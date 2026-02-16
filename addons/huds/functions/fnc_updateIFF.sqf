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

if (GVAR(fireControl_IFF_cbaSetting)) then {
    {
        params ["_unitsNearPlayer"];

        private _datalink = nil;
        private _unitRelationToPlayer = nil;
        private _nearbyUnit = _x; // _unitsNearPlayer
        private _distance = (positionCameraToWorld [0,0,0]) distance _nearbyUnit;

        private _sideUnit = side _nearbyUnit;
        private _sidePlayer = side ACE_player;
        private _hostileCheck = _sidePlayer getFriend _sideUnit;
        private _fov = getObjectFOV vehicle ACE_player;

        private _pos = [];
        private _size = 0;
        private _icon = "";
        private _color = [];

        private _screenPosition = worldToScreen (_nearbyUnit modelToWorldVisual IFF_NEARBYUNITS_OFFSET);
        if (_screenPosition isEqualTo []) then { continue };

        switch GVAR(fireControl_datalink_cbaSetting) do {
            case 0: {_datalink = _sidePlayer};
            case 1: {_datalink = side group ACE_player};
            case 2: {_datalink = ACE_player};
        };

        if (lifeState _nearbyUnit == "INCAPACITATED" OR lifeState _nearbyUnit == "DEAD") then {
            //_icon = "";
            //_color = [0,0,0,0];
            break;
        };

        if ((_datalink knowsAbout _nearbyUnit) < 0.1) then {
            break;
        };

        if (_hostileCheck < 0.6) then {
            _unitRelationToPlayer = "ENEMY";
        } else {
            if (_sideUnit == civilian) then {
                _unitRelationToPlayer = "NEUTRAL";
            } else {
                if (_sideUnit == civilian) then {
                    _unitRelationToPlayer = "SQUAD";
                } else {
                    _unitRelationToPlayer = "FRIENDLY";
                };
            };
        };

        switch _nearbyUnit do {
            case (_nearbyUnit isKindOf "MAN") : {
                _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition "spine3");

                switch _unitRelationToPlayer do {
                    case "ENEMY" : {
                        _size = 1 max (GVAR(fireControl_humanSizeEnemy_cbaSetting) / tan(_fov /2) / _distance);
                        _icon = GVAR(fireControl_humanIconEnemy_cbaSetting);
                        _color = GVAR(fireControl_enemyColor_cbaSetting);
                    };
                    case "NEUTRAL" : {
                        _size = 1 max (GVAR(fireControl_humanSizeFriend_cbaSetting) / tan(_fov /2) / _distance);
                        _icon = GVAR(fireControl_humanIconFriend_cbaSetting);
                        _color = GVAR(fireControl_neutralColor_cbaSetting);
                    };
                    case "FRIENDLY" : {
                        _size = 1 max (GVAR(fireControl_humanSizeFriend_cbaSetting) / tan(_fov /2) / _distance);
                        _icon = GVAR(fireControl_humanIconFriend_cbaSetting);
                        _color = GVAR(fireControl_friendColor_cbaSetting);
                    };
                    case "SQUAD" : {
                        _size = 1 max (GVAR(fireControl_humanSizeFriend_cbaSetting) / tan(_fov /2) / _distance);
                        _icon = GVAR(fireControl_humanIconFriend_cbaSetting);
                        _color = switch (assignedTeam _nearbyUnit) do {
                            case "MAIN": {GVAR(fireControl_groupColor_cbaSetting)};
                            case "RED": {[1,0,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "GREEN": {[0,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "BLUE": {[0,0,1,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "YELLOW": {[1,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        };
                    };
                };
            };
            case (_nearbyUnit isKindOf "CAR" || {_nearbyUnit isKindOf "TANK"}) : {
                _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["zamerny", "Memory"]);
                _size = (GVAR(fireControl_vehicleSize_cbaSetting) / tan(_fov /2) / _distance) max 0.5;
                switch _unitRelationToPlayer do {
                    case "ENEMY" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_enemyColor_cbaSetting);
                    };
                    case "NEUTRAL" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_neutralColor_cbaSetting);
                    };
                    case "FRIENDLY" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_friendColor_cbaSetting);
                    };
                    case "SQUAD" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = switch (assignedTeam _nearbyUnit) do {
                            case "MAIN": {GVAR(fireControl_groupColor_cbaSetting)};
                            case "RED": {[1,0,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "GREEN": {[0,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "BLUE": {[0,0,1,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "YELLOW": {[1,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        };
                    };
                };
            };
            case (_nearbyUnit isKindOf "AIR") : {
                _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["zamerny", "Memory"]);
                _size = (GVAR(fireControl_vehicleSize_cbaSetting) / tan(_fov /2) / _distance) max 0.5;
                switch _unitRelationToPlayer do {
                    case "ENEMY" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_enemyColor_cbaSetting);
                    };
                    case "NEUTRAL" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_neutralColor_cbaSetting);
                    };
                    case "FRIENDLY" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_friendColor_cbaSetting);
                    };
                    case "SQUAD" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = switch (assignedTeam _nearbyUnit) do {
                            case "MAIN": {GVAR(fireControl_groupColor_cbaSetting)};
                            case "RED": {[1,0,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "GREEN": {[0,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "BLUE": {[0,0,1,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "YELLOW": {[1,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        };
                    };
                };
            };
            case (_nearbyUnit isKindOf "StaticWeapon") : {
                _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["osahlavne", "Memory"]);
                _size = (GVAR(fireControl_staticSize_cbaSetting) / tan(_fov /2) / _distance) max 0.5;
                switch _unitRelationToPlayer do {
                    case "ENEMY" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_enemyColor_cbaSetting);
                    };
                    case "NEUTRAL" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_neutralColor_cbaSetting);
                    };
                    case "FRIENDLY" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = GVAR(fireControl_friendColor_cbaSetting);
                    };
                    case "SQUAD" : {
                        _icon = GVAR(fireControl_staticIcon_cbaSetting);
                        _color = switch (assignedTeam _nearbyUnit) do {
                            case "MAIN": {GVAR(fireControl_groupColor_cbaSetting)};
                            case "RED": {[1,0,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "GREEN": {[0,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "BLUE": {[0,0,1,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                            case "YELLOW": {[1,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        };
                    };
                };
            };
        };

        drawIcon3D [_icon,_color,_pos,_size,_size,0,"",0,0,"RobotoCondensed","center",false];

        /*if (_nearbyUnit isKindOf "MAN") then {
            _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition "spine3");
            _size = 1 max (GVAR(fireControl_humanSizeFriend_cbaSetting) / tan(_fov /2) / _distance);

            if (lifeState _nearbyUnit == "INCAPACITATED" OR lifeState _nearbyUnit == "DEAD") then {
                _icon = "";
                _color = [0,0,0,0];
            } else {
                if ((_sideUnit == civilian) && {(_datalink knowsAbout _nearbyUnit) > 0.1}) then {
                    _icon = GVAR(fireControl_humanIconFriend_cbaSetting);
                    _color = GVAR(fireControl_neutralColor_cbaSetting);
                } else {
                    if (_hostileCheck < 0.6 && {(_datalink knowsAbout _nearbyUnit) > 0.1}) then {
                        _size = 1 max (GVAR(fireControl_humanSizeEnemy_cbaSetting) / tan(_fov /2) / _distance);
                        _icon = GVAR(fireControl_humanIconEnemy_cbaSetting);
                        _color = GVAR(fireControl_enemyColor_cbaSetting);
                    } else {
                        if (group ACE_player isEqualTo group _nearbyUnit) then {
                            private _transparency = GVAR(fireControl_groupColor_cbaSetting) select 3;
                            _icon = GVAR(fireControl_humanIconFriend_cbaSetting);
                            _color = switch (assignedTeam _nearbyUnit) do {
                                case "MAIN": {GVAR(fireControl_groupColor_cbaSetting)};
                                case "RED": {[1,0,0,_transparency]};
                                case "GREEN": {[0,1,0,_transparency]};
                                case "BLUE": {[0,0,1,_transparency]};
                                case "YELLOW": {[1,1,0,_transparency]};
                            };
                        } else {
                            if (_sideUnit == _sidePlayer OR _hostileCheck > 0.6 && {(_datalink knowsAbout _nearbyUnit) > 0.1}) then {
                                _icon = GVAR(fireControl_humanIconFriend_cbaSetting);
                                _color = GVAR(fireControl_friendColor_cbaSetting);
                            } else {
                                systemChat "FUNC(updateIFF) check why I fired.";
                                _icon = "";
                                _color = [0,0,0,0];
                            };
                        };
                    };
                };
            };
        } else {
            if (lifeState _nearbyUnit == "INCAPACITATED" OR lifeState _nearbyUnit == "DEAD") then {
                _color = [0,0,0,0];
            } else {
                if ((_sideUnit == civilian) && {(_datalink knowsAbout _nearbyUnit) > 0.1}) then {
                    _color = GVAR(fireControl_neutralColor_cbaSetting);
                } else {
                    if (_hostileCheck < 0.6 && {(_datalink knowsAbout _nearbyUnit) > 0.1}) then {
                        _color = GVAR(fireControl_enemyColor_cbaSetting);
                    } else {
                        if (group ACE_player isEqualTo group _nearbyUnit) then {
                            _color = GVAR(fireControl_groupColor_cbaSetting);
                        } else {
                            if (_sideUnit == _sidePlayer OR {_hostileCheck > 0.6 && {(_datalink knowsAbout _nearbyUnit) > 0.1}}) then {
                                _color = GVAR(fireControl_friendColor_cbaSetting);
                            } else {
                                _color = [0,0,0,0];
                            };
                        };
                    };
                };
            };

            if (_nearbyUnit isKindOf "StaticWeapon") then {
                _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["osahlavne", "Memory"]);
                _icon = GVAR(fireControl_staticIcon_cbaSetting);
                _size = (GVAR(fireControl_staticSize_cbaSetting) / tan(_fov /2) / _distance) max 0.5;
            } else {
                _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["zamerny", "Memory"]);
                _icon = GVAR(fireControl_vehicleIcon_cbaSetting);
                _size = (GVAR(fireControl_vehicleSize_cbaSetting) / tan(_fov /2) / _distance) max 0.5;
            };
        };*/
    } forEach (_unitsNearPlayer);
};
