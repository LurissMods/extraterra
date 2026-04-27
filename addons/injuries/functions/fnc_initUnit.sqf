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

    _unit setVariable [QGVAR(unitVacuumExposed),false,true];
    _unit setVariable [QGVAR(unitVacuumExposedTime),0,true];

    _unit setVariable [QGVAR(unitBaroUncon),(random [3, 5, 10]),true];
    _unit setVariable [QGVAR(unitBaroCardiacArrest),(random [20, 30, 40]),true];
    _unit setVariable [QGVAR(unitBaroDeath),(random [80, 90, 120]),true];
    _unit setVariable [QGVAR(unitBaroUnconBool),false,true];
    _unit setVariable [QGVAR(unitBaroCardiacArrestBool),false,true];

    _unit setVariable [QGVAR(unitSeed),random 32769,true];
    _unit setVariable [QGVAR(radLim0),random [375,562.5,750],true];
    _unit setVariable [QGVAR(radLim1),random [751,1125.5,1500],true];
    _unit setVariable [QGVAR(radLim2),random [1501,2250.5,3000],true];
    _unit setVariable [QGVAR(radLim3),random [3001,4150.5,5300],true];
    _unit setVariable [QGVAR(radLim4),random [5301,6800.5,8300],true];
    _unit setVariable [QGVAR(radLim5),random [8301,9650.5,11000],true];
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
