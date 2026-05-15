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
GET_SUIT_BOOLS(_unit) params ["_inFullSuit","_helmetBool","_suitBool","_packBool"];

private _return = false;

if (_inFullSuit && {!(GET_SUIT_ACTIVATED(_unit)) && {GET_BATTERY_RESERVE(_unit) > 0}}) then {
    _return = true;
};

_return;
