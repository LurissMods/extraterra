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

if !(GVAR(CBAset_toggleIFF)) exitWith {};

// Don't delete this, needs to be seperate from the hudVisibility PFH
if (!isNull findDisplay 312 || {!isNull findDisplay 314}) exitWith {};

if !(GET_SUIT_ACTIVATED(ACE_player)) exitWith {};

if ((ACE_player getVariable [QEGVAR(huds,unitBootActive),false]) && {GVAR(isFireControlBooting)}) exitWith {};

private _unitsNearPlayer = call FUNC(updateUnitsNearPlayer);

[_unitsNearPlayer] call FUNC(updateIFF);
[_unitsNearPlayer] call FUNC(updateNametags);
call FUNC(updateWeaponCrosshair);
call FUNC(updateTargetPosInfo);
