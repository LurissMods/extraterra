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

GET_AIR_TANK(_unit) params ["_tankClass","_currentAirSupply","_totalAirSupply"];
GET_BATTERY(_unit) params ["_batteryClass","_currentBattSupply","_totalBattSupply"];

if (GET_AIR_TANK_BOOL(_unit)) then {

    private _stateChange = false;

    if !(GET_AIR_TANK_STATECHANGE(_unit)) then {
        _syncValue = true;
        _stateChange = true;

        SET_AIR_TANK_STATECHANGE(_unit,true,_syncValue);
    };

    // New air tank added. Import to unit
    if (_stateChange) then {
        SET_AIR_RESERVE(_unit,_currentAirSupply,_syncValue);
        SET_AIR_RESERVE_MAX(_unit,_totalAirSupply,_syncValue);
    };

    // If suit active but reserve is 0 and tank present, import the reserve
    if (GET_SUIT_ACTIVATED(_unit) && {GET_AIR_RESERVE(_unit) == 0}) then {
        SET_AIR_RESERVE(_unit,_currentAirSupply,_syncValue);
    };

    // If suit inactive but reserve is not 0 and tank present, set active reserve to 0
    if (!(GET_SUIT_ACTIVATED(_unit)) && {GET_AIR_RESERVE(_unit) != 0}) then {
        private _tankDataUpdate = [_tankClass,GET_AIR_RESERVE(_unit),_totalAirSupply];

        SET_AIR_TANK(_unit,_tankDataUpdate,_syncValue);
        SET_AIR_RESERVE(_unit,0,_syncValue);
    };
} else {
    private _stateChange = false;

    if (GET_AIR_TANK_STATECHANGE(_unit)) then {
        _syncValue = true;
        _stateChange = true;

        SET_AIR_TANK_STATECHANGE(_unit,false,_syncValue);
    };

    // Air tank removed. Update air tank and unit
    if (_stateChange) then {
        private _tankDataUpdate = [_tankClass,GET_AIR_RESERVE(_unit),_totalAirSupply];

        SET_AIR_TANK(_unit,_tankDataUpdate,_syncValue);
        SET_AIR_RESERVE(_unit,0,_syncValue);
    };
};

// ----------------------------------------- Battery ------------------------------------------------------ //

if (GET_BATTERY_BOOL(_unit)) then {

    private _stateChange = false;

    if !(GET_BATTERY_STATECHANGE(_unit)) then {
        _syncValue = true;
        _stateChange = true;

        SET_BATTERY_STATECHANGE(_unit,true,_syncValue);
    };

    // New battery added. Import to unit
    if (_stateChange) then {
        SET_BATTERY_RESERVE(_unit,_currentBattSupply,_syncValue);
        SET_BATTERY_RESERVE_MAX(_unit,_totalBattSupply,_syncValue);
    };

} else {
    private _stateChange = false;

    if (GET_BATTERY_STATECHANGE(_unit)) then {
        _syncValue = true;
        _stateChange = true;

        SET_BATTERY_STATECHANGE(_unit,false,_syncValue);
    };

    // Battery removed. Update battery and unit
    if (_stateChange) then {
        private _batteryDataUpdate = [_batteryClass,GET_BATTERY_RESERVE(_unit),_totalBattSupply];

        SET_BATTERY(_unit,_batteryDataUpdate,_syncValue);
        SET_BATTERY_RESERVE(_unit,0,_syncValue);
    };

    // If suit is active without a battery, turn off the suit
    if (GET_SUIT_ACTIVATED(_unit)) then {
        SET_SUIT_ACTIVATED(_unit,false,_syncValue);
    };
};

_syncValue;
