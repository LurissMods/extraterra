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

params ["_unit","_callingInjury"];

private _deathReason = "";

switch _callingInjury do {
    case iID_EBULLISM: {
        _deathReason = LLSTRING(deathVacuumExposure);
    };
    case iID_ARS: {
        _deathReason = LLSTRING(deathARS);
    };
    case iID_ASPHYXIATION: {
        _deathReason = LLSTRING(deathAsphyxiation);
    };
    case iID_DCS: {
        _deathReason = LLSTRING(deathEbullism);
    };
    case iID_HYPERTHERM: {
        _deathReason = LLSTRING(deathHyperthermia);
    };
    case iID_HYPOTHERM: {
        _deathReason = LLSTRING(deathHypothermia);
    };
    default {
        _deathReason = LLSTRING(deathUnknown);
    }
};

systemChat format ["Death called! Unit: %1 Reason: %2",_unit,_deathReason];

[_unit, _deathReason, objNull, objNull] call ACEFUNC(common,setDead);
