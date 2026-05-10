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

params ["_unit","_currentRad"];

private _staminaSetting = [_unit] call EFUNC(common,getStaminaSetting);
private _radFatigueStart = ((_unit getVariable [QGVAR(unitRadLimArray),nil]) select 2);
private _maxRadLim = ((_unit getVariable [QGVAR(unitRadLimArray),nil]) select 8);

if (_staminaSetting == 2) exitWith {};

if (_staminaSetting == 0 && {isPlayer _unit}) then {
    private _fatigueCoeff = linearConversion [_radFatigueStart,_maxRadLim,_currentRad,1,0.25,true];
    ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*_fatigueCoeff;
    ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*_fatigueCoeff;
} else {
    private _fatigueCoeff = linearConversion [_radFatigueStart,_maxRadLim,_currentRad,1,1.75,true];
    _unit setUnitTrait ["loadCoef", _fatigueCoeff];
    //_unit setUnitTrait ["staminaDrainCoef", _fatigueCoeff]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
};
