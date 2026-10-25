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
if (!alive _unit) exitWith {};
// Exclude headless clients from the _unit array
if (_unit isKindOf QUOTE(HeadlessClient_F)) exitWith {};

if (isServer) then {
    private _lastTimeUpdated = GETVAR(_unit,GVAR(datalinkLastUpdate),0);
    private _deltaT = (CBA_missionTime - _lastTimeUpdated) min 50;
    private _randomUpdateTime = GETVAR(_unit,GVAR(randomUpdateTime),0);

    if (!local _unit) exitWith {

        if (_deltaT > _randomUpdateTime) then {
            _unit setVariable [QGVAR(randomUpdateTime),(random [5, 7.5, 10]),true];
            _unit remoteExecCall [QFUNC(updateDatalink), owner _unit];
        };
    };

    if (_deltaT > _randomUpdateTime) then {
        _unit setVariable [QGVAR(randomUpdateTime),(random [5, 7.5, 10]),true];
        _unit call FUNC(updateDatalink);
    };
} else {
    if (!local _unit) exitWith {};
};

//if (!isPlayer _unit) exitWith {}; // testing performance

if ([_unit] call EFUNC(lifesupport,handleUnitLifesupport)) then { // returns true when update ran
    //EGVAR(main,statemachineInitalized) = true;
};
