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

params ["_isSuitCheckCall", "_prebreatheRatio", "_inSuit", "_currentAtmo"];

//systemChat str EGVAR(lifesupport,atmoEnteredSuit);

//systemChat str _prebreatheRatio;
private _prebreatheSeverityCoeff = linearConversion[0,1,_prebreatheRatio,PREBREATHE_SAFE_THRESHOLD,1];

if (_isSuitCheckCall) then {

} else {
    if (!_inSuit && {_currentAtmo == 2}) then {

        if (!GVAR(barotraumaInit)) then {
            GVAR(barotraumaInit) = true;
            (_prebreatheSeverityCoeff*10) call ace_hearing_fnc_earringing;
            [player, _prebreatheSeverityCoeff*0.3] call ace_medical_status_fnc_adjustpainlevel;
        };

        if (_prebreatheRatio > PREBREATHE_SAFE_THRESHOLD) then {
            /*GVAR(barotraumaDizziness_PP) ppEffectEnable true;
            GVAR(barotraumaDizziness_PP) ppEffectAdjust [100, 0.5, 0.1, 0.5];
            GVAR(barotraumaDizziness_PP) ppEffectCommit 0;*/
        };

        ["mildEarBarotrauma", 0.1 max (1 - _prebreatheRatio), true] call ace_common_fnc_setHearingCapability;
        GVAR(barotraumaTimer) = GVAR(barotraumaTimer) + 1;
    } else {
        if (GVAR(barotraumaInit)) then {
            ["mildEarBarotrauma", 0.1 max (1 - _prebreatheRatio), false] call ace_common_fnc_setHearingCapability;
            GVAR(barotraumaInit) = false;
        };
        GVAR(barotraumaTimer) = 0 max GVAR(barotraumaTimer) - 1;
    };
};

// cough sound
// Shortness of breath (Severe)

//private _severityEar = _severity*20;


//[_unit, _severity] call ace_medical_status_fnc_adjustpainlevel;

//GVAR(barotraumaBlur_PP) ppEffectEnable true;
//GVAR(barotraumaBlur_PP) ppEffectAdjust [0.01, 0.01, 0.06, 0.06];
//GVAR(barotraumaBlur_PP) ppEffectCommit 0.05;

/*
dizziness
tinnitus
muffled hearing
*/
