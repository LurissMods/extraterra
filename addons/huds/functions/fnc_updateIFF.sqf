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

    /*private _screenPosition = worldToScreen (_nearbyUnit modelToWorldVisual IFF_NEARBYUNITS_OFFSET);
    if (_screenPosition isEqualTo []) then { continue };*/

    switch GVAR(fireControl_datalink_cbaSetting) do {
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
                    _size = (GVAR(fireControl_humanSizeEnemy_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_MAN_FOV) / _distance) max 0.75; //max GVAR(fireControl_humanSizeEnemyMin_cbaSetting);
                    _icon = GVAR(fireControl_humanIconEnemy_cbaSetting);
                    _color = +GVAR(fireControl_enemyColor_cbaSetting);
                    //systemChat format ["Pos: %1, Size: %2, Icon: %3, Color: %4",_pos,_size,_icon,_color];
                };
                case "NEUTRAL" : {
                    _size = (GVAR(fireControl_humanSizeNeutral_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_MAN_FOV) / _distance) max 0.75; //max GVAR(fireControl_humanSizeNeutralMin_cbaSetting);
                    _icon = GVAR(fireControl_humanIconNeutral_cbaSetting);
                    _color = +GVAR(fireControl_neutralColor_cbaSetting);
                };
                case "FRIENDLY" : {
                    _size = (GVAR(fireControl_humanSizeFriend_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_MAN_FOV) / _distance) max 0.75; //max GVAR(fireControl_humanSizeFriendMin_cbaSetting);
                    _icon = GVAR(fireControl_humanIconFriend_cbaSetting);
                    _color = +GVAR(fireControl_friendColor_cbaSetting);
                };
                case "SQUAD" : {
                    _size = (GVAR(fireControl_humanSizeFriend_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_MAN_FOV) / _distance) max 0.75; //max GVAR(fireControl_humanSizeFriendMin_cbaSetting);
                    _icon = GVAR(fireControl_humanIconFriend_cbaSetting);
                    _color = switch (assignedTeam _nearbyUnit) do {
                        case "MAIN": {+GVAR(fireControl_groupColor_cbaSetting)};
                        case "RED": {+[1,0,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "GREEN": {+[0,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "BLUE": {+[0,0,1,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "YELLOW": {+[1,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                    };
                };
            };
        };
        case ("VEHICLE"): {
            _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["zamerny", "Memory"]);
            switch _unitRelationToPlayer do {
                case "ENEMY" : {
                    _size = (GVAR(fireControl_vehicleSizeEnemy_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 1; //max GVAR(fireControl_vehicleSizeEnemyMin_cbaSetting);
                    _icon = GVAR(fireControl_vehicleIconEnemy_cbaSetting);
                    _color = +GVAR(fireControl_enemyColor_cbaSetting);
                };
                case "NEUTRAL" : {
                    _size = (GVAR(fireControl_vehicleSizeNeutral_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 1; //max GVAR(fireControl_vehicleSizeNeutralMin_cbaSetting);
                    _icon = GVAR(fireControl_vehicleIconNeutral_cbaSetting);
                    _color = +GVAR(fireControl_neutralColor_cbaSetting);
                };
                case "FRIENDLY" : {
                    _size = (GVAR(fireControl_vehicleSizeFriend_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 1; //max GVAR(fireControl_vehicleSizeFriendMin_cbaSetting);
                    _icon = GVAR(fireControl_vehicleIconFriend_cbaSetting);
                    _color = +GVAR(fireControl_friendColor_cbaSetting);
                };
                case "SQUAD" : {
                    _size = (GVAR(fireControl_vehicleSizeFriend_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 1; //max GVAR(fireControl_vehicleSizeFriendMin_cbaSetting);
                    _icon = GVAR(fireControl_vehicleIconFriend_cbaSetting);
                    _color = switch (assignedTeam _nearbyUnit) do {
                        case "MAIN": {+GVAR(fireControl_groupColor_cbaSetting)};
                        case "RED": {+[1,0,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "GREEN": {+[0,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "BLUE": {+[0,0,1,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "YELLOW": {+[1,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                    };
                };
            };
        };
        case ("AIR"): {
            _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["zamerny", "Memory"]);
            switch _unitRelationToPlayer do {
                case "ENEMY" : {
                    _size = (GVAR(fireControl_aircraftSizeEnemy_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 1.33; //max GVAR(fireControl_aircraftSizeEnemyMin_cbaSetting);
                    _icon = GVAR(fireControl_aircraftIconEnemy_cbaSetting);
                    _color = +GVAR(fireControl_enemyColor_cbaSetting);
                };
                case "NEUTRAL" : {
                    _size = (GVAR(fireControl_aircraftSizeNeutral_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 1.33; //max GVAR(fireControl_aircraftSizeNeutralMin_cbaSetting);
                    _icon = GVAR(fireControl_aircraftIconNeutral_cbaSetting);
                    _color = +GVAR(fireControl_neutralColor_cbaSetting);
                };
                case "FRIENDLY" : {
                    _size = (GVAR(fireControl_aircraftSizeFriend_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 1.33; //max GVAR(fireControl_aircraftSizeFriendMin_cbaSetting);
                    _icon = GVAR(fireControl_aircraftIconFriend_cbaSetting);
                    _color = +GVAR(fireControl_friendColor_cbaSetting);
                };
                case "SQUAD" : {
                    _size = (GVAR(fireControl_aircraftSizeFriend_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 1.33; //max GVAR(fireControl_aircraftSizeFriendMin_cbaSetting);
                    _icon = GVAR(fireControl_aircraftIconFriend_cbaSetting);
                    _color = switch (assignedTeam _nearbyUnit) do {
                        case "MAIN": {+GVAR(fireControl_groupColor_cbaSetting)};
                        case "RED": {+[1,0,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "GREEN": {+[0,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "BLUE": {+[0,0,1,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "YELLOW": {+[1,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                    };
                };
            };
        };
        case ("StaticWeapon"): {
            _pos = _nearbyUnit modelToWorldVisual (_nearbyUnit selectionPosition ["osahlavne", "Memory"]);
            switch _unitRelationToPlayer do {
                case "ENEMY" : {
                    _size = (GVAR(fireControl_staticSizeEnemy_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 0.75; //max GVAR(fireControl_staticSizeEnemyMin_cbaSetting);
                    _icon = GVAR(fireControl_staticIconEnemy_cbaSetting);
                    _color = +GVAR(fireControl_enemyColor_cbaSetting);
                };
                case "NEUTRAL" : {
                    _size = (GVAR(fireControl_staticSizeNeutral_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 0.75; //max GVAR(fireControl_staticSizeNeutralMin_cbaSetting);
                    _icon = GVAR(fireControl_staticIconNeutral_cbaSetting);
                    _color = +GVAR(fireControl_neutralColor_cbaSetting);
                };
                case "FRIENDLY" : {
                    _size = (GVAR(fireControl_staticSizeFriend_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 0.75; //max GVAR(fireControl_staticSizeFriendMin_cbaSetting);
                    _icon = GVAR(fireControl_staticIconFriend_cbaSetting);
                    _color = +GVAR(fireControl_friendColor_cbaSetting);
                };
                case "SQUAD" : {
                    _size = (GVAR(fireControl_staticSizeFriend_cbaSetting) / tan(_fov / DEFAULT_MIN_IFF_OTHER_FOV) / _distance) max 0.75; //max GVAR(fireControl_staticSizeFriendMin_cbaSetting);
                    _icon = GVAR(fireControl_staticIconFriend_cbaSetting);
                    _color = switch (assignedTeam _nearbyUnit) do {
                        case "MAIN": {+GVAR(fireControl_groupColor_cbaSetting)};
                        case "RED": {+[1,0,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "GREEN": {+[0,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "BLUE": {+[0,0,1,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
                        case "YELLOW": {+[1,1,0,(GVAR(fireControl_groupColor_cbaSetting) select 3)]};
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
