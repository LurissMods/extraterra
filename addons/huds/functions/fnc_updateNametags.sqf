#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates the nametags for friendly units. Run every frame.
* Called by the Fire Control PFH.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateNametags
*
* Public: No
*/

params ["_unitsNearPlayer"];

private _maxDist = 15; // Consider adding CBA setting
//private _heightOffset = 0.85; // Consider adding CBA setting
private _size = 0.04;
private _font = "RobotoCondensed"; // Consider adding CBA setting?
private _colorFriendly = +GVAR(CBAset_friendColorIFF);
// Consider adding some kind of icon option

{
    _x params ["_currentUnit"];

    if ((side _currentUnit == side ACE_player) && {(isNull objectParent _currentUnit)}) then {

        private _dist = ACE_player distance _currentUnit;
        //private _heightOffset = 0.85 max (linearConversion [0,(getObjectViewDistance select 0),_dist,0.85,400])*(getObjectFOV ACE_player);
        private _heightOffset = 0.85 max (tan(4)*_dist)*(getObjectFOV ACE_player);
        private _alpha = 0;
        private _color = [];

        if (_currentUnit == cursorTarget) then {
            _alpha = 1;
        } else {
            if (_dist > _maxDist) then {
                continue;
            } else {
                _alpha = 0 max (1 - (_dist / _maxDist)) min 1;
            };
        };

        private _pos = unitAimPositionVisual _currentUnit;
        _pos set [2, (_pos select 2) + _heightOffset];



        if (group _currentUnit isEqualTo group ACE_player) then {
            _color = switch (assignedTeam _currentUnit) do {
            case "MAIN": {[1,1,1,_alpha]};
            case "RED": {[1,0,0,_alpha]};
            case "GREEN": {[0,1,0,_alpha]};
            case "BLUE": {[0,0,1,_alpha]};
            case "YELLOW": {[1,1,0,_alpha]};
            };
        } else {
            _colorFriendly set [3,_alpha];
            _color = _colorFriendly;
        };

        drawIcon3D ["", _color, _pos, 0.5, 0.5, 0, (toUpper (name _currentUnit)), 2, _size, _font];

    };
} forEach _unitsNearPlayer;
