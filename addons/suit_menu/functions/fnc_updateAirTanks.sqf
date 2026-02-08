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

params ["_listNBox"];

private _counter = 1;

lnbClear _listNBox;

_listNBox lnbSetColumnsPos [0,0.1,0.66];

//systemChat str lnbGetColumnsPosition _listNBox;
_listNBox lnbAddRow ["","No Air Tank",""];

private _currentPlayerAirTank = GETVAR(player,EGVAR(lifesupport,currentAirTank),nil);
private _currentTankAirReserve = GETVAR(player,EGVAR(lifesupport,unitAirReserve),nil);

private _airTanksInInv = call FUNC(airTanksInInv);

if (GVAR(currentSelectedAirTank) != 0) then {
    private _displayName = getText (configFile >> "CfgMagazines" >> _currentPlayerAirTank >> "displayname");
    _listNBox lnbAddRow ["",format["%1",_displayName],format["%1 mL",_currentTankAirReserve]];
    _listNBox lnbSetData [[1, 1], _currentPlayerAirTank];
    _listNBox lnbSetData [[1, 2], format ["%1",_currentTankAirReserve]];
    INC(_counter);
};

{
    private _currentMag = _x select 0;
    private _currentMagAmmo = (_x select 1);
    private _displayName = getText (configFile >> "CfgMagazines" >> _currentMag >> "displayname");

    _listNBox lnbAddRow ["",format["%1",_displayName],format["%1 mL",_currentMagAmmo]];

    //systemChat format ["%1 in mag",_currentMagAmmo];

    _listNBox lnbSetData [[_counter, 1], _currentMag];
    _listNBox lnbSetData [[_counter, 2], format ["%1",_currentMagAmmo]];
    INC(_counter);
} forEach _airTanksInInv;
