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

if (GVAR(initPFH_HudGeneral_Activated)) exitWith {};
GVAR(initPFH_HudGeneral_Activated) = true;

GVAR(hudPFH_HudGeneral) = [{

    // Note: Create an EH that handles the hud in zeus
    /*private _hudElements = [];

    switch (GET_SUIT_FACTION(ACE_player)) do {
        case NO_SUIT_FACTION: {
            ERROR_1("Suit faction undefined! Unit: %1",ACE_player);
        };
        case US_SUIT_FACTION: {
            _hudElements = GVAR(hudElementsArray_US);
        };
    };

    if (!isNull findDisplay 312) then {
        {_x ctrlSetFade 1; _x ctrlCommit 0} forEach _hudElements;

        GVAR(hudPixelation_PP) ppEffectEnable false;
        GVAR(hudPixelation_PP) ppEffectCommit 0;

        GVAR(hudChromAb_PP) ppEffectEnable false;
        GVAR(hudChromAb_PP) ppEffectCommit 0;

        GVAR(hudRadialBlur_PP) ppEffectEnable false;
        GVAR(hudRadialBlur_PP) ppEffectCommit 0;

        GVAR(filmGrain_PP) ppEffectEnable false;
        GVAR(filmGrain_PP) ppEffectCommit 0;
    } else {
        {_x ctrlSetFade 0; _x ctrlCommit 0} forEach _hudElements;
        GVAR(hudPixelation_PP) ppEffectEnable true;
        GVAR(hudPixelation_PP) ppEffectCommit 0;

        GVAR(hudChromAb_PP) ppEffectEnable true;
        GVAR(hudChromAb_PP) ppEffectCommit 0;

        GVAR(hudRadialBlur_PP) ppEffectEnable true;
        GVAR(hudRadialBlur_PP) ppEffectCommit 0;

        GVAR(filmGrain_PP) ppEffectEnable true;
        GVAR(filmGrain_PP) ppEffectCommit 0;
    };*/

    call FUNC(updateWeaponDisplay);
    call FUNC(updateGrenadeDisplay);
    call FUNC(updateGroupDisplay);
    call FUNC(updateWeaponIcons);

    }, 0, []
] call CBA_fnc_addPerFrameHandler;
