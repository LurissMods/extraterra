#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks if unit is in direct sunlight. Returns thermal heating in watts.
*
* Arguments:
* _isUnitInSun - Value between 0 and 1, generally behaves like a boolean.
* _suitSolarAbsorptance - How well a suit absorbs solar energy, ratio from 0 to 1
* _unit - Can be a player or AI unit
*
* Return Value:
* _solarHeatingPower - Thermal heating of unit from sunlight. In Watts
*
* Example:
* [] call exterra_lifeSupport_fnc_updateSolarIrradiance;
*
* Public: Yes
*/

params ["_isUnitInSun","_suitSolarAbsorptance","_unit"];

private _exposedArea = 0;
private _solarHeatingPower = 0;

if (_isUnitInSun > 0.5) then { // Checks if the unit is in the sun. Usually always = 1, but made it 0.5 to deal with edge cases (e.g. sun rise/set). If 0, the script would also run when the "moon" (or in this case Earth) is out instead.
    if (sunOrMoon > 0) then { // Checks if solar irradiance simulation is enabled in the CBA settings.
        /* This code is spaghetti. I had to do a bunch of werid shit to get it working.

        This is the solar irradiance simulation script. It checks for the angle of unit (both horizontal and vertical) and compares it with the angle of the sun.
        Arma doesn't actually return an up vector for the unit so the workaround I used is a bit fucky - I got the direction vector of the "spine3" bone in the arma man animation rig instead.
        */
        private _unitDir = vectorNormalized(vectorDir _unit); // Returns the horizontal heading of the unit.
        private _sunDir = (getLighting#2); // Gets the direction vector of the sun.

        private _unitHoriz = [(_unitDir#0),(_unitDir#1)]; // Selects the x and y values of the units azimuth vector.
        private _sunDirHoriz = [(_sunDir#0),(_sunDir#1)]; // Selects the x and y values of the suns position.

        private _angleHoriz = _unitHoriz vectorCos _sunDirHoriz; // Finds the angle between the unit azimuth and sun. This is always 100% accurate and easy thankfully.

        private _unitPitchVectorStart = ASLToAGL eyePos _unit;
        private _unitPitchVectorEnd = _unit modelToWorld (_unit selectionPosition ["spine3", "Memory"]); // Gets the position of the "spine3" bone of the arma man skeleton.
        private _unitPitchVector = _unitPitchVectorStart vectorFromTo _unitPitchVectorEnd; // Creates a vector from the units eyes to spine3 bone.

        private _dotProduct = abs(_unitPitchVector vectorDotProduct _sunDir);
        private _exposureVert = abs(_dotProduct - 1);

        _exposedArea = (AREAHUMAN_TOP * (1 - abs _exposureVert)) + (AREAHUMAN_FRONT * ( abs _exposureVert)*(abs _angleHoriz)) + (AREAHUMAN_SIDE * (1 - abs _angleHoriz)); // Exposed area is a ratio of all the returns. Output is in m^2.
    };
    _solarHeatingPower = (SOLAR_RADIATION_WATTAGE_1AU*_suitSolarAbsorptance)*_exposedArea; // Solar irradiance * area = power. Output is in watts.
};

_solarHeatingPower;
