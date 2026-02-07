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

params ["_unit"];

//if (true) exitWith {};

private _unitAwake = _unit call ACEFUNC(common,isAwake);

if (!isPlayer _unit || {!_unitAwake}) exitWith {}; // temp fix

private _heartRate = GET_HEART_RATE(_unit);
GET_BLOOD_PRESSURE(_unit) params ["_bloodPressureL", "_bloodPressureH"];
private _meanBP = (2/3) * _bloodPressureH + (1/3) * _bloodPressureL;

private _flag = GETVAR(_unit,GVAR(cardiacArrestFlag),false);

if (_heartRate >= HEART_RATE_FATAL_HIGH || {_heartRate <= HEART_RATE_FATAL_LOW || {_meanBP < BLOOD_PRESSURE_FATAL_LOW || {_meanBP > BLOOD_PRESSURE_FATAL_HIGH}}}) then {

    if (!_flag) then {
        SETVAR(_unit,GVAR(cardiacArrestTimer),CBA_missionTime);
        //GVAR(cardiacArrestFlag) = true;
        SETVAR(_unit,GVAR(cardiacArrestFlag),true);
    };

    private _unitCardiacArrestTimer = GETVAR(_unit,GVAR(cardiacArrestTimer),CBA_missionTime);

    private _timer = (CBA_missionTime - _unitCardiacArrestTimer);
    systemChat str _timer;

    if ((CBA_missionTime - _unitCardiacArrestTimer) > CARDIAC_ARREST_TIMEOUT) then {
        [_unit, true] call ace_medical_status_fnc_setUnconsciousState;
        [_unit, true] call ace_medical_status_fnc_setCardiacArrestState;
    };

} else {
    SETVAR(_unit,GVAR(cardiacArrestFlag),false);
};
