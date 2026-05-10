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
GET_SUIT_BOOLS(_unit) params ["_masterBool","_helmetBool","_suitBool","_packBool"];

// two types - Sudden depressure (air to vac) and ebullism
// account for open wounds here?

private _unitVacuumBool = _unit getVariable [QGVAR(unitVacuumExposed),nil];


private _unitOpenWounds = GET_OPEN_WOUNDS(_unit);
private _unitWoundKeys = keys _unitOpenWounds;
private _unitExposedWounds = 0;

// Retrive and find ACE medical injuries for a unit
// Wound class = floor(id/10)      Wound Severity = id%10      E.g. Bruise = 21, class 2, severity 1
{
    // Bruises = Wound class 2
    // Velocity = Wound class 7
    if (_x == "head") then {
        {
            private _woundClass = floor((_x select 0)/10);
            if (_woundClass != 2) then {
                if ((_x select 1) == 1) then {
                    _helmetBool = false;
                };
            };
        } forEach (_unitOpenWounds get _x);
    } else {
        {
            private _woundClass = floor((_x select 0)/10);
            if (_woundClass != 2) then {
                if ((_x select 1) == 1) then {
                    _unitExposedWounds = _unitExposedWounds + 1;
                };
            };
        } forEach (_unitOpenWounds get _x);
    };

} forEach _unitWoundKeys;

//systemChat format ["Open wounds: %1, Unit: %2",_unitExposedWounds,_unit];

if (_unitExposedWounds > 6) then {
    _suitBool = false;
};


switch (GET_ATMO(_unit)) do {
    case 0: {
        switch true do {
            case !_helmetBool: {
                if (_unitVacuumBool) then {
                    //[QACEGVAR(medical,activateMedical), _unit] call CBA_fnc_localEvent; ACE optimizes by not calculating AI w/o medical
                    [_unit,_syncValues] call FUNC(updateVacuumExposure);
                } else {
                    [_unit,_syncValues] call FUNC(initVacuumExposure);
                };
            };
            case !_suitBool: {
                if (_unitVacuumBool) then {
                    [_unit,_syncValues] call FUNC(updateVacuumExposure);
                } else {
                    [_unit,_syncValues] call FUNC(initVacuumExposure);
                };
            };
            case _helmetBool: {
                if (_unitVacuumBool) then {
                    [_unit,_syncValues] call FUNC(removeVacuumExposure);
                } else {
                    //private _unitTimer = CBA_missionTime - (_unit getVariable [QGVAR(unitVacuumExposedTime),nil]);
                    //private _unitTimerCoeff = linearConversion[0,5,_unitTimer,1,0,true];
                };
            };
            case _suitBool: {
                if (_unitVacuumBool) then {
                    [_unit,_syncValues] call FUNC(removeVacuumExposure);
                } else {
                    //private _unitTimer = CBA_missionTime - (_unit getVariable [QGVAR(unitVacuumExposedTime),nil]);
                    //private _unitTimerCoeff = linearConversion[0,5,_unitTimer,1,0,true];
                };
            };
        };
    };
    default {
        _unit setVariable [QGVAR(unitVacuumExposed),false,_syncValues];

        if (_unit == ACE_player) then {
            [QGVAR(exposedVacuum), 0, false] call ACEFUNC(common,setHearingCapability);
            GVAR(burredVision) ppEffectAdjust [0];
            GVAR(burredVision) ppEffectCommit 5;
        };
    };
};

/*if (!_helmetBool && {GET_ATMO(_unit) == 0}) then {

    _unit setVariable [QGVAR(unitVacuumExposed),true,true];

    _unit setVariable [VAR_PAIN,1,false];

    if (_unit == ACE_player) then {
        [QGVAR(exposedVacuum), 0, true] call ACEFUNC(common,setHearingCapability);
        10 call ACEFUNC(hearing,earringing);
        GVAR(burredVision) ppEffectAdjust [2];
        GVAR(burredVision) ppEffectCommit 0.05;
    } else {};


   /* GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2 * (1 - _bpGradient),2 * (1 - _bpGradient),0,0,0,0.1,0.5]];
    GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,(0.3 max (1 - _bpGradient)),0,[0,0,0,0],[1,1,1,(1 - _bpGradient)],[1,1,1,0]];
    GVAR(lowBloodFlowSpots) ppEffectAdjust [_bpGradient, 0.01, 4, 0.02, 0.02, 0];
    if hasInterface then {
        ["exposedVacuum", 0, true] call ace_common_fnc_setHearingCapability;
    };
};*/


/*private _prebreatheSeverityCoeff = linearConversion[0,1,_prebreatheRatio,PREBREATHE_SAFE_THRESHOLD,1];

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
            GVAR(barotraumaDizziness_PP) ppEffectCommit 0;
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
};*/

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
