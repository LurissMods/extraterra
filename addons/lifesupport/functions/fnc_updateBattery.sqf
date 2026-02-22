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

//private _unitSuitFaction = GETVAR(_unit,GVAR(unitSuitFaction),NO_SUIT_FACTION);
//private _currentBatteryCapacity = GETVAR(_unit,GVAR(unitMaxBatteryCapacity),nil);
//private _currentBatteryCapacity = GETVAR(_unit,GVAR(unitCurrentBatteryCapacity),nil);
//private _unitSuitFaction = GET_SUIT_FACTION(_unit);
//private _currentBatteryCapacity = GET_BATTERY_RESERVE_MAX(_unit);
private _currentBatteryCapacity = GET_BATTERY_RESERVE(_unit);

private _suitTheveninVoltage = 0;
private _basePowerDraw = 0;
private _minPumpPowerDraw = 0;
private _maxPumpPowerDraw = 0;
private _suitMaxActiveCool = 0;
private _suitMaxActiveHeat = 0;
private _suitBatteryCapacityAmpHoursInSeconds = 0;
private _currentPumpPowerDraw = 0;

//if (GET_SUIT_FACTION(_unit) == NO_SUIT_FACTION) exitWith {};

switch (GET_SUIT_FACTION(_unit)) do {
    case NO_SUIT_FACTION: {
        ERROR_1("Suit faction undefined! Unit: %1",_unit);
    };
    case US_SUIT_FACTION: {
        _suitTheveninVoltage = SUIT_THEVENIN_VOLTAGE_US;
        _basePowerDraw = SUIT_BASE_POWER_DRAW_US;
        _minPumpPowerDraw = SUIT_MIN_PUMP_POWER_US;
        _maxPumpPowerDraw = SUIT_MAX_PUMP_POWER_US;
        _suitMaxActiveCool = GVAR(maxActiveCool_US);
        _suitMaxActiveHeat = GVAR(maxActiveHeat_US);
        _suitBatteryCapacityAmpHoursInSeconds = SUIT_BATTERY_CAP_US;
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

private _currentPowerDraw = ((_basePowerDraw +_currentPumpPowerDraw)/_suitTheveninVoltage)*_deltaT;
_currentBatteryCapacity = _currentBatteryCapacity - _currentPowerDraw;

SET_POWER_DRAW(_unit,_currentPowerDraw,_syncValue);
SET_BATTERY_RESERVE(_unit,_currentBatteryCapacity,_syncValue);
//_unit setVariable [QGVAR(unitPowerDraw),_currentCurrentDraw,_syncValue];
//_unit setVariable [QGVAR(unitCurrentBatteryCapacity),_currentBatteryCapacity,_syncValue];
