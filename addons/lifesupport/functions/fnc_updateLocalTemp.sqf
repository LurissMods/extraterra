#include "..\script_component.hpp"
/*
 * Author: Luriss
 * Simulates the local temperature of the environment surrounding the player. Returns a ratio between 0 and 1 (0 means min temp, 1 means max temp).
 *
 * Arguments:
 * _moonSurfaceTemp (Array -  [minTemp, maxTemp]). In Kelvin.
 *
 * Return Value:
 * _tempAroundPlayer
 *
 * Example:
 * [] call exterra_lifeSupport_fnc_localTemperature;
 *
 * Public: Yes
 */

params ["_unit", "_moonSurfaceTemp"];

private _distCheck = [];
private _tempAroundUnit = nil;
private _presetSelection = nil;

if (GVAR(localTemperatureSim)) then { // Checks if temp simulation is enabled in the CBA settings.
    /* Behold the CPU muncher 9000. This thing is basically a primitive form of path tracing. I've locked down the user input just in case someone tries to brick their PC.

    This is the local temperature simulation script. It works by creating a grid of positions around the player (adjusted to 1m above ground level) and checks if that position is in shadow or not.
    The return is a value between 0 and 1, 1 being full sun, and 0 being full shadow.
    The theory is that due to the 2 week long lunar day/night combined with the hard vacuum, the temperature gradient between lit and shaded areas would be quite large, hence the temperature in a given area would be the average of the extremes.
    */

    if (isPlayer _unit) then {
        _presetSelection = missionNamespace getVariable [QGVAR(localTemperatureSim_setting), 2]; // This selects detail setting selected in the CBA settings.
    } else {
        _presetSelection = 4;
    };

    switch _presetSelection do {
        case 0: {
            _distCheck = [50,12.5,2]; // 64 Points
        };
        case 1: {
            _distCheck = [50,(50/3),2]; // 48 Points
        };
        case 2: {
            _distCheck = [50,25,2]; // 32 Points
        };
        case 3: {
            _distCheck = [50,25,1]; // 16 Points
        };
        case 4: {
            _distCheck = [50,50,1]; // 8 Points
        };
    };
    private _surroundingPosArray = []; // Initalizations. Needs to be redone every loop anyways.
    private _result = 0;
    private _totalI = 0;

    for "_i" from 1 to (_distCheck#0/_distCheck#1) do { // For loop iterating through the number of itterations (E.g. 50/10 = 5, with points at radi of 10, 20, 30, 40, and 50 meters).

        _surroundingPosArray set [_totalI, eyePos _unit vectorAdd [(_distCheck#1*_i),0]]; // Defines one position from the player and adds it to the _surroundingPosArray array.
        _surroundingPosArray#(_totalI) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL]; // Sets the coordinate to +1m above the ground. If this isn't here the points won't conform to the terrain.

        _surroundingPosArray set [_totalI+1, eyePos _unit vectorAdd [0,(_distCheck#1*_i)]];
        _surroundingPosArray#(_totalI+1) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+1)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

        _surroundingPosArray set [_totalI+2, eyePos _unit vectorAdd [-1*(_distCheck#1*_i),0]];
        _surroundingPosArray#(_totalI+2) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+2)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

        _surroundingPosArray set [_totalI+3, eyePos _unit vectorAdd [0,-1*(_distCheck#1*_i)]];
        _surroundingPosArray#(_totalI+3) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+3)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

        _surroundingPosArray set [_totalI+4, eyePos _unit vectorAdd [(_distCheck#1*_i),(_distCheck#1*_i)]];
        _surroundingPosArray#(_totalI+4) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+4)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

        _surroundingPosArray set [_totalI+5, eyePos _unit vectorAdd [-1*(_distCheck#1*_i),(_distCheck#1*_i)]];
        _surroundingPosArray#(_totalI+5) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+5)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

        _surroundingPosArray set [_totalI+6, eyePos _unit vectorAdd [(_distCheck#1*_i),-1*(_distCheck#1*_i)]];
        _surroundingPosArray#(_totalI+6) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+6)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

        _surroundingPosArray set [_totalI+7, eyePos _unit vectorAdd [-1*(_distCheck#1*_i),-1*(_distCheck#1*_i)]];
        _surroundingPosArray#(_totalI+7) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+7)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

        _totalI = _totalI + 8;

        if (_distCheck#2 == 2) then {

            _surroundingPosArray set [_totalI, eyePos _unit vectorAdd [((_distCheck#1*_i)/(_distCheck#2*_i)),(_distCheck#1*_i)]];
            _surroundingPosArray#(_totalI) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

            _surroundingPosArray set [_totalI+1, eyePos _unit vectorAdd [-1*((_distCheck#1*_i)/(_distCheck#2*_i)),(_distCheck#1*_i)]];
            _surroundingPosArray#(_totalI+1) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+1)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

            _surroundingPosArray set [_totalI+2, eyePos _unit vectorAdd [((_distCheck#1*_i)/(_distCheck#2*_i)),-1*(_distCheck#1*_i)]];
            _surroundingPosArray#(_totalI+2) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+2)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

            _surroundingPosArray set [_totalI+3, eyePos _unit vectorAdd [-1*((_distCheck#1*_i)/(_distCheck#2*_i)),-1*(_distCheck#1*_i)]];
            _surroundingPosArray#(_totalI+3) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+3)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

            _surroundingPosArray set [_totalI+4, eyePos _unit vectorAdd [(_distCheck#1*_i), ((_distCheck#1*_i)/(_distCheck#2*_i))]];
            _surroundingPosArray#(_totalI+4) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+4)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

            _surroundingPosArray set [_totalI+5, eyePos _unit vectorAdd [(_distCheck#1*_i), -1*((_distCheck#1*_i)/(_distCheck#2*_i))]];
            _surroundingPosArray#(_totalI+5) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+5)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

            _surroundingPosArray set [_totalI+6, eyePos _unit vectorAdd [-1*(_distCheck#1*_i), ((_distCheck#1*_i)/(_distCheck#2*_i))]];
            _surroundingPosArray#(_totalI+6) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+6)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

            _surroundingPosArray set [_totalI+7, eyePos _unit vectorAdd [-1*(_distCheck#1*_i), -1*((_distCheck#1*_i)/(_distCheck#2*_i))]];
            _surroundingPosArray#(_totalI+7) set [2,(getTerrainHeightASL(_surroundingPosArray#(_totalI+7)))+LOCAL_TEMP_VECTOR_HEIGHT_AGL];

            _totalI = _totalI + 8; // Done so the array doesn't get overwritten the next time this loops.
        };
    };

    {
        _inSunlight = [_unit,"VIEW"] checkVisibility [_x, _x vectorDiff ((getLighting#2) vectorMultiply IS_IN_SUN_CHECK_VECTOR_LENGTH)]; // Creates a vector from each point towards the sun and checks if it is in shadow. 1 = sun, 0 = shadow. 200m long. Making it shorter improves performance but then you'll get weird edge cases.
        _result = _result + _inSunlight; // Adds the result of the current check to a sum of all the previous checks.
    } forEach _surroundingPosArray;

    _result = _result/(count _surroundingPosArray); // Divides the result by the maximum possible value for the given array size. Ratio from 0 to 1.
    _tempAroundUnit = linearConversion[0,1,_result,_moonSurfaceTemp#0,_moonSurfaceTemp#1]; // Uses a linearConversion to select the local temperature from the provided min and max temp range. 0.5 = mid point of provided temps.
} else {
    _tempAroundUnit = linearConversion[0,1,sunOrMoon,(_moonSurfaceTemp#0),(_moonSurfaceTemp#1)]; // If local temp simulation is disabled, the temp is controlled by time of day.
};

_tempAroundUnit;
