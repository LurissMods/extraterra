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

GET_BATTERY(_unit) params ["_batteryClass","_currentSupply","_totalSupply"];

private _dummyClass = getText (configFile >> "CfgMagazines" >> _batteryClass >> "exterra_equipedDummy");

_unit removeItem _dummyClass;
_unit addMagazine [_batteryClass,(GET_BATTERY_RESERVE(_unit))];

SET_BATTERY(_unit,[],true);
SET_BATTERY_BOOL(_unit,false,true);
