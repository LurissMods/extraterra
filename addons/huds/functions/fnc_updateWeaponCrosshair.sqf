#include "..\script_component.hpp"
/*
 * Author: Luriss
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

if (cameraView != "GUNNER" && {(currentWeapon ACE_player != "") && {isNull objectParent ACE_player}}) then { //isNull objectParent player = checks if player is in vehicle
    private _icon = GVAR(fireControl_crosshairIcon); // Make this factional
    private _colour = GVAR(fireControl_crosshairColor);
    private _vectorMaxCheck = GVAR(fireControl_crosshairMaxRange);
    private _datalink = nil;
    private _distanceToTarget = nil;
    private _sidePlayer = side ACE_player;
    private _hostileCheck = _sidePlayer getFriend (side cursorObject);


    private _vectorStart = ACE_player modelToWorldWorld (ACE_player selectionPosition ["rightHand", "Memory"]);
    private _vectorEnd = (_vectorStart vectorAdd (ACE_player weaponDirection currentWeapon ACE_player vectorMultiply _vectorMaxCheck));

    if (isNull cursorObject) then {
    private _groundIntersectPoint = (terrainIntersectAtASL [ _vectorStart, _vectorEnd]);
    _distanceToTarget = (_vectorStart vectorDistance _groundIntersectPoint) min GVAR(fireControl_crosshairMaxRange);
    _vectorEnd = ASLToAGL (_vectorStart vectorAdd (ACE_player weaponDirection currentWeapon ACE_player vectorMultiply _distanceToTarget));
    } else {
    _distanceToTarget = (ACE_player distance cursorObject) min GVAR(fireControl_crosshairMaxRange);
    _vectorEnd = ASLToAGL (_vectorStart vectorAdd (ACE_player weaponDirection currentWeapon ACE_player vectorMultiply _distanceToTarget));
    };

    private _cursorFade = linearConversion [0,GVAR(fireControl_crosshairMaxRange),_distanceToTarget,GVAR(fireControl_crosshairMaxOpacity),GVAR(fireControl_crosshairMinOpacity)];

    switch GVAR(fireControl_Datalink) do {
    case 0: {_datalink = _sidePlayer};
    case 1: {_datalink = side group ACE_player};
    case 2: {_datalink = ACE_player};
    };

    if (!isNull cursorObject) then {
        if (lifeState cursorObject == "INCAPACITATED" OR lifeState cursorObject == "DEAD") then {
            _colour = GVAR(fireControl_crosshairColor);
        } else {
            if (side cursorObject == civilian && {(_datalink knowsAbout cursorObject) > 0.1}) then {
                _colour = GVAR(fireControl_neutralColor);
            } else {
                if (_hostileCheck < 0.6 && {(_datalink knowsAbout cursorObject) > 0.1}) then {
                    _colour = GVAR(fireControl_enemyColor);
                } else {
                    if (side cursorObject == _sidePlayer OR _hostileCheck > 0.6 && {(_datalink knowsAbout cursorObject) > 0.1}) then {
                        _colour = GVAR(fireControl_friendColor);
                    } else {
                        _colour = GVAR(fireControl_crosshairColor);
                    };
                };
            };
        };
    };

    systemChat "Crosshair func running!";

    _colour set [3,_cursorFade];
    drawIcon3D [_icon,_colour,_vectorEnd,1,1,0,"",0,0,"RobotoCondensed","center",false];
};
