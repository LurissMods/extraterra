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

params ["_unit", ["_isRespawn", true]];
TRACE_2("initUnit",_unit,_isRespawn);

if (!_isRespawn) then {

    if hasInterface then {
        // Setup ppEffect
        GVAR(lowBloodFlowTunnelVision) = ppEffectCreate ["ColorCorrections", 4301];
        GVAR(lowBloodFlowTunnelVision) ppEffectEnable true;
        GVAR(lowBloodFlowTunnelVision) ppEffectForceInNVG true;
        GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
        GVAR(lowBloodFlowTunnelVision) ppEffectCommit 0;

        GVAR(lowBloodFlowGreyscale) = ppEffectCreate ["ColorCorrections", 4302];
        GVAR(lowBloodFlowGreyscale) ppEffectEnable true;
        GVAR(lowBloodFlowGreyscale) ppEffectForceInNVG true;
        GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[1,1,1,0]];
        GVAR(lowBloodFlowGreyscale) ppEffectCommit 0;

        GVAR(lowBloodFlowSpots) = ppEffectCreate ["FilmGrain", 4303];
        GVAR(lowBloodFlowSpots) ppEffectEnable true;
        GVAR(lowBloodFlowSpots) ppEffectForceInNVG true;
        GVAR(lowBloodFlowSpots) ppEffectAdjust [0, 0.01, 3, 0.1, 0.1, 0];
        GVAR(lowBloodFlowSpots) ppEffectCommit 0;

        GVAR(burredVision) = ppEffectCreate ["DynamicBlur", 400];
        GVAR(burredVision) ppEffectEnable true;
        GVAR(burredVision) ppEffectForceInNVG true;
        GVAR(burredVision) ppEffectAdjust [0];
        GVAR(burredVision) ppEffectCommit 0;
    };

    _unit addEventHandler ["Respawn", {[(_this select 0), true] call FUNC(initUnit)}];
    [_unit,true] call FUNC(initUnit);
};

if (!local _unit) exitWith {};

if (_isRespawn) then {

    // General
    SET_SYMPTOM_HASHMAP(_unit,createHashMap,true);

    // Symptoms
    SET_BP_ADJUST(_unit,0,true);
    SET_HR_ADJUST(_unit,0,true);
    SET_FEVER_ADJUST(_unit,0,true);
    SET_HEAT_RASH_BOOL(_unit,false,true);
    SET_CYANOSIS_BOOL(_unit,false,true);
    SET_SIMPLE_SPO2(_unit,100,true);

    // Ebullism
    SET_VAC_EXPOSE_TIME(_unit,0,true);
    SET_VAC_EXPOSE_ARRAY(_unit,VAC_EXPOSE_ARRAY,true);
    SET_VAC_EXPOSE_BOOL(_unit,false,true);
    SET_VAC_EXPOSE_EFFECT_BOOL(_unit,false,true);

    // ARS_
    SET_ARS_RAD_ARRAY(_unit,RAD_LIMIT_ARRAY,true);
    SET_ARS_RAD_INDEX(_unit,0,true);
    SET_ARS_TIMER(_unit,(NO_ARS_TIMER + CBA_missionTime),true);
    SET_ARS_FATIGUE_WEAKNESS_BOOL(_unit,false,true);
    SET_ARS_HYPOTENSION_BOOL(_unit,false,true);
    SET_ARS_FEVER_BOOL(_unit,false,true);
};

/*[{
    params ["_unit"];
    TRACE_3("Unit Init",_unit,local _unit,typeOf _unit);

    _unit setVariable [QGVAR(initialized), true, true];
    [QGVAR(initialized), [_unit]] call CBA_fnc_localEvent;
}, [_unit], 0.5] call CBA_fnc_waitAndExecute;*/






/*GVAR(vomitMild) = false;

// Setup ppEffect
GVAR(lowBloodFlowTunnelVision) = ppEffectCreate ["ColorCorrections", 4301];
GVAR(lowBloodFlowTunnelVision) ppEffectEnable true;
GVAR(lowBloodFlowTunnelVision) ppEffectForceInNVG true;
GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
GVAR(lowBloodFlowTunnelVision) ppEffectCommit 0;

GVAR(lowBloodFlowGreyscale) = ppEffectCreate ["ColorCorrections", 4302];
GVAR(lowBloodFlowGreyscale) ppEffectEnable true;
GVAR(lowBloodFlowGreyscale) ppEffectForceInNVG true;
GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[1,1,1,0]];
GVAR(lowBloodFlowGreyscale) ppEffectCommit 0;

GVAR(lowBloodFlowSpots) = ppEffectCreate ["FilmGrain", 4303];
GVAR(lowBloodFlowSpots) ppEffectEnable true;
GVAR(lowBloodFlowSpots) ppEffectForceInNVG true;
GVAR(lowBloodFlowSpots) ppEffectAdjust [0, 0.01, 3, 0.1, 0.1, 0];
GVAR(lowBloodFlowSpots) ppEffectCommit 0;

GVAR(burredVision) = ppEffectCreate ["DynamicBlur", 400];
GVAR(burredVision) ppEffectEnable true;
GVAR(burredVision) ppEffectForceInNVG true;
GVAR(burredVision) ppEffectAdjust [0];
GVAR(burredVision) ppEffectCommit 0;

GVAR(lastUpdateTime) = 0;

GVAR(pfID) = [LINKFUNC(lowBloodFlowEffectPP), 0, []] call CBA_fnc_addPerFrameHandler;*/
