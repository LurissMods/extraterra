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

if (GVAR(initPFH_HUD_Activated)) exitWith {};
GVAR(initPFH_HUD_Activated) = true;

GVAR(hudWasHidden) = false;

GVAR(hudPFH) = [{

    if (!isGameFocused) exitWith {}; // Pause HUD scripts if tabbed out

    call FUNC(updateHudInertia);
    call FUNC(updateHudVisibility);
    call FUNC(quickSuitCheck);
    call FUNC(hudAnimHandler);

    if !(GET_SUIT_ACTIVATED(ACE_player)) exitWith {};

    call FUNC(updateFireControl);
    call FUNC(updateWeaponDisplay);
    call FUNC(updateGrenadeDisplay);
    call FUNC(updateGroupDisplay);
    call FUNC(updateWeaponIcons);

    }, 0, []
] call CBA_fnc_addPerFrameHandler;
