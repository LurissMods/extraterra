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

            // Checks dropped uniform/vest/bag for equipped items. Unequips item if found
            if ((count everyContainer _container) > 0) then {
                {
                    _x params ["_currentContainerName", "_currentContainerObject"];

                    {
                        if (_x == _dummyClass) then {
                            if (GET_SUIT_ACTIVATED(_unit)) then {
                                _currentContainerObject addItemCargoGlobal [_dummyClass, -1];
                                _currentContainerObject addMagazineAmmoCargo  [_airTankClass,1,GET_AIR_RESERVE(_unit)];
                            } else {
                                _currentContainerObject addItemCargoGlobal [_dummyClass, -1];
                                _currentContainerObject addMagazineAmmoCargo  [_airTankClass,1,_airTankCurrent];
                            };

                            SET_AIR_TANK(_unit,[],true);
                            SET_AIR_TANK_BOOL(_unit,false,true);
                            //[LLSTRING(equippedConsumeableErrorMessage),2] call ACEFUNC(common,displayTextStructured);
                        };

                    } forEach (itemCargo _currentContainerObject);

                } forEach (everyContainer _container);
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

            // Checks dropped uniform/vest/bag for equipped items. Unequips item if found
            if ((count everyContainer _container) > 0) then {
                {
                    _x params ["_currentContainerName", "_currentContainerObject"];

                    {
                        if (_x == _dummyClass) then {
                            if (GET_SUIT_ACTIVATED(_unit)) then {
                                _currentContainerObject addItemCargoGlobal [_dummyClass, -1];
                                _currentContainerObject addMagazineAmmoCargo  [_batteryClass,1,GET_BATTERY_RESERVE(_unit)];
                            } else {
                                _currentContainerObject addItemCargoGlobal [_dummyClass, -1];
                                _currentContainerObject addMagazineAmmoCargo  [_batteryClass,1,_battCurrentSupply];
                            };

                            SET_BATTERY(_unit,[],true);
                            SET_BATTERY_BOOL(_unit,false,true);
                            //[LLSTRING(equippedConsumeableErrorMessage),2] call ACEFUNC(common,displayTextStructured);
                        };

                    } forEach (itemCargo _currentContainerObject);

                } forEach (everyContainer _container);
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
