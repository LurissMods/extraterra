#include "..\script_component.hpp"
/*
* Author: Luriss
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

//systemChat "test";

/*player setVariable [QGVAR(hasHelmet),headgear player in GVAR(whitelistHelmets) || {(getNumber (configFile >> 'CfgWeapons' >> (headgear player) >> 'MJOLNIR_isHelmet')) == 1}];
player setVariable [QGVAR(hasSuit),uniform player in GVAR(whitelistSuits) || {(getNumber (configFile >> 'CfgWeapons' >> (uniform player) >> 'MJOLNIR_isArmor')) == 1}];

if (GETVAR(player,GVAR(hasHelmet),false) && GETVAR(player,GVAR(hasSuit),false)) then {
    SETVAR(player,GVAR(hasHelmAndSuit),true);
};*/

private _inSuit = ACE_player getVariable [QEGVAR(lifesupport,unitSuitBools),[false,false,false,false]];
systemChat str _inSuit;

//systemChat str GETVAR(player,GVAR(hasHelmet),"Failed");
//systemChat str GETVAR(player,GVAR(hasSuit),"Failed");*

//Activate Suit action
/*GVAR(hudActivateAction) = player addAction ["<t color='#B1EE58'>Activate suit</t>", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    [(_this select 3) select 0] call FUNC(suitActivation);
    }, [_inSuit#1], 6, false, true,"", "!(player getVariable ['exterra_huds_suitEnabled', false])"
];*/

GVAR(hudActivateAction) = [["<t color='#B1EE58'>Activate suit</t>", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    [(_this select 3) select 0] call FUNC(suitActivation);
    }, [_inSuit#0], 6, false, true,"", "!(player getVariable ['exterra_huds_suitEnabled', false]) && (player getVariable ['exterra_lifesupport_unitSuitBools', false]) select 0"
]] call CBA_fnc_addPlayerAction;

GVAR(hudDeactivateAction) = [["<t color='#ff0000'>Deactivate suit</t>", {
    params ["_target", "_caller", "_actionId", "_arguments"];
    [(_this select 3) select 0] call FUNC(suitDeactivation);
    }, [_inSuit#0], 6, false, true,"", "(player getVariable ['exterra_huds_suitEnabled', false])"
]] call CBA_fnc_addPlayerAction;

//,"(alive _originalTarget) && !(player getVariable 'exterra_huds_suitEnabled')"

//Deactivate Suit action.
GVAR(hudDeactivateAction) = player addAction ["<t color='#ff0000'>Deactivate suit</t>", {
        (_this select 0) params ["_target"];
        _target setVariable ["exterra_huds_disableSuit", true];
        //playSound "Simulation_Fatal";
    }, [], 6, false, true,"","(alive _originalTarget) && !(player getVariable 'exterra_huds_disableSuit')"
];

/*LRSS_activateHudAction = player addAction ["<t color='#B1EE58'>Boot HUD</t>", {
		call FUNC(bootUp_US);
	}, [], 6, false, true,"","(alive _originalTarget) && !(player getvariable ['LRSS_MJOLNIR_hudInitiated', false]) && (player getVariable ['exterra_huds_hasSuit',false]) && (player getVariable 'LRSS_suitActive') && (player getVariable ['exterrra_huds_hasHelmet',false])"];*/
