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

params ["_unit"];

private _return = false;
private _unitItems = items _unit;

{
    private _isItemVomitHelm = getNumber (configFile >> QUOTE(CfgWeapons) >> _x >> QUOTE(exterra_uniforms_vomitSeverity));
    if (_isItemVomitHelm > 0) exitWith {
        _return = true;
    };

} forEach _unitItems;

_return;
