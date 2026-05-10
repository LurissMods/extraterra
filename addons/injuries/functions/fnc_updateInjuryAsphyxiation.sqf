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

params ["_unit","_deltaT","_syncValue"];

private _unitHashmap = GET_SYMPTOM_HASHMAP(_unit);

if (GET_ATMO(_unit) == ATMO_STATE_VACUUM) then {
    if ((GET_AIR_RESERVE(_unit)) == 0) then {
        if (_unit == ACE_player) then {
            if (ACEGVAR(medical_vitals,simulateSpO2)) then {
                _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[0,nil,nil]];
            } else {

            };
        };
    } else {
        if (_unit == ACE_player) then {
            if (ACEGVAR(medical_vitals,simulateSpO2)) then {
                _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[1,nil,nil]];
            } else {

            };
        };
    };
} else {
    if (_unit == ACE_player) then {
        if (ACEGVAR(medical_vitals,simulateSpO2)) then {
            _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[1,nil,nil]];
        } else {

        };
    };
};
