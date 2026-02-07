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

params ["_unit","_deltaT","_syncValues"];

if (!isPlayer _unit) exitWith {}; // temp fix

private _currentRad = GETVAR(_unit,EGVAR(lifesupport,lifetimeRadLevel),0); // in mSv

//private _randomRadLim0 = GVAR(playerSeed) random [375,562.5,750];
//private _randomRadLim1 = _randomRadLim0;

//systemChat str GVAR(randomRadLim0);
//systemChat str GVAR(randomRadLim1);
//systemChat str GVAR(randomRadLim2);

//test github 0.2.0.0 dev branch

//private _radiationGradient = linearConversion [0,HYPOTHERMIA_STAGE_DEATH,_currentRad,0,1,true];

/*
    Record time of stage reached
    If timer completes, symptom happens
    If next stage is reached, start timer for that stage.
    If prev. timer goes off first, that symptom takes precedent.
*/

if (CBA_missionTime - (GVAR(radLim0Time)) >= 5 && {GVAR(vomitMild)}) then {
    systemChat "you threw up! (mild)";
    GVAR(vomitMild) = false;
};

switch (true) do {
    case (GVAR(radLim0Time) == 0 && {_currentRad > GVAR(randomRadLim0)}): {
        systemChat "case 0";
        GVAR(radLim0Time) = CBA_missionTime;
        if (random 1 < 1) then {
            GVAR(vomitMild) = true; //0.025
        };
    };
    case (GVAR(radLim1Time) == 0 && {_currentRad > GVAR(randomRadLim1)}): {
        systemChat "case 1";
        GVAR(radLim1Time) = CBA_missionTime;
        if (random 1 < 0.125) then {
            systemChat "you threw up! (mild)";
        };
    };
    case (GVAR(radLim2Time) == 0 && {_currentRad > GVAR(randomRadLim2)}): {
        systemChat "case 2";
        GVAR(radLim2Time) = CBA_missionTime;
        if (random 1 < 0.35) then {
            systemChat "you threw up! (mild/moderate)";
        };
        if (random 1 < 0.45) then {
            systemChat "you feel tired and weak! (mild/moderate)";
        };
        if (random 1 < 0.04) then {
            systemChat "you will die in 2 months!";
        };
        // Symptom onset 4 hours, performance degraded demanding task
    };
    case (GVAR(radLim3Time) == 0 && {_currentRad > GVAR(randomRadLim3)}): {
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
    case (GVAR(radLim4Time) == 0 && {_currentRad > GVAR(randomRadLim4)}): {
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
    case (GVAR(radLim5Time) == 0 && {_currentRad > GVAR(randomRadLim5)}): {
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
};
