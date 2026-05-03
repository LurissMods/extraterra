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

private _staminaSetting = -1;

switch true do {
    case (ACEGVAR(advanced_fatigue,enabled)): {
        _staminaSetting = 0;
    };
    case (isStaminaEnabled _unit): {
        _staminaSetting = 1;
    };
    default {
        _staminaSetting = 2;
    };
};

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
        case "fatigue": {
            if (_staminaSetting != 2) then {
                if (isPlayer _unit) then {
                    switch (_unitArsHashmap get _x) do {
                        case 0: {
                            if (_staminaSetting == 0) then {
                                ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*0.75;
                                ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*0.75;
                            } else {
                                _unit setUnitTrait ["loadCoef", 1.2];
                                //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                            };
                        };
                        case 1: {
                            if (_staminaSetting == 0) then {
                                ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*0.5;
                                ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*0.5;
                            } else {
                                _unit setUnitTrait ["loadCoef", 1.5];
                                //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                            };
                        };
                        case 2: {
                            if (_staminaSetting == 0) then {
                                ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*0.25;
                                ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*0.25;
                            } else {
                                _unit setUnitTrait ["loadCoef", 1.8];
                                //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                            };
                        };
                    };
                } else {
                    switch (_unitArsHashmap get _x) do {
                        case 0: {
                            _unit setUnitTrait ["loadCoef", 1.2];
                            //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                        };
                        case 1: {
                            _unit setUnitTrait ["loadCoef", 1.5];
                            //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                        };
                        case 2: {
                            _unit setUnitTrait ["loadCoef", 1.8];
                            //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                        };
                    };
                };
            };
        };
        case "headache": {
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
        };
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

switch _currentRadLimIndex do {
    case 8: {
        // ??
    };
    case 7: {
        private _unitNewArsTimer = (1800*(random [0.8,1,1.2]));
        _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
    };
    case 6: {
        private _unitNewArsTimer = (1800*(random [0.8,1,1.2]));
        _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
    };
    case 5: {
        private _unitNewArsTimer = (900*(random [0.8,1,1.2]));
        _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
    };
    case 4: {
        private _unitNewArsTimer = (1800*(random [0.8,1,1.2]));
        _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
    };
    case 3: {
        private _unitNewArsTimer = (3600*(random [0.8,1,1.2]));
        _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
    };
    case 2: {
        private _unitNewArsTimer = (7200*(random [0.8,1,1.2]));
        _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
    };
    case 1: {
        private _unitNewArsTimer = (10800*(random [0.8,1,1.2]));
        _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
    };
    case 0: {
        private _unitNewArsTimer = (14400*(random [0.8,1,1.2]));
        _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
    };
};

_unit setVariable [QGVAR(unitArsHashMap),_unitArsHashmap,true];
