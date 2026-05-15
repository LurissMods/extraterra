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

params ["_unit", "_container", "_item", "_case"];

// Case 0 is for players attempting to drop equipped items in their own inventory
// Case 1 is for players attempting to take equipped items from other unit inventories

switch _case do {
    case 0: {
        if (GET_AIR_TANK_BOOL(_unit)) then {
            GET_AIR_TANK(_unit) params ["_airTankClass","_airTankCurrent","_airTankMax"];

            private _dummyClass = getText (configFile >> "CfgMagazines" >> _airTankClass >> "exterra_equipedDummy");

            if (_item == _dummyClass) then {
                _container addItemCargoGlobal [_item, -1];
                _unit addItem _dummyClass;
                [LLSTRING(equippedConsumeableErrorMessage),2] call ACEFUNC(common,displayTextStructured);
            };
        };

        if (GET_BATTERY_BOOL(_unit)) then {
            GET_BATTERY(_unit) params ["_batteryClass","_battCurrentSupply","_battTotalSupply"];

            private _dummyClass = getText (configFile >> "CfgMagazines" >> _batteryClass >> "exterra_equipedDummy");

            if (_item == _dummyClass) then {
                _container addItemCargoGlobal [_item, -1];
                _unit addItem _dummyClass;
                [LLSTRING(equippedConsumeableErrorMessage),2] call ACEFUNC(common,displayTextStructured);
            };
        };
    };
    case 1: {
        // _container *should* only ever be the targeted unit in this context
        if (GET_AIR_TANK_BOOL(objectParent _container)) then {
            GET_AIR_TANK(objectParent _container) params ["_airTankClass","_airTankCurrent","_airTankMax"];

            private _dummyClass = getText (configFile >> "CfgMagazines" >> _airTankClass >> "exterra_equipedDummy");

            if (_item == _dummyClass) then {
                _unit removeItem _dummyClass;
                _container addItemCargoGlobal [_item, 1];
                [LLSTRING(equippedConsumeableErrorMessage),2] call ACEFUNC(common,displayTextStructured);
            };
        };

        if (GET_BATTERY_BOOL(objectParent _container)) then {
            GET_BATTERY(objectParent _container) params ["_batteryClass","_battCurrentSupply","_battTotalSupply"];

            private _dummyClass = getText (configFile >> "CfgMagazines" >> _batteryClass >> "exterra_equipedDummy");

            if (_item == _dummyClass) then {
                _unit removeItem _dummyClass;
                _container addItemCargoGlobal [_item, 1];
                [LLSTRING(equippedConsumeableErrorMessage),2] call ACEFUNC(common,displayTextStructured);
            };
        };
    };
};
