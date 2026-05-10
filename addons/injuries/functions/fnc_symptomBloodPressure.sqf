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

params ["_unit","_bpArray","_syncValue"];

private _avg = 0;
{
    _avg = _avg + _x;
} forEach _bpArray;

_avg = _avg/count _bpArray;

// Range from ~30/20 to ~205/185
private _adjustValue = linearConversion [-1,1,_avg,-BP_ADJUST_LIMITS,BP_ADJUST_LIMITS];

// Handled by API injected in fnc_consumeMedications
//_unit setVariable[QGVAR(bpAdjust),_adjustValue,_syncValue];
SET_BP_ADJUST(_unit,_adjustValue,_syncValue);
