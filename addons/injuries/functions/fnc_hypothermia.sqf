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

private _coreTemp = ([_unit] call EFUNC(lifeSupport,coreTemp) select 0);

if (_coreTemp >= HUMAN_NATURAL_CORETEMP) exitWith {};

private _currentPain = GETVAR(_unit,ACEGVAR(medical,pain),0);
private _currentHypothermiaFlag = GETVAR(_unit,GVAR(unitCurrentCoreTempFlag),0);

private _hypothermiaGradient = linearConversion [HYPOTHERMIA_STAGE_MILD,HYPOTHERMIA_STAGE_DEATH,_coreTemp,0,1,true];
private _painGradient = _hypothermiaGradient*0.25;
//private _heartRateGradient = 0 max ((-16*(_hypothermiaGradient^2)) + (8*_hypothermiaGradient))*40; // 0 + 8 x - 16 x^2, https://www.wolframalpha.com/input?i=quadratic+fit+%7B%5B0%2C0%5D%2C%5B0.25%2C1%5D%2C%5B0.5%2C0%5D%7D
private _heartRateGradient = (((5.92593*_hypothermiaGradient^3) - (11.4074*_hypothermiaGradient^2) + (4.48148*_hypothermiaGradient)) max -1)*120;// https://www.wolframalpha.com/input?i=cubic+fit+%7B%5B0%2C0%5D%2C%5B0.25%2C0.5%5D%2C%5B0.55%2C0%5D%2C%5B1%2C-1%5D%7D
private _bloodPressureGradient = (-1 max ((5.92593*_hypothermiaGradient^3) - (11.4074*_hypothermiaGradient^2) + (4.48148*_hypothermiaGradient)))*(-30); // Default resistance value is 100, 85 derived through testing
//private _bloodPressureGradient = ((10.7143*(_hypothermiaGradient^3)) - (20.0595*(_hypothermiaGradient^2)) + (8.34524*_hypothermiaGradient))*(-50); // Default resistance value is 100, 85 derived through testing

systemChat str _heartRateGradient;

[_unit, _painGradient] call ACEFUNC(medical_status,adjustPainLevel);// ace_medical_status_fnc_adjustPainLevel;
[_unit, _heartRateGradient, _deltaT, _syncValues] call ACEFUNC(medical_vitals,updateHeartRate);//ace_medical_vitals_fnc_updateHeartRate;
[_unit, _bloodPressureGradient, _deltaT, _syncValues] call ACEFUNC(medical_vitals,updatePeripheralResistance);//ace_medical_vitals_fnc_updatePeripheralResistance; // This affects blood pressure

ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor) * (1 - _hypothermiaGradient);
ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor) * (1 - _hypothermiaGradient);

private _heartRate = GET_HEART_RATE(_unit);
GET_BLOOD_PRESSURE(_unit) params ["_bloodPressureL", "_bloodPressureH"];
systemChat format ["Hyp. Gradient: %1",_hypothermiaGradient];
//systemChat format ["HR. Gradient: %1",_heartRateGradient/120];
//systemChat format ["Core Temp: %1",_coreTemp];
systemChat format ["HR: %1",_heartRate];
systemChat format ["Sys/Dias: %2/%1",_bloodPressureL,_bloodPressureH];
//systemChat format ["Core Temp: %1",_coreTemp];

switch (true) do {
    case (_coreTemp > HYPOTHERMIA_STAGE_MILD): {
        //systemChat "No Hyperthermia";
    };
    case (_coreTemp <= HYPOTHERMIA_STAGE_MILD && {_coreTemp > HYPOTHERMIA_STAGE_MODERATE}): {
        //systemChat "Mild Hyperthermia";
        if (_currentHypothermiaFlag != HYPOTHERMIA_STAGE_MILD) then {
            SETVAR(_unit,GVAR(unitCurrentCoreTempFlag),HYPOTHERMIA_STAGE_MILD);
            //systemChat "State change fired!";
            ["1", 1.5, _unit, 10] call ACEFUNC(common,displayTextStructured);
        };
    };
    case (_coreTemp <= HYPOTHERMIA_STAGE_MODERATE && {_coreTemp > HYPOTHERMIA_STAGE_SEVERE}): {
        //systemChat "Moderate Hyperthermia";
        if (_currentHypothermiaFlag != HYPOTHERMIA_STAGE_MODERATE) then {
            SETVAR(_unit,GVAR(unitCurrentCoreTempFlag),HYPOTHERMIA_STAGE_MODERATE);
            //systemChat "State change fired!";
            ["2", 1.5, _unit, 10] call ACEFUNC(common,displayTextStructured);
        };
    };
    case (_coreTemp <= HYPOTHERMIA_STAGE_SEVERE): {
        //systemChat "Severe Hyperthermia";
        if (_currentHypothermiaFlag != HYPOTHERMIA_STAGE_SEVERE) then {
            SETVAR(_unit,GVAR(unitCurrentCoreTempFlag),HYPOTHERMIA_STAGE_SEVERE);
            //systemChat "State change fired!";
            ["3", 1.5, _unit, 10] call ACEFUNC(common,displayTextStructured);
        };
    };
};


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
