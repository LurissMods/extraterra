#include "..\script_component.hpp"
/*
* Author: Luriss
* Resets the default state on a unit after respawning.
*
* Arguments:
* 0: The Unit <OBJECT>
*
* Return Value:
* None
*
* Example:
* [player] call ace_medical_statemachine_fnc_resetStateDefault
*
* Public: No
*/

params ["_unit"];

if (!EGVAR(common,exterraEnabled)) exitWith {};

// This should only run on the player unit on the player client
if (!hasInterface || {_unit != ACE_player}) exitWith {};

//systemChat format ["HUD start up fired! Unit: %1", _unit];

private _unitSuitFaction = GETVAR(_unit,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION);

switch _unitSuitFaction do {
    case NO_SUIT_FACTION: {
        systemChat "Switch fired case error! FUNC(statemachine,startSuitBootup)";
        WARNING("exterra_statemachine_fnc_startSuitBootup unexpected suit faction in switch-case!");
    };
    case US_SUIT_FACTION: {
        call EFUNC(huds,bootHUD_US)
        // Note: per frame calcs should start immediately
    };
};
