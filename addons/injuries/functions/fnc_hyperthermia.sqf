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

/*if (!isPlayer _unit) exitWith {}; // temp fix

private _coreTemp = ([_unit] call EFUNC(lifeSupport,coreTemp) select 0);

if (_coreTemp <= HUMAN_NATURAL_CORETEMP) exitWith {};

private _currentPain = GETVAR(_unit,ACEGVAR(medical,pain),0);
private _currentHyperthermiaFlag = GETVAR(_unit,GVAR(unitCurrentCoreTempFlag),0);

private _hyperthermiaGradient = linearConversion [HYPERTHERMIA_STAGE_MILD,HYPERTHERMIA_STAGE_DEATH,_coreTemp,0,1,true];

private _headachePain = _hyperthermiaGradient*HEADACHE_MAX_PAIN;
private _heartRateAdjust = _hyperthermiaGradient*HYPERTHERMIA_MAX_HEARTRATE;
private _bloodPressureAdjust = _hyperthermiaGradient*HYPERTHERMIA_MIN_RESISTANCE; // Default resistance value is 100, 85 derived through testing

[_unit, _headachePain] call ACEFUNC(medical_status,adjustPainLevel);// ace_medical_status_fnc_adjustPainLevel;
[_unit, _heartRateAdjust, _deltaT, _syncValues] call ACEFUNC(medical_vitals,updateHeartRate);//ace_medical_vitals_fnc_updateHeartRate;
[_unit, _bloodPressureAdjust, _deltaT, _syncValues] call ACEFUNC(medical_vitals,updatePeripheralResistance);//ace_medical_vitals_fnc_updatePeripheralResistance; // This affects blood pressure

ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor) * (1 - _hyperthermiaGradient);
ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor) * (1 - _hyperthermiaGradient);

private _heartRate = GET_HEART_RATE(_unit);
private _bloodPressure = ([_unit] call ACEFUNC(medical_status,getBloodPressure));*/

/*systemChat format ["Hyp. Gradient: %1",_hyperthermiaGradient];
systemChat format ["BP. Gradient: %1",_bloodPressureGradient];*/
//systemChat format ["Core Temp: %1",_coreTemp];
//systemChat format ["HR: %1",_heartRate];
/*systemChat format ["Sys/Dias: %2/%1",(_bloodPressure select 0),(_bloodPressure select 1)];
//systemChat format ["Core Temp: %1",_coreTemp];

switch (true) do {
    case (_coreTemp < HYPERTHERMIA_STAGE_MILD): {
        //systemChat "No Hyperthermia";
    };
    case (_coreTemp >= HYPERTHERMIA_STAGE_MILD && {_coreTemp < HYPERTHERMIA_STAGE_MODERATE}): {
        //systemChat "Mild Hyperthermia";
        if (_currentHyperthermiaFlag != HYPERTHERMIA_STAGE_MILD) then {
            SETVAR(_unit,GVAR(unitCurrentCoreTempFlag),HYPERTHERMIA_STAGE_MILD);
            //systemChat "State change fired!";
            ["You feel itchy and sweaty.", 1.5, _unit, 10] call ACEFUNC(common,displayTextStructured);
        };
    };
    case (_coreTemp >= HYPERTHERMIA_STAGE_MODERATE && {_coreTemp < HYPERTHERMIA_STAGE_SEVERE}): {
        //systemChat "Moderate Hyperthermia";
        if (_currentHyperthermiaFlag != HYPERTHERMIA_STAGE_MODERATE) then {
            SETVAR(_unit,GVAR(unitCurrentCoreTempFlag),HYPERTHERMIA_STAGE_MODERATE);
            //systemChat "State change fired!";
            ["You're sweating a lot.", 1.5, _unit, 10] call ACEFUNC(common,displayTextStructured);
        };
    };
    case (_coreTemp >= HYPERTHERMIA_STAGE_SEVERE): {
        //systemChat "Severe Hyperthermia";
        if (_currentHyperthermiaFlag != HYPERTHERMIA_STAGE_SEVERE) then {
            SETVAR(_unit,GVAR(unitCurrentCoreTempFlag),HYPERTHERMIA_STAGE_SEVERE);
            //systemChat "State change fired!";
            ["Your skin feels cold.", 1.5, _unit, 10] call ACEFUNC(common,displayTextStructured);
        };
    };
};*/


/*if (_coreTemp >= HYPERTHERMIA_STAGE_MILD && {_coreTemp < HYPERTHERMIA_STAGE_MODERATE}) then {
    systemChat "Mild Hyperthermia";
    //player setVariable ["ace_medical_pain", (_currentPain + 0.1)];
} else {
    if (_coreTemp >= HYPERTHERMIA_STAGE_MODERATE && {_coreTemp < HYPERTHERMIA_STAGE_SEVERE}) then {
        systemChat "Moderate Hyperthermia";
        //player setVariable ["ace_medical_pain", (_currentPain + 0.2)];
    } else {
        if (_coreTemp >= HYPERTHERMIA_STAGE_SEVERE) then {
            systemChat "Severe Hyperthermia";
            //player setVariable ["ace_medical_pain", (_currentPain + 0.3)];
        };
    };
};*/

/*
Hyperthermia
	Mild (>37 - 38 Celsius core temp)
		Heat rash
			Itchy/prickly skin, small red bumps
		Heavy sweating
		Dizzy/faint - screen blur?
		Tired/Lethargic - less stamina
		Thirst
		Heat Cramps
			During or shortly after physical activity
	Moderate (Heat exhaustion) (38 - 40 Celsius core temp)
		Headaches
		Heavy sweating
		Fatigue/Weakness
		Nausea/Vomiting
		Weak, rapid heart rate
		Poor coordination
	Severe (Heatstroke) (>40 Celsius core temp)
		Headache, dizziness, confusion
		Fast, shallow breathing
		Extreme thirst
		Delerium
		Slurred speech
		Agression/strange behaviour
		Convulsions/Seizures/Coma
		Skin may feel cold (deceptive)
		Rapid heart Rate
*/
