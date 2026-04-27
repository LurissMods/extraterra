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

_unit setVariable [QGVAR(unitVacuumExposed),false,_syncValues];
_unit setVariable [QGVAR(unitVacuumExposedTime),CBA_missionTime,_syncValues];

//_unit setVariable [VAR_PAIN,0.5,_syncValues];

if (_unit == ACE_player) then {
    [QGVAR(exposedVacuum), 0, false] call ACEFUNC(common,setHearingCapability);
    GVAR(burredVision) ppEffectAdjust [0];
    GVAR(burredVision) ppEffectCommit 30;
};
