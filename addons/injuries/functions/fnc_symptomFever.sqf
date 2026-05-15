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

params ["_unit","_feverArray","_syncValue"];

private _avg = 0;
{
    _avg = _avg + _x;
} forEach _feverArray;

_avg = _avg/count _feverArray;

private _adjustValue = linearConversion [0,1,_avg,HUMAN_NATURAL_CORETEMP,HIGH_FEVER_CORE_TEMP,true];

SET_CORE_TEMP_TARGET(_unit,_adjustValue,_syncValue);
