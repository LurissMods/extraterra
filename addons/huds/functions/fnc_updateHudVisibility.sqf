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

if (_helmetBool && {_suitBool && {_packBool}}) then {
    _masterBool = true;
} else {
    _masterBool = false;
};

// ----------------------------------- Temp fix

private _hudElements = [];
private _bootElements = [];
private _playerFaction = GET_SUIT_FACTION(ACE_player);
private _isBootAnimPlaying = GET_BOOT_ACTIVE(ACE_player);

switch (_playerFaction) do {
    case NO_SUIT_FACTION: {
        ERROR_1("Suit faction undefined! Unit: %1",ACE_player);
    };
    case US_SUIT_FACTION: {
        _hudElements = GVAR(hudElementsArray_US);
        _bootElements = [(GVAR(hudBootText_US)#0),(GVAR(hudBootLogo_US)#0)]; // Note: Not currently used
    };
};

// Hide HUD if in zeus, splendid camera, or commander mode
if (!isNull findDisplay 312 || {!isNull findDisplay 314 || {cameraView == "GROUP"}}) then {

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
