#include "..\script_component.hpp"
/*
* Author: Akaviri13, Luriss
* Updates the IFF icons. Run every frame.
* Called by the Fire Control PFH.
*
* Arguments:
* ["_unitsNearPlayer"]  [<ARRAY>]
* _unitsNearPlayer = Array of units surrounding the player.
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateIFF
*
* Public: No
*/

params ["_unitsNearPlayer"];

{
    params ["_unitsNearPlayer"];

    private _datalink = nil;
    private _unitRelationToPlayer = nil;
    private _unitIsKindOf = nil;
    private _nearbyUnit = _x; // _unitsNearPlayer
    private _distance = (positionCameraToWorld [0,0,0]) distance _nearbyUnit;

    private _sideUnit = side _nearbyUnit;
    private _sidePlayer = side ACE_player;
    private _hostileCheck = _sidePlayer getFriend _sideUnit;
    private _fov = getObjectFOV vehicle ACE_player;

    private _pos = nil;
    private _size = nil;
    private _icon = nil;
    private _color = nil;

    switch GVAR(CBAset_datalink) do {
        case 0: {_datalink = _sidePlayer};
        case 1: {_datalink = side group ACE_player};
        case 2: {_datalink = ACE_player};
    };

    if (lifeState _nearbyUnit == "INCAPACITATED" OR lifeState _nearbyUnit == "DEAD") then {
        continue;
    };

    if ((_datalink knowsAbout _nearbyUnit) < KNOWS_ABOUT_IFF_THRESHOLD) then {
        continue;
    };

    if (_nearbyUnit isKindOf "MAN") then {
        _unitIsKindOf = "MAN";
    } else {
        if (_nearbyUnit isKindOf "CAR" || {_nearbyUnit isKindOf "TANK"}) then {
            _unitIsKindOf = "VEHICLE";
        } else {
            if (_nearbyUnit isKindOf "AIR") then {
                _unitIsKindOf = "AIR";
            } else {
                _unitIsKindOf = "StaticWeapon";
            };
        };
    };

    if (_hostileCheck < 0.6) then {
        _unitRelationToPlayer = "ENEMY";
    } else {
        if (_sideUnit == civilian) then {
            _unitRelationToPlayer = "NEUTRAL";
        } else {
            if (group _nearbyUnit == group ACE_player) then {
                _unitRelationToPlayer = "SQUAD";
            } else {
                _unitRelationToPlayer = "FRIENDLY";
            };
        };
    };

    switch _unitIsKindOf do {
        case ("MAN"): {
            _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition "spine3");

            switch _unitRelationToPlayer do {
                case "ENEMY" : {
                    _size = (GVAR(CBAset_infantryIFF_maxSizeEnemy) / tan(_fov / GVAR(CBAset_infantryIFF_minSizeEnemy)) / _distance) max GVAR(CBAset_infantryIFF_maxSizeEnemy);
                    _icon = GVAR(CBAset_infantryIFF_iconEnemy);
                    _color = +GVAR(CBAset_enemyColorIFF);
                };
                case "NEUTRAL" : {
                    _size = (GVAR(CBAset_infantryIFF_maxSizeNeutral) / tan(_fov / GVAR(CBAset_infantryIFF_minSizeNeutral)) / _distance) max GVAR(CBAset_infantryIFF_maxSizeNeutral);
                    _icon = GVAR(CBAset_infantryIFF_iconNeutral);
                    _color = +GVAR(CBAset_neutralColorIFF);
                };
                case "FRIENDLY" : {
                    _size = (GVAR(CBAset_infantryIFF_maxSizeFriend) / tan(_fov / GVAR(CBAset_infantryIFF_minSizeFriend)) / _distance) max GVAR(CBAset_infantryIFF_maxSizeFriend);
                    _icon = GVAR(CBAset_infantryIFF_iconFriend);
                    _color = +GVAR(CBAset_friendColorIFF);
                };
                case "SQUAD" : {
                    _size = (GVAR(CBAset_infantryIFF_maxSizeFriend) / tan(_fov / GVAR(CBAset_infantryIFF_minSizeFriend)) / _distance) max GVAR(CBAset_infantryIFF_maxSizeFriend);
                    _icon = GVAR(CBAset_infantryIFF_iconFriend);
                    _color = switch (assignedTeam _nearbyUnit) do {
                        case "MAIN": {+GVAR(CBAset_groupColorIFF)};
                        case "RED": {+[1,0,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "GREEN": {+[0,1,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "BLUE": {+[0,0,1,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "YELLOW": {+[1,1,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                    };
                };
            };
        };
        case ("VEHICLE"): {
            _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["zamerny", "Memory"]);
            switch _unitRelationToPlayer do {
                case "ENEMY" : {
                    _size = (GVAR(CBAset_vehicleIFF_maxSizeEnemy) / tan(_fov / GVAR(CBAset_vehicleIFF_minSizeEnemy)) / _distance) max GVAR(CBAset_vehicleIFF_maxSizeEnemy);
                    _icon = GVAR(CBAset_vehicleIFF_iconEnemy);
                    _color = +GVAR(CBAset_enemyColorIFF);
                };
                case "NEUTRAL" : {
                    _size = (GVAR(CBAset_vehicleIFF_maxSizeNeutral) / tan(_fov / GVAR(CBAset_vehicleIFF_minSizeNeutral)) / _distance) max GVAR(CBAset_vehicleIFF_maxSizeNeutral);
                    _icon = GVAR(CBAset_vehicleIFF_iconNeutral);
                    _color = +GVAR(CBAset_neutralColorIFF);
                };
                case "FRIENDLY" : {
                    _size = (GVAR(CBAset_vehicleIFF_maxSizeFriend) / tan(_fov / GVAR(CBAset_vehicleIFF_minSizeFriend)) / _distance) max GVAR(CBAset_vehicleIFF_maxSizeFriend);
                    _icon = GVAR(CBAset_vehicleIFF_iconFriend);
                    _color = +GVAR(CBAset_friendColorIFF);
                };
                case "SQUAD" : {
                    _size = (GVAR(CBAset_vehicleIFF_maxSizeFriend) / tan(_fov / GVAR(CBAset_vehicleIFF_minSizeFriend)) / _distance) max GVAR(CBAset_vehicleIFF_maxSizeFriend);
                    _icon = GVAR(CBAset_vehicleIFF_iconFriend);
                    _color = switch (assignedTeam _nearbyUnit) do {
                        case "MAIN": {+GVAR(CBAset_groupColorIFF)};
                        case "RED": {+[1,0,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "GREEN": {+[0,1,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "BLUE": {+[0,0,1,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "YELLOW": {+[1,1,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                    };
                };
            };
        };
        case ("AIR"): {
            _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["zamerny", "Memory"]);
            switch _unitRelationToPlayer do {
                case "ENEMY" : {
                    _size = (GVAR(CBAset_aircraftIFF_maxSizeEnemy) / tan(_fov / GVAR(CBAset_aircraftIFF_minSizeEnemy)) / _distance) max GVAR(CBAset_aircraftIFF_maxSizeEnemy);
                    _icon = GVAR(CBAset_aircraftIFF_iconEnemy);
                    _color = +GVAR(CBAset_enemyColorIFF);
                };
                case "NEUTRAL" : {
                    _size = (GVAR(CBAset_aircraftIFF_maxSizeNeutral) / tan(_fov / GVAR(CBAset_aircraftIFF_minSizeNeutral)) / _distance) max GVAR(CBAset_aircraftIFF_maxSizeNeutral);
                    _icon = GVAR(CBAset_aircraftIFF_iconNeutral);
                    _color = +GVAR(CBAset_neutralColorIFF);
                };
                case "FRIENDLY" : {
                    _size = (GVAR(CBAset_aircraftIFF_maxSizeFriend) / tan(_fov / GVAR(CBAset_aircraftIFF_minSizeFriend)) / _distance) max GVAR(CBAset_aircraftIFF_maxSizeFriend);
                    _icon = GVAR(CBAset_aircraftIFF_iconFriend);
                    _color = +GVAR(CBAset_friendColorIFF);
                };
                case "SQUAD" : {
                    _size = (GVAR(CBAset_aircraftIFF_maxSizeFriend) / tan(_fov / GVAR(CBAset_aircraftIFF_minSizeFriend)) / _distance) max GVAR(CBAset_aircraftIFF_maxSizeFriend);
                    _icon = GVAR(CBAset_aircraftIFF_iconFriend);
                    _color = switch (assignedTeam _nearbyUnit) do {
                        case "MAIN": {+GVAR(CBAset_groupColorIFF)};
                        case "RED": {+[1,0,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "GREEN": {+[0,1,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "BLUE": {+[0,0,1,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "YELLOW": {+[1,1,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                    };
                };
            };
        };
        case ("StaticWeapon"): {
            _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["osahlavne", "Memory"]);
            switch _unitRelationToPlayer do {
                case "ENEMY" : {
                    _size = (GVAR(CBAset_staticIFF_maxSizeEnemy) / tan(_fov / GVAR(CBAset_staticIFF_minSizeEnemy)) / _distance) max GVAR(CBAset_staticIFF_maxSizeEnemy);
                    _icon = GVAR(CBAset_staticIFF_iconEnemy);
                    _color = +GVAR(CBAset_enemyColorIFF);
                };
                case "NEUTRAL" : {
                    _size = (GVAR(CBAset_staticIFF_maxSizeNeutral) / tan(_fov / GVAR(CBAset_staticIFF_minSizeNeutral)) / _distance) max GVAR(CBAset_staticIFF_maxSizeNeutral);
                    _icon = GVAR(CBAset_staticIFF_iconNeutral);
                    _color = +GVAR(CBAset_neutralColorIFF);
                };
                case "FRIENDLY" : {
                    _size = (GVAR(CBAset_staticIFF_maxSizeFriend) / tan(_fov / GVAR(CBAset_staticIFF_minSizeFriend)) / _distance) max GVAR(CBAset_staticIFF_maxSizeFriend);
                    _icon = GVAR(CBAset_staticIFF_iconFriend);
                    _color = +GVAR(CBAset_friendColorIFF);
                };
                case "SQUAD" : {
                    _size = (GVAR(CBAset_staticIFF_maxSizeFriend) / tan(_fov / GVAR(CBAset_staticIFF_minSizeFriend)) / _distance) max GVAR(CBAset_staticIFF_maxSizeFriend);
                    _icon = GVAR(CBAset_staticIFF_iconFriend);
                    _color = switch (assignedTeam _nearbyUnit) do {
                        case "MAIN": {+GVAR(CBAset_groupColorIFF)};
                        case "RED": {+[1,0,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "GREEN": {+[0,1,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "BLUE": {+[0,0,1,(GVAR(CBAset_groupColorIFF) select 3)]};
                        case "YELLOW": {+[1,1,0,(GVAR(CBAset_groupColorIFF) select 3)]};
                    };
                };
            };
        };
        default {ERROR_1("Error! _unitIsKindOf unknown case! %1",_unitIsKindOf); break};
    };

    _colorFade = linearConversion [DEFAULT_IFF_FADE_DIST_END,DEFAULT_IFF_FADE_DIST_START,_distance,0,1,true];
    _color set [3,_colorFade];

    drawIcon3D [_icon,_color,_pos,_size,_size,0,"",0,0,"RobotoCondensed","center",false];

} forEach (_unitsNearPlayer);
