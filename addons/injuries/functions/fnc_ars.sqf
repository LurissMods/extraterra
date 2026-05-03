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

params ["_unit","_deltaT","_syncValues"];

if (!isPlayer _unit) exitWith {}; // temp fix

private _unitCurrentArsTimer = (_unit getVariable [QGVAR(unitArsTimer),nil]) - CBA_missionTime;
private _unitArsHashmap = _unit getVariable [QGVAR(unitArsHashMap),nil];

private _currentRad = GET_LIFETIME_RAD(_unit); // in mSv
private _currentRadLimIndex = (_unit getVariable [QGVAR(unitRadLimIndex),nil]);
private _currentRadLim = ((_unit getVariable [QGVAR(unitRadLimArray),nil]) select _currentRadLimIndex);

if (_currentRadLimIndex > 0 && {CBA_missionTime > _unitCurrentArsTimer}) then {
    [_unit] call FUNC(updateArsSymptoms);
};

//systemChat str _currentRadLim;
//systemChat str _currentRadLimIndex;

/*
stage 0 - 4 hours onset
stage 1 - 3 hours onset
stage 2 - 2 hours onset
stage 3 - 1 hour onset
stage 4 - 30 min onset
stage 5 - 15 min onset
stage 6 - 30 min onset
stage 7 - 30 min onset
stage 8 - 15 min onset

note: add lethal dose message in ACE medical menu
*/

