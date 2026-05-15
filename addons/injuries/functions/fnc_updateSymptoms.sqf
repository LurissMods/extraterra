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

//private _unitHashmap = _unit getVariable [QGVAR(unitHashmap),nil];
private _unitHashmap = GET_SYMPTOM_HASHMAP(_unit);
private _unitHashmapKeys = keys _unitHashmap;
private _unitCurrentSymptoms = [];

private _unitCurrentArsTimer = GET_ARS_TIMER(_unit);
private _currentRadLimIndex = GET_ARS_RAD_INDEX(_unit);

private _painArray = [];
private _fatigueArray = [];
private _weaknessArray = [];
private _bpArray = [];
private _hrArray = [];
private _feverArray = [];
private _spo2Array = [];


/* ---------------------------------- Extracting IDs ---------------------------------- */

{
    private _symptomID = floor(_x/ID_RADIX);
    private _injuryID = _x%ID_RADIX;
    _unitCurrentSymptoms pushBack [_x,_symptomID, _injuryID];

} forEach _unitHashmapKeys;

/* ---------------------------------- Symptom processing ---------------------------------- */

if (isPlayer _unit)  then {
    //systemChat format ["Hashmap: %1",_unitCurrentSymptoms];
    //_unit setVariable [QGVAR(hrAdjust),-100,_syncValue];
};

{
    _x params ["_currentHashKey","_symptomID","_injuryID"];
    (_unitHashmap get _currentHashKey) params ["_variable0","_variable1","_callTime"];

    if (isPlayer _unit)  then {
        //systemChat format ["sID: %1, iID: %2, v0: %3, v1: %4",_symptomID,_injuryID,_variable0,_variable1];
        //systemChat format ["Time remaining: %1",(_unitCurrentArsTimer - CBA_missionTime)];
    };

    /* ---------------------------------- Injury timing ---------------------------------- */

    // Only apply ARS symptoms if the timer is up
    if (CBA_missionTime < _unitCurrentArsTimer) then {
        if (_injuryID == iID_ARS) then {
            continue;
        };
    } else {
        private _newUnitTimer = [
            NO_ARS_TIMER, // Case 0
            (ARS_STAGE_1_TIMER*(random [0.8,1,1.2])), // Case 1
            (ARS_STAGE_2_TIMER*(random [0.8,1,1.2])), // Case 2
            (ARS_STAGE_3_TIMER*(random [0.8,1,1.2])), // Case 3
            (ARS_STAGE_4_TIMER*(random [0.8,1,1.2])), // Case 4
            (ARS_STAGE_5_TIMER*(random [0.8,1,1.2])), // Case 5
            (ARS_STAGE_6_TIMER*(random [0.8,1,1.2])), // Case 6
            (ARS_STAGE_7_TIMER*(random [0.8,1,1.2])), // Case 7
            (ARS_STAGE_8_TIMER*(random [0.8,1,1.2])), // Case 8
            (ARS_STAGE_9_TIMER*(random [0.8,1,1.2]))  // Case 9
        ];
        _unit setVariable [QGVAR(unitArsTimer),((_newUnitTimer select _currentRadLimIndex) + CBA_missionTime),_syncValue];
    };

    /* ---------------------------------- Symptom processing ---------------------------------- */

    switch _symptomID do {
        case sID_DEATH: {
            //systemChat format ["Death called! Hash: %1, sID: %2, iID: %3",_currentHashKey,_symptomID,_variable0];
            [_unit,_injuryID] call FUNC(symptomDeath);
        };
        case sID_UNCON: {
            // _variable0: min uncon time.   _variable1: Force uncon at min time.
            [_unit,_variable0,_variable1] call FUNC(symptomUncon);
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_CARDIAC_ARREST: {
            if !(IN_CRDC_ARRST(_unit)) then {
                [QACEGVAR(medical,FatalVitals), _unit] call CBA_fnc_localEvent;
            };
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_PAIN: {
            _painArray pushBack _variable0;
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_NAUSEA: {
            // _variable0: Severity = Mild, Moderate, Severe.  _variable1: visorType = Screen/glass
            [_unit,_variable0,_variable1] call FUNC(symptomNausea);
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_FATIGUE: {
            _fatigueArray pushBack _variable0;
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_WEAKNESS: {
            _weaknessArray pushBack _variable0;
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_NO_RUN: {
            if (_variable0) then {
                if (isSprintAllowed _unit) then {
                    _unit allowSprint false;
                };
            } else {
                if !(isSprintAllowed _unit) then {
                    _unit allowSprint true;
                };
            };
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_NO_JOG: {
            if (_variable0) then {
                if !(isForcedWalk _unit) then {
                    _unit allowSprint false;
                    _unit forceWalk true;
                };
            } else {
                if (isForcedWalk _unit) then {
                    _unit forceWalk false;
                };
            };
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_BP: {
            _bpArray pushBack _variable0;
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_HR: {
            if (_unit == ACE_player) then {
                //systemChat str _injuryID;
            };
            _hrArray pushBack _variable0;
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_FEVER: {
            _feverArray pushBack _variable0;
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_HYPERVENT: {

        };
        case sID_TINNITUS: {
            // _variable0: Tinnitus intensity
            _variable0 call ACEFUNC(hearing,earringing);
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_BLUR_VIS: {
            // _variable0: Blur intensity   _variable1: Blur commit time
            [_unit,_variable0,_variable1] call FUNC(symptomVisionBlur);
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_DEAFNESS: {
            // _variable0: Deafness intensity   _variable1: True/false bool
            [_unit,_injuryID,_variable0,_variable1] call FUNC(symptomDeafness);
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_SPO2: {
            _spo2Array pushBack _variable0;
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_RASH: {
            SET_HEAT_RASH_BOOL(_unit,_variable0,_syncValue);
            _unitHashmap deleteAt _currentHashKey;
        };
        case sID_LIMP: {
            [_unit,_variable0] call FUNC(symptomLimp);
        };
        case sID_CYANOSIS: {
            SET_CYANOSIS_BOOL(_unit,_variable0,_syncValue);
            _unitHashmap deleteAt _currentHashKey;
        };
    };
    //_unitHashmap deleteAt _x;
} forEach _unitCurrentSymptoms;

// Average the pain value from multiple injuries
if (_painArray isNotEqualTo []) then {
    private _avg = 0;
    {
        _avg = _avg + _x;
    } forEach _painArray;
    [_unit, _avg] call ACEFUNC(medical_status,adjustPainLevel);
};

// Average the fatigue value from multiple injuries
if (_fatigueArray isNotEqualTo []) then {
    [_unit,_fatigueArray] call FUNC(symptomFatigue);
};

// Average the weakness value from multiple injuries
if (_weaknessArray isNotEqualTo []) then {
    [_unit,_weaknessArray] call FUNC(symptomWeakness);
};

// Average the blood pressure value from multiple injuries
if (_bpArray isNotEqualTo []) then {
    [_unit,_bpArray,_syncValue] call FUNC(symptomBloodPressure);
};

// Average the heart rate value from multiple injuries
if (_hrArray isNotEqualTo []) then {
    [_unit,_hrArray,_syncValue] call FUNC(symptomHeartRate);
};

// Average the fever value from multiple injuries
if (_feverArray isNotEqualTo []) then {
    [_unit,_feverArray,_syncValue] call FUNC(symptomFever);
};

// Average the fever value from multiple injuries
if (_spo2Array isNotEqualTo []) then {
    //systemChat str _spo2Array;
    [_unit,_deltaT,_syncValue,_spo2Array] call FUNC(symptomSPO2);
};
