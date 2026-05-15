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

params ["_unit"];

private _batteryArray = [];
private _actions = [];

{
    private _currentBattery = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_battery");

    if ((GET_SUIT_FACTION(_unit)) == _currentBattery) then {
        private _batteryMax = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_battery_maxCapacity");
        private _batteryData = [(_x#0),(_x#1),_batteryMax];
        _batteryArray pushBack _batteryData;
    };

} forEach magazinesAmmo _unit;

{
    _x params ["_batteryClass","_batteryCurrent","_batteryMax"];

    private _childStatement = {
        params ["_target", "_player", "_params", "_actionData"];
        _params params ["_batteryClass","_batteryCurrent","_airTankMax"];

        private _inArray = [_batteryClass,_batteryCurrent,_airTankMax];
        private _dummyClass = getText (configFile >> "CfgMagazines" >> _batteryClass >> "exterra_equipedDummy");

        SET_BATTERY(_target,_inArray,true);
        SET_BATTERY_BOOL(_target,true,true);

        _target removeItem _batteryClass;
        _target addItem _dummyClass;
    };

    private _modifierFunc = {
        params ["_target", "_player", "_params", "_actionData"];
        _params params ["_batteryClass","_batteryCurrent","_batteryMax"];

        // Done to stop a 0 divisor error that can happen on mission start
        if (_batteryMax == 0) then {
            _batteryMax = 1;
        };

        private _batteryName = getText (configFile >> "CfgMagazines" >> _batteryClass >> "displayname");
        private _percentRemaining = round ((_batteryCurrent/_batteryMax)*100);

        // Sets the icon for the remaining capacity
        switch true do {
            case (_percentRemaining >= 87.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_battery100_ca.paa)];
            };
            case (_percentRemaining < 12.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_battery0_ca.paa)];
            };
            case (_percentRemaining < 37.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_battery25_ca.paa)];
            };
            case (_percentRemaining < 62.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_battery50_ca.paa)];
            };
            case (_percentRemaining < 87.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_battery75_ca.paa)];
            };
        };

        // Modify the action - index 1 is the display name, 2 is the icon...
        _actionData set [1, format ["%1 (%2%%)", _batteryName, _percentRemaining]];
    };

    private _action = ["exterra_batteryInInv", "Error: Battery _modifierFunc broken!", "", _childStatement, {true}, {}, [_batteryClass,_batteryCurrent,_batteryMax],{[0, 0, 0]},1,[false,false,false,false,false],_modifierFunc] call ACEFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _unit];

} forEach _batteryArray;

_actions;
