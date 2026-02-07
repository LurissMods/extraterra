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

    // Air and Pressure
    SETVAR(_unit,GVAR(inAtmo),ATMO_STATE_ERROR);

    // Temperature
    SETVAR(_unit,GVAR(suitTemp),0); // Note, need to rename define, that's why I haven't put it in yet
    SETVAR(_unit,GVAR(coreTemp),HUMAN_NATURAL_CORETEMP);

    // Radiation
    SETVAR(_unit,GVAR(inRadShield),RAD_COEFF0_DEFAULT);
    SETVAR(_unit,GVAR(lifetimeRadLevel),0);
};

[{
    params ["_unit"];
    TRACE_3("Unit Init",_unit,local _unit,typeOf _unit);

    //_unit setVariable [QEGVAR(medical,initialized), true, true];
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;
