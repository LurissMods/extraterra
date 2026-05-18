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

//params ["_unit"]

[
    NAUSEA_CLEANING_TIME, // Time
    [], // Args
    { // Success

        {
            private _isItemVomitHelm = getNumber (configFile >> QUOTE(CfgWeapons) >> _x >> QUOTE(exterra_uniforms_vomitSeverity));
            if (_isItemVomitHelm > 0) exitWith {
                private _cleanHelmet = getText (configFile >> QUOTE(CfgWeapons) >> _x >> QUOTE(exterra_uniforms_baseVariant));
                ACE_player removeItem _x;
                ACE_player addItem _cleanHelmet;
            };

        } forEach (items ACE_player);
    },
    { // Fail

    },
    "Cleaning Vomit"
] call ACEFUNC(common,progressBar);
