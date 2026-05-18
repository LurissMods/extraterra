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

private _currentDose = NORMAL_BACKGROUND_RADIATION min GETVAR(_logic,currentDose,nil);

if _isActivated then {
    EGVAR(common,currentEnvironRadiationPerHour) = _currentDose;
    publicVariable QEGVAR(common,currentEnvironRadiationPerHour);
    deleteVehicle _logic;
};
