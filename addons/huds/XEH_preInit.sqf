#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;


GVAR(toggleBootUp_cbaSetting);
GVAR(bootUpSpeed_cbaSetting);
GVAR(tempMeasurementSystem_cbaSetting);
GVAR(whitelistHelmetsUS_cbaSetting);
GVAR(whitelistSuitsUS_cbaSetting);
GVAR(whitelistPacksUS_cbaSetting);
GVAR(whitelistHelmetsPRC_cbaSetting);
GVAR(whitelistSuitsPRC_cbaSetting);
GVAR(whitelistPacksPRC_cbaSetting);
GVAR(toggleHUDppEffects_cbaSetting);
GVAR(hudPixelation_power_cbaSetting);
GVAR(hudChromAb_power_cbaSetting);
GVAR(hudRadialBlur_power_cbaSetting);
GVAR(hudRadialBlur_offset_cbaSetting);
GVAR(colorCorrection_power);
GVAR(fireControl_datalink_cbaSetting);
GVAR(fireControl_groupColor_cbaSetting) = [0,0,0,0];
GVAR(fireControl_friendColor_cbaSetting) = [0,0,0,0];
GVAR(fireControl_neutralColor_cbaSetting) = [0,0,0,0];
GVAR(fireControl_enemyColor_cbaSetting) = [0,0,0,0];
GVAR(fireControl_humanIconFriend_cbaSetting);
GVAR(fireControl_humanSizeFriend_cbaSetting);
GVAR(fireControl_humanIconEnemy_cbaSetting);
GVAR(fireControl_humanSizeEnemy_cbaSetting);
GVAR(fireControl_staticIcon_cbaSetting);
GVAR(fireControl_staticSize_cbaSetting);
GVAR(fireControl_vehicleIcon_cbaSetting);
GVAR(fireControl_vehicleSize_cbaSetting);
GVAR(fireControl_crosshairIcon_cbaSetting);
GVAR(fireControl_crosshairColor_cbaSetting);
GVAR(fireControl_crosshairMaxRange_cbaSetting);
GVAR(fireControl_crosshairMinOpacity_cbaSetting);
GVAR(fireControl_crosshairMaxOpacity_cbaSetting);
GVAR(hudOutlineColor_cbaSetting);
GVAR(infoBackgroundColor_cbaSetting);
GVAR(weaponBackgroundColor_cbaSetting);
GVAR(airBarColor_cbaSetting);
GVAR(battBarColor_cbaSetting);
GVAR(barTextColor_cbaSetting);
GVAR(bootTextColor_cbaSetting);
GVAR(textColor_cbaSetting);
GVAR(textColor_safe_cbaSetting);
GVAR(textColor_caution_cbaSetting);
GVAR(textColor_danger_cbaSetting);

// Config Global Vars //
// Config Sounds
GVAR(hudBootSound_US);
GVAR(hudTestTone_US);
GVAR(hudTypingSound0);
// US HUD vars
GVAR(airBar_US_base);
GVAR(battBar_US_base);
GVAR(systemMessages_US_base);
GVAR(overlay_US_base);
GVAR(weaponInfo_US_base);
GVAR(bootUp_US_base);
GVAR(bootUp_US_text);
GVAR(bootUp_US_headline);
GVAR(rangefinder_US_base);
GVAR(info_US_base);
GVAR(squad_US_base);

// ----------------------------------------------------------------------------------------------------------------------------

GVAR(suitEnabled) = false;
GVAR(hudBootInit);
GVAR(fireControlEnabled);
//GVAR(hasHelmet);
//GVAR(hasSuit);
GVAR(hasHelmAndSuit);
GVAR(selectedWeapon) = "NOWEAPON";
GVAR(selectedThrowable) = "NOWEAPON";

GVAR(whitelistHelmets) = [];
GVAR(whitelistSuits) = [];
GVAR(whitelistPacks) = [];
GVAR(disableSuit);

GVAR(hudActivateAction);
GVAR(hudDeactivateAction);

GVAR(hudHandlerAdded) = false;
GVAR(fireControlHandlerAdded) = false;
GVAR(iffHandlerAdded) = false;

GVAR(hudInteriaHandle);
GVAR(oldViewAngleX);
GVAR(oldViewAngleY);
GVAR(hudAngleX) = 0;
GVAR(hudAngleY) = 0;
GVAR(noMovementTimer);

