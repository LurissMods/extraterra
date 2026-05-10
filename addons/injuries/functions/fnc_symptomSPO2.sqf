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

params ["_unit","_spo2Array"];

if (!ACEGVAR(medical_vitals,simulateSpO2)) exitWith {};

private _lowest = 0;
{
    if (_x < _lowest) then {
        _lowest = _x;
    }
} forEach _spo2Array;

// 1 is no effect, 0 is completely blocked breathing
ACEGVAR(medical_vitals,spo2DutyList) set [QGVAR(spo2Factor), _lowest];
