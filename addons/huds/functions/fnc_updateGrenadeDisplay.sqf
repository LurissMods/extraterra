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

private _grenadeNameAddress = nil;
private _grenadeAmountAddress = nil;

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateRangefinder)";
    };
    case US_SUIT_FACTION: {
        _grenadeNameAddress = (GVAR(weapon_grenade_text_US)#0);
        _grenadeAmountAddress = (GVAR(weapon_grenadeAmount_text_US)#0);
    };
};

private _currentThrowableName = nil;
private _currentThrowableAmount = nil;

if (count currentThrowable ACE_player != 0) then {
    _currentThrowableName = getText (configFile >> "CfgMagazines" >> (currentThrowable ACE_player select 0) >> "displayName");
    _currentThrowableAmount = {_x == (currentThrowable ACE_player select 0)} count magazines ACE_player;
} else {
    _currentThrowableName = "None";
    _currentThrowableAmount = 0;
};

_grenadeNameAddress ctrlSetStructuredText parseText format ["<t size='0.75'> %1", _currentThrowableName];
_grenadeAmountAddress ctrlSetStructuredText parseText format ["<t size='0.8' align='center'>%1", _currentThrowableAmount];

//if (count currentThrowable ACE_player == 0) then {currentThrowable ACE_player = ["NOWEAPON"]};
