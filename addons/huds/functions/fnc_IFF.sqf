#include "..\script_component.hpp"
/*
* Author: Akaviri13 (Inherited from his code)
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

params ["_unitsNearPlayer"];
LRSS_showIcons = true; // Not properly implemented yet

if (LRSS_showIcons && {isNull(findDisplay 312) && {call CBA_fnc_currentUnit == player}}) then {
    {
    private _offset = [0,0,0];
    private _datalink = nil;
    private _unit = _x;
    private _distance = (positionCameraToWorld [0,0,0]) distance _unit;
    private _icon = "";
    private _color = [0,0,0,0];
    private _size = 0;
    private _sideUnit = side _unit;
    private _sidePlayer = side player;
    private _hostileCheck = _sidePlayer getFriend _sideUnit;
    private _fov = getObjectFOV vehicle player;
    private _pos = [0,0,0];

    private _screenPosition = worldToScreen (_unit modelToWorldVisual _offset);
	if (_screenPosition isEqualTo []) then { continue };

    switch GVAR(fireControl_Datalink) do {
        case 0: {_datalink = _sidePlayer};
        case 1: {_datalink = side group player};
        case 2: {_datalink = player};
    };

    if (_unit isKindOf "MAN") then {
        _pos = _unit modelToWorldVisual (_unit selectionPosition "spine3");
        _size = 1 max (GVAR(fireControl_humanSizeFriend) / tan(_fov /2) / _distance);

        if (lifeState _unit == "INCAPACITATED" OR lifeState _unit == "DEAD") then {
            _icon = "";
            _color = [0,0,0,0];
        } else {
            if ((_sideUnit == civilian) && {(_datalink knowsAbout _unit) > 0.1}) then {
                _icon = GVAR(fireControl_humanIconFriend);
                _color = GVAR(fireControl_neutralColor);
            } else {
                if (_hostileCheck < 0.6 && {(_datalink knowsAbout _unit) > 0.1}) then {
                    _size = 1 max (GVAR(fireControl_humanSizeEnemy) / tan(_fov /2) / _distance);
                    _icon = GVAR(fireControl_humanIconEnemy);
                    _color = GVAR(fireControl_enemyColor);
                } else {
                    if (group player isEqualTo group _unit) then {
                        private _transparency = GVAR(fireControl_groupColor) select 3;
                        _icon = GVAR(fireControl_humanIconFriend);
                        _color = switch (assignedTeam _unit) do {
                            case "MAIN": {GVAR(fireControl_groupColor)};
                            case "RED": {[1,0,0,_transparency]};
                            case "GREEN": {[0,1,0,_transparency]};
                            case "BLUE": {[0,0,1,_transparency]};
                            case "YELLOW": {[1,1,0,_transparency]};
                        };
                    } else {
                        if (_sideUnit == _sidePlayer OR _hostileCheck > 0.6 && {(_datalink knowsAbout _unit) > 0.1}) then {
                            _icon = GVAR(fireControl_humanIconFriend);
                            _color = GVAR(fireControl_friendColor);
                        } else {
                            _icon = "";
                            _color = [0,0,0,0];
                        };
                    };
                };
            };
        };
    } else {
        if (lifeState _unit == "INCAPACITATED" OR lifeState _unit == "DEAD") then {
            _color = [0,0,0,0];
        } else {
            if ((_sideUnit == civilian) && {(_datalink knowsAbout _unit) > 0.1}) then {
                _color = GVAR(fireControl_neutralColor);
            } else {
                if (_hostileCheck < 0.6 && {(_datalink knowsAbout _unit) > 0.1}) then {
                    _color = GVAR(fireControl_enemyColor);
                } else {
                    if (group player isEqualTo group _unit) then {
                        _color = GVAR(fireControl_groupColor);
                    } else {
                        if (_sideUnit == _sidePlayer OR {_hostileCheck > 0.6 && {(_datalink knowsAbout _unit) > 0.1}}) then {
                            _color = GVAR(fireControl_friendColor);
                        } else {
                            _color = [0,0,0,0];
                        };
                    };
                };
            };
        };

        if (_unit isKindOf "StaticWeapon") then {
            _pos = _unit modelToWorldVisual (_unit selectionPosition ["osahlavne", "Memory"]);
            _icon = GVAR(fireControl_staticIcon);
            _size = (GVAR(fireControl_staticSize) / tan(_fov /2) / _distance) max 0.5;
        } else {
            _pos = _unit modelToWorldVisual (_unit selectionPosition ["zamerny", "Memory"]);
            _icon = GVAR(fireControl_vehicleIcon);
            _size = (GVAR(fireControl_vehicleSize) / tan(_fov /2) / _distance) max 0.5;
        };
    };

    drawIcon3D [_icon,_color,_pos,_size,_size,0,"",0,0,"RobotoCondensed","center",false];
    } forEach (_unitsNearPlayer);
};
