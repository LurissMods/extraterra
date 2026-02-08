#include "..\script_component.hpp"
/*
* Author: Glowbal
* Opens the Medical Menu for given target.
*
* Arguments:
* 0: Target <OBJECT>
*
* Return Value:
* None
*
* Example:
* [ACE_player] call ace_medical_gui_fnc_openMenu
*
* Public: No
*/

private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];

_listBox = _display displayCtrl 1501;
_airCombo = _display displayCtrl 2100;

private _currentPlayerAirTank = GETVAR(player,EGVAR(lifesupport,currentAirTank),nil);
private _currentTankAirReserve = GETVAR(player,EGVAR(lifesupport,unitAirReserve),nil);

//systemChat str _currentPlayerAirTank;

if ((lbCurSel _airCombo) != GVAR(currentSelectedAirTank)) then {
    if (!isNil QUOTE(_currentPlayerAirTank) && {lbCurSel _airCombo == 1}) then {
        systemChat "No air tank fired";
        GVAR(currentSelectedAirTank) = (lbCurSel _airCombo);

        SETVAR(player,EGVAR(lifesupport,currentAirTank),nil);
        SETVAR(player,EGVAR(lifesupport,unitAirReserve),100); // 100 is temp, add define

        player addMagazine [_currentPlayerAirTank, _currentTankAirReserve];
        //[_airCombo] call FUNC(updateAirTanks);
    } else {
        systemChat "New air tank fired";
        GVAR(currentSelectedAirTank) = (lbCurSel _airCombo);
        private _allAirTanksInInv = call FUNC(airTanksInInv);
        private _selectedAirTank = _allAirTanksInInv select (lbCurSel _airCombo - 1);

        SETVAR(player,EGVAR(lifesupport,currentAirTank),(_selectedAirTank select 0));
        SETVAR(player,EGVAR(lifesupport,unitAirReserve),(_selectedAirTank select 1));

        if (!isNil QUOTE(_currentPlayerAirTank)) then {
            player addMagazine [_currentPlayerAirTank, _currentTankAirReserve];
        };

        player removeMagazine (_selectedAirTank select 0);
        //[_airCombo] call FUNC(updateAirTanks);
    };
};


/*if ((lbCurSel _airCombo) != GVAR(currentSelectedAirTank)) then {
    systemChat str (lbCurSel _airCombo);
    GVAR(currentSelectedAirTank) = (lbCurSel _airCombo);
    private _airTanksInInv = [_airCombo] call FUNC(updateAirTanks);
    private _currentPlayerAirTank = GETVAR(player,EGVAR(lifesupport,currentAirTank),nil);

    if (!isNull _currentPlayerAirTank) then {
        private _oldTankAirReserve = GETVAR(player,EGVAR(lifesupport,unitAirReserve),nil);
        player addMagazine [_currentPlayerAirTank, _oldTankAirReserve];
    };

    SETVAR(player,EGVAR(lifesupport,unitAirReserve),((_airTanksInInv select (GVAR(currentSelectedAirTank)-1)) select 1));

    systemChat str _airTanksInInv;
    player removeMagazine ((_airTanksInInv select (GVAR(currentSelectedAirTank)-1)) select 0);


};*/





//systemChat str (lbCurSel _airCombo);
