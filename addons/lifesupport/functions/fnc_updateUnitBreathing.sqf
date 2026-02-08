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

private _oxygenSupplyWhenFull = GETVAR(_unit,GVAR(unitAirMaxReserve),100);
private _oxygenSupply = GETVAR(_unit,GVAR(unitAirReserve),_oxygenSupplyWhenFull);
private _suitData = _unit getVariable [QGVAR(unitSuitData),"Error!"];

private _unitMass = HUMAN_MASS + (((loadAbs _unit)/10)/2.205); // Junk on the right is the gear weight converted into kg
private _percievedPain = 0 max (GETVAR(_unit,ace_medical_pain,0) - GETVAR(_unit,ace_medical_painSuppress,0)) min 1;
//private _PainCoeff = ((missionNamespace getVariable ["LRSS_LIFESUPPORT_PAIN_COEFFICIENT", 1])*(0.00052652*(exp(7.26135*_percievedPain))));
private _PainCoeff = 0;
/*
_PainCoeff is defined by the following exponential function for 0 <= _percievedPain <= 1:
0.00052652 e^(7.26135 x)
This is meant to simulate pains effect on breathing, with minor pain having little effect and severe pain causing heavy breathing/hyperventilation.
*/
private _respiratoryRate = (ACEGVAR(advanced_fatigue,respiratoryRate) + _PainCoeff) min 1;
/*
This function uses two cubic functions, for 0 <= x <= 1:
3.5 + 61.1643 x - 127.42 x^2 + 110.756 x^3
3.5 + 128.306 x - 222.781 x^2 + 138.975 x^3
The top one is for full mobility (no suit), while the bottom one represents the lowest possible mobility (heavy pressure suit).
The linearConversion function is so a variable coefficient for suit mobility (e.g. US suit = 0.6) can be applied. This is done to make the code more flexible.
The resultant _currentVO2 will equal the current VO2 of the player in ml/kg/minute.
*/

// _suitData#1 is suit mobility
private _currentVO2 = ((_respiratoryRate^3 * (linearConversion[0,1,(_suitData#1),110.756,138.975])) + (_respiratoryRate^2 * -(linearConversion[0,1,(_suitData#1),127.42,222.781])) + (_respiratoryRate * (linearConversion[0,1,(_suitData#1),61.1643,128.306])) + 3.5);
private _currentO2Consumption = (((_currentVO2 * _unitMass)/60) min 56)*_deltaT;

if (GETVAR(_unit,EGVAR(huds,suitEnabled),false)) then {
    [_suitFaction, _oxygenSupply, _oxygenSupplyWhenFull, _currentO2Consumption] call EFUNC(huds,airHud);
};

_unit setVariable [QGVAR(unitAirReserve),(0 max (_oxygenSupply-_currentO2Consumption)),_syncValue];
