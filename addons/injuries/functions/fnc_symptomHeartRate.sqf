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

params ["_unit","_hrArray","_syncValue"];

private _sum = 0;
{
    _sum = _sum + _x;
} forEach _hrArray;

// Handled by API injected in fnc_consumeMedications
//_unit setVariable[QGVAR(hrAdjust),_sum,_syncValue];
SET_HR_ADJUST(_unit,_sum,_syncValue);
