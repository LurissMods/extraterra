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

params ["_unit","_syncValues"];

_syncValues = true;

_unit setVariable [QGVAR(unitVacuumExposed),true,_syncValues];
_unit setVariable [QGVAR(unitVacuumExposedTime),CBA_missionTime,_syncValues];

_unit setVariable [VAR_PAIN,0.5,_syncValues]; // Note: Pain will naturally decay

if (_unit == ACE_player) then {
    [QGVAR(exposedVacuum), 0, true] call ACEFUNC(common,setHearingCapability);
    20 call ACEFUNC(hearing,earringing);
    GVAR(burredVision) ppEffectAdjust [2];
    GVAR(burredVision) ppEffectCommit 0.01;
};
