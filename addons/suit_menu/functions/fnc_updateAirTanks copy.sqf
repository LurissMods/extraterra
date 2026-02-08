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

params ["_airCombo"];

lbClear _airCombo;

private _currentPlayerAirTank = GETVAR(player,EGVAR(lifesupport,currentAirTank),nil);

//systemChat str _currentPlayerAirTank;

if (!isNil "_currentPlayerAirTank") then {
    systemChat "Tank true fired";
    private _airTankReserve = GETVAR(player,EGVAR(lifesupport,unitAirReserve),nil);
    _airCombo lbAdd format["%1 (%2 L)",_currentPlayerAirTank,_airTankReserve];
    _airCombo lbAdd "No Air Tank";
} else {
    systemChat "Tank false fired";
    _airCombo lbAdd "No Air Tank";
};

/*private _currentSuitStatus = call EFUNC(huds,isInHelmAndSuit);
private _faction = _currentSuitStatus select 1;
private _currentCompatibleTanks = "noSuit";

private _airTanksInInv = [];
private _magsInPlayerInv = magazinesAmmo player;

if (_faction == -1) exitWith {systemChat "not wearing space suit"};

switch (_faction) do {
    case 0: {
        _currentCompatibleTanks = compatibleMagazines QUOTE(exterra_lifesupport_compatAirTanksUS);
    };
};

{
    if (_currentCompatibleTanks find (_x#0) != -1) then {
        _airTanksInInv pushBack _x;
    };
} forEach _magsInPlayerInv;*/

private _airTanksInInv = call FUNC(airTanksInInv);

{
    private _currentMag = _x select 0;
    private _currentMagAmmo = (_x select 1)/1000;

    _airCombo lbAdd format["%1 (%2 L)",_currentMag,_currentMagAmmo];
} forEach _airTanksInInv;

//_airTanksInInv;
