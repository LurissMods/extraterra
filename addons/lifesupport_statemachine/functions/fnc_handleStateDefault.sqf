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

/*
// Handles solar storm calculations for the whole server, run only on the server/player host.
// It's done this way to ensure that the calculation stays synchronized with the statemachine.
if (isServer && {(EGVAR(modules,stormParams) select 0) == true}) then {
    EGVAR(modules,stormParams) params ["_bool", "_duration", "_maxDose"];
    [_duration,_maxDose] call EFUNC(modules,updateSolarStorm);
};*/

if ([_unit] call EFUNC(lifesupport,handleUnitLifesupport)) then { // returns true when update ran
    //EGVAR(main,statemachineInitalized) = true;
};
