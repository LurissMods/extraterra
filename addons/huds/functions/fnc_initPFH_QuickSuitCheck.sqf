#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks the player suit bools/faction and applies the relevant effects.
* This is done because a statemachine update would be too slow.
* This PFH should ideally never be removed.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_initPFH_QuickSuitCheck
*
* Public: No
*/

if (!hasInterface) exitWith {};

GVAR(currentPlayerHelmetOutline) = -1;
GVAR(currentPlayerMasterBool) = false;
GVAR(currentPlayerMasterFaction) = -1;

GVAR(hudPFH_helmetOutline) = [{

    private _helmetBool = false;
    private _suitBool = false;
    private _packBool = false;
    private _masterBool = false;
    private _helmetFaction = -1;
    private _suitFaction = -1;
    private _packFaction = -1;
    private _masterFaction = -1;

    {
        _helmetBool = headgear ACE_player in _x;
        if (_helmetBool) exitWith {
            _helmetFaction = (_x#1);
        };
    } forEach GVAR(whitelistHelmets);

    {
        _suitBool = uniform ACE_player in _x;
        if (_suitBool) exitWith {
            _suitFaction = (_x#1);
        };
    } forEach EGVAR(huds,whitelistSuits);

    {
        _packBool = backpack ACE_player in _x;
        if (_packBool) exitWith {
            _packFaction = (_x#1)
        };
    } forEach EGVAR(huds,whitelistPacks);

    if (_helmetFaction == _suitFaction && {_helmetFaction == _packFaction}) then {
        _masterFaction = _helmetFaction;
    } else {
        _masterFaction = 0;
    };

    if (_helmetBool && {_suitBool && {_packBool}}) then {
        _masterBool = true;
    } else {
        _masterBool = false;
    };


    if (_masterBool != GVAR(currentPlayerMasterBool) || {_masterFaction != GVAR(currentPlayerMasterFaction)}) then {
        GVAR(currentPlayerMasterBool) = _masterBool;
        GVAR(currentPlayerMasterFaction) = _masterFaction;
        ['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent;
    };

    if (_helmetFaction != GVAR(currentPlayerHelmetOutline)) then {
        GVAR(currentPlayerHelmetOutline) = _helmetFaction;

        switch _helmetFaction do {
            case NO_SUIT_FACTION: {
                (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
                (GVAR(helmetOutline_US)#0) ctrlCommit 0;
            };
            case US_SUIT_FACTION: {
                (GVAR(helmetOutline_US)#0) ctrlSetFade 0;
                (GVAR(helmetOutline_US)#0) ctrlCommit 0;
            };
        };
    };

}, 0] call CBA_fnc_addPerFrameHandler;
