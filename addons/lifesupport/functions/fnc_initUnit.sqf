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

params ["_unit", ["_isRespawn", true]];
TRACE_2("initUnit",_unit,_isRespawn);

if (!local _unit) exitWith {};

if (!_isRespawn) then { // Always add respawn EH (same as CBA's onRespawn=1)

    private _suitBoolsInit = [false,false,false,false];
    private _suitDataInit = [DEFAULT_SUIT_OFF_AIR_RESERVE,DEFAULT_SUIT_MOBILITY,DEFAULT_SUIT_BLACK_BODY,DEFAULT_SUIT_SOLAR_ABSORB,DEFAULT_SUIT_THICKNESS];

    // First time set up on mission init for each unit
    // Air and Pressure
    SET_ATMO(_unit,ATMO_STATE_ERROR,true);
    SET_AIR_RESERVE_MAX(_unit,10000,true); // 10000 temp value until air tank system implemented
    SET_AIR_RESERVE(_unit,10000,true); // 10000 temp value until air tank system implemented
    SET_AIR_CONSUMPTION(_unit,0,true);

    // Temperature
    SET_ENVIRONMENT_TEMP(_unit,ROOM_TEMP,true);
    SET_SUIT_TEMP(_unit,ROOM_TEMP,true);
    SET_CORE_TEMP(_unit,HUMAN_NATURAL_CORETEMP,true);
    SET_RADIATED_CORE_HEAT(_unit,0,true);
    SET_ACTIVE_COOL(_unit,0,true);
    SET_ACTIVE_HEAT(_unit,0,true);
    SET_NET_HEAT(_unit,0,true);
    SET_DELTA_TEMP(_unit,0,true);

    // Radiation
    SET_RAD_SHIELD_CASE(_unit,0,true);
    SET_RAD_SHIELD_COEFF(_unit,RAD_COEFF0_DEFAULT,true);
    SET_LIFETIME_RAD(_unit,0,true);

    // Electrical
    SET_BATTERY_RESERVE(_unit,100000,true);
    SET_BATTERY_RESERVE_MAX(_unit,100000,true);
    SET_POWER_DRAW(_unit,0,true);

    // Suit
    SET_SUIT_ACTIVATED(_unit,false,true);
    SET_SUIT_BOOLS(_unit,_suitBoolsInit,true);
    SET_SUIT_FACTION(_unit,NO_SUIT_FACTION,true);
    SET_SUIT_DATA(_unit,_suitDataInit,true);

    _unit addEventHandler ["Respawn", {[(_this select 0), true] call FUNC(initUnit)}];
};

if (_isRespawn) then {
    TRACE_1("reseting all vars on respawn",_isRespawn); // note: state is handled by ace_medical_statemachine_fnc_resetStateDefault

    private _suitBoolsInit = [false,false,false,false];
    private _suitDataInit = [DEFAULT_SUIT_OFF_AIR_RESERVE,DEFAULT_SUIT_MOBILITY,DEFAULT_SUIT_BLACK_BODY,DEFAULT_SUIT_SOLAR_ABSORB,DEFAULT_SUIT_THICKNESS];

    // Air and Pressure
    SET_ATMO(_unit,ATMO_STATE_ERROR,true);
    SET_AIR_RESERVE_MAX(_unit,10000,true); // 10000 temp value until air tank system implemented
    SET_AIR_RESERVE(_unit,10000,true); // 10000 temp value until air tank system implemented
    SET_AIR_CONSUMPTION(_unit,0,true);

    // Temperature
    SET_ENVIRONMENT_TEMP(_unit,ROOM_TEMP,true);
    SET_SUIT_TEMP(_unit,ROOM_TEMP,true);
    SET_CORE_TEMP(_unit,HUMAN_NATURAL_CORETEMP,true);
    SET_RADIATED_CORE_HEAT(_unit,0,true);
    SET_ACTIVE_COOL(_unit,0,true);
    SET_ACTIVE_HEAT(_unit,0,true);
    SET_NET_HEAT(_unit,0,true);
    SET_DELTA_TEMP(_unit,0,true);

    // Radiation
    SET_RAD_SHIELD_CASE(_unit,0,true);
    SET_RAD_SHIELD_COEFF(_unit,RAD_COEFF0_DEFAULT,true);
    SET_LIFETIME_RAD(_unit,0,true);

    // Electrical
    SET_BATTERY_RESERVE(_unit,100000,true);
    SET_BATTERY_RESERVE_MAX(_unit,100000,true);
    SET_POWER_DRAW(_unit,0,true);

    // Suit
    SET_SUIT_ACTIVATED(_unit,false,true);
    SET_SUIT_BOOLS(_unit,_suitBoolsInit,true);
    SET_SUIT_FACTION(_unit,NO_SUIT_FACTION,true);
    SET_SUIT_DATA(_unit,_suitDataInit,true);
};

[{
    params ["_unit"];
    TRACE_3("Unit Init",_unit,local _unit,typeOf _unit);

    _unit setVariable [QGVAR(initialized), true, true];
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;
