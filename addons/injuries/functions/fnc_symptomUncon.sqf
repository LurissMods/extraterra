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

params ["_unit","_minUnconTime","_forceWakeup"];

if (IS_UNCONSCIOUS(_unit)) exitWith {};

if (isNil "_minUnconTime") then {
    [_unit, true] call ACEFUNC(medical,setUnconscious);
} else {
    if (isNil "_forceWakeup") then {
        [_unit, true, _minUnconTime] call ACEFUNC(medical,setUnconscious);
    } else {
        [_unit, true, _minUnconTime, _forceWakeup] call ACEFUNC(medical,setUnconscious);
    };
};