if (_currentRad > _currentRadLim) then {
    switch _currentRadLimIndex do {
        case 8: {
            systemChat format ["Case 8! Unit: %1", _unit];
            // 100% severe vomit chance
            // 100% severe nausea chance
            // 100% anorexia chance
            // 30% severe diarrhea cramps chance
            // 100% severe fatigue chance
            // 100% severe weakness chance
            // 100% severe hypotension chance
            // 100% severe dizziness chance
            // 100% severe disorientation chance
            // 70% moderate fever chance (core temp system will be good for this)
            // 100% severe fluid/electrolyte imbalance chance
            // 100% severe headache chance

            // note: This is a special case for the ARS timer. Fix later

            // Death - 1 in 3600 death chance / second? ~100% after one hour
            private _temp = random 3600;
            if (_temp < 0) then {
                systemChat "you're dead!";
            } else {
               systemChat format ["Not dead yet! Roll: %1", _temp];
            };
        };
        case 7: {
            systemChat format ["Case 7! Unit: %1", _unit];
            // 100% severe vomit chance
            // 100% severe nausea chance
            // 100% anorexia chance
            // 20% severe diarrhea cramps chance
            // 100% severe fatigue chance
            // 100% severe weakness chance
            // 100% severe hypotension chance
            // 100% severe dizziness chance
            // 100% severe disorientation chance
            // 47.5% severe fever chance (core temp system will be good for this)
            // 100% severe fluid/electrolyte imbalance chance
            // 100% severe headache chance
            private _unitNewArsTimer = (1800*(random [0.8,1,1.2]));
            if (_unitNewArsTimer < _unitCurrentArsTimer) then {
                _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
            };
            systemChat str _unitCurrentArsTimer;

            // Vomit
            _unitArsHashmap set ["vomit",2];

            // Fatigue
            _unitArsHashmap set ["fatigue",2];

            // Headache
            _unitArsHashmap set ["headache",2];

            // Hypotension
            //_unitArsHashmap set ["hypotension",2];

            _unit setVariable [QGVAR(unitRadLimIndex),8,true];
        };
        case 6: {
            systemChat format ["Case 6! Unit: %1", _unit];
            // 100% severe vomit chance
            // 100% severe nausea chance
            // 100% anorexia chance
            // 10% severe diarrhea cramps chance
            // 100% severe fatigue chance
            // 100% severe weakness chance
            // 80% mild hypotension chance
            // 100% severe dizziness chance
            // 100% severe disorientation chance
            // 37.5% moderate fever chance (core temp system will be good for this)
            // 100% moderate fluid/electrolyte imbalance chance
            // 100% severe headache chance
            private _unitNewArsTimer = (1800*(random [0.8,1,1.2]));
            if (_unitNewArsTimer < _unitCurrentArsTimer) then {
                _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
            };
            systemChat str _unitCurrentArsTimer;

            // Vomit
            _unitArsHashmap set ["vomit",2];

            // Fatigue
            _unitArsHashmap set ["fatigue",2];

            // Headache
            _unitArsHashmap set ["headache",2];

            // Hypotension
            if (random 1 < 0.8) then {
                //_unitArsHashmap set ["hypotension",0];
            };

            _unit setVariable [QGVAR(unitRadLimIndex),7,true];
        };
        case 5: {
            systemChat format ["Case 5! Unit: %1", _unit];
            // 100% severe vomit chance
            // 100% severe nausea chance
            // 100% anorexia chance
            // 10% severe diarrhea cramps chance
            // 100% severe fatigue chance
            // 100% severe weakness chance
            // 100% severe dizziness chance
            // 100% severe disorientation chance
            // 80% moderate fluid/electrolyte imbalance chance
            // 80% moderate headache chance
            private _unitNewArsTimer = (900*(random [0.8,1,1.2]));
            if (_unitNewArsTimer < _unitCurrentArsTimer) then {
                _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
            };
            systemChat str _unitCurrentArsTimer;

            // Vomit
            _unitArsHashmap set ["vomit",2];

            // Fatigue
            _unitArsHashmap set ["fatigue",2];

            // Headache
            if (random 1 < 0.8) then {
                _unitArsHashmap set ["headache",1];
            };

            _unit setVariable [QGVAR(unitRadLimIndex),6,true];
        };
        case 4: {
            systemChat format ["Case 4! Unit: %1", _unit];
            // 90% severe vomit chance
            // 95% severe nausea chance
            // 100% anorexia chance
            // 10% severe diarrhea cramps chance
            // 95% severe fatigue chance
            // 95% severe weakness chance
            // 50% moderate headache chance
            private _unitNewArsTimer = (1800*(random [0.8,1,1.2]));
            if (_unitNewArsTimer < _unitCurrentArsTimer) then {
                _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
            };
            systemChat str _unitCurrentArsTimer;

            // Vomit
            if (random 1 < 0.9) then {
                _unitArsHashmap set ["vomit",2];
            };

            // Fatigue
            if (random 1 < 0.95) then {
                _unitArsHashmap set ["fatigue",2];
            };

            // Headache
            if (random 1 < 0.5) then {
                _unitArsHashmap set ["headache",1];
            };

            _unit setVariable [QGVAR(unitRadLimIndex),5,true];
        };
        case 3: {
            systemChat format ["Case 3! Unit: %1", _unit];
            // 55% moderate vomit chance
            // 80% moderate nausea chance
            // 95% anorexia chance
            // 10% moderate diarrhea cramps chance
            // 75% moderate fatigue chance
            // 75% moderate weakness chance
            private _unitNewArsTimer = (3600*(random [0.8,1,1.2]));
            if (_unitNewArsTimer < _unitCurrentArsTimer) then {
                _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
            };
            systemChat str _unitCurrentArsTimer;

            // Vomit
            if (random 1 < 0.55) then {
                _unitArsHashmap set ["vomit",1];
            };

            // Fatigue
            if (random 1 < 0.75) then {
                _unitArsHashmap set ["fatigue",1];
            };

            /*// Fatigue onset after about 3 hours
            if (_unit == ACE_player) then {

                // Fatigue
                if (random 1 < 0.75) then {
                    systemChat "Moderate fatigue";
                    if (ACEGVAR(advanced_fatigue,enabled)) then {
                        ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*0.5;
                        ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*0.5;
                    } else {
                        _unit setUnitTrait ["loadCoef", 1.4];
                        //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                    };
                };
            } else {
                // Fatigue
                if (random 1 < 0.75) then {
                    systemChat "Moderate fatigue";
                    _unit setUnitTrait ["loadCoef", 1.4];
                    //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                };
            };*/

            _unit setVariable [QGVAR(unitRadLimIndex),4,true];
        };
        case 2: {
            systemChat format ["Case 2! Unit: %1", _unit];
            // 35% moderate vomit chance
            // 50% moderate nausea chance
            // 70% anorexia chance
            // 45% moderate fatigue chance
            // 45% moderate weakness chance
            private _unitNewArsTimer = (7200*(random [0.8,1,1.2]));
            if (_unitNewArsTimer < _unitCurrentArsTimer) then {
                _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
            };
            systemChat str _unitCurrentArsTimer;

            // Vomit
            if (random 1 < 0.35) then {
                _unitArsHashmap set ["vomit",1];
            };

            // Fatigue
            if (random 1 < 0.45) then {
                _unitArsHashmap set ["fatigue",1];
            };


            /*// Fatigue onset after about 4 hours
            if (_unit == ACE_player) then {

                // Fatigue
                if (random 1 < 0.45) then {
                    systemChat "Moderate fatigue";
                    if (ACEGVAR(advanced_fatigue,enabled)) then {
                        ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*0.5;
                        ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoevryFactor)*0.5;
                    } else {
                        _unit setUnitTrait ["loadCoef", 1.4];
                        //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                    };
                };

            } else {
                // Fatigue
                if (random 1 < 0.45) then {
                    systemChat "Moderate fatigue";
                    _unit setUnitTrait ["loadCoef", 1.4];
                    //_unit setUnitTrait ["staminaDrainCoef", 2]; Note: broken? Check later on arma discord
                };
            };*/

            _unit setVariable [QGVAR(unitRadLimIndex),3,true];
        };
        case 1: {
            systemChat format ["Case 1! Unit: %1", _unit];
            // 12.5% mild vomit chance
            // 17.5% mild nausea chance
            // 32.5% anorexia chance
            private _unitNewArsTimer = (10800*(random [0.8,1,1.2]));
            if (_unitNewArsTimer < _unitCurrentArsTimer) then {
                _unit setVariable [QGVAR(unitArsTimer),(_unitNewArsTimer + CBA_missionTime),true];
            };
            systemChat str _unitCurrentArsTimer;

            // Vomit
            if (random 1 < 0.125) then {
                _unitArsHashmap set ["vomit",0];
            };

            _unit setVariable [QGVAR(unitRadLimIndex),2,true];
        };
        case 0: {
            systemChat format ["Case 0! Unit: %1", _unit];
            _unit setVariable [QGVAR(unitArsTimer),((14400*(random [0.8,1,1.2])) + CBA_missionTime),true];
            // 5% mild vomit chance

            // Vomit
            if (random 1 < 0.05) then {
                _unitArsHashmap set ["vomit",0];
            };

            /*if (_unit == ACE_player) then {

                //setStaminaScheme "Exhausted";
                //_unit forceWalk true;
                //_unit allowSprint false;
                //_unit setUnitTrait ["loadCoef", 1.2];
                //systemChat str (getAllUnitTraits _unit);
                //_unit setUnitTrait ["staminaDrainCoef", 1000, true];
            };*/

            _unit setVariable [QGVAR(unitRadLimIndex),1,true];
        };
    };
};


