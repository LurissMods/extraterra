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

//params ["_unit"];
GVAR(previousControlledUnit) = ACE_player;

GVAR(playerSeed) = random 32769; // Used for randomization on a per player basis (e.g. when throwing up due to ARS)
GVAR(randomRadLim0) = random [375,562.5,750];
GVAR(randomRadLim1) = random [751,1125.5,1500];
GVAR(randomRadLim2) = random [1501,2250.5,3000];
GVAR(randomRadLim3) = random [3001,4150.5,5300];
GVAR(randomRadLim4) = random [5301,6800.5,8300];
GVAR(randomRadLim5) = random [8301,9650.5,11000];

GVAR(vomitMild) = false;

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

GVAR(lastUpdateTime) = 0;

GVAR(pfID) = [LINKFUNC(lowBloodFlowEffectPP), 0, []] call CBA_fnc_addPerFrameHandler;
