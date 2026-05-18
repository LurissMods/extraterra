#include "..\script_component.hpp"
/*
* Author: Luriss
* Changes the radiation level of the mission.
*
* Arguments:
* Passed from module. Check CfgVehicles.hpp for attribute classes.
*
* Return Value:
* None
*
* Example:
* Called via module in CfgVehicles.hpp.
*
* Public: No
*/

// e^(-5x^2)

private _logic = _this param [0,objnull,[objnull]];
private _isActivated = _this param [2,true,[true]];

private _duration = 10 max GETVAR(_logic,duration,nil);
private _maxDose = GETVAR(_logic,totalDose,nil);

if (_duration < 1800) then {
    _duration = 1800;
};

if (_maxDose > 10000) then {
    _maxDose = 10000;
};

if _isActivated then {
    [QGVAR(stormEvent), [_duration, _maxDose]] call CBA_fnc_serverEvent;
    deleteVehicle _logic;
};
