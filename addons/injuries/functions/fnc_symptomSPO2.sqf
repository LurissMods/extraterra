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

params ["_unit","_deltaT","_syncValue","_spo2Array"];

private _lowest = 1;
{
    if (_x < _lowest) then {
        _lowest = _x;
    }
} forEach _spo2Array;



if (_unit == ACE_player && {ACEGVAR(medical_vitals,simulateSpO2)}) then {
    // 1 is no effect, 0 is completely blocked breathing
    ACEGVAR(medical_vitals,spo2DutyList) set [QGVAR(spo2Factor), _lowest];
} else {
    private _deltaSpo2 = linearConversion [1,0,_lowest,SPO2_MAX_DELTA,-SPO2_MAX_DELTA,true]*_deltaT;
    private _newSpo2 = 0 max ((GET_SIMPLE_SPO2(_unit)) + _deltaSpo2) min 100;
    SET_SIMPLE_SPO2(_unit,_newSpo2,_syncValue);
};
