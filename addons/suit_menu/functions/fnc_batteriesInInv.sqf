#include "..\script_component.hpp"
/*
* Author: Glowbal, mharis001
* Handles opening the Medical Menu. Called from onLoad event.
*
* Arguments:
* 0: Medical Menu display <DISPLAY>
*
* Return Value:
* None
*
* Example:
* [DISPLAY] call ace_medical_gui_fnc_onMenuOpen
*
* Public: No
*/

//private _currentSuitStatus = call EFUNC(huds,isInHelmAndSuit);
private _faction = _currentSuitStatus select 1;
private _currentCompatibleTanks = "noSuit";

private _batteriesInInv = [];
private _magsInPlayerInv = magazinesAmmo player;

if (_faction == -1) exitWith {systemChat "not wearing space suit"};

switch (_faction) do {
    case 0: {
        _currentCompatibleTanks = compatibleMagazines QUOTE(exterra_lifesupport_compatBatteriesUS);
    };
};

{
    if (_currentCompatibleTanks find (_x#0) != -1) then {
        _batteriesInInv pushBack _x;
    };
} forEach _magsInPlayerInv;

_batteriesInInv;
