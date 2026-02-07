#include "..\script_component.hpp"
/*
 * Author: Luriss
 * Changes the radiation level of the mission.
 *
 * Arguments:
 * Passed from module. Check CfgVehicles.hpp for attribute classes.
 *
 * Return Value:
 * None
 *
 * Example:
 * Called via module in CfgVehicles.hpp.
 *
 * Public: No
 */

_logic = _this param [0,objnull,[objnull]];
_isActivated = _this param [2,true,[true]];

private _minValue = 0.057;
private _maxValue = 5000;

if _isActivated then {
	_stormIntensity = 5000;
	_transitionTime = 15;

	_previousRad = GVAR(currentEnvironRadiationPerHour);

	_changeInRadiationPerSecond = (_stormIntensity - _previousRad)/_transitionTime;

	for "_i" from 1 to _transitionTime do {
		GVAR(currentEnvironRadiationPerHour) = _minValue max (GVAR(currentEnvironRadiationPerHour) + _changeInRadiationPerSecond) min _maxValue;
		sleep 1;
	};

	deleteVehicle _logic;
};
