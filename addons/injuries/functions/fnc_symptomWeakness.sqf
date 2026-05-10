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

params ["_unit", "_weaknessArray"];

private _staminaSetting = [_unit] call EFUNC(common,getStaminaSetting);

if (_staminaSetting == 2) exitWith {};

private _coeff = 0;
{
    _coeff = _coeff + _x;
} forEach _weaknessArray;

_coeff = _coeff/count _weaknessArray;

switch _staminaSetting do {
    case 0: {
        if (isPlayer _unit) then {
            private _coeffConverted = linearConversion [0,1,_coeff,1,FATIGUE_0_MIN,true];
            ACEGVAR(advanced_fatigue,loadFactor) = GVAR(originalLoadFactor)*_coeffConverted;
            ACEGVAR(advanced_fatigue,terrainGradientFactor) = GVAR(originalTerrainGradientFactor)*_coeffConverted;
        } else {
            private _coeffConverted = linearConversion [0,1,_coeff,1,FATIGUE_1_MAX,true];
            _unit setUnitTrait ["loadCoef", _coeffConverted];
        };
    };
    case 1: {
        private _coeffConverted = linearConversion [0,1,_coeff,1,FATIGUE_1_MAX,true];
        _unit setUnitTrait ["loadCoef", _coeffConverted];
    };
};
