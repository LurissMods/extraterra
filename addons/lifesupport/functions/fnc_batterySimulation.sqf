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

params ["_suitFaction", "_currentActiveCool", "_currentActiveHeat"];

private _suitTheveninVoltage = 0;
private _basePowerDraw = 0;
private _minPumpPowerDraw = 0;
private _maxPumpPowerDraw = 0;
private _suitMaxActiveCool = 0;
private _suitMaxActiveHeat = 0;
private _currentPumpPowerDraw = 0;
private _currentBatteryCapacity = 0;



switch (_suitFaction) do {
    case 0: {
        _suitTheveninVoltage = SUIT_THEVENIN_VOLTAGE_US;
        _suitBatteryCapacityAmpHoursInSeconds = SUIT_BATTERY_CAP_US;
        _basePowerDraw = SUIT_BASE_POWER_DRAW_US;
        _minPumpPowerDraw = SUIT_MIN_PUMP_POWER_US;
        _maxPumpPowerDraw = SUIT_MAX_PUMP_POWER_US;
        _suitMaxActiveCool = GVAR(maxActiveCool_US);
        _suitMaxActiveHeat = GVAR(maxActiveHeat_US);

        _currentBatteryCapacity = GETVAR(player,GVAR(unitCurrentBatteryCapacity),_suitBatteryCapacityAmpHoursInSeconds);
    };
};



if (_currentActiveCool > 0) then {
    _currentPumpPowerDraw = linearConversion [0,_suitMaxActiveCool,_currentActiveCool,_minPumpPowerDraw,_maxPumpPowerDraw];
} else {
    if (_currentActiveHeat > 0) then {
        _currentPumpPowerDraw = linearConversion [0,_suitMaxActiveHeat,_currentActiveHeat,_minPumpPowerDraw,_maxPumpPowerDraw];
    } else {
        _currentPumpPowerDraw = _minPumpPowerDraw;
    };
};

private _currentCurrentDraw = (_basePowerDraw +_currentPumpPowerDraw)/_suitTheveninVoltage;
_currentBatteryCapacity = _currentBatteryCapacity - _currentCurrentDraw;

if (GETVAR(player,EGVAR(huds,suitEnabled),false)) then {
    [_suitFaction,_currentBatteryCapacity,SUIT_BATTERY_CAP_US,_currentCurrentDraw] call EFUNC(huds,battHud);
};
SETVAR(player,GVAR(unitCurrentBatteryCapacity),_currentBatteryCapacity);
