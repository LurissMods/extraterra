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

// https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2021SW002749#swe21195-bib-0014
// https://remm.hhs.gov/nato-doserate0-0_75.htm

/* https://arxiv.org/html/2604.15160v1#S3
* GLE 5 (1956) https://www.aanda.org/articles/aa/full_html/2024/04/aa48699-23/F2.html
*       Burst then exponential decay - Starts approx 3:45am UT, ends approx 7 am UT?
*       Approx 600mSv
*       maxDose*e^-4x as approximation. Integral approx = 0.24542.
*       maxDose = storm total dose / 0.24542
*
* 994 CE - Total dose: 2000 mSv
* 775 CE - Total dose: 4500 mSv
*
*/

params ["_unit","_deltaT","_syncValue"];

//if (!isPlayer _unit) exitWith {}; // temp fix

private _unitCurrentArsTimer = (GET_ARS_TIMER(_unit)) - CBA_missionTime;
private _unitHashmap = GET_SYMPTOM_HASHMAP(_unit);

private _currentRad = GET_LIFETIME_RAD(_unit); // in mSv
private _currentRadLimIndex = GET_ARS_RAD_INDEX(_unit);
private _currentRadLim = ((GET_ARS_RAD_ARRAY(_unit)) select _currentRadLimIndex);

//systemChat str _currentRadLim;
//systemChat str _currentRadLimIndex;

