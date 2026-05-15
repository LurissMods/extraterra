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

params ["_unit","_blurIntensity","_blurCommitTime"];

if (_unit != ACE_player) exitWith {};

GVAR(burredVision) ppEffectAdjust [_blurIntensity];
GVAR(burredVision) ppEffectCommit _blurCommitTime;
