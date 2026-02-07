#include "..\script_component.hpp"
/*
* Author: Akaviri13
* Checks if player is in direct sunlight. Returns thermal heating in watts.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_mainLoop
*
* Public: No
*/

params ["_grenadeDisplayAddressArray", "_currentWeapon", "_currentThrowable"];

private _currentThrowable = currentThrowable player;
private _currentThrowableName = nil;
private _currentThrowableAmount = nil;

if (count currentThrowable player != 0) then {
    _currentThrowableName = getText (configFile >> "CfgMagazines" >> (_currentThrowable select 0) >> "displayName");
    _currentThrowableAmount = {_x == (_currentThrowable select 0)} count magazines player;
} else {
    _currentThrowableName = "None";
    _currentThrowableAmount = 0;
};

(_grenadeDisplayAddressArray#0) ctrlSetStructuredText parseText format ["<t size='0.75'> %1", _currentThrowableName];
(_grenadeDisplayAddressArray#1) ctrlSetStructuredText parseText format ["<t size='0.8' align='center'>%1", _currentThrowableAmount];

if (count _currentThrowable == 0) then {_currentThrowable = ["NOWEAPON"]};