if (_currentRad > _currentRadLim || {CBA_missionTime > _unitCurrentArsTimer}) then {

    if (_currentRad > _currentRadLim) then {
        _currentRadLimIndex = _currentRadLimIndex + 1;
        _unit setVariable [QGVAR(unitRadLimIndex),_currentRadLimIndex,true];

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
        if ((_newUnitTimer select _currentRadLimIndex) < _unitCurrentArsTimer) then {
            _syncValue = true;
            //_unit setVariable [QGVAR(unitArsTimer),((_newUnitTimer select _currentRadLimIndex) + CBA_missionTime),true];
            SET_ARS_TIMER(_unit,((_newUnitTimer select _currentRadLimIndex) + CBA_missionTime),_syncValue);
        };

    };

    /*
    * Notes:
    *   Vomit chance limited to a max chance of 66% per hour. Vomiting every 10 minutes would get old very fast.
    */

    switch _currentRadLimIndex do {
        case 9: {
            // Vomit
            // Nausea
            // Diarrhea
            // Fatigue
            // Dizziness/disorientation
            // Headache
            // Hypotension
            // Fever
            // Death

            // Vomit - 16.5% chance per 10 minute window (~66% chance 1 hour)
            if (random 1 < 0.165) then {
                // 0 = screen, 1 = visor. Not yet implemented.
                _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_SEVERE,0,nil]];
            };

            // Fatigue + Weakness - 100% chance
            SET_ARS_FATIGUE_WEAKNESS_BOOL(_unit,true,_syncValue);

            // Movement ability - 16.5% chance per 10 minute window (~66% chance 1 hour)
            if (random 1 < 0.165) then {
                if (random 1 < 0.33) then {
                    _unitHashmap set [((sID_NO_JOG*ID_RADIX) + iID_ARS),[nil,nil,nil]];
                } else {
                    _unitHashmap set [((sID_NO_RUN*ID_RADIX) + iID_ARS),[nil,nil,nil]];
                };
            };

            // Headache - 100% chance
            _unitHashmap set [((sID_PAIN*ID_RADIX) + iID_ARS),[HEADACHE_SEVERE,nil,nil]];

            // Fever - 19.5% chance per 10 minute window (~66% chance 1 hour)
            if (random 1 < 0.195) then {
                SET_ARS_FEVER_BOOL(_unit,true,_syncValue);
            };

            // Hypotension - 100% chance
            SET_ARS_HYPOTENSION_BOOL(_unit,true,_syncValue);

            // Death - 11% chance per 10 minute window (~50% chance 1 hour)
            if (random 1 < 0.11) then {
                //_unitHashmap set [((sID_DEATH*ID_RADIX) + iID_ARS),[nil,nil,nil]];
                systemChat "you're dead from ARS!";
            };
        };
        case 8: {
            // Vomit
            // Nausea
            // Diarrhea
            // Fatigue
            // Dizziness/disorientation
            // Headache
            // Hypotension
            // Fever

            // Vomit - 19.5% chance per 12 minute window (~66% chance 1 hour)
            if (random 1 < 0.195) then {
                // 0 = screen, 1 = visor. Not yet implemented.
                _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_SEVERE,0,nil]];
            };

            // Fatigue + Weakness - 100% chance
            SET_ARS_FATIGUE_WEAKNESS_BOOL(_unit,true,_syncValue);

            // Movement ability - 19.5% chance per 12 minute window (~66% chance 1 hour)
            if (random 1 < 0.195) then {
                _unitHashmap set [((sID_NO_RUN*ID_RADIX) + iID_ARS),[nil,nil,nil]];
            };

            // Headache - 100% chance
            _unitHashmap set [((sID_PAIN*ID_RADIX) + iID_ARS),[HEADACHE_SEVERE,nil,nil]];

            // Fever - 12% chance per 12 minute window (~47% chance 1 hour)
            if (random 1 < 0.12) then {
                SET_ARS_FEVER_BOOL(_unit,true,_syncValue);
            };

            // Hypotension - 100% chance
            SET_ARS_HYPOTENSION_BOOL(_unit,true,_syncValue);
        };
        case 7: {
            // Vomit
            // Nausea
            // Diarrhea
            // Fatigue
            // Dizziness/disorientation
            // Headache
            // Hypotension
            // Fever

            // Vomit - 23.7% chance per 15 minute window (~66% chance 1 hour)
            if (random 1 < 0.237) then {
                // 0 = screen, 1 = visor. Not yet implemented.
                _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_SEVERE,0,nil]];
            };

            // Fatigue + Weakness - 100% chance
            SET_ARS_FATIGUE_WEAKNESS_BOOL(_unit,true,_syncValue);

            // Movement ability - 9.6% chance per 15 minute window (~33% chance 1 hour)
            if (random 1 < 0.096) then {
                _unitHashmap set [((sID_NO_RUN*ID_RADIX) + iID_ARS),[nil,nil,nil]];
            };

            // Headache - 100% chance
            _unitHashmap set [((sID_PAIN*ID_RADIX) + iID_ARS),[HEADACHE_SEVERE,nil,nil]];

            // Fever - 11.1% chance per 15 minute window (~37.5% chance 1 hour)
            if (random 1 < 0.111) then {
                SET_ARS_FEVER_BOOL(_unit,true,_syncValue);
            };

            // Hypotension - 23.7% chance per 15 minute window (~66% chance 1 hour)
            if (random 1 < 0.237) then {
                SET_ARS_HYPOTENSION_BOOL(_unit,true,_syncValue);
            };
        };
        case 6: {
            // Vomit
            // Nausea
            // Diarrhea
            // Fatigue
            // Dizziness/disorientation
            // Headache

            // Vomit - 30% chance per 20 minute window (~66% chance 1 hour)
            if (random 1 < 0.3) then {
                if (random 1 < 0.5) then {
                    // 0 = screen, 1 = visor. Not yet implemented.
                    _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_SEVERE,0,nil]];
                } else {
                    // 0 = screen, 1 = visor. Not yet implemented.
                    _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_MODERATE,0,nil]];
                };
            };

            // Fatigue + Weakness - 55% chance per 20 minute window (~91% chance 1 hour)
            if (random 1 < 0.55) then {
                SET_ARS_FATIGUE_WEAKNESS_BOOL(_unit,true,_syncValue);
            };

            // Headache - 42% chance per 20 minute window (~80% chance 1 hour)
            if (random 1 < 0.42) then {
                _unitHashmap set [((sID_PAIN*ID_RADIX) + iID_ARS),[HEADACHE_MODERATE,nil,nil]];
            };
        };
        case 5: {
            // Vomit
            // Nausea
            // Diarrhea
            // Fatigue
            // Headache

            // Vomit - 42% chance per 30 minute window (~66% chance 1 hour)
            if (random 1 < 0.42) then {
                if (random 1 < 0.5) then {
                    // 0 = screen, 1 = visor. Not yet implemented.
                    _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_SEVERE,0,nil]];
                } else {
                    // 0 = screen, 1 = visor. Not yet implemented.
                    _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_MODERATE,0,nil]];
                };
            };

            // Fatigue + Weakness - 69% chance per 30 minute window (~90% chance 1 hour)
            if (random 1 < 0.69) then {
                SET_ARS_FATIGUE_WEAKNESS_BOOL(_unit,true,_syncValue);
            };

            // Headache - 29% chance per 30 minute window (~50% chance 1 hour)
            if (random 1 < 0.29) then {
                if (random 1 < 0.5) then {
                    _unitHashmap set [((sID_PAIN*ID_RADIX) + iID_ARS),[HEADACHE_MODERATE,nil,nil]];
                } else {
                    _unitHashmap set [((sID_PAIN*ID_RADIX) + iID_ARS),[HEADACHE_MILD,nil,nil]];
                };
            };
        };
        case 4: {
            // Vomit
            // Nausea
            // Diarrhea
            // Fatigue

            // Vomit - 55% chance per 1 hour window (~80% chance two hours)
            if (random 1 < 0.55) then {
                _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_MODERATE,0,nil]];
            };

            // Fatigue + Weakness - 75% chance per 1 hour window (~94% chance two hours)
            if (random 1 < 0.75) then {
                SET_ARS_FATIGUE_WEAKNESS_BOOL(_unit,true,_syncValue);
            };

        };
        case 3: {
            // Vomit
            // Nausea
            // Fatigue

            // Vomit - 35% chance per 2 hour window
            if (random 1 < 0.35) then {
                if (random 1 < 0.5) then {
                    // 0 = screen, 1 = visor. Not yet implemented.
                    _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_MODERATE,0,nil]];
                } else {
                    // 0 = screen, 1 = visor. Not yet implemented.
                    _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_MILD,0,nil]];
                };
            };

            // Fatigue + Weakness - 45% chance per 2 hour window
            if (random 1 < 0.45) then {
                SET_ARS_FATIGUE_WEAKNESS_BOOL(_unit,true,_syncValue);
            };
        };
        case 2: {
            // Vomit - 15% chance per 3 hour window
            if (random 1 < 0.15) then {
                // 0 = screen, 1 = visor. Not yet implemented.
                _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_MILD,0,nil]];
            };
        };
        case 1: {
            // Vomit - 5% chance per 4 hour window
            if (random 1 < 0.05) then {
                // 0 = screen, 1 = visor. Not yet implemented.
                _unitHashmap set [((sID_NAUSEA*ID_RADIX) + iID_ARS),[NAUSEA_MILD,0,nil]];
            };
        };
        default {};
    };
};

