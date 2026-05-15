#include "..\script_component.hpp"
/*
* Author: kymckay (modified by Luriss)
* Resets the default state on a unit after respawning.
*
* Arguments:
* 0: The Unit <OBJECT>
*
* Return Value:
* None
*
* Example:
* [player] call ace_medical_statemachine_fnc_resetStateDefault
*
* Public: No
*/

params ["_unit"];

if (!EGVAR(common,exterraEnabled)) exitWith {};

//[_unit, true] call EFUNC(lifesupport,initUnit);
[_unit, EGVAR(lifesupport,STATE_MACHINE), "Dead", "Default"] call CBA_statemachine_fnc_manualTransition;
