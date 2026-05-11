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

GET_AIR_TANK(_unit) params ["_tankClass","_currentSupply","_totalSupply"];

_unit addMagazine [_tankClass,(GET_AIR_RESERVE(_unit))];

SET_AIR_TANK(_unit,[],true);