if (GET_ARS_FEVER_BOOL(_unit)) then {
    private _minRadLim = ((GET_ARS_RAD_ARRAY(_unit)) select 6);
    private _maxRadLim = ((GET_ARS_RAD_ARRAY(_unit)) select 8);
    private _current = linearConversion [_minRadLim,_maxRadLim,_currentRad,0,1,true];
    _unitHashmap set [((sID_FEVER*ID_RADIX) + iID_ARS),[_current,nil,nil]];
};

if (GET_ARS_HYPOTENSION_BOOL(_unit)) then {
    private _minRadLim = ((GET_ARS_RAD_ARRAY(_unit)) select 6);
    private _maxRadLim = ((GET_ARS_RAD_ARRAY(_unit)) select 8);
    private _current = linearConversion [_minRadLim,_maxRadLim,_currentRad,0,-1,true];
    _unitHashmap set [((sID_BP*ID_RADIX) + iID_ARS),[_current,nil,nil]];
};

if (GET_ARS_FATIGUE_WEAKNESS_BOOL(_unit)) then {
    private _minRadLim = ((GET_ARS_RAD_ARRAY(_unit)) select 2);
    private _maxRadLim = ((GET_ARS_RAD_ARRAY(_unit)) select 8);
    private _current = linearConversion [_minRadLim,_maxRadLim,_currentRad,0,1,true];
    _unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_ARS),[_current,nil,nil]];
    _unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_ARS),[_current,nil,nil]];
};

_syncValue;
