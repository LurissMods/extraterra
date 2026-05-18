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

//if (!IS_MEDICAL_ACTIVITY(_unit)) exitWith {};

private _sum = 0;
{
    _sum = -150 max (_sum + _x) min 150;
} forEach _hrArray;

// Handled by API injected in fnc_consumeMedications
SET_HR_ADJUST(_unit,_sum,_syncValue);
