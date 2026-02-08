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

private _area = [getPosATL _logic];
private _atmoVal = GETVAR(_logic,atmoComp,-1);
private _radShieldVal = GETVAR(_logic,shieldingValue,-1);
private _checkTime = GETVAR(_logic,checkTime,0.5);

_area append (_logic getVariable ["objectarea",[]]);
_area params ["_pivot","_a","_b"];

[
	{
		_inArea = (allUnits - entities "HeadlessClient_F") inAreaArray (_this getVariable "params" select 0);
		{
			if (GETVAR(_x,EGVAR(lifesupport,unitInAtmo),ATMO_STATE_ERROR) != (_this getVariable "params" select 1)) then {
				_x setVariable [QEGVAR(lifesupport,unitInAtmo), (_this getVariable "params" select 1), true];
				_x removePrimaryWeaponItem QUOTE(exterra_vacuumMuzzle);
				_x removeSecondaryWeaponItem QUOTE(exterra_vacuumMuzzle);
				//systemChat "Set atmo fired";
			};
			if (GETVAR(_x,EGVAR(lifesupport,unitInRadShield),RAD_SHIELD_ERROR) != (_this getVariable "params" select 4)) then {
				_x setVariable [QEGVAR(lifesupport,unitInRadShield), (_this getVariable "params" select 4), true];
				//systemChat "Set atmo fired";
			};
		} forEach _inArea;
	},
	(_checkTime),
	[_area, _atmoVal, _isActivated, _logic, _radShieldVal],
	{GVAR(allLifeSupportAreas) append [(_this getVariable "params" select 0)];},
	{GVAR(allLifeSupportAreas) = GVAR(allLifeSupportAreas) - [(_this getVariable "params" select 0)];},
	{(_this getVariable "params" select 2)},
	{isNull (_this getVariable "params" select 3)}

] call CBA_fnc_createPerFrameHandlerObject;
