#include "..\script_component.hpp"
/*
* Author: Luriss
* Handles the default state
*
* Arguments:
* 0: The Unit <OBJECT>
*
* Return Value:
* None
*
* Example:
* [player] call ace_medical_statemachine_fnc_handleStateDefault
*
* Public: No
*/

params ["_unit"];

// Check if the enabler module is placed
if (!EGVAR(common,exterraEnabled)) exitWith {};
// If the unit died the loop is finished
if (!alive _unit || {!local _unit}) exitWith {};
// Exclude headless clients from the _unit array
if (_unit isKindOf QUOTE(HeadlessClient_F)) exitWith {};

//if (!isPlayer _unit) exitWith {}; // testing performance

if ([_unit] call EFUNC(lifesupport,handleUnitLifesupport)) then { // returns true when update ran
    //EGVAR(main,statemachineInitalized) = true;
};
