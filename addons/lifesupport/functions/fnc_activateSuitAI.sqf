#include "..\script_component.hpp"
/*
* Author: Luriss
* Initalizes life support variables for all units.
*
* Arguments:
* [_unit, _isRespawn] [<UNIT>, <BOOL>]
* _unit - Current unit
* _isRespawn - Whether or not this is the first time a unit has spawned
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_initUnit;
*
* Public: No
*/

params ["_unit","_syncValue"];

if (isPlayer _unit) exitWith {};

GET_SUIT_BOOLS(_unit) params ["_inFullSuit","_helmetBool","_suitBool","_packBool"];

if !(GET_AIR_TANK_BOOL(_unit)) then {
    if ([_unit] call FUNC(getAirTanks)) then {
        _syncValue = true;
        private _airTankData = nil;

        {
            private _currentAirTank = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_airTank");

            if ((GET_SUIT_FACTION(_unit)) == _currentAirTank) exitWith {
                private _airTankMax = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_airTank_maxCapacity");
                _airTankData = [(_x#0),(_x#1),_airTankMax];
            };

        } forEach magazinesAmmo _unit;

        _airTankData params ["_airTankClass","_airTankCurrent","_airTankMax"];

        private _inArray = [_airTankClass,_airTankCurrent,_airTankMax];
        private _dummyClass = getText (configFile >> "CfgMagazines" >> _airTankClass >> "exterra_equipedDummy");

        SET_AIR_TANK(_unit,_inArray,_syncValue);
        SET_AIR_TANK_BOOL(_unit,true,_syncValue);

        _unit removeItem _airTankClass;
        _unit addItem _dummyClass;
    };
};

if !(GET_BATTERY_BOOL(_unit)) then {
    if ([_unit] call FUNC(getBatteries)) then {
        _syncValue = true;
        private _batteryData = nil;

        {
            private _currentBattery = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_battery");

            if ((GET_SUIT_FACTION(_unit)) == _currentBattery) exitWith {
                private _batteryMax = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_battery_maxCapacity");
                _batteryData = [(_x#0),(_x#1),_batteryMax];
            };

        } forEach magazinesAmmo _unit;

        _batteryData params ["_batteryClass","_batteryCurrent","_airTankMax"];

        private _inArray = [_batteryClass,_batteryCurrent,_airTankMax];
        private _dummyClass = getText (configFile >> "CfgMagazines" >> _batteryClass >> "exterra_equipedDummy");

        SET_BATTERY(_unit,_inArray,_syncValue);
        SET_BATTERY_BOOL(_unit,true,_syncValue);

        _unit removeItem _batteryClass;
        _unit addItem _dummyClass;
    };
};

if !(GET_SUIT_ACTIVATED(_unit)) then {
    if (_inFullSuit && {(GET_BATTERY_BOOL(_unit))}) then {
        _syncValue = true;
        SET_SUIT_ACTIVATED(_unit,true,_syncValue);
    };
};
