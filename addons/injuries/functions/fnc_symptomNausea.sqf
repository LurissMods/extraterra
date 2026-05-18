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

params ["_unit","_severity","_visorType"];

if (_unit != ACE_player) exitWith {};

private _vomitVariant = getArray (configFile >> QUOTE(CfgWeapons) >> (headgear _unit) >> QUOTE(exterra_uniforms_vomitVariants));
_vomitVariant params ["_light","_moderate","_severe"];

switch _severity do {
    case 0: {
        playSound QGVAR(vomitMild_snd);

        if (_light != "") then {
            removeHeadgear _unit;
            _unit addHeadgear _light;
        };
    };
    case 1: {
        playSound QGVAR(vomitMild_snd);

        if (_moderate != "") then {
            removeHeadgear _unit;
            _unit addHeadgear _moderate;
        };
    };
    case 2: {
        playSound QGVAR(vomitMild_snd);

        if (_severe != "") then {
            removeHeadgear _unit;
            _unit addHeadgear _severe;
        };
    };
};
