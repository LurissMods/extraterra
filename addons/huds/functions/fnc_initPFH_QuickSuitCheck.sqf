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

if (!EGVAR(common,exterraEnabled)) exitWith {};

if (!hasInterface) exitWith {};

GVAR(hudPFH_helmetOutline) = [{

    private _helmetBool = false;
    private _suitBool = false;
    private _packBool = false;
    private _masterBool = false;
    private _helmetFaction = NO_SUIT_FACTION;
    private _suitFaction = NO_SUIT_FACTION;
    private _packFaction = NO_SUIT_FACTION;
    private _masterFaction = NO_SUIT_FACTION;

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
        _masterFaction = NO_SUIT_FACTION;
    };

    if (_helmetBool && {_suitBool && {_packBool}}) then {
        _masterBool = true;
    } else {
        _masterBool = false;
    };

    // -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    // Deactivate the HUD if the player has an incomplete suit
    if ((_masterBool != (GET_QUICK_SUIT_BOOL(ACE_player))) || {_masterFaction != (GET_QUICK_SUIT_FACTION(ACE_player))}) then {
        //GVAR(currentPlayerMasterBool) = _masterBool;
        //GVAR(currentPlayerMasterFaction) = _masterFaction;
        SET_QUICK_SUIT_BOOL(ACE_player,_masterBool,false);
        SET_QUICK_SUIT_FACTION(ACE_player,_masterFaction,false);
        ['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent;
    };

    // Deactivate the HUD if the player runs out of power
    if (GET_BATTERY_RESERVE(ACE_player) <= 0) then {
        ['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent;
    };

    // -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    //systemChat str _helmetFaction;

    if (_helmetFaction != (GET_QUICK_CURRENT_OUTLINE(ACE_player))) then {
        //GVAR(currentPlayerHelmetOutline) = _helmetFaction;
        SET_QUICK_CURRENT_OUTLINE(ACE_player,_helmetFaction,false);

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
