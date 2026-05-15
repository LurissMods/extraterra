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
* [] call exterra_lifeSupport_fnc_initPFH_HudGeneral
*
* Public: No
*/

GVAR(hudWasHidden) = false;

GVAR(hudPFH_HudVisibility) = [{

    private _hudElements = [];
    private _playerFaction = GET_SUIT_FACTION(ACE_player);
    private _isBootAnimPlaying = ACE_player getVariable [QEGVAR(huds,unitBootActive),false];
    GET_SUIT_BOOLS(ACE_player) params ["_inFullSuit","_helmetBool","_suitBool","_packBool"];

    switch (_playerFaction) do {
        case NO_SUIT_FACTION: {
            ERROR_1("Suit faction undefined! Unit: %1",ACE_player);
        };
        case US_SUIT_FACTION: {
            _hudElements = GVAR(hudElementsArray_US);
        };
    };

    if (!isNull findDisplay 312 || {!isNull findDisplay 314 || {cameraView == "GROUP"}}) then {
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
            case _isBootAnimPlaying: {
                // Note: This needs to be fixed
            };
            case (cameraView == "EXTERNAL"): {
                (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
                (GVAR(helmetOutline_US)#0) ctrlCommit 0;

                if (GET_SUIT_ACTIVATED(ACE_player)) then {
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
                if (GET_SUIT_ACTIVATED(ACE_player)) then {
                    {_x ctrlSetFade 0; _x ctrlCommit 0} forEach _hudElements;

                    GVAR(hudPixelation_PP) ppEffectEnable true;
                    GVAR(hudPixelation_PP) ppEffectCommit 0;

                    GVAR(hudChromAb_PP) ppEffectEnable true;
                    GVAR(hudChromAb_PP) ppEffectCommit 0;

                    GVAR(hudRadialBlur_PP) ppEffectEnable true;
                    GVAR(hudRadialBlur_PP) ppEffectCommit 0;

                    GVAR(filmGrain_PP) ppEffectEnable true;
                    GVAR(filmGrain_PP) ppEffectCommit 0;
                } else {
                    if (GVAR(hudWasHidden)) then {
                        if (_helmetBool) then {
                            switch (_playerFaction) do {
                                case NO_SUIT_FACTION: {
                                    (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
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

    }, 0, []
] call CBA_fnc_addPerFrameHandler;
