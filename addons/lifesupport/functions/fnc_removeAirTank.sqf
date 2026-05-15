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

GET_AIR_TANK(_unit) params ["_airTankClass","_airTankCurrent","_airTankMax"];

private _dummyClass = getText (configFile >> "CfgMagazines" >> _airTankClass >> "exterra_equipedDummy");

if (GET_SUIT_ACTIVATED(_unit)) then {
    _unit removeItem _dummyClass;
    _unit addMagazine [_airTankClass,GET_AIR_RESERVE(_unit)];
} else {
    _unit removeItem _dummyClass;
    _unit addMagazine [_airTankClass,_airTankCurrent];
};

SET_AIR_TANK(_unit,[],true);
SET_AIR_TANK_BOOL(_unit,false,true);