//private _randomRadLim0 = GVAR(playerSeed) random [375,562.5,750];
//private _randomRadLim1 = _randomRadLim0;

//systemChat str GVAR(randomRadLim0);
//systemChat str GVAR(randomRadLim1);
//systemChat str GVAR(randomRadLim2);

//private _radiationGradient = linearConversion [0,HYPOTHERMIA_STAGE_DEATH,_currentRad,0,1,true];

/*
    Record time of stage reached
    If timer completes, symptom happens
    If next stage is reached, start timer for that stage.
    If prev. timer goes off first, that symptom takes precedent.
*/

/*
if (CBA_missionTime - (_unit getVariable [QGVAR(radLim0),nil]) >= 5 && {GVAR(vomitMild)}) then {
    systemChat "you threw up! (mild)";
    playSound QGVAR(vomitMild_snd);
    (GVAR(vomitMild_UI)#0) ctrlSetFade 0;
    (GVAR(vomitMild_UI)#0) ctrlCommit 0;

    private _ctrl = 1410; // idc for ace injuries
    private _target = ACE_player;
    private _selectionN = -1;
    private _entries = "rad 0 called";

    //[QACEGVAR(medical_gui,updateInjuryListGeneral), [_ctrl, _target, _selectionN, _entries]] call CBA_fnc_localEvent;

    GVAR(vomitMild) = false;
};
if (CBA_missionTime - (GVAR(radLim1Time)) >= 5 && {GVAR(vomitMild)}) then {
    systemChat "you threw up! (mild)";
    (GVAR(vomitMild_UI)#0) ctrlSetFade 0;
    (GVAR(vomitMild_UI)#0) ctrlCommit 0;

    GVAR(vomitMild) = false;
};

switch (true) do {
    case (GVAR(radLim0Time) == 0 && {_currentRad > (_unit getVariable [QGVAR(radLim0),nil])}): {
        systemChat "case 0";
        GVAR(radLim0Time) = CBA_missionTime;
        if (random 1 < 1) then {
            GVAR(vomitMild) = true; //0.025
        };
    };
    case (GVAR(radLim1Time) == 0 && {_currentRad > (_unit getVariable [QGVAR(radLim1),nil])}): {
        systemChat "case 1";
        GVAR(radLim1Time) = CBA_missionTime;
        if (random 1 < 0.125) then {
            GVAR(vomitMild) = true;
        };
    };
    case (GVAR(radLim2Time) == 0 && {_currentRad > (_unit getVariable [QGVAR(radLim2),nil])}): {
        systemChat "case 2";
        GVAR(radLim2Time) = CBA_missionTime;
        if (random 1 < 0.35) then {
            if (random 1 < 0.5) then {
                GVAR(vomitMild) = true;
            } else {
                GVAR(vomitModerate) = true;
            };
        };
        if (random 1 < 0.45) then {
            systemChat "you feel tired and weak! (mild/moderate)";
        };
        if (random 1 < 0.04) then {
            systemChat "you will die in 2 months!";
        };
        // Symptom onset 4 hours, performance degraded demanding task
    };
    case (GVAR(radLim3Time) == 0 && {_currentRad > (_unit getVariable [QGVAR(radLim3),nil])}): {
        systemChat "case 3";
        GVAR(radLim3Time) = CBA_missionTime;
        if (random 1 < 0.55) then {
            systemChat "you threw up! (moderate)";
        };
        if (random 1 < 0.75) then {
            systemChat "you feel tired and weak! (moderate)";
        };
        if (random 1 < 0.25) then {
            systemChat "you will die in 6 weeks!";
        };
        // hair loss
        // Symptom onset 3 hours, performance degraded demanding task
        // 4 - 40 hours, performance degraded undemanding task
    };
    case (GVAR(radLim4Time) == 0 && {_currentRad > (_unit getVariable [QGVAR(radLim4),nil])}): {
        systemChat "case 4";
        GVAR(radLim4Time) = CBA_missionTime;
        if (random 1 < 0.90) then {
            systemChat "you threw up! (moderate/severe)";
        };
        if (random 1 < 0.45) then {
            systemChat "you feel tired and weak! (moderate/severe)";
        };
        if (random 1 < 0.70) then {
            systemChat "you will die in 3 weeks!";
        };
        if (random 1 < 0.5) then {
            systemChat "you will have a headache (mild/moderate)";
        };
        // hair loss
        // Symptom onset 2 hours, performance degraded demanding task
        // 2 hours, performance degraded undemanding task
    };
    case (GVAR(radLim5Time) == 0 && {_currentRad > (_unit getVariable [QGVAR(radLim5),nil])}): {
        systemChat "case 5";
        GVAR(radLim5Time) = CBA_missionTime;

        systemChat "you threw up! (moderate/severe)";
        systemChat "you feel tired and weak! (severe)";
        systemChat "you will die in 2 - 3 weeks!";

        if (random 1 < 0.8) then {
            systemChat "you will have a headache (moderate)";
        };
        // hair loss
        // Symptom onset 1 hours, combat ineffective
        // 2 hours, performance degraded undemanding task
    };
};*/
