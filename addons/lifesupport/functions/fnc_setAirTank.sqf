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

private _airTankArray = [];
private _actions = [];

{
    private _currentAirTank = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_airTank");

    if ((GET_SUIT_FACTION(_unit)) == _currentAirTank) then {
        private _airTankMax = getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "exterra_airTank_maxCapacity");
        private _airTankData = [(_x#0),(_x#1),_airTankMax];
        _airTankArray pushBack _airTankData;
    };

} forEach magazinesAmmo _unit;

{
    _x params ["_airTankClass","_airTankCurrent","_airTankMax"];

    private _childStatement = {
        params ["_target", "_player", "_params", "_actionData"];
        _params params ["_airTankClass","_airTankCurrent","_airTankMax"];

        private _inArray = [_airTankClass,_airTankCurrent,_airTankMax];
        private _dummyClass = getText (configFile >> "CfgMagazines" >> _airTankClass >> "exterra_equipedDummy");

        SET_AIR_TANK(_target,_inArray,true);
        SET_AIR_TANK_BOOL(_target,true,true);

        _target removeItem _airTankClass;
        _target addItem _dummyClass;
    };

    private _modifierFunc = {
        params ["_target", "_player", "_params", "_actionData"];
        _params params ["_airTankClass","_airTankCurrent","_airTankMax"];

        // Done to stop a 0 divisor error that can happen on mission start
        if (_airTankMax == 0) then {
            _airTankMax = 1;
        };

        private _tankName = getText (configFile >> "CfgMagazines" >> _airTankClass >> "displayname");
        private _percentRemaining = round ((_airTankCurrent/_airTankMax)*100);

        // Sets the icon for the remaining capacity
        switch true do {
            case (_percentRemaining >= 87.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_airTank100_ca.paa)];
            };
            case (_percentRemaining < 12.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_airTank0_ca.paa)];
            };
            case (_percentRemaining < 37.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_airTank25_ca.paa)];
            };
            case (_percentRemaining < 62.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_airTank50_ca.paa)];
            };
            case (_percentRemaining < 87.5): {
                _actionData set [2, QPATHTOF(data\exterra_lifesupport_airTank75_ca.paa)];
            };
        };

        // Modify the action - index 1 is the display name, 2 is the icon...
        _actionData set [1, format ["%1 (%2%%)", _tankName, _percentRemaining]];
    };

    private _action = ["exterra_airTankInInv", "Error: Air tank _modifierFunc broken!", "", _childStatement, {true}, {}, [_airTankClass,_airTankCurrent,_airTankMax],{[0, 0, 0]},1,[false,false,false,false,false],_modifierFunc] call ACEFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _unit];

} forEach _airTankArray;

_actions;
