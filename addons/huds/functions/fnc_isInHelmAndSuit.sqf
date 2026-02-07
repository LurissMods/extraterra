#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks if player is wearing a space suit, and what faction that suit belongs to.
*
* Arguments:
* None
*
* Return Value:
* [<BOOL>,<NUMBER>] - First return is whether or not the player is wearing a space suit, the second is the faction of that suit. If there's a faction mismatch it will return -1 (no faction).
*
* Example:
* [] call exterra_huds_fnc_isInHelmAndSuit
*
* Public: No
*/

private _helmetBool = false;
private _suitBool = false;
private _packBool = false;
private _helmetFaction = nil;
private _suitFaction = nil;
private _packFaction = nil;
private _bool = nil;
private _faction = -1;

{
_helmetBool = headgear player in _x;
if (_helmetBool) exitWith {_helmetFaction = (_x#1)};
} forEach GVAR(whitelistHelmets);

{
_suitBool = uniform player in _x;
if (_suitBool) exitWith {_suitFaction = (_x#1)};
} forEach GVAR(whitelistSuits);

{
_packBool = backpack player in _x;
if (_packBool) exitWith {_packFaction = (_x#1)};
} forEach GVAR(whitelistPacks);

if (_helmetFaction == _suitFaction && {_helmetFaction == _packFaction}) then {
    _faction = _helmetFaction;
};

if (_helmetBool && {_suitBool && {_packBool}}) then {
    _bool = true;
} else {
    _bool = false;
};

[_bool, _faction, _helmetBool, _helmetFaction, _suitBool, _suitFaction, _packBool, _packFaction];
