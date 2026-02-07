#include "..\script_component.hpp"
/*
 * Author: Luriss
 * Checks if player is in direct sunlight. Returns thermal heating in watts.
 *
 * Arguments:
 * _isPlayerInSun (Value between 0 and 1, generally behaves like a boolean. Result of the code to the right.) I used _isPlayerInSun = [player,"VIEW"] checkVisibility [eyePos player, eyePos player vectorDiff ((getLighting#2) vectorMultiply 200)];
 *
 * Return Value:
 * _solarHeatingPower
 *
 * Example:
 * [] call exterra_lifeSupport_fnc_solarIrradiance;
 *
 * Public: Yes
 */

params ["_isPlayerInSun"];

private _exposedArea = 0;
private _solarHeatingPower = 0;

if (_isPlayerInSun > 0.5) then { // Checks if the player is in the sun. Usually always = 1, but made it 0.5 to deal with edge cases (e.g. sun rise/set). If 0, the script would also run when the "moon" (or in this case Earth) is out instead.
    if (sunOrMoon > 0) then { // Checks if solar irradiance simulation is enabled in the CBA settings.
        /* This code is spaghetti. I had to do a bunch of werid shit to get it working.

        This is the solar irradiance simulation script. It checks for the angle of player (both horizontal and vertical) and compares it with the angle of the sun.
        Arma doesn't actually return an up vector for the player so the workaround I used is a bit fucky - I got the direction vector of the "spine3" bone in the arma man animation rig instead.
        */
        _playerDir = vectorNormalized(vectorDir player); // Returns the horizontal heading of the player.
        _sunDir = (getLighting#2); // Gets the direction vector of the sun.

        _playerHoriz = [(_playerDir#0),(_playerDir#1)]; // Selects the x and y values of the players azimuth vector.
        _sunDirHoriz = [(_sunDir#0),(_sunDir#1)]; // Selects the x and y values of the suns position.

        _angleHoriz = _playerHoriz vectorCos _sunDirHoriz; // Finds the angle between the player azimuth and sun. This is always 100% accurate and easy thankfully.

        _playerPitchVectorStart = ASLToAGL eyePos player;
        _playerPitchVectorEnd = player modelToWorld (player selectionPosition ["spine3", "Memory"]); // Gets the position of the "spine3" bone of the arma man skeleton.
        _playerPitchVector = _playerPitchVectorStart vectorFromTo _playerPitchVectorEnd; // Creates a vector from the players eyes to spine3 bone.

        _dotProduct = abs(_playerPitchVector vectorDotProduct _sunDir);
        _exposureVert = abs(_dotProduct - 1);

        _exposedArea = (AREAHUMAN_TOP * (1 - abs _exposureVert)) + (AREAHUMAN_FRONT * ( abs _exposureVert)*(abs _angleHoriz)) + (AREAHUMAN_SIDE * (1 - abs _angleHoriz)); // Exposed area is a ratio of all the returns. Output is in m^2.
        //systemChat format ["Exposed area: %1", _exposedArea];
    };
    _solarHeatingPower = (SOLAR_RADIATION_WATTAGE_1AU * _exposedArea); // Solar irradiance * area = power. Output is in watts.
};

_solarHeatingPower;
