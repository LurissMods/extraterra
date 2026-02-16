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

    // First time set up on mission init for each unit
    // Air and Pressure
    _unit setVariable [QGVAR(unitInAtmo),ATMO_STATE_ERROR,true];
    _unit setVariable [QGVAR(unitAirMaxReserve),10000,true]; // 10000 temp value until air tank system implemented
    _unit setVariable [QGVAR(unitAirReserve),10000,true]; // 10000 temp value until air tank system implemented
    _unit setVariable [QGVAR(unitAirConsumption),0,true];

    // Temperature
    _unit setVariable [QGVAR(unitEnvTemp),ROOM_TEMP,true];
    _unit setVariable [QGVAR(unitSuitTemp),ROOM_TEMP,true];
    _unit setVariable [QGVAR(unitCoreTemp),HUMAN_NATURAL_CORETEMP,true];
    _unit setVariable [QGVAR(unitRadiatedCoreTemp),0,true];
    _unit setVariable [QGVAR(unitActiveThermalCool),0,true];
    _unit setVariable [QGVAR(unitActiveThermalHeat),0,true];
    _unit setVariable [QGVAR(unitNetHeatPwr),0,true];
    _unit setVariable [QGVAR(unitDeltaTemp),0,true];

    // Radiation
    _unit setVariable [QGVAR(unitInRadShield),0,true];
    _unit setVariable [QGVAR(unitRadShieldCoeff),RAD_COEFF0_DEFAULT,true];
    _unit setVariable [QGVAR(unitLifetimeRadLevel),0,true];

    // Electrical
    _unit setVariable [QGVAR(unitCurrentBatteryCapacity),100000,true]; // 100000 temp value until battery system implemented
    _unit setVariable [QGVAR(unitMaxBatteryCapacity),100000,true]; // 100000 temp value until battery system implemented
    _unit setVariable [QGVAR(unitPowerDraw),0,true];

    // Suit
    _unit setVariable [QGVAR(suitActivated), false, true];
    _unit setVariable [QGVAR(unitSuitBools),[false,false,false,false],true];
    _unit setVariable [QGVAR(unitSuitFaction),NO_SUIT_FACTION,true];
    _unit setVariable [QGVAR(unitSuitData),[DEFAULT_SUIT_OFF_AIR_RESERVE,DEFAULT_SUIT_MOBILITY,DEFAULT_SUIT_BLACK_BODY,DEFAULT_SUIT_SOLAR_ABSORB,DEFAULT_SUIT_THICKNESS],true];

    _unit addEventHandler ["Respawn", {[(_this select 0), true] call FUNC(initUnit)}];
};

if (_isRespawn) then {
    TRACE_1("reseting all vars on respawn",_isRespawn); // note: state is handled by ace_medical_statemachine_fnc_resetStateDefault

    // Air and Pressure
    _unit setVariable [QGVAR(unitInAtmo),ATMO_STATE_ERROR,true];
    _unit setVariable [QGVAR(unitAirMaxReserve),10000,true]; // 10000 temp value until air tank system implemented
    _unit setVariable [QGVAR(unitAirReserve),10000,true]; // 10000 temp value until air tank system implemented
    _unit setVariable [QGVAR(unitAirConsumption),0,true];

    // Temperature
    _unit setVariable [QGVAR(unitEnvTemp),ROOM_TEMP,true];
    _unit setVariable [QGVAR(unitSuitTemp),ROOM_TEMP,true];
    _unit setVariable [QGVAR(unitCoreTemp),HUMAN_NATURAL_CORETEMP,true];
    _unit setVariable [QGVAR(unitRadiatedCoreTemp),0,true];
    _unit setVariable [QGVAR(unitActiveThermalCool),0,true];
    _unit setVariable [QGVAR(unitActiveThermalHeat),0,true];
    _unit setVariable [QGVAR(unitNetHeatPwr),0,true];
    _unit setVariable [QGVAR(unitDeltaTemp),0,true];

    // Radiation
    _unit setVariable [QGVAR(unitInRadShield),0,true];
    _unit setVariable [QGVAR(unitRadShieldCoeff),RAD_COEFF0_DEFAULT,true];
    _unit setVariable [QGVAR(unitLifetimeRadLevel),0,true];

    // Electrical
    _unit setVariable [QGVAR(unitCurrentBatteryCapacity),100000,true]; // 100000 temp value until battery system implemented
    _unit setVariable [QGVAR(unitMaxBatteryCapacity),100000,true]; // 100000 temp value until battery system implemented

    // Suit
    _unit setVariable [QGVAR(suitActivated), false, true];
    _unit setVariable [QGVAR(unitSuitBools),[false,false,false,false],true];
    _unit setVariable [QGVAR(unitSuitFaction),NO_SUIT_FACTION,true];
    _unit setVariable [QGVAR(unitSuitData),[DEFAULT_SUIT_OFF_AIR_RESERVE,DEFAULT_SUIT_MOBILITY,DEFAULT_SUIT_BLACK_BODY,DEFAULT_SUIT_SOLAR_ABSORB,DEFAULT_SUIT_THICKNESS],true];
};

[{
    params ["_unit"];
    TRACE_3("Unit Init",_unit,local _unit,typeOf _unit);

    //_unit setVariable [QEGVAR(medical,initialized), true, true];
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;
