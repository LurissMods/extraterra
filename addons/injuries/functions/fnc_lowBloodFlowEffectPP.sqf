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

if ((CBA_missionTime - GVAR(lastUpdateTime)) < INTERVAL) exitWith {};
GVAR(lastUpdateTime) = CBA_missionTime;

//if (true) exitWith {};

if ((!isNull findDisplay 312) || {!alive ACE_player}) exitWith {
    GVAR(lowBloodFlowTunnelVision) ppEffectEnable false;
    GVAR(lowBloodFlowGreyscale) ppEffectEnable false;
    GVAR(lowBloodFlowSpots) ppEffectEnable false;
};
GVAR(lowBloodFlowTunnelVision) ppEffectEnable true;
GVAR(lowBloodFlowGreyscale) ppEffectEnable true;
GVAR(lowBloodFlowSpots) ppEffectEnable true;

GET_BLOOD_PRESSURE(ACE_player) params ["_bloodPressureL", "_bloodPressureH"];
private _meanBP = (2/3) * _bloodPressureH + (1/3) * _bloodPressureL;
private _heartRate = GET_HEART_RATE(ACE_player);
//private _bpLow = _bloodPressure select 0;

private _bpGradient = linearConversion [BLOOD_PRESSURE_LOW_UPPER,BLOOD_PRESSURE_LOW_LOWER,_meanBP,0,1,true];
private _hrGradient = linearConversion [HEART_RATE_LOW_UPPER,HEART_RATE_LOW_LOWER,_heartRate,0,1,true];

if (ACE_player call ACEFUNC(common,isAwake)) then {

    if (_bpGradient > _hrGradient) then {
        if (_meanBP < BLOOD_PRESSURE_LOW_UPPER) then {
            //private _bpGradient = linearConversion [60,30,_bpLow,0,1,true];

            GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2 * (1 - _bpGradient),2 * (1 - _bpGradient),0,0,0,0.1,0.5]];
            GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,(0.3 max (1 - _bpGradient)),0,[0,0,0,0],[1,1,1,(1 - _bpGradient)],[1,1,1,0]];
            GVAR(lowBloodFlowSpots) ppEffectAdjust [_bpGradient, 0.01, 4, 0.02, 0.02, 0];
        } else {
            GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
            GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[1,1,1,0]];
            GVAR(lowBloodFlowSpots) ppEffectAdjust [0, 0.01, 3, 0.1, 0.1, 0];
        };
    } else {
        if (_heartRate < HEART_RATE_LOW_UPPER) then {
            //private _bpGradient = linearConversion [60,30,_bpLow,0,1,true];

            GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2 * (1 - _hrGradient),2 * (1 - _hrGradient),0,0,0,0.1,0.5]];
            GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,(0.3 max (1 - _hrGradient)),0,[0,0,0,0],[1,1,1,(1 - _hrGradient)],[1,1,1,0]];
            GVAR(lowBloodFlowSpots) ppEffectAdjust [_hrGradient, 0.01, 4, 0.02, 0.02, 0];
        } else {
            GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
            GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[1,1,1,0]];
            GVAR(lowBloodFlowSpots) ppEffectAdjust [0, 0.01, 3, 0.1, 0.1, 0];
        };
    };
    /*switch (true) do {
        case (_bpLow < 60): {
            private _bpGradient = linearConversion [60,30,_bpLow,0,1,true];

            GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2 * (1 - _bpGradient),2 * (1 - _bpGradient),0,0,0,0.1,0.5]];
            GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,(0.3 max (1 - _bpGradient)),0,[0,0,0,0],[1,1,1,(1 - _bpGradient)],[1,1,1,0]];
            GVAR(lowBloodFlowSpots) ppEffectAdjust [_bpGradient, 0.01, 4, 0.02, 0.02, 0];
        };
        case (_heartRate < 50): {
            private _bpGradient = linearConversion [50,30,_heartRate,0,1,true];

            GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2 * (1 - _bpGradient),2 * (1 - _bpGradient),0,0,0,0.1,0.5]];
            GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,(0.3 max (1 - _bpGradient)),0,[0,0,0,0],[1,1,1,(1 - _bpGradient)],[1,1,1,0]];
            GVAR(lowBloodFlowSpots) ppEffectAdjust [_bpGradient, 0.01, 4, 0.02, 0.02, 0];
        };
        default {
            GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
            GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[1,1,1,0]];
            GVAR(lowBloodFlowSpots) ppEffectAdjust [0, 0.01, 3, 0.1, 0.1, 0];
        };
    };*/

    /*if (_bpLow < 60) then {
        private _bpGradient = linearConversion [60,30,_bpLow,0,1,true];

        GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2 * (1 - _bpGradient),2 * (1 - _bpGradient),0,0,0,0.1,0.5]];
        GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,(0.3 max (1 - _bpGradient)),0,[0,0,0,0],[1,1,1,(1 - _bpGradient)],[1,1,1,0]];
        GVAR(lowBloodFlowSpots) ppEffectAdjust [_bpGradient, 0.01, 4, 0.02, 0.02, 0];
    } else {
        GVAR(lowBloodFlowTunnelVision) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
        GVAR(lowBloodFlowGreyscale) ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[1,1,1,0]];
        GVAR(lowBloodFlowSpots) ppEffectAdjust [0, 0.01, 3, 0.1, 0.1, 0];
    };*/
};

if (GVAR(previousControlledUnit) != ACE_player) then {
    GVAR(lowBloodFlowTunnelVision) ppEffectCommit 0;
    GVAR(lowBloodFlowGreyscale) ppEffectCommit 0;
    GVAR(lowBloodFlowSpots) ppEffectCommit 0;
} else {
    GVAR(lowBloodFlowTunnelVision) ppEffectCommit 1;
    GVAR(lowBloodFlowGreyscale) ppEffectCommit INTERVAL;
    GVAR(lowBloodFlowSpots) ppEffectCommit INTERVAL;
};

GVAR(previousControlledUnit) = ACE_player;
