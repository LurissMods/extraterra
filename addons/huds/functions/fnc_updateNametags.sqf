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

private _maxDist = 15; // Consider adding CBA setting
//private _heightOffset = 0.85; // Consider adding CBA setting
private _size = 0.04;
private _font = "RobotoCondensed"; // Consider adding CBA setting?
private _colorFriendly = GVAR(fireControl_friendColor_cbaSetting);
// Consider adding some kind of icon option

{
    if ((_x != ACE_player) && {(side _x == side ACE_player) && {(isNull objectParent _x)}}) then {

        private _dist = ACE_player distance _x;
        private _heightOffset = 0.85 max (linearConversion [0,5000,_dist,0.85,400])*(getObjectFOV ACE_player);
        private _alpha = 0;

        if (_x == cursorTarget) then {
            _alpha = 1;
        } else {
            if (_dist > _maxDist) then {
                continue;
            } else {
                _alpha = 0 max (1 - (_dist / _maxDist)) min 1;
            };
        };

        private _pos = unitAimPositionVisual _x;
        _pos set [2, (_pos select 2) + _heightOffset];

        private _colour = _colorFriendly;

        if (group _x isEqualTo group ACE_player) then {
            _colour = switch (assignedTeam (_x)) do {
            case "MAIN": {[1,1,1,_alpha]};
            case "RED": {[1,0,0,_alpha]};
            case "GREEN": {[0,1,0,_alpha]};
            case "BLUE": {[0,0,1,_alpha]};
            case "YELLOW": {[1,1,0,_alpha]};
            };
        };

        drawIcon3D ["", _colour, _pos, 0.5, 0.5, 0, (toUpper (name _x)), 2, _size, _font];

    };
} forEach allUnits;
