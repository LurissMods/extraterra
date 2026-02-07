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

_listNBox = _display displayCtrl 1503;

private _currentPlayerAirTank = GETVAR(player,EGVAR(lifesupport,currentAirTank),nil);
private _currentTankAirReserve = GETVAR(player,EGVAR(lifesupport,playerAirReserve),nil);
private _currentTankMaxAirReserve = 100;



if (lnbCurSelRow _listNBox != GVAR(currentSelectedAirTank)) then {

    private _newSelection = lnbCurSelRow _listNBox;
    private _oldSelection = GVAR(currentSelectedAirTank);

    _listNBox lnbSetPicture [[_oldSelection, 0], ""];

    _listNBox lnbSetCurSelRow _newSelection;
    _listNBox lnbSetPicture [[_newSelection, 0], "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"];

    if (_newSelection == 0) then {
        private _oldTankName = _listNBox lnbData [_oldSelection, 1];
        private _oldTankAirReserve = _currentTankAirReserve;

        SETVAR(player,EGVAR(lifesupport,currentAirTank),nil);
        SETVAR(player,EGVAR(lifesupport,playerAirReserve),100); //temp value
        SETVAR(player,EGVAR(lifesupport,playerAirMaxReserve),_currentTankMaxAirReserve);

        player addMagazine [_oldTankName, _oldTankAirReserve];
    } else {
        private _oldTankName = _listNBox lnbData [_oldSelection, 1];
        private _oldTankAirReserve = _currentTankAirReserve;
        private _newTankName = _listNBox lnbData [_newSelection, 1];
        private _newTankAirReserve = _listNBox lnbData [_newSelection, 2];

        _currentTankMaxAirReserve = getNumber (configFile >> "CfgMagazines" >> _newTankName >> "count");

        private _allAirTanksInInv = call FUNC(airTanksInInv);
        private _selectedAirTank = "";

        SETVAR(player,EGVAR(lifesupport,currentAirTank),_newTankName);
        SETVAR(player,EGVAR(lifesupport,playerAirReserve),parseNumber _newTankAirReserve);
        SETVAR(player,EGVAR(lifesupport,playerAirMaxReserve),_currentTankMaxAirReserve);

        _test = GETVAR(player,EGVAR(lifesupport,playerAirReserve),nil);
        //systemChat format ["%1 After setvar",_test];
        //systemChat format ["%1 stored var",_oldTankAirReserve];

        if (_oldSelection != 0) then {

            _selectedAirTank = _allAirTanksInInv select (_newSelection - 2);
            player removeMagazine (_selectedAirTank select 0);

            player addMagazine [_oldTankName, _oldTankAirReserve];
        } else {
            _selectedAirTank = _allAirTanksInInv select (_newSelection - 1);
            player removeMagazine (_selectedAirTank select 0);
        };

    };

    GVAR(currentSelectedAirTank) = lnbCurSelRow _listNBox;
};

//systemChat str _currentPlayerAirTank;

/*if ((lbCurSel _listNBox) != GVAR(currentSelectedAirTank)) then {
    if (!isNil QUOTE(_currentPlayerAirTank) && {lbCurSel _listNBox == 1}) then {
        systemChat "No air tank fired";
        GVAR(currentSelectedAirTank) = (lbCurSel _listNBox);

        SETVAR(player,EGVAR(lifesupport,currentAirTank),nil);
        SETVAR(player,EGVAR(lifesupport,playerAirReserve),100); // 100 is temp, add define

        player addMagazine [_currentPlayerAirTank, _currentTankAirReserve];
        //[_airCombo] call FUNC(updateAirTanks);
    } else {
        systemChat "New air tank fired";
        GVAR(currentSelectedAirTank) = (lbCurSel _listNBox);
        private _allAirTanksInInv = call FUNC(airTanksInInv);
        private _selectedAirTank = _allAirTanksInInv select (lbCurSel _listNBox - 1);

        SETVAR(player,EGVAR(lifesupport,currentAirTank),(_selectedAirTank select 0));
        SETVAR(player,EGVAR(lifesupport,playerAirReserve),(_selectedAirTank select 1));

        if (!isNil QUOTE(_currentPlayerAirTank)) then {
            player addMagazine [_currentPlayerAirTank, _currentTankAirReserve];
        };

        player removeMagazine (_selectedAirTank select 0);
        //[_airCombo] call FUNC(updateAirTanks);
    };
};*/
