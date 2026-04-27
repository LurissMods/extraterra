#include "..\script_component.hpp"
/*
* Author: Luriss
* Initalizes the suit fire control PFH. Called by either bootHUD_XX or the HudBoot PFH depending on quick boot CBA setting.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_initPFH_FireControl
*
* Public: No
*/

// Note: This isn't faction agonostic yet!

if (GVAR(initPFH_FireControl_Activated)) exitWith {};
GVAR(initPFH_FireControl_Activated) = true;

GVAR(hudPFH_fireControl) = [{

    if (!isNull findDisplay 312) exitWith {};

    [call FUNC(updateUnitsNearPlayer)] call FUNC(updateIFF);
    call FUNC(updateWeaponCrosshair);
    call FUNC(updateNametags);
    call FUNC(updateTargetPosInfo);

    }, 0, []
] call CBA_fnc_addPerFrameHandler;
