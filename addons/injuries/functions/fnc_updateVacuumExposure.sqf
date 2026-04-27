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

params ["_unit","_syncValues"];

private _unitTimer = CBA_missionTime - (_unit getVariable [QGVAR(unitVacuumExposedTime),nil]);

//private _heartRateAdjust = linearConversion[0,30,_unitTimer,0,200];
//[_unit, _heartRateAdjust, _deltaT, _syncValues] call ACEFUNC(medical_vitals,updateHeartRate);
systemChat str GET_HEART_RATE(_unit);
private _unitUnconBool = _unit getVariable [QGVAR(unitBaroUnconBool),nil];
private _unitCardiacArrestBool = _unit getVariable [QGVAR(unitBaroCardiacArrestBool),nil];

if (!_unitUnconBool && {_unitTimer > (_unit getVariable [QGVAR(unitBaroUncon),nil])}) then {
    systemChat "Stage 1";
    _unit setVariable [QGVAR(unitBaroUnconBool),true,_syncValues];

    // If knocked out by an injury I can't force uncon. Using cardiac arrest as a work around.
    if (IS_UNCONSCIOUS(_unit)) then {
        _unit setVariable [QGVAR(unitBaroCardiacArrestBool),true,_syncValues];
        [QACEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
        systemChat "Stage 2 skipped";
    } else {
        [_unit, true, 120] call ACEFUNC(medical,setUnconscious);
    };
};
if (!_unitCardiacArrestBool && {_unitTimer > (_unit getVariable [QGVAR(unitBaroCardiacArrest),nil])}) then {
    systemChat "Stage 2";
    _unit setVariable [QGVAR(unitBaroCardiacArrestBool),true,_syncValues];
    [QACEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
    //_unit setVariable [VAR_CRDC_ARRST,true,_syncValues];
    //[_unit] call ACEFUNC(medical_statemachine,enteredStateCardiacArrest);
};
// ~30 sec. Cardiac arrest
if (_unitTimer > (_unit getVariable [QGVAR(unitBaroDeath),nil])) then {
    systemChat "Stage 3";
    [_unit, "Vacuum Exposure", objNull, objNull] call ACEFUNC(common,setDead);
};
