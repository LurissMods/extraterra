#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks the player suit bools/faction and applies the relevant effects.
* This is done because a statemachine update would be too slow.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_quickSuitCheck
*
* Public: No
*/

private _helmetBool = false;
private _suitBool = false;
private _packBool = false;
private _masterBool = false;
private _helmetFaction = NO_SUIT_FACTION;
private _suitFaction = NO_SUIT_FACTION;
private _packFaction = NO_SUIT_FACTION;
private _masterFaction = NO_SUIT_FACTION;
private _isItemVomitHelm = getNumber (configFile >> QUOTE(CfgWeapons) >> headgear ACE_player >> QUOTE(exterra_uniforms_vomitSeverity));

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
    SET_QUICK_SUIT_BOOL(ACE_player,_masterBool,false);
    SET_QUICK_SUIT_FACTION(ACE_player,_masterFaction,false);
    [QEGVAR(lifesupport,suitDeactivated), ACE_player] call CBA_fnc_localEvent;
};

// Deactivate the HUD if the player runs out of power
if (GET_BATTERY_RESERVE(ACE_player) <= 0) then {
    [QEGVAR(lifesupport,suitDeactivated), ACE_player] call CBA_fnc_localEvent;
};

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if (_helmetFaction != (GET_QUICK_CURRENT_OUTLINE(ACE_player))) then {
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

// Note: This is a double up check with the updateHudVisibility function which is a bit inefficient
if (!isNull findDisplay 312 || {!isNull findDisplay 314 || {cameraView == "GROUP"}}) then {
    (EGVAR(injuries,vomitMildScreen_UI)#0) ctrlSetFade 1;
    (EGVAR(injuries,vomitMildScreen_UI)#0) ctrlCommit 0;
    (EGVAR(injuries,vomitModerateScreen_UI)#0) ctrlSetFade 1;
    (EGVAR(injuries,vomitModerateScreen_UI)#0) ctrlCommit 0;
    (EGVAR(injuries,vomitSevereScreen_UI)#0) ctrlSetFade 1;
    (EGVAR(injuries,vomitSevereScreen_UI)#0) ctrlCommit 0;
} else {
    if (!_helmetBool) then {
        (EGVAR(injuries,vomitMildScreen_UI)#0) ctrlSetFade 1;
        (EGVAR(injuries,vomitMildScreen_UI)#0) ctrlCommit 0;
        (EGVAR(injuries,vomitModerateScreen_UI)#0) ctrlSetFade 1;
        (EGVAR(injuries,vomitModerateScreen_UI)#0) ctrlCommit 0;
        (EGVAR(injuries,vomitSevereScreen_UI)#0) ctrlSetFade 1;
        (EGVAR(injuries,vomitSevereScreen_UI)#0) ctrlCommit 0;
    } else {
        switch _isItemVomitHelm do {
            case 3: {
                (EGVAR(injuries,vomitSevereScreen_UI)#0) ctrlSetFade 0;
                (EGVAR(injuries,vomitSevereScreen_UI)#0) ctrlCommit 0;
            };
            case 2: {
                (EGVAR(injuries,vomitModerateScreen_UI)#0) ctrlSetFade 0;
                (EGVAR(injuries,vomitModerateScreen_UI)#0) ctrlCommit 0;
            };
            case 1: {
                (EGVAR(injuries,vomitMildScreen_UI)#0) ctrlSetFade 0;
                (EGVAR(injuries,vomitMildScreen_UI)#0) ctrlCommit 0;
            };
            default {
                (EGVAR(injuries,vomitMildScreen_UI)#0) ctrlSetFade 1;
                (EGVAR(injuries,vomitMildScreen_UI)#0) ctrlCommit 0;
                (EGVAR(injuries,vomitModerateScreen_UI)#0) ctrlSetFade 1;
                (EGVAR(injuries,vomitModerateScreen_UI)#0) ctrlCommit 0;
                (EGVAR(injuries,vomitSevereScreen_UI)#0) ctrlSetFade 1;
                (EGVAR(injuries,vomitSevereScreen_UI)#0) ctrlCommit 0;
            };
        };
    };
};
