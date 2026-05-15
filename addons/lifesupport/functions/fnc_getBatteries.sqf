#include "..\script_component.hpp"
/*
* Author: Luriss
* Initalizes life support variables for all units.
*
* Arguments:
* [_unit, _isRespawn] [<UNIT>, <BOOL>]
* _unit - Current unit
* _isRespawn - Whether or not this is the first time a unit has spawned
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_initUnit;
*
* Public: No
*/

params ["_unit"];

private _configReturn = false;

{
    private _currentBattery = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_battery");

    if ((GET_SUIT_FACTION(_unit)) == _currentBattery) exitWith {_configReturn = true};

} forEach magazinesAmmo _unit;

_configReturn;
