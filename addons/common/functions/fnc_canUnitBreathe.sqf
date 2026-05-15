#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks if the unit can breathe in the current environment
*
* Arguments:
* _unit <UNIT>
*
* Return Value:
* _surroundingAirState <NUMBER>
* Returns either a 0, 1, or 2 for use in switch-cases
*
* Example:
* [] call exterra_common_fnc_canUnitBreathe
*
* Public: Yes
*/

params ["_unit"];
GET_SUIT_BOOLS(_unit) params ["_inFullSuit","_helmetBool","_suitBool","_packBool"];

private _surroundingAirState = ATMO_BREATHE_ERROR;

switch (GET_ATMO(_unit)) do {
    case ATMO_STATE_VACUUM: {
        if (!_helmetBool || {!_suitBool}) then {
            _surroundingAirState = ATMO_BREATHE_NONE;
        } else {
            _surroundingAirState = ATMO_BREATHE_SUIT;
        };
    };
    case ATMO_STATE_1ATM: {
        _surroundingAirState = ATMO_BREATHE_FULL;
        /*if !_inFullSuit then {
            _surroundingAirState = ATMO_BREATHE_FULL;
        } else {
            _surroundingAirState = ATMO_BREATHE_SUIT;
        };*/
    };
    case ATMO_STATE_0P3ATM: {
        _surroundingAirState = ATMO_BREATHE_PARTIAL;
        /*if !_inFullSuit then {
            _surroundingAirState = ATMO_BREATHE_PARTIAL;
        } else {
            _surroundingAirState = ATMO_BREATHE_SUIT;
        };*/
    };
    default {
        ERROR_1("Invalid atmo state! State: %1",(GET_ATMO(_unit)));
    };
};

_surroundingAirState;
