#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates the current air consumption and air reserve for a unit.
*
* Arguments:
* [_unit, _deltaT, _syncValue] [<UNIT>, <NUMBER>, <BOOL>]
* _unit - Current unit.
* _deltaT - Main loop is called at a variable rate e.g. 1.01 sec, 1.03 sec, this corrects for that
* _syncValue - Whether or not to sync the current update with the server
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateUnitBreathing;
*
* Public: No
*/

params ["_unit","_deltaT","_syncValue"];
GET_SUIT_DATA(_unit) params ["_helmetPassiveAirReserve","_suitMobility","_suitBlackBodyCoeff","_suitSolarAbsorptance","_suitThickness"];

private _staminaSetting = [_unit] call EFUNC(common,getStaminaSetting);

//private _oxygenSupplyWhenFull = GETVAR(_unit,GVAR(unitAirMaxReserve),nil);
//private _oxygenSupply = GETVAR(_unit,GVAR(unitAirReserve),nil);
//private _suitData = _unit getVariable [QGVAR(unitSuitData),nil];

if (GET_ATMO(_unit) != 0) exitWith {}; // If in atmo, use surrounding air instead of air tank

private _oxygenSupplyWhenFull = GET_AIR_RESERVE_MAX(_unit);
private _oxygenSupply = GET_AIR_RESERVE(_unit);
//private _suitBools = GET_SUIT_BOOLS(_unit) params ["_masterBool","_helmetBool","_suitBool","_packBool"];

private _unitMass = HUMAN_MASS + (((loadAbs _unit)/10)/2.205); // Junk on the right is the gear weight converted into kg
private _respiratoryRate = nil;

private _percievedPain = GET_PAIN_PERCEIVED(_unit);
//private _painCoeff = (GVAR(breathingPain_coeff)*(0.00052652*(exp(7.26135*_percievedPain))));
private _painCoeff = BREATHING_PAIN_FUNCTION(GVAR(breathingPain_coeff),_percievedPain);
/*
_painCoeff is defined by the following exponential function for 0 <= _percievedPain <= 1:
0.00052652 e^(7.26135 x)
This is meant to simulate pains effect on breathing, with minor pain having little effect and severe pain causing heavy breathing/hyperventilation.
*/

// Determine which respiratory rate to use depending on mission stamina settings
// Order of precedence: ACE fatigue > Vanilla fatigue > No fatigue
switch _staminaSetting do {
    case 0: {
        // ACE advanced fatigue only applies to the player
        if (_unit == ACE_player) then {
            _respiratoryRate = (ACEGVAR(advanced_fatigue,respiratoryRate) + _painCoeff) min 1;
        } else {
            _respiratoryRate = (0.33 + _painCoeff) min 1;
        };
    };
    case 1: {
        _respiratoryRate = 0.073 max (getFatigue _unit + _painCoeff) min 1;
    };
    case 2: {
        _respiratoryRate = (0.33 + _painCoeff) min 1;
    };
    default {
        ERROR_1("Invalid _staminaSetting in switch-case! _staminaSetting: %1",_staminaSetting);
    };
};

/*
The BREATHING_VO2_FUNCTION function uses two cubic functions, for 0 <= x <= 1:
3.5 + 61.1643 x - 127.42 x^2 + 110.756 x^3
3.5 + 128.306 x - 222.781 x^2 + 138.975 x^3
The top one is for full mobility (no suit), while the bottom one represents the lowest possible mobility (heavy pressure suit).
The linearConversion function is so a variable coefficient for suit mobility (e.g. US suit = 0.6) can be applied. This is done to make the code more flexible.
The resultant _currentVO2 will equal the current VO2 of the player in ml/kg/minute.
*/

// https://www.wolframalpha.com/input?i=curve+fit+%7B%5B0%2C15%5D%2C%5B0.073%2C15%5D%2C%5B0.265%2C20%5D%2C%5B0.685%2C30%5D%2C%5B0.93%2C40%5D%2C%5B1%2C55%5D%7D

// _suitData#1 is suit mobility
//private _currentVO2 = ((_respiratoryRate^3 * (linearConversion[0,1,(_suitData#1),110.756,138.975])) + (_respiratoryRate^2 * -(linearConversion[0,1,(_suitData#1),127.42,222.781])) + (_respiratoryRate * (linearConversion[0,1,(_suitData#1),61.1643,128.306])) + 3.5);
//private _currentVO2 = BREATHING_VO2_FUNCTION(_respiratoryRate,_suitMobility);

private _suitMobilityMultiplier = linearConversion [1,0,_suitMobility,1,2];

private _currentBreathsPerSec = (537.284*_respiratoryRate^5 - 852.668*_respiratoryRate^4 + 296.002*_respiratoryRate^3 + 65.4183*_respiratoryRate^2 - 6.03649*_respiratoryRate + 15)/60;
private _currentTidalVolume = linearConversion [0,1,_respiratoryRate,0.5,3];

private _currentO2Consumption = ((_currentBreathsPerSec*_currentTidalVolume*_suitMobilityMultiplier)/4)*_deltaT; // note, /4 is to account for rebreathing, only 25% of o2 is used per breath

//private _currentO2Consumption = (((_currentVO2 * _unitMass)/60) min 56)*_deltaT;

private _newOxygenSupply = (0 max (_oxygenSupply-_currentO2Consumption));

//_unit setVariable [QGVAR(unitAirConsumption),_currentO2Consumption,_syncValue];
//_unit setVariable [QGVAR(unitAirReserve),_newOxygenSupply,_syncValue];
SET_AIR_CONSUMPTION(_unit,_currentO2Consumption,_syncValue);
SET_AIR_RESERVE(_unit,_newOxygenSupply,_syncValue);


// ACE resp rate
//      resting = 0.073 = 16 bpm, 500ml tidal
//      walk = 0.265 = 18 bpm
//      slow jog = 0.685 = 30 bpm
//      fast jog = 0.93 = 40 bpm
//      run = 1 = 55 bpm, 3L tidal
