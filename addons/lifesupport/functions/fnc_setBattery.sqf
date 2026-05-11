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

private _batteryArray = [];

{
    private _currentBattery = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_battery");

    //systemChat str (_currentAirTank);

    if (((GET_SUIT_FACTION(_unit)) + 100) == _currentBattery) then {
        _batteryArray pushBack _x;
    };

} forEach magazinesAmmo _unit;

systemChat str _batteryArray;

private _firstBattery = (_batteryArray#0);
private _inArray = [(_firstBattery select 0),(_firstBattery select 1),(_firstBattery select 1)];

SET_BATTERY(_unit,_inArray,true);

_unit removeItem (_firstBattery#0);
