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

// This should only run on the player unit on the player client
if (!hasInterface || {_unit != ACE_player}) exitWith {};

private _unitSuitFaction = GETVAR(_unit,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION);
systemChat str _unitSuitFaction;

switch _unitSuitFaction do {
    case NO_SUIT_FACTION: {
        systemChat "called error!";
        WARNING("exterra_lifesupport_statemachine_fnc_startSuitBootup unexpected suit faction in switch-case!");
    };
    case US_SUIT_FACTION: {
        systemChat "called!";
        call EFUNC(huds,bootHUD_US)
        // Note: per frame calcs should start immediately
    };
};
