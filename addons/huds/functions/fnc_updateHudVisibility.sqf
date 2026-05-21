#include "..\script_component.hpp"
/*
* Author: Luriss
* Initalizes the general HUD PFH. Called by either bootHUD_XX or the HudBoot PFH depending on quick boot CBA setting.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_initPFH_HUD
*
* Public: No
*/

// ----------------------------------- Temp fix

private _helmetBool = false;
private _suitBool = false;
private _packBool = false;
private _masterBool = false;
private _helmetFaction = NO_SUIT_FACTION;
private _suitFaction = NO_SUIT_FACTION;
private _packFaction = NO_SUIT_FACTION;
private _playerFaction = NO_SUIT_FACTION;
private _isItemVomitHelm = getNumber (configFile >> QUOTE(CfgWeapons) >> headgear ACE_player >> QUOTE(exterra_uniforms_vomitSeverity));

private _hudElements = [];
private _bootElements = []; // Currently not used
private _isBootAnimPlaying = GET_BOOT_ACTIVE(ACE_player);

// Helmet bool check
{
    _helmetBool = headgear ACE_player in _x;
    if (_helmetBool) exitWith {
        _helmetFaction = (_x#1);
    };
} forEach GVAR(whitelistHelmets);

// Suit bool check
{
    _suitBool = uniform ACE_player in _x;
    if (_suitBool) exitWith {
        _suitFaction = (_x#1);
    };
} forEach EGVAR(huds,whitelistSuits);

// Pack bool check
{
    _packBool = backpack ACE_player in _x;
    if (_packBool) exitWith {
        _packFaction = (_x#1)
    };
} forEach EGVAR(huds,whitelistPacks);

// Master bool check
if (_helmetBool && {_suitBool && {_packBool}}) then {
    _masterBool = true;
} else {
    _masterBool = false;
};

// Suit faction check
if (_helmetFaction == _suitFaction && {_helmetFaction == _packFaction}) then {
    _playerFaction = _helmetFaction;
} else {
    _playerFaction = NO_SUIT_FACTION;
};

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Deactivate the HUD if the player has an incomplete suit
if ((_masterBool != (GET_QUICK_SUIT_BOOL(ACE_player))) || {_playerFaction != (GET_QUICK_SUIT_FACTION(ACE_player))}) then {
    SET_QUICK_SUIT_BOOL(ACE_player,_masterBool,false);
    SET_QUICK_SUIT_FACTION(ACE_player,_playerFaction,false);
    [QEGVAR(lifesupport,suitDeactivated), ACE_player] call CBA_fnc_localEvent;
};

// Deactivate the HUD if the player runs out of power
if (GET_BATTERY_RESERVE(ACE_player) <= 0) then {
    [QEGVAR(lifesupport,suitDeactivated), ACE_player] call CBA_fnc_localEvent;
};

// Show the correct helmet outline for the helmet currently worn by the player
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

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

switch (_playerFaction) do {
    case NO_SUIT_FACTION: {
        ERROR_1("Suit faction undefined! Unit: %1",ACE_player);
    };
    case US_SUIT_FACTION: {
        _hudElements = GVAR(hudElementsArray_US);
        _bootElements = [(GVAR(hudBootText_US)#0),(GVAR(hudBootLogo_US)#0)]; // Note: Not currently used
    };
};

// Handle hud visiblity
if (!isNull findDisplay 312 || {!isNull findDisplay 314 || {cameraView == "GROUP"}}) then {
    // Hide HUD if in zeus, splendid camera, or commander mode

    SET_BOOT_ACTIVE(ACE_player,false,false); // Skip the boot sequence

    [ACE_player,false] call EFUNC(huds,hideAllHuds);

    GVAR(hudPixelation_PP) ppEffectEnable false;
    GVAR(hudPixelation_PP) ppEffectCommit 0;

    GVAR(hudChromAb_PP) ppEffectEnable false;
    GVAR(hudChromAb_PP) ppEffectCommit 0;

    GVAR(hudRadialBlur_PP) ppEffectEnable false;
    GVAR(hudRadialBlur_PP) ppEffectCommit 0;

    GVAR(filmGrain_PP) ppEffectEnable false;
    GVAR(filmGrain_PP) ppEffectCommit 0;

    GVAR(hudWasHidden) = true;
} else {
    switch true do {
        // If in 3rd person
        case (cameraView == "EXTERNAL"): {
            (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
            (GVAR(helmetOutline_US)#0) ctrlCommit 0;

            if (GET_SUIT_ACTIVATED(ACE_player) && {!_isBootAnimPlaying}) then {
                {_x ctrlSetFade 0; _x ctrlCommit 0} forEach _hudElements;

                GVAR(hudPixelation_PP) ppEffectEnable true;
                GVAR(hudPixelation_PP) ppEffectCommit 0;

                GVAR(hudChromAb_PP) ppEffectEnable true;
                GVAR(hudChromAb_PP) ppEffectCommit 0;

                GVAR(hudRadialBlur_PP) ppEffectEnable true;
                GVAR(hudRadialBlur_PP) ppEffectCommit 0;

                GVAR(filmGrain_PP) ppEffectEnable true;
                GVAR(filmGrain_PP) ppEffectCommit 0;
            };

            GVAR(hudWasHidden) = true;
        };
        default {
            if (GET_SUIT_ACTIVATED(ACE_player) && {!_isBootAnimPlaying}) then {
                {_x ctrlSetFade 0; _x ctrlCommit 0} forEach _hudElements;

                GVAR(hudPixelation_PP) ppEffectEnable true;
                GVAR(hudPixelation_PP) ppEffectCommit 0;

                GVAR(hudChromAb_PP) ppEffectEnable true;
                GVAR(hudChromAb_PP) ppEffectCommit 0;

                GVAR(hudRadialBlur_PP) ppEffectEnable true;
                GVAR(hudRadialBlur_PP) ppEffectCommit 0;

                GVAR(filmGrain_PP) ppEffectEnable true;
                GVAR(filmGrain_PP) ppEffectCommit 0;

                switch (_playerFaction) do {
                    case NO_SUIT_FACTION: {
                        (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
                        (GVAR(helmetOutline_US)#0) ctrlCommit 0;
                    };
                    case US_SUIT_FACTION: {
                        (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
                        (GVAR(helmetOutline_US)#0) ctrlCommit 0;
                    };
                };
            } else {
                if (GVAR(hudWasHidden)) then {
                    if (_helmetBool) then {
                        switch (_playerFaction) do {
                            case NO_SUIT_FACTION: {
                                (GVAR(helmetOutline_US)#0) ctrlSetFade 0;
                                (GVAR(helmetOutline_US)#0) ctrlCommit 0;
                            };
                            case US_SUIT_FACTION: {
                                (GVAR(helmetOutline_US)#0) ctrlSetFade 0;
                                (GVAR(helmetOutline_US)#0) ctrlCommit 0;
                            };
                        };
                        GVAR(hudWasHidden) = false;
                    } else {
                        (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
                        (GVAR(helmetOutline_US)#0) ctrlCommit 0;
                        GVAR(hudWasHidden) = false;
                    };
                };
            };
        };
    };
};

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Handle vomit visiblity
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
