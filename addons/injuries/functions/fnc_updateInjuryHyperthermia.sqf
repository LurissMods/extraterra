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

private _unitCoreTemp = GET_CORE_TEMP(_unit);

if (_unitCoreTemp < (HUMAN_NATURAL_CORETEMP + CORE_TEMP_ERROR)) exitWith {};

//private _unitHashmap = _unit getVariable [QGVAR(unitHashmap),nil];
private _unitHashmap = GET_SYMPTOM_HASHMAP(_unit);

private _fatigueSeverity = linearConversion [HUMAN_NATURAL_CORETEMP,HYPERTHERMIA_DEATH,_unitCoreTemp,0,1,true];
private _headacheSeverity = linearConversion [HYPERTHERMIA_HEAT_CRAMPS,HYPERTHERMIA_DEATH,_unitCoreTemp,0,HEADACHE_SEVERE,true];
private _muscleCrampsSeverity = linearConversion [HYPERTHERMIA_HEAT_CRAMPS,HYPERTHERMIA_DEATH,_unitCoreTemp,0,MUSCLE_CRAMP_MAX,true];
private _hypotensionSeverity = linearConversion [HYPERTHERMIA_HEAT_EXHAUSTION,HYPERTHERMIA_DEATH,_unitCoreTemp,0,HYPERTHERMIA_BP_LIMIT,true];
private _heartRateSeverity = linearConversion [HYPERTHERMIA_HEAT_EXHAUSTION,HYPERTHERMIA_DEATH,_unitCoreTemp,0,HYPERTHERMIA_HR_LIMIT,true];

switch true do {
    case (_unitCoreTemp > HYPERTHERMIA_DEATH): {
        _unitHashmap set [((sID_CARDIAC_ARREST*ID_RADIX) + iID_HYPERTHERM),[nil,nil,nil]];
    };
    case (_unitCoreTemp > HYPERTHERMIA_HEAT_STROKE): {
        // Vomit - 0.003% chance per second (~10% chance 1 hour)
        if (random 1 < 0.00003) then {
            // 0 = screen, 1 = visor. Not yet implemented.
            _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_HYPERTHERM),[NAUSEA_MODERATE,0,nil]];
        };

        if (GET_HEAT_RASH_BOOL(_unit)) then {
            // Heat Rash
            _unitHashmap set [((sID_RASH*ID_RADIX) + iID_HYPERTHERM),[false,nil,nil]];
        };
    };
    case (_unitCoreTemp > HYPERTHERMIA_HEAT_EXHAUSTION): {
        // Vomit - 0.003% chance per second (~10% chance 1 hour)
        if (random 1 < 0.00003) then {
            // 0 = screen, 1 = visor. Not yet implemented.
            _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_HYPERTHERM),[NAUSEA_MODERATE,0,nil]];
        };

        if !(GET_HEAT_RASH_BOOL(_unit)) then {
            // Heat Rash
            _unitHashmap set [((sID_RASH*ID_RADIX) + iID_HYPERTHERM),[true,nil,nil]];
        };
    };
    case (_unitCoreTemp > HYPERTHERMIA_HEAT_CRAMPS): {
        // Vomit - 0.003% chance per second (~10% chance 1 hour)
        if (random 1 < 0.00003) then {
            // 0 = screen, 1 = visor. Not yet implemented.
            _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_HYPERTHERM),[NAUSEA_MILD,0,nil]];
        };

        if (GET_HEAT_RASH_BOOL(_unit)) then {
            // Heat Rash
            _unitHashmap set [((sID_RASH*ID_RADIX) + iID_HYPERTHERM),[false,nil,nil]];
        };
    };
    default {
        if (GET_HEAT_RASH_BOOL(_unit)) then {
            // Heat Rash
            _unitHashmap set [((sID_RASH*ID_RADIX) + iID_HYPERTHERM),[false,nil,nil]];
        };
    };
};

// Fatigue + Weakness
_unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_HYPERTHERM),[_fatigueSeverity,nil,nil]];
_unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_HYPERTHERM),[_fatigueSeverity,nil,nil]];
// Blood Pressure
_unitHashmap set [((sID_BP*ID_RADIX) + iID_HYPERTHERM),[_hypotensionSeverity,nil,nil]];
// Heart Rate
_unitHashmap set [((sID_HR*ID_RADIX) + iID_HYPERTHERM),[_heartRateSeverity,nil,nil]];
// Pain
_unitHashmap set [((sID_PAIN*ID_RADIX) + iID_HYPERTHERM),[(_headacheSeverity + _muscleCrampsSeverity),nil,nil]];
