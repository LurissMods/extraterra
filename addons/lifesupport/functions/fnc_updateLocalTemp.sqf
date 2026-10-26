#include "..\script_component.hpp"
/*
* Author: Luriss
* Simulates the local temperature of the environment surrounding the player. Returns a ratio between 0 and 1 (0 means min temp, 1 means max temp).
*
* Arguments:
* [_unit, _moonSurfaceTemp, _syncValue] [<UNIT>,<ARRAY>,<BOOL>]
* _unit - Current unit.
* _moonSurfaceTemp - Moon surface temp in Kelvin [Lowest possible value, Highest possible value]
* _syncValue - Whether or not to sync the current update with the server
*
* Return Value:
* [_tempAroundUnit] [<NUMBER>]
* _tempAroundUnit - Current environmental temperature around the unit in Kelvin
*
* Example:
* [] call exterra_lifeSupport_fnc_updateLocalTemp;
*
* Public: No
*/

params ["_unit", "_moonSurfaceTemp", "_syncValue"];

private _tempAroundUnit = nil;

private _points = nil;
private _rows = nil;
private _distance = nil;

private _pointsArray = [];

if ((!isPlayer _unit) || {GVAR(CBAset_localTemperatureSimToggle)}) then { // Checks if temp simulation is enabled in the CBA settings.
    /* Behold the CPU muncher 9000. This thing is basically a primitive form of path tracing. I've locked down the user input just in case someone tries to brick their PC.

    This is the local temperature simulation script. It works by creating a grid of positions around the player (adjusted to 1m above ground level) and checks if that position is in shadow or not.
    The return is a value between 0 and 1, 1 being full sun, and 0 being full shadow.
    The theory is that due to the 2 week long lunar day/night combined with the hard vacuum, the temperature gradient between lit and shaded areas would be quite large, hence the temperature in a given area would be the average of the extremes.
    */

    // This selects detail setting selected in the CBA settings.
    switch GVAR(CBAset_localTemperatureSimValue) do {
        case 0: {
            _points = 64;
            _rows = 4;
            _distance = 100;
        };
        case 1: {
            _points = 48;
            _rows = 3;
            _distance = 100;
        };
        case 2: {
            _points = 32;
            _rows = 4;
            _distance = 75;
        };
        case 3: {
            _points = 24;
            _rows = 3;
            _distance = 75;
        };
        case 4: {
            _points = 16;
            _rows = 2;
            _distance = 75;
        };
    };

    private _step = _distance/_rows;
    private _pointsPerRow = _points/_rows;
    private _angle = 360/_pointsPerRow;

    /*
        Benchmarks:
        Luriss specs as of testing:
        CPU: 9800X3D
        GPU: RTX 5070ti
        RAM: 32 GB DDR5

        64 pts: 655 μs
        48 pts: 511 μs
        32 pts: 362 μs
        24 pts: 296 μs
        16 pts: 220 μs
    */



    for "_i" from 1 to _rows do {

        private _currentStep = _step*_i;
        private _angleInc = 0;

        for "_j" from 1 to _pointsPerRow do {

            private _coordX = _currentStep*sin(_angleInc);
            private _coordY = _currentStep*cos(_angleInc);

            // Note: [x,y,z] LOCAL_TEMP_VECTOR_HEIGHT_AGL
            private _vectorPos = _unit modelToWorld [_coordX,_coordY,0];
            _vectorPos set [2,LOCAL_TEMP_VECTOR_HEIGHT_AGL]; // Set the height offest in AGL so it doesn't inherit the model space height

            _vectorPos = AGLToASL _vectorPos; // Position needs to be converted to ASL

            _pointsArray pushBack _vectorPos;

            _angleInc = _angleInc + _angle;
        };
    };

    private _sunlightPointsTotal = 0;
    private _sunPos = (_pointsArray#0) vectorDiff ((getLighting#2) vectorMultiply viewDistance); // Finding the position of the sun using the first vector in the array and caching it
    {
        // /private _sunPos = _x vectorDiff ((getLighting#2) vectorMultiply viewDistance);
        private _inShadow = (terrainIntersectASL [_x, _sunPos] || {lineIntersects [_x, _sunPos]});

        if !_inShadow then {
            _sunlightPointsTotal = _sunlightPointsTotal + 1;
        };
    } forEach _pointsArray;

    private _sunShadowRatio = _sunlightPointsTotal/(count _pointsArray); // Divides the result by the maximum possible value for the given array size. Ratio from 0 to 1.
    _tempAroundUnit = linearConversion[0,1,_sunShadowRatio,_moonSurfaceTemp#0,_moonSurfaceTemp#1]; // Uses a linearConversion to select the local temperature from the provided min and max temp range. 0.5 = mid point of provided temps.
} else {

    if (isPlayer _unit) then {
        _points = 30;
        _rows = 5;
        _distance = 500;
    } else {
        _points = 18;
        _rows = 3;
        _distance = 300;
    };

    /*
        Benchmarks:
        Luriss specs as of testing:
        CPU: 9800X3D
        GPU: RTX 5070ti
        RAM: 32 GB DDR5

        Player: 142 μs
        AI: 111 μs
    */

    private _step = _distance/_rows;
    private _pointsPerRow = _points/_rows;
    private _angle = 360/_pointsPerRow;

    private _avgGradientByAngle = [];
    private _unitHeightASL = (getPosASL _unit) select 2;

    // Create an array of points around the unit, find and store their gradient relative to the player's ASL height
    for "_i" from 1 to _rows do {

        private _currentStep = _step*_i;
        private _angleInc = 0;

        for "_j" from 1 to _pointsPerRow do {

            private _coordX = _currentStep*sin(_angleInc);
            private _coordY = _currentStep*cos(_angleInc);

            // Note: [x,y,z]
            private _vectorPos = _unit modelToWorld [_coordX,_coordY,0];
            _vectorPos set [2,0]; // Set the height offest in AGL so it doesn't inherit the model space height

            _vectorPos = AGLToASL _vectorPos; // Position needs to be converted to ASL

            _pointsArray pushBack [_angleInc, _vectorPos#2];

            _angleInc = _angleInc + _angle;

        };
    };

    // Find the average gradient according to the azimuth (i.e. all points at 10 degrees are averaged)
    private _angleInc = 0;
    for "_i" from 1 to _pointsPerRow do {

        private _gradients = _pointsArray select {
            _x#0 == _angleInc;
        };

        private _gradientSum = 0;
        {
            _gradientSum = _gradientSum + _x#1;

        } forEach _gradients;

        _avgGradientByAngle pushBack (((_gradientSum/_rows) - _unitHeightASL)/_distance);

        _angleInc = _angleInc + _angle;
    };

    // Average all gradients around the unit into a single average
    private _gradientsSum = 0;
    {
        _gradientsSum = _gradientsSum + abs(_x);

    } forEach _avgGradientByAngle;
    private _avgGradientDegrees = (_gradientsSum/_pointsPerRow)*100; // average gradient in degrees

    // Find sun angle in sky via vectors
    private _sunDirVector = getLighting#2;
    private _sunAzimuthVector = +_sunDirVector;
    _sunAzimuthVector set [2,0];

    private _dotProduct = _sunDirVector vectorDotProduct _sunAzimuthVector;
    private _sunAngle = acos(_dotProduct/((vectorMagnitude _sunDirVector)*(vectorMagnitude _sunAzimuthVector)));

    // If sunAngle is > than the surrounding gradient, the entire area is assumed to be exposed to sunlight
    private _approxSunShadowRatio = 1;
    if (_sunAngle <= _avgGradientDegrees) then {
        _approxSunShadowRatio = linearConversion [_avgGradientDegrees,0,_sunAngle,1,0,true];
    };

    _tempAroundUnit = linearConversion[0,1,_approxSunShadowRatio,_moonSurfaceTemp#0,_moonSurfaceTemp#1];
};

_tempAroundUnit;
