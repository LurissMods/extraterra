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

private _oxygenSupplyWhenFull = GETVAR(_unit,GVAR(unitAirMaxReserve),1000);
private _oxygenSupply = GETVAR(_unit,GVAR(unitAirReserve),_oxygenSupplyWhenFull);
private _suitData = _unit getVariable [QGVAR(unitSuitData),ERROR("exterra_lifesupport_fnc_updateUnitBreathing no suit data in GETVAR!")];

private _unitMass = HUMAN_MASS + (((loadAbs _unit)/10)/2.205); // Junk on the right is the gear weight converted into kg
private _respiratoryRate = nil;
private _newOxygenSupply = nil;

private _percievedPain = GET_PAIN_PERCEIVED(_unit);
//private _painCoeff = (GVAR(breathingPain_coeff)*(0.00052652*(exp(7.26135*_percievedPain))));
private _painCoeff = BREATHING_PAIN_FUNCTION(GVAR(breathingPain_coeff),_percievedPain);
/*
_painCoeff is defined by the following exponential function for 0 <= _percievedPain <= 1:
0.00052652 e^(7.26135 x)
This is meant to simulate pains effect on breathing, with minor pain having little effect and severe pain causing heavy breathing/hyperventilation.
*/

if (isPlayer _unit) then {
    _respiratoryRate = (ACEGVAR(advanced_fatigue,respiratoryRate) + _painCoeff) min 1;
} else {
    _respiratoryRate = (0.33 + _painCoeff) min 1;
};

/*
The BREATHING_VO2_FUNCTION function uses two cubic functions, for 0 <= x <= 1:
3.5 + 61.1643 x - 127.42 x^2 + 110.756 x^3
3.5 + 128.306 x - 222.781 x^2 + 138.975 x^3
The top one is for full mobility (no suit), while the bottom one represents the lowest possible mobility (heavy pressure suit).
The linearConversion function is so a variable coefficient for suit mobility (e.g. US suit = 0.6) can be applied. This is done to make the code more flexible.
The resultant _currentVO2 will equal the current VO2 of the player in ml/kg/minute.
*/

// _suitData#1 is suit mobility
//private _currentVO2 = ((_respiratoryRate^3 * (linearConversion[0,1,(_suitData#1),110.756,138.975])) + (_respiratoryRate^2 * -(linearConversion[0,1,(_suitData#1),127.42,222.781])) + (_respiratoryRate * (linearConversion[0,1,(_suitData#1),61.1643,128.306])) + 3.5);
private _currentVO2 = BREATHING_VO2_FUNCTION(_respiratoryRate,(_suitData#1));
private _currentO2Consumption = (((_currentVO2 * _unitMass)/60) min 56)*_deltaT;

_newOxygenSupply = (0 max (_oxygenSupply-_currentO2Consumption));

_unit setVariable [QGVAR(unitAirReserve),_newOxygenSupply,_syncValue];
