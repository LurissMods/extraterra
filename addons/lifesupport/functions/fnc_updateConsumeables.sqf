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

private _unitAirTank = GET_AIR_TANK(_unit);
private _unitBattery = GET_BATTERY(_unit);

if (_unit == ACE_player) then {
    systemChat str (count (_unit getVariable ['exterra_lifesupport_unitAirTank',[]]) != 0);
};

if (count _unitAirTank != 0) then {

    if !(GET_AIR_TANK_BOOL(_unit)) then {
        _unitAirTank params ["_tankClass","_currentSupply","_totalSupply"];
        _syncValue = true;

        SET_AIR_RESERVE(_unit,_currentSupply,_syncValue);
        SET_AIR_RESERVE_MAX(_unit,_totalSupply,_syncValue);

        SET_AIR_TANK_BOOL(_unit,true,_syncValue);
    };
} else {
    if (GET_AIR_TANK_BOOL(_unit)) then {
        _unitAirTank params ["_tankClass","_currentSupply","_totalSupply"];
        _syncValue = true;

        SET_AIR_RESERVE(_unit,0,_syncValue);
        SET_AIR_RESERVE_MAX(_unit,1,_syncValue);

        SET_AIR_TANK_BOOL(_unit,false,_syncValue);
    };
};

if (count _unitBattery != 0) then {

    if !(GET_BATTERY_BOOL(_unit)) then {
        _unitBattery params ["_batteryClass","_currentSupply","_totalSupply"];
        _syncValue = true;

        SET_BATTERY_RESERVE(_unit,_currentSupply,_syncValue);
        SET_BATTERY_RESERVE_MAX(_unit,_totalSupply,_syncValue);

        SET_BATTERY_BOOL(_unit,true,_syncValue);
    };
} else {
    if (GET_BATTERY_BOOL(_unit)) then {
        _unitBattery params ["_batteryClass","_currentSupply","_totalSupply"];
        _syncValue = true;

        SET_BATTERY_RESERVE(_unit,0,_syncValue);
        SET_BATTERY_RESERVE_MAX(_unit,1,_syncValue);

        SET_BATTERY_BOOL(_unit,false,_syncValue);
    };
};

_syncValue;
