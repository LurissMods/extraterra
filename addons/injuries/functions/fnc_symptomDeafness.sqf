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

params ["_unit","_callingInjury","_deafnessValue","_deafnessBool"];

if (_unit != ACE_player) exitWith {};

switch _callingInjury do {
    case iID_INJURY_AGNOSTIC: {
        [QGVAR(dynamicDeafness), _deafnessValue, _deafnessBool] call ACEFUNC(common,setHearingCapability);
    };
    case iID_EBULLISM: {
        [QGVAR(ebullismDeafness), 0, _deafnessBool] call ACEFUNC(common,setHearingCapability);
    };
    case iID_DCS: {
        [QGVAR(dcsDeafness), 0, _deafnessBool] call ACEFUNC(common,setHearingCapability);
    };
    default {}
};
