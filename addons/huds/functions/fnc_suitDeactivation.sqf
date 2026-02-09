#include "..\script_component.hpp"
/*
* Author: Akaviri13 (Inherited from his code)
* Checks if player is in direct sunlight. Returns thermal heating in watts.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_mainLoop
*
* Public: No
*/

if (GVAR(toggleHUDppEffects_cbaSetting)) then {
    GVAR(hudPixelation_PP) ppEffectEnable false;
    GVAR(hudChromAb_PP) ppEffectEnable false;
    GVAR(hudRadialBlur_PP) ppEffectEnable false;
    GVAR(filmGrain_PP) ppEffectEnable false;
};



_hudElementsBoot = [
    (GVAR(hudOutline_US)#0),
    (GVAR(info_background_US)#0),
    (GVAR(info_background_text_US)#0),
    (GVAR(weapon_background_US)#0),
    (GVAR(info_airRemain_text_US)#0),
    (GVAR(info_battRemain_text_US)#0),
    (GVAR(info_internalTemp_text_US)#0),
    (GVAR(info_externalTemp_text_US)#0),
    (GVAR(info_thermalPowerBalance_text_US)#0),
    (GVAR(info_timeUntilDang_text_US)#0),
    (GVAR(info_externalAtmo_text_US)#0),
    (GVAR(info_radPerHour_text_US)#0),
    (GVAR(info_lifetimeRad_text_US)#0),
    (GVAR(squad_member0_text_US)#0),
    (GVAR(squad_member1_text_US)#0),
    (GVAR(squad_member2_text_US)#0),
    (GVAR(squad_member3_text_US)#0),
    (GVAR(squad_member4_text_US)#0),
    (GVAR(squad_member5_text_US)#0),
    (GVAR(squad_member6_text_US)#0),
    (GVAR(squad_member7_text_US)#0),
    (GVAR(squad_member8_text_US)#0),
    (GVAR(squad_member9_text_US)#0),
    (GVAR(squad_member10_text_US)#0),
    (GVAR(squad_member11_text_US)#0),
    (GVAR(squad_member12_text_US)#0),
    (GVAR(squad_member13_text_US)#0),
    (GVAR(squad_member14_text_US)#0),
    (GVAR(squad_member15_text_US)#0),
    (GVAR(squad_member16_text_US)#0),
    (GVAR(squad_member17_text_US)#0),
    (GVAR(squad_member0_heart_US)#0),
    (GVAR(squad_member1_heart_US)#0),
    (GVAR(squad_member2_heart_US)#0),
    (GVAR(squad_member3_heart_US)#0),
    (GVAR(squad_member4_heart_US)#0),
    (GVAR(squad_member5_heart_US)#0),
    (GVAR(squad_member6_heart_US)#0),
    (GVAR(squad_member7_heart_US)#0),
    (GVAR(squad_member8_heart_US)#0),
    (GVAR(squad_member9_heart_US)#0),
    (GVAR(squad_member10_heart_US)#0),
    (GVAR(squad_member11_heart_US)#0),
    (GVAR(squad_member12_heart_US)#0),
    (GVAR(squad_member13_heart_US)#0),
    (GVAR(squad_member14_heart_US)#0),
    (GVAR(squad_member15_heart_US)#0),
    (GVAR(squad_member16_heart_US)#0),
    (GVAR(squad_member17_heart_US)#0),
    (GVAR(airBar_US)#0),
    (GVAR(battBar_US)#0),
    (GVAR(rangefinder_background_US)#0),
    (GVAR(weapon_currentWeapon_US)#0),
    (GVAR(weapon_secondWeapon_US)#0),
    (GVAR(weapon_launcher_US)#0),
    (GVAR(weapon_grenade_US)#0),
    (GVAR(rangefinder_grid_US)#0),
    (GVAR(rangefinder_bearing_US)#0),
    (GVAR(rangefinder_range_US)#0),
    (GVAR(weapon_weaponMagazines_text_US)#0),
    (GVAR(weapon_fireMode_text_US)#0),
    (GVAR(weapon_grenade_text_US)#0),
    (GVAR(weapon_grenadeAmount_text_US)#0),
    (GVAR(weapon_weaponZero_text_US)#0)
];

{_x ctrlSetFade 1; _x ctrlCommit 0.0} forEach _hudElementsBoot;
(GVAR(helmetOutline_US)#0) ctrlSetFade 0;
(GVAR(helmetOutline_US)#0) ctrlCommit 0;

[GVAR(fireControl_handler)] call CBA_fnc_removePerFrameHandler;
GVAR(fireControlHandlerAdded) = false;

[GVAR(iff_handler)] call CBA_fnc_removePerFrameHandler;
GVAR(iffHandlerAdded) = false;

[GVAR(generalHud_handler)] call CBA_fnc_removePerFrameHandler;

player setVariable [QGVAR(suitEnabled), false];
