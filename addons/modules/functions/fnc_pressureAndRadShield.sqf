#include "..\script_component.hpp"
/*
 * Author: Luriss
 * Checks if player is in direct sunlight. Returns thermal heating in watts.
 *
 * Arguments:
 * _isPlayerInSun (Value between 0 and 1, generally behaves like a boolean. Result of the code to the right.) I used _isPlayerInSun = [player,"VIEW"] checkVisibility [eyePos player, eyePos player vectorDiff ((getLighting#2) vectorMultiply 200)];
 *
 * Return Value:
 * _solarHeatingPower
 *
 * Example:
 * [] call lrss_extraterra_lifeSupport_fnc_breathingSimulation;
 *
 * Public: Yes
 */

private _logic = _this param [0,objnull,[objnull]];
private _isActivated = _this param [2,true,[true]];

private _area = [[getPosATL _logic]];
private _atmoVal = GETVAR(_logic,atmoComp,-1);
private _radShieldVal = GETVAR(_logic,shieldingValue,-1);
private _checkTime = GETVAR(_logic,checkTime,0.5);

(_area select 0) append (_logic getVariable ["objectArea",[]]);
_area append [[_atmoVal,_radShieldVal]];

[
	{},
	(0),
    [_area,_isActivated,_logic,_atmoVal,_radShieldVal],
	{GVAR(allLifeSupportAreas) append [(_this getVariable "params" select 0)]; publicVariable QGVAR(allLifeSupportAreas);},
	{GVAR(allLifeSupportAreas) = GVAR(allLifeSupportAreas) - [(_this getVariable "params" select 0)]; publicVariable QGVAR(allLifeSupportAreas);},
	{(_this getVariable "params" select 1)},
	{isNull (_this getVariable "params" select 2)}

] call CBA_fnc_createPerFrameHandlerObject;
