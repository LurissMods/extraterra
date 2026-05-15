#include "..\script_component.hpp"
/*
* Author: Luriss
* Main calculation loop for life support. Done to ensure that 1) life support is only enabled and run when desired (I chose this instead of a CBA option), and 2) ensure that life support area calculations are done only on the server.
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

private _logic = _this param [0,objnull,[objnull]];
private _checkTime = _logic getVariable ["checkTime", 0.5];

EGVAR(common,exterraEnabled) = true;
publicVariable QEGVAR(common,exterraEnabled);
