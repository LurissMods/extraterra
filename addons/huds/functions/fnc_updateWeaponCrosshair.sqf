#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates the weapon crosshair. Run every frame.
* Called by the Fire Control PFH.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateWeaponCrossshair
*
* Public: No
*/

if (cameraView != "GUNNER" && {(currentWeapon ACE_player != "") && {isNull objectParent ACE_player}}) then { //isNull objectParent player = checks if player is in vehicle

    private _icon = GVAR(CBAset_crosshairIcon); // Make this faction agnostic
    private _color = +GVAR(CBAset_crosshairColor);
    private _vectorMaxCheck = GVAR(CBAset_crosshairMaxRange);

    private _datalink = nil;
    private _distanceToTarget = nil;
    private _unitRelationToPlayer = nil;
    private _sidePlayer = side ACE_player;
    private _hostileCheck = _sidePlayer getFriend (side cursorObject);


    private _vectorStart = ACE_player modelToWorldWorld (ACE_player selectionPosition ["rightHand", "Memory"]);
    private _vectorEnd = (_vectorStart vectorAdd (ACE_player weaponDirection currentWeapon ACE_player vectorMultiply _vectorMaxCheck));

    if (isNull cursorObject) then {
    private _groundIntersectPoint = (terrainIntersectAtASL [ _vectorStart, _vectorEnd]);
    _distanceToTarget = (_vectorStart vectorDistance _groundIntersectPoint) min GVAR(CBAset_crosshairMaxRange);
    _vectorEnd = ASLToAGL (_vectorStart vectorAdd (ACE_player weaponDirection currentWeapon ACE_player vectorMultiply _distanceToTarget));
    } else {
    _distanceToTarget = (ACE_player distance cursorObject) min GVAR(CBAset_crosshairMaxRange);
    _vectorEnd = ASLToAGL (_vectorStart vectorAdd (ACE_player weaponDirection currentWeapon ACE_player vectorMultiply _distanceToTarget));
    };

    private _cursorFade = linearConversion [0,GVAR(CBAset_crosshairMaxRange),_distanceToTarget,GVAR(CBAset_crosshairMaxOpacity),GVAR(CBAset_crosshairMinOpacity)];

    switch GVAR(CBAset_datalink) do {
        case 0: {_datalink = _sidePlayer};
        case 1: {_datalink = side group ACE_player};
        case 2: {_datalink = ACE_player};
    };

    if (_hostileCheck < 0.6) then {
        _unitRelationToPlayer = "ENEMY";
    } else {
        if (side cursorObject == civilian) then {
            _unitRelationToPlayer = "NEUTRAL";
        } else {
            _unitRelationToPlayer = "FRIENDLY";
        };
    };

    if (!isNull cursorObject) then {
        if (lifeState cursorObject == "INCAPACITATED" OR lifeState cursorObject == "DEAD") then {
            _color = +GVAR(CBAset_crosshairColor);
        } else {
            if ((_datalink knowsAbout cursorObject) > KNOWS_ABOUT_IFF_THRESHOLD) then {
                switch _unitRelationToPlayer do {
                    case "ENEMY" : {
                        _color = +GVAR(CBAset_enemyColorIFF);
                    };
                    case "NEUTRAL" : {
                        _color = +GVAR(CBAset_neutralColorIFF);
                    };
                    case "FRIENDLY" : {
                        _color = +GVAR(CBAset_friendColorIFF);
                    };
                };
            } else {
                _color = +GVAR(CBAset_crosshairColor);
            };


            /*if (side cursorObject == civilian && {(_datalink knowsAbout cursorObject) > 0.1}) then {
                _color = GVAR(CBAset_neutralColorIFF);
            } else {
                if (_hostileCheck < 0.6 && {(_datalink knowsAbout cursorObject) > 0.1}) then {
                    _color = +GVAR(CBAset_enemyColorIFF);
                } else {
                    if (side cursorObject == _sidePlayer OR _hostileCheck > 0.6 && {(_datalink knowsAbout cursorObject) > 0.1}) then {
                        _color = GVAR(CBAset_friendColorIFF);
                    } else {
                        _color = GVAR(CBAset_crosshairColor);
                    };
                };
            };*/
        };
    };

    _color set [3,_cursorFade];
    drawIcon3D [_icon,_color,_vectorEnd,0.75,0.75,0,"",0,0,"RobotoCondensed","center",false];
};