GVAR(bootUpLines);

GVAR(IFF_range) = DEFAULT_IFF_RANGE;

GVAR(generalHud_handler);
GVAR(fireControl_handler);
GVAR(iff_handler);
GVAR(playerSuitCheck_handler);
GVAR(playerInSuit_handler);
GVAR(playerOutSuit_handler);

GVAR(hudPixelation_PP) = ppEffectCreate ["Resolution", 1];
GVAR(hudChromAb_PP) = ppEffectCreate ["ChromAberration", 200];
GVAR(hudRadialBlur_PP) = ppEffectCreate ["RadialBlur", 100];
GVAR(filmGrain_PP) = ppEffectCreate ["FilmGrain", 2000];

// US HUD global vars hudInit.sqf ----------------------------------------------------------------------
GVAR(helmetOutline_US);
GVAR(hudOutline_US);

GVAR(info_controlGroup_US);
GVAR(info_background_US);
GVAR(info_airRemain_text_US);
GVAR(info_battRemain_text_US);
GVAR(info_internalTemp_text_US);
GVAR(info_externalTemp_text_US);
GVAR(info_thermalPowerBalance_text_US);
GVAR(info_timeUntilDang_text_US);
GVAR(info_externalAtmo_text_US);
GVAR(info_radPerHour_text_US);
GVAR(info_lifetimeRad_text_US);

GVAR(weapon_controlGroup_US);
GVAR(weapon_background_US);
GVAR(weapon_currentWeapon_US);
GVAR(weapon_secondWeapon_US);
GVAR(weapon_launcher_US);
GVAR(weapon_grenade_US);
GVAR(weapon_grenadeName_text_US);
GVAR(weapon_grenadeAmount_text_US);
GVAR(weapon_fireMode_text_US);
GVAR(weapon_weaponZero_text_US);
GVAR(weapon_weaponMagazines_text_US);

GVAR(squad_controlGroup_US);
GVAR(squad_member0_text_US);
GVAR(squad_member0_heart_US);
GVAR(squad_member1_text_US);
GVAR(squad_member1_heart_US);
GVAR(squad_member2_text_US);
GVAR(squad_member2_heart_US);
GVAR(squad_member3_text_US);
GVAR(squad_member3_heart_US);
GVAR(squad_member4_text_US);
GVAR(squad_member4_heart_US);
GVAR(squad_member5_text_US);
GVAR(squad_member5_heart_US);
GVAR(squad_member6_text_US);
GVAR(squad_member6_heart_US);
GVAR(squad_member7_text_US);
GVAR(squad_member7_heart_US);
GVAR(squad_member8_text_US);
GVAR(squad_member8_heart_US);
GVAR(squad_member9_text_US);
GVAR(squad_member9_heart_US);
GVAR(squad_member10_text_US);
GVAR(squad_member10_heart_US);
GVAR(squad_member11_text_US);
GVAR(squad_member11_heart_US);
GVAR(squad_member12_text_US);
GVAR(squad_member12_heart_US);
GVAR(squad_member13_text_US);
GVAR(squad_member13_heart_US);
GVAR(squad_member14_text_US);
GVAR(squad_member14_heart_US);
GVAR(squad_member15_text_US);
GVAR(squad_member15_heart_US);
GVAR(squad_member16_text_US);
GVAR(squad_member16_heart_US);
GVAR(squad_member17_text_US);
GVAR(squad_member17_heart_US);

GVAR(rangefinder_controlGroup_US);
GVAR(rangefinder_background_US);
GVAR(rangefinder_bearing_US);
GVAR(rangefinder_range_US);
GVAR(rangefinder_grid_US);

GVAR(bootup_logo_US);
GVAR(bootup_bistGrid_US);
GVAR(bootup_text_US);
GVAR(bootup_headline_text_US);

GVAR(systemMessages_controlGroup_US);
GVAR(systemMessages_text_US);

GVAR(airBar_US);
GVAR(battBar_US);

GVAR(squad_memberAddressArray_US);
GVAR(squad_heartAddressArray_US);
GVAR(rangefinder_addressArray_US);
GVAR(weapon_addressArray_US);
GVAR(grenade_addressArray_US);
GVAR(weaponIcons_addressArray_US);

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
