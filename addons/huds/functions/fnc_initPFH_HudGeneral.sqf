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

    if !(GET_SUIT_ACTIVATED(ACE_player)) exitWith {};

    call FUNC(updateWeaponDisplay);
    call FUNC(updateGrenadeDisplay);
    call FUNC(updateGroupDisplay);
    call FUNC(updateWeaponIcons);

    }, 0, []
] call CBA_fnc_addPerFrameHandler;
