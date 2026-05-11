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

private _airTankArray = [];

{
    private _currentAirTank = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_airTank");

    //systemChat str (_currentAirTank);

    if (((GET_SUIT_FACTION(_unit)) + 100) == _currentAirTank) then {
        _airTankArray pushBack _x;
    };

} forEach magazinesAmmo _unit;

systemChat str _airTankArray;

private _firstAirTank = (_airTankArray#0);
private _inArray = [(_firstAirTank select 0),(_firstAirTank select 1),(_firstAirTank select 1)];

SET_AIR_TANK(_unit,_inArray,true);

_unit removeItem (_firstAirTank#0);
