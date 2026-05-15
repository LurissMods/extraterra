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
GET_SUIT_BOOLS(_unit) params ["_inFullSuit","_helmetBool","_suitBool","_packBool"];

if (_unit != ACE_player) exitWith {}; // Disabled for AI. Will revist this

private _unitHashmap = GET_SYMPTOM_HASHMAP(_unit);
private _canUnitBreathe = [_unit] call EFUNC(common,canUnitBreathe);
private _currentSpo2 = nil;
private _breathePartial = nil;
private _breatheSuitNoAir = nil;
private _simpleSpo2Bool = false;

if (_unit == ACE_player && {ACEGVAR(medical_vitals,simulateSpO2)}) then {
    _currentSpo2 = GET_SPO2(_unit);
    _breathePartial = ASPHYX_BREATHE_PARTIAL;
    _breatheSuitNoAir = ASPHYX_BREATHE_SUIT_NO_AIR;
} else {
    _currentSpo2 = GET_SIMPLE_SPO2(_unit);
    _breathePartial = ASPHYX_BREATHE_PARTIAL_SIMPLE;
    _breatheSuitNoAir = ASPHYX_BREATHE_SUIT_NO_AIR_SIMPLE;
    _simpleSpo2Bool = true;
};

switch _canUnitBreathe do {
    case ATMO_BREATHE_NONE: {
        _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[ASPHYX_BREATHE_NONE,nil,nil]];
    };
    case ATMO_BREATHE_SUIT: {
        if ((GET_AIR_RESERVE(_unit)) == 0) then {
            _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[_breatheSuitNoAir,nil,nil]];
        } else {
            _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[_breathePartial,nil,nil]];
        };
    };
    case ATMO_BREATHE_PARTIAL: {
        _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[_breathePartial,nil,nil]];
    };
    case ATMO_BREATHE_FULL: {
        if _inFullSuit then {
            _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[_breathePartial,nil,nil]];
        } else {
            _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[ASPHYX_BREATHE_FULL,nil,nil]];
        };
    };
    default {
        _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_ASPHYXIATION),[ASPHYX_BREATHE_FULL,nil,nil]];
    };
};

switch true do {
    case (_currentSpo2 < ASPHYX_SPO2_CARDIAC_ARREST_LIMIT): {
        _unitHashmap set [((sID_CARDIAC_ARREST*ID_RADIX) + iID_ASPHYXIATION),[nil,nil,nil]];
    };
    case (_currentSpo2 < ASPHYX_SPO2_LIMP_LIMIT): {
        _unitHashmap set [((sID_LIMP*ID_RADIX) + iID_ASPHYXIATION),[true,nil,nil]];
    };
    case (_currentSpo2 < ASPHYX_SPO2_WALK_LIMIT): {
        _unitHashmap set [((sID_NO_JOG*ID_RADIX) + iID_ASPHYXIATION),[true,nil,nil]];
        _unitHashmap set [((sID_LIMP*ID_RADIX) + iID_ASPHYXIATION),[false,nil,nil]];
    };
    case (_currentSpo2 < ASPHYX_SPO2_CYANOSIS_LIMIT): {
        _unitHashmap set [((sID_CYANOSIS*ID_RADIX) + iID_ASPHYXIATION),[true,nil,nil]];
        _unitHashmap set [((sID_NO_RUN*ID_RADIX) + iID_ASPHYXIATION),[true,nil,nil]];
        _unitHashmap set [((sID_NO_JOG*ID_RADIX) + iID_ASPHYXIATION),[false,nil,nil]];
    };
    default {
        _unitHashmap set [((sID_CYANOSIS*ID_RADIX) + iID_ASPHYXIATION),[false,nil,nil]];
        _unitHashmap set [((sID_NO_JOG*ID_RADIX) + iID_ASPHYXIATION),[false,nil,nil]];
        _unitHashmap set [((sID_NO_RUN*ID_RADIX) + iID_ASPHYXIATION),[false,nil,nil]];
        _unitHashmap set [((sID_LIMP*ID_RADIX) + iID_ASPHYXIATION),[false,nil,nil]];
    };
};

if (_simpleSpo2Bool) then {
    if !(IN_CRDC_ARRST(_unit)) then {
        private _hrAdjust = linearConversion [ASPHYX_LIN_CONVERSION_SPO2_START,ASPHYX_SPO2_CARDIAC_ARREST_LIMIT,_currentSpo2,0,ASPHYX_HR_LIMIT,true];
        private _bpAdjust = linearConversion [ASPHYX_LIN_CONVERSION_SPO2_START,ASPHYX_SPO2_CARDIAC_ARREST_LIMIT,_currentSpo2,0,ASPHYX_BP_LIMIT,true];
        private _fatigueWeaknessCoeff = linearConversion [ASPHYX_LIN_CONVERSION_SPO2_START,ASPHYX_SPO2_CARDIAC_ARREST_LIMIT,_currentSpo2,0,ASPHYX_FATIGUE_WEAKNESS_LIMIT,true];

        // Heart Rate
        _unitHashmap set [((sID_HR*ID_RADIX) + iID_ASPHYXIATION),[_hrAdjust,nil,nil]];
        // Blood Pressure
        _unitHashmap set [((sID_BP*ID_RADIX) + iID_ASPHYXIATION),[_bpAdjust,nil,nil]];
        // Fatigue + Weakness
        _unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_ASPHYXIATION),[_fatigueWeaknessCoeff,nil,nil]];
        _unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_ASPHYXIATION),[_fatigueWeaknessCoeff,nil,nil]];
    };
} else {
    if !(IN_CRDC_ARRST(_unit)) then {
        private _bpAdjust = linearConversion [ASPHYX_LIN_CONVERSION_SPO2_START,ASPHYX_SPO2_CARDIAC_ARREST_LIMIT,_currentSpo2,0,ASPHYX_BP_LIMIT,true];
        private _fatigueWeaknessCoeff = linearConversion [ASPHYX_LIN_CONVERSION_SPO2_START,ASPHYX_SPO2_CARDIAC_ARREST_LIMIT,_currentSpo2,0,ASPHYX_FATIGUE_WEAKNESS_LIMIT,true];

        // Blood Pressure
        _unitHashmap set [((sID_BP*ID_RADIX) + iID_ASPHYXIATION),[_bpAdjust,nil,nil]];
        // Fatigue + Weakness
        _unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_ASPHYXIATION),[_fatigueWeaknessCoeff,nil,nil]];
        _unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_ASPHYXIATION),[_fatigueWeaknessCoeff,nil,nil]];
    };
};
