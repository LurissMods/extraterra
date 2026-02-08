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

params ["_unit", ["_isRespawn", true]];
TRACE_2("initUnit",_unit,_isRespawn);

if (!_isRespawn) then { // Always add respawn EH (same as CBA's onRespawn=1)
    _unit addEventHandler ["Respawn", {[(_this select 0), true] call FUNC(initUnit)}];
};

if (!local _unit) exitWith {};

/*if (damage _unit > 0) then {
    _unit setDamage 0;
};*/

if (_isRespawn) then {
    TRACE_1("reseting all vars on respawn",_isRespawn); // note: state is handled by ace_medical_statemachine_fnc_resetStateDefault

    // Air and Pressure/
    _unit setVariable [QGVAR(unitInAtmo),ATMO_STATE_ERROR,true];
    _unit setVariable [QGVAR(unitAirMaxReserve),0,true];
    _unit setVariable [QGVAR(unitAirReserve),0,true];

    // Temperature
    _unit setVariable [QGVAR(unitSuitTemp),ROOM_TEMP,true];
    _unit setVariable [QGVAR(unitCoreTemp),HUMAN_NATURAL_CORETEMP,true];
    _unit setVariable [QGVAR(unitRadiatedCoreTemp),0,true];
    _unit setVariable [QGVAR(unitActiveThermalCool),0,true];
    _unit setVariable [QGVAR(unitActiveThermalHeat),0,true];

    // Radiation
    _unit setVariable [QGVAR(unitInRadShield),RAD_COEFF0_DEFAULT,true];
    _unit setVariable [QGVAR(unitLifetimeRadLevel),0,true];

    // Electrical
    _unit setVariable [QGVAR(unitCurrentBatteryCapacity),0,true];

    // Suit
    _unit setVariable [QGVAR(unitSuitBools),[false,false,false,false],true];
    _unit setVariable [QGVAR(unitSuitFaction),NO_SUIT_FACTION,true];
    _unit setVariable [QGVAR(unitSuitData),[DEFAULT_SUIT_OFF_AIR_RESERVE,DEFAULT_SUIT_MOBILITY,DEFAULT_SUIT_BLACK_BODY,DEFAULT_SUIT_SOLAR_ABSORB,DEFAULT_SUIT_THICKNESS],true];

    systemChat "initUnit ran";
};

[{
    params ["_unit"];
    TRACE_3("Unit Init",_unit,local _unit,typeOf _unit);

    //_unit setVariable [QEGVAR(medical,initialized), true, true];
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;
