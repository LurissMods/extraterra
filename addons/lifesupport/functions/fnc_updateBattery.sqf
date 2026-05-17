#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates the current power draw and remaining battery capacity for a unit.
*
* Arguments:
* [_unit, _deltaT, _syncValue] [<UNIT>, <NUMBER>, <BOOL>]
* _unit - Current unit.
* _deltaT - Main loop is called at a variable rate e.g. 1.01 sec, 1.03 sec, this corrects for that
* _syncValue - Whether or not to sync the current update with the server
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateBattery;
*
* Public: No
*/

params ["_unit","_deltaT","_syncValue"];

private _currentBatteryCapacity = GET_BATTERY_RESERVE(_unit);

private _suitTheveninVoltage = 0;
private _basePowerDraw = 0;
private _minPumpPowerDraw = 0;
private _maxPumpPowerDraw = 0;
private _suitMaxActiveCool = 0;
private _suitMaxActiveHeat = 0;
private _currentPumpPowerDraw = 0;
private _currentVisionModePowerDraw = 0;

switch (GET_SUIT_FACTION(_unit)) do {
    case NO_SUIT_FACTION: {
        ERROR_1("Suit faction undefined! Unit: %1",_unit);
    };
    case US_SUIT_FACTION: {
        _suitTheveninVoltage = SUIT_THEVENIN_VOLTAGE_US;
        _basePowerDraw = SUIT_BASE_POWER_DRAW_US;
        _minPumpPowerDraw = SUIT_MIN_THERMAL_CONTROL_POWER_US;
        _maxPumpPowerDraw = SUIT_MAX_THERMAL_CONTROL_POWER_US;
        _suitMaxActiveCool = GVAR(CBAset_maxActiveCool_US);
        _suitMaxActiveHeat = GVAR(CBAset_maxActiveHeat_US);
    };
};

switch (currentVisionMode _unit) do {
    case 0: { // Normal
    _currentVisionModePowerDraw = 0
    };
    case 1: { // NVGs
    _currentVisionModePowerDraw = SUIT_NV_WATTAGE_US;
    };
    case 2: { // THermals
    _currentVisionModePowerDraw = SUIT_TV_WATTAGE_US;
    };
};

if (GET_ACTIVE_COOL(_unit) > 0) then {
    _currentPumpPowerDraw = linearConversion [0,_suitMaxActiveCool,GET_ACTIVE_COOL(_unit),_minPumpPowerDraw,_maxPumpPowerDraw];
} else {
    if (GET_ACTIVE_HEAT(_unit) > 0) then {
        _currentPumpPowerDraw = linearConversion [0,_suitMaxActiveHeat,GET_ACTIVE_HEAT(_unit),_minPumpPowerDraw,_maxPumpPowerDraw];
    } else {
        _currentPumpPowerDraw = _minPumpPowerDraw;
    };
};

private _currentPowerDraw = ((_basePowerDraw + _currentPumpPowerDraw + _currentVisionModePowerDraw)/_suitTheveninVoltage)*_deltaT;
_currentBatteryCapacity = 0 max (_currentBatteryCapacity - _currentPowerDraw);

SET_POWER_DRAW(_unit,_currentPowerDraw,_syncValue);
SET_BATTERY_RESERVE(_unit,_currentBatteryCapacity,_syncValue);
