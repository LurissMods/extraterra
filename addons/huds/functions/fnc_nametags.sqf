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

private _maxDist = 15;
private _heightOffset = 0.85;
private _size = 0.04;
private _font = "RobotoCondensed";
private _colorFriendly = GVAR(fireControl_friendColor);

{
    if ((_x != player)  && {(side _x == side player) && {(isNull objectParent _x) && {(player distance _x < _maxDist)}}}) then {

    private _dist = player distance _x;
    private _alpha = 1 - (_dist / _maxDist);
    _alpha = _alpha max 0 min 1;
    private _pos = unitAimPositionVisual _x;
    _pos set [2, (_pos select 2) + _heightOffset];

    private _colour = _colorFriendly;

    if (group _x isEqualTo group player) then {
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
