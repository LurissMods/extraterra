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

private _unitCurrentArsTimer = _unit getVariable [QGVAR(unitArsTimer),nil];
private _unitArsHashmap = _unit getVariable [QGVAR(unitArsHashMap),nil];
private _unitSymptoms = keys _unitArsHashmap;
private _currentRadLimIndex = (_unit getVariable [QGVAR(unitRadLimIndex),nil]);

systemChat format ["Update ARS fired! Unit: %1, Symptoms: %2, Current rad case: %3",_unit,_unitSymptoms,_currentRadLimIndex];

//systemChat str _unitSymptoms;

{
    switch _x do {
        case "vomit": {
            // consider adding non-player effect for AI?
            if (isPlayer _unit) then {
                switch (_unitArsHashmap get _x) do {
                    case 0: {
                        playSound QGVAR(vomitMild_snd);
                        (GVAR(vomitMildScreen_UI)#0) ctrlSetFade 0;
                        (GVAR(vomitMildScreen_UI)#0) ctrlCommit 0;
                    };
                    case 1: {
                        (GVAR(vomitMildScreen_UI)#0) ctrlSetFade 1;
                        (GVAR(vomitMildScreen_UI)#0) ctrlCommit 0;

                        playSound QGVAR(vomitMild_snd);
                        (GVAR(vomitModerateScreen_UI)#0) ctrlSetFade 0;
                        (GVAR(vomitModerateScreen_UI)#0) ctrlCommit 0;
                    };
                    case 2: {
                        (GVAR(vomitMildScreen_UI)#0) ctrlSetFade 1;
                        (GVAR(vomitMildScreen_UI)#0) ctrlCommit 0;
                        (GVAR(vomitModerateScreen_UI)#0) ctrlSetFade 1;
                        (GVAR(vomitModerateScreen_UI)#0) ctrlCommit 0;

                        playSound QGVAR(vomitMild_snd);
                        (GVAR(vomitSevereScreen_UI)#0) ctrlSetFade 0;
                        (GVAR(vomitSevereScreen_UI)#0) ctrlCommit 0;
                    };
                };
            };
        };
        /*case "fatigue": {
            if (_staminaSetting != 2) then {
                if (isPlayer _unit) then {
                    switch (_unitArsHashmap get _x) do {
                        case 0: {
                            if (_staminaSetting == 0) then {
                                ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*0.75;
                                ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*0.75;
                            } else {
                                _unit setUnitTrait ["loadCoef", 1.2];
                                //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
                            };
                        };
                        case 1: {
                            if (_staminaSetting == 0) then {
                                ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*0.5;
                                ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*0.5;
                            } else {
                                _unit setUnitTrait ["loadCoef", 1.5];
                                //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
                            };
                        };
                        case 2: {
                            if (_staminaSetting == 0) then {
                                ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*0.25;
                                ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*0.25;
                            } else {
                                _unit setUnitTrait ["loadCoef", 1.8];
                                //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
                            };
                        };
                    };
                } else {
                    switch (_unitArsHashmap get _x) do {
                        case 0: {
                            _unit setUnitTrait ["loadCoef", 1.2];
                            //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
                        };
                        case 1: {
                            _unit setUnitTrait ["loadCoef", 1.5];
                            //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
                        };
                        case 2: {
                            _unit setUnitTrait ["loadCoef", 1.8];
                            //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
                        };
                    };
                };
            };
        };*/
        case "headache": {
            switch (_unitArsHashmap get _x) do {
                case 0: {
                    [_unit, 0.05] call ACEFUNC(medical_status,adjustPainLevel);
                };
                case 1: {
                    [_unit, 0.1] call ACEFUNC(medical_status,adjustPainLevel);
                };
                case 2: {
                    [_unit, 0.2] call ACEFUNC(medical_status,adjustPainLevel);
                };
            };
        };
        case "movementAbility": {
            switch (_unitArsHashmap get _x) do {
                case 1: {
                    _unit allowSprint false;
                };
                case 2: {
                    _unit allowSprint false;
                    _unit forceWalk true;
                };
                default {};
            };
        }
        /*case "hypotension": {
            switch (_unitArsHashmap get _x) do {
                case 0: {
                    [_unit, 0.1] call ACEFUNC(medical_status,adjustPainLevel);
                };
                case 1: {
                    [_unit, 0.2] call ACEFUNC(medical_status,adjustPainLevel);
                };
                case 2: {
                    [_unit, 0.3] call ACEFUNC(medical_status,adjustPainLevel);
                };
            };
        };*/
    };
    _unitArsHashmap deleteAt _x;
} forEach _unitSymptoms;

private _newUnitTimer = [
    (NO_ARS_TIMER*(random [0.8,1,1.2])), // Case 0
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
_unit setVariable [QGVAR(unitArsTimer),((_newUnitTimer select _currentRadLimIndex) + CBA_missionTime),true];
//systemChat format ["New timer: %1, +CBA: %2",(_newUnitTimer select _currentRadLimIndex),((_newUnitTimer select _currentRadLimIndex) + CBA_missionTime)];

_unit setVariable [QGVAR(unitArsHashMap),_unitArsHashmap,true];
