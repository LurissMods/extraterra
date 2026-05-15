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

params ["_unit", "_fatigueArray"];

private _staminaSetting = [_unit] call EFUNC(common,getStaminaSetting);

if (_staminaSetting == 2) exitWith {};

private _coeff = 0;
{
    _coeff = _coeff + _x;
} forEach _fatigueArray;

_coeff = _coeff/count _fatigueArray;

switch _staminaSetting do {
    case 0: {
        if (_unit == ACE_player) then {
            private _coeffConverted = linearConversion [0,1,_coeff,1,FATIGUE_0_MIN,true];
            ACEGVAR(advanced_fatigue,performanceFactor) = GVAR(originalPerformanceFactor)*_coeffConverted;
            ACEGVAR(advanced_fatigue,recoveryFactor) = GVAR(originalRecoveryFactor)*_coeffConverted;
        } else {
            //private _coeffConverted = linearConversion [0,1,_coeff,1,FATIGUE_1_MAX,true];
            //_unit setUnitTrait ["staminaDrainCoef", _coeff]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
        };
    };
    case 1: {
        //private _coeffConverted = linearConversion [0,1,_coeff,1,FATIGUE_1_MAX,true];
        //_unit setUnitTrait ["staminaDrainCoef", _coeff]; Note: Not yet in arma stable branch. Fix this when 2.22 is released
    };
};
