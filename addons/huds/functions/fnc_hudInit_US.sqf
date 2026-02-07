#include "..\script_component.hpp"
/*
 * Author: Luriss
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

//if (isClass(configFile >> "CfgPatches" >> "LRSS_Suit_Scripts_DEV")) exitWith {};

params ["_suitFaction"];

//call LRSS_fnc_removeHudEventhandler;

QGVAR(overlay_US_base) cutText ["","PLAIN",-1,false];
QGVAR(airBar_US_base) cutText ["", "PLAIN", -1, false];
QGVAR(battBar_US_base) cutText ["", "PLAIN", -1, false];
QGVAR(weaponInfo_US_base) cutText ["", "PLAIN", -1, false];
QGVAR(systemMessages_US_base) cutText ["", "PLAIN", -1, false];
QGVAR(rangefinder_US_base) cutText ["", "PLAIN", -1, false];
QGVAR(info_US_base) cutText ["", "PLAIN", -1, false];
QGVAR(squad_US_base) cutText ["", "PLAIN", -1, false];
QGVAR(bootUp_US_base) cutText ["", "PLAIN", -1, false];

QGVAR(overlay_US_base) cutRsc [QGVAR(overlay_US_base), "PLAIN", -1, false, false];
QGVAR(airBar_US_base) cutRsc [QGVAR(airBar_US_base),"PLAIN",-1,false];
QGVAR(battBar_US_base) cutRsc [QGVAR(battBar_US_base),"PLAIN",-1,false];
QGVAR(weaponInfo_US_base) cutRsc [QGVAR(weaponInfo_US_base), "PLAIN", -1, false];
QGVAR(systemMessages_US_base) cutRsc [QGVAR(systemMessages_US_base), "PLAIN", -1, false];
QGVAR(rangefinder_US_base) cutRsc [QGVAR(rangefinder_US_base),"PLAIN",-1,false];
QGVAR(info_US_base) cutRsc [QGVAR(info_US_base),"PLAIN",-1,false];
QGVAR(squad_US_base) cutRsc [QGVAR(squad_US_base),"PLAIN",-1,false];
QGVAR(bootUp_US_base) cutRsc [QGVAR(bootUp_US_base), "PLAIN", -1, false];

with uiNamespace do {
    private _displayOverlay = uiNamespace getVariable QGVAR(overlay_US_base);
    private _displayWeaponInfo = uiNamespace getVariable QGVAR(weaponInfo_US_base);
    private _displayBootUp = uiNamespace getVariable QGVAR(bootUp_US_base);
    private _displayMessage = uiNamespace getVariable QGVAR(systemMessages_US_base);
    private _displayPosition = uiNamespace getVariable QGVAR(rangefinder_US_base);
    private _displayConsumeable = uiNamespace getVariable QGVAR(info_US_base);
    private _displayAirBar = uiNamespace getVariable QGVAR(airBar_US_base);
    private _displayBattBar = uiNamespace getVariable QGVAR(battBar_US_base);
    private _displaySquadInfo = uiNamespace getVariable QGVAR(squad_US_base);

    GVAR(helmetOutline_US) = _displayOverlay ctrlCreate ["RscPicture", 28635];
    GVAR(hudOutline_US) = _displayOverlay ctrlCreate ["RscPicture", 28636];

    GVAR(info_controlGroup_US) = _displayConsumeable ctrlCreate ["RscControlsGroupNoScrollbars", 30006];
    GVAR(info_background_US) = _displayConsumeable ctrlCreate ["RscPicture", 28001, GVAR(info_controlGroup_US)];
    GVAR(info_background_text_US) = _displayConsumeable ctrlCreate ["RscPicture", 28932, GVAR(info_controlGroup_US)];
    GVAR(info_airRemain_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92426, GVAR(info_controlGroup_US)];
    GVAR(info_battRemain_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92846, GVAR(info_controlGroup_US)];
    GVAR(info_internalTemp_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92427, GVAR(info_controlGroup_US)];
    GVAR(info_externalTemp_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92428, GVAR(info_controlGroup_US)];
    GVAR(info_thermalPowerBalance_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92429, GVAR(info_controlGroup_US)];
    GVAR(info_timeUntilDang_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92429, GVAR(info_controlGroup_US)];
    GVAR(info_externalAtmo_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92429, GVAR(info_controlGroup_US)];
    GVAR(info_radPerHour_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92430, GVAR(info_controlGroup_US)];
    GVAR(info_lifetimeRad_text_US) = _displayConsumeable ctrlCreate ["RscStructuredText", 92431, GVAR(info_controlGroup_US)];

    GVAR(weapon_controlGroup_US) = _displayWeaponInfo ctrlCreate ["RscControlsGroupNoScrollbars", 38001];
    GVAR(weapon_background_US) = _displayWeaponInfo ctrlCreate ["RscPicture", 28822, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_currentWeapon_US) = _displayWeaponInfo ctrlCreate ["RscPicture", 28002, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_secondWeapon_US) = _displayWeaponInfo ctrlCreate ["RscPicture", 28003, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_launcher_US) = _displayWeaponInfo ctrlCreate ["RscPicture", 28004, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_grenade_US) = _displayWeaponInfo ctrlCreate ["RscPicture", 28005, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_grenade_text_US) = _displayWeaponInfo ctrlCreate ["RscStructuredText", 10867, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_grenadeAmount_text_US) = _displayWeaponInfo ctrlCreate ["RscStructuredText", 10868, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_fireMode_text_US) = _displayWeaponInfo ctrlCreate ["RscStructuredText", 10866, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_weaponZero_text_US) = _displayWeaponInfo ctrlCreate ["RscStructuredText", 10869, GVAR(weapon_controlGroup_US)];
    GVAR(weapon_weaponMagazines_text_US) = _displayWeaponInfo ctrlCreate ["RscStructuredText", 10865, GVAR(weapon_controlGroup_US)];

    GVAR(squad_controlGroup_US) = _displaySquadInfo ctrlCreate ["RscControlsGroupNoScrollbars", 25006];
    GVAR(squad_member0_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member0_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28024, GVAR(squad_controlGroup_US)];
    GVAR(squad_member1_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member1_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member2_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member2_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member3_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member3_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member4_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member4_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member5_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member5_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member6_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member6_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member7_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member7_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member8_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member8_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member9_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member9_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member10_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member10_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member11_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member11_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member12_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member12_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member13_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member13_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member14_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member14_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member15_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member15_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member16_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member16_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];
    GVAR(squad_member17_text_US) = _displaySquadInfo ctrlCreate ["RscStructuredText", 25007, GVAR(squad_controlGroup_US)];
    GVAR(squad_member17_heart_US) = _displaySquadInfo ctrlCreate ["RscPicture", 28842, GVAR(squad_controlGroup_US)];

    GVAR(rangefinder_controlGroup_US) = _displayPosition ctrlCreate ["RscControlsGroupNoScrollbars", 29006];
    GVAR(rangefinder_background_US) = _displayPosition ctrlCreate ["RscPicture", 28006, GVAR(rangefinder_controlGroup_US)];
    GVAR(rangefinder_bearing_US) = _displayPosition ctrlCreate ["RscStructuredText", 98006, GVAR(rangefinder_controlGroup_US)];
    GVAR(rangefinder_range_US) = _displayPosition ctrlCreate ["RscStructuredText", 98008, GVAR(rangefinder_controlGroup_US)];
    GVAR(rangefinder_grid_US) = _displayPosition ctrlCreate ["RscStructuredText", 98007, GVAR(rangefinder_controlGroup_US)];

    GVAR(bootup_logo_US) = _displayBootUp ctrlCreate ["RscPicture", 10861];
    GVAR(bootup_bistGrid_US) = _displayBootUp ctrlCreate ["RscPicture", 82862];
    GVAR(bootup_text_US) = _displayBootUp displayCtrl 10263;
    GVAR(bootup_headline_text_US) = _displayBootUp displayCtrl 10264;

    //GVAR(systemMessages_controlGroup_US) = _displayMessage displayCtrl 110863;
    //GVAR(systemMessages_text_US) = _displayMessage displayCtrl 10863;

    GVAR(airBar_US) = _displayAirBar displayCtrl 1245;
    GVAR(battBar_US) = _displayBattBar displayCtrl 1246;
};

GVAR(rangefinder_controlGroup_US) = [uiNamespace getVariable QGVAR(rangefinder_controlGroup_US)]; // Array data type - E.g. ["Control Datatype"]
GVAR(info_controlGroup_US) = [uiNamespace getVariable QGVAR(info_controlGroup_US)];
GVAR(weapon_controlGroup_US) = [uiNamespace getVariable QGVAR(weapon_controlGroup_US)];
GVAR(squad_controlGroup_US) = [uiNamespace getVariable QGVAR(squad_controlGroup_US)];

GVAR(helmetOutline_US) = [uiNamespace getVariable QGVAR(helmetOutline_US)]; // Array data type - E.g. ["Control Datatype"]
GVAR(hudOutline_US) = [uiNamespace getVariable QGVAR(hudOutline_US)];

GVAR(bootup_logo_US) = [uiNamespace getVariable QGVAR(bootup_logo_US)];
GVAR(bootup_bistGrid_US) = [uiNamespace getVariable QGVAR(bootup_bistGrid_US)];
GVAR(bootup_text_US) = [uiNamespace getVariable QGVAR(bootup_text_US)];
GVAR(bootup_headline_text_US) = [uiNamespace getVariable QGVAR(bootup_headline_text_US)];

GVAR(airBar_US) = [uiNamespace getVariable QGVAR(airBar_US)];
GVAR(battBar_US) = [uiNamespace getVariable QGVAR(battBar_US)];

GVAR(info_background_text_US) = [uiNamespace getVariable QGVAR(info_background_text_US)];
GVAR(info_airRemain_text_US) = [uiNamespace getVariable QGVAR(info_airRemain_text_US)];
GVAR(info_battRemain_text_US) = [uiNamespace getVariable QGVAR(info_battRemain_text_US)];
GVAR(info_internalTemp_text_US) = [uiNamespace getVariable QGVAR(info_internalTemp_text_US)];
GVAR(info_externalTemp_text_US) = [uiNamespace getVariable QGVAR(info_externalTemp_text_US)];
GVAR(info_thermalPowerBalance_text_US) = [uiNamespace getVariable QGVAR(info_thermalPowerBalance_text_US)];
GVAR(info_timeUntilDang_text_US) = [uiNamespace getVariable QGVAR(info_timeUntilDang_text_US)];
GVAR(info_externalAtmo_text_US) = [uiNamespace getVariable QGVAR(info_externalAtmo_text_US)];
GVAR(info_radPerHour_text_US) = [uiNamespace getVariable QGVAR(info_radPerHour_text_US)];
GVAR(info_lifetimeRad_text_US) = [uiNamespace getVariable QGVAR(info_lifetimeRad_text_US)];

GVAR(squad_member0_text_US) = [uiNamespace getVariable QGVAR(squad_member0_text_US)];
GVAR(squad_member0_heart_US) = [uiNamespace getVariable QGVAR(squad_member0_heart_US)];
GVAR(squad_member1_text_US) = [uiNamespace getVariable QGVAR(squad_member1_text_US)];
GVAR(squad_member1_heart_US) = [uiNamespace getVariable QGVAR(squad_member1_heart_US)];
GVAR(squad_member2_text_US) = [uiNamespace getVariable QGVAR(squad_member2_text_US)];
GVAR(squad_member2_heart_US) = [uiNamespace getVariable QGVAR(squad_member2_heart_US)];
GVAR(squad_member3_text_US) = [uiNamespace getVariable QGVAR(squad_member3_text_US)];
GVAR(squad_member3_heart_US) = [uiNamespace getVariable QGVAR(squad_member3_heart_US)];
GVAR(squad_member4_text_US) = [uiNamespace getVariable QGVAR(squad_member4_text_US)];
GVAR(squad_member4_heart_US) = [uiNamespace getVariable QGVAR(squad_member4_heart_US)];
GVAR(squad_member5_text_US) = [uiNamespace getVariable QGVAR(squad_member5_text_US)];
GVAR(squad_member5_heart_US) = [uiNamespace getVariable QGVAR(squad_member5_heart_US)];
GVAR(squad_member6_text_US) = [uiNamespace getVariable QGVAR(squad_member6_text_US)];
GVAR(squad_member6_heart_US) = [uiNamespace getVariable QGVAR(squad_member6_heart_US)];
GVAR(squad_member7_text_US) = [uiNamespace getVariable QGVAR(squad_member7_text_US)];
GVAR(squad_member7_heart_US) = [uiNamespace getVariable QGVAR(squad_member7_heart_US)];
GVAR(squad_member8_text_US) = [uiNamespace getVariable QGVAR(squad_member8_text_US)];
GVAR(squad_member8_heart_US) = [uiNamespace getVariable QGVAR(squad_member8_heart_US)];
GVAR(squad_member9_text_US) = [uiNamespace getVariable QGVAR(squad_member9_text_US)];
GVAR(squad_member9_heart_US) = [uiNamespace getVariable QGVAR(squad_member9_heart_US)];
GVAR(squad_member10_text_US) = [uiNamespace getVariable QGVAR(squad_member10_text_US)];
GVAR(squad_member10_heart_US) = [uiNamespace getVariable QGVAR(squad_member10_heart_US)];
GVAR(squad_member11_text_US) = [uiNamespace getVariable QGVAR(squad_member11_text_US)];
GVAR(squad_member11_heart_US) = [uiNamespace getVariable QGVAR(squad_member11_heart_US)];
GVAR(squad_member12_text_US) = [uiNamespace getVariable QGVAR(squad_member12_text_US)];
GVAR(squad_member12_heart_US) = [uiNamespace getVariable QGVAR(squad_member12_heart_US)];
GVAR(squad_member13_text_US) = [uiNamespace getVariable QGVAR(squad_member13_text_US)];
GVAR(squad_member13_heart_US) = [uiNamespace getVariable QGVAR(squad_member13_heart_US)];
GVAR(squad_member14_text_US) = [uiNamespace getVariable QGVAR(squad_member14_text_US)];
GVAR(squad_member14_heart_US) = [uiNamespace getVariable QGVAR(squad_member14_heart_US)];
GVAR(squad_member15_text_US) = [uiNamespace getVariable QGVAR(squad_member15_text_US)];
GVAR(squad_member15_heart_US) = [uiNamespace getVariable QGVAR(squad_member15_heart_US)];
GVAR(squad_member16_text_US) = [uiNamespace getVariable QGVAR(squad_member16_text_US)];
GVAR(squad_member16_heart_US) = [uiNamespace getVariable QGVAR(squad_member16_heart_US)];
GVAR(squad_member17_text_US) = [uiNamespace getVariable QGVAR(squad_member17_text_US)];
GVAR(squad_member17_heart_US) = [uiNamespace getVariable QGVAR(squad_member17_heart_US)];


GVAR(systemMessages_controlGroup_US) = [uiNamespace getVariable QGVAR(systemMessages_controlGroup_US)];
GVAR(systemMessages_text_US) = [uiNamespace getVariable QGVAR(systemMessages_text_US)];

GVAR(info_background_US) = [uiNamespace getVariable QGVAR(info_background_US)];

GVAR(weapon_background_US) = [uiNamespace getVariable QGVAR(weapon_background_US)];
GVAR(rangefinder_background_US) = [uiNamespace getVariable QGVAR(rangefinder_background_US)];
GVAR(weapon_currentWeapon_US) = [uiNamespace getVariable QGVAR(weapon_currentWeapon_US)];
GVAR(weapon_secondWeapon_US) = [uiNamespace getVariable QGVAR(weapon_secondWeapon_US)];
GVAR(weapon_launcher_US) = [uiNamespace getVariable QGVAR(weapon_launcher_US)];
GVAR(weapon_grenade_US) = [uiNamespace getVariable QGVAR(weapon_grenade_US)];

GVAR(rangefinder_grid_US) = [uiNamespace getVariable QGVAR(rangefinder_grid_US)];
GVAR(rangefinder_bearing_US) = [uiNamespace getVariable QGVAR(rangefinder_bearing_US)];
GVAR(rangefinder_range_US) = [uiNamespace getVariable QGVAR(rangefinder_range_US)];
GVAR(weapon_weaponMagazines_text_US) = [uiNamespace getVariable QGVAR(weapon_weaponMagazines_text_US)];

GVAR(weapon_fireMode_text_US) = [uiNamespace getVariable QGVAR(weapon_fireMode_text_US)];
GVAR(weapon_grenade_text_US) = [uiNamespace getVariable QGVAR(weapon_grenade_text_US)];
GVAR(weapon_grenadeAmount_text_US) = [uiNamespace getVariable QGVAR(weapon_grenadeAmount_text_US)];
GVAR(weapon_weaponZero_text_US) = [uiNamespace getVariable QGVAR(weapon_weaponZero_text_US)];

// --------------------------------------------------------------------------------------------

/*LRSS_MJOLNIR_bootBoxEndPos = [0.2523 * safeZoneW + safeZoneX,0.148 * safeZoneH + safeZoneY,0.16875 * safeZoneW,0.15 * safeZoneH];
private _controlPositionBox = LRSS_MJOLNIR_bootBoxEndPos;
private _controlSizeBox = [_controlPositionBox select 2, _controlPositionBox select 3];
private _centerPositionBox = [(_controlPositionBox select 0) + ((_controlSizeBox select 0) / 2), (_controlPositionBox select 1) + ((_controlSizeBox select 1) / 2)];
LRSS_MJOLNIR_bootBoxStart = [(_centerPositionBox select 0), (_centerPositionBox select 1),0,0];*/

(GVAR(bootup_logo_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_bootLogo_US.paa";
(GVAR(bootup_logo_US)#0) ctrlSetFade 1;
(GVAR(bootup_logo_US)#0) ctrlSetTextColor [1,1,1,1];
(GVAR(bootup_logo_US)#0) ctrlCommit 0;

(GVAR(bootup_bistGrid_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_bistGrid_US.paa";;
(GVAR(bootup_bistGrid_US)#0) ctrlSetPosition BOOTUP_BISTGRID_US_POS;
(GVAR(bootup_bistGrid_US)#0) ctrlSetFade 1;
(GVAR(bootup_bistGrid_US)#0) ctrlSetTextColor [1,1,1,1];
(GVAR(bootup_bistGrid_US)#0) ctrlCommit 0;

(GVAR(bootup_text_US)#0) ctrlSetStructuredText parseText "";
(GVAR(bootup_text_US)#0) ctrlSetPosition BOOTUP_TEXT_US_POS;
(GVAR(bootup_text_US)#0) ctrlSetFade 1;
(GVAR(bootup_text_US)#0) ctrlSetTextColor [1,1,1,1];
(GVAR(bootup_text_US)#0) ctrlCommit 0;

(GVAR(bootup_headline_text_US)#0) ctrlSetText "P O W E R I N G   U P";
(GVAR(bootup_headline_text_US)#0) ctrlSetPosition BOOTUP_HEADLINE_TEXT_US_POS;
(GVAR(bootup_headline_text_US)#0) ctrlSetFade 1;
(GVAR(bootup_headline_text_US)#0) ctrlSetTextColor GVAR(bootTextColor);
(GVAR(bootup_headline_text_US)#0) ctrlCommit 0;

/*if (LRSS_MJOLNIR_SHOW_OUTLINE) then {
    (GVAR(helmetOutline_US)#0) ctrlSetText GVAR(helmetOutline_US);
} else {
    (GVAR(helmetOutline_US)#0) ctrlSetText "";
};
(GVAR(helmetOutline_US)#0) ctrlSetFade 0;
(GVAR(helmetOutline_US)#0) ctrlCommit 0;

if (LRSS_SHOW_HUD_OVERLAY) then {
    (GVAR(hudOutline_US)#0) ctrlSetText GVAR(hudOutline_US);
} else {
    (GVAR(hudOutline_US)#0) ctrlSetText "";
};*/
(GVAR(helmetOutline_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_helmetBackground_US.paa";
(GVAR(hudOutline_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudBackground_US.paa";
(GVAR(helmetOutline_US)#0) ctrlSetFade 1;
(GVAR(helmetOutline_US)#0) ctrlCommit 0;

(GVAR(hudOutline_US)#0) ctrlSetTextColor GVAR(hudOutlineColor);
(GVAR(hudOutline_US)#0) ctrlSetFade 1;
(GVAR(hudOutline_US)#0) ctrlCommit 0;

(GVAR(info_background_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudInfo_US.paa";; // Indexing into array to pull out the control datatype
(GVAR(info_background_US)#0) ctrlSetTextColor GVAR(infoBackgroundColor);
(GVAR(info_background_US)#0) ctrlSetPosition INFO_BACKGROUND_US_POS;
(GVAR(info_background_US)#0) ctrlSetFade 1;
(GVAR(info_background_US)#0) ctrlCommit 0;

(GVAR(rangefinder_background_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudRangefinder_US.paa";
(GVAR(rangefinder_background_US)#0) ctrlSetTextColor GVAR(infoBackgroundColor);
(GVAR(rangefinder_background_US)#0) ctrlSetPosition RANGEFINDER_BACKGROUND_US_POS;
(GVAR(rangefinder_background_US)#0) ctrlSetFade 1;
(GVAR(rangefinder_background_US)#0) ctrlCommit 0;

(GVAR(weapon_background_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudWeapon_US.paa";
(GVAR(weapon_background_US)#0) ctrlSetTextColor GVAR(weaponBackgroundColor);
(GVAR(weapon_background_US)#0) ctrlSetPosition WEAPON_BACKGROUND_US_POS;
(GVAR(weapon_background_US)#0) ctrlSetFade 1;
(GVAR(weapon_background_US)#0) ctrlCommit 0;

(GVAR(airBar_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_airBar_US.paa";
(GVAR(airBar_US)#0) ctrlSetTextColor GVAR(airBarColor);
(GVAR(airBar_US)#0) ctrlSetFade 1;
(GVAR(airBar_US)#0) ctrlCommit 0;

(GVAR(battBar_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_battBar_US.paa";
(GVAR(battBar_US)#0) ctrlSetTextColor GVAR(battBarColor);
(GVAR(battBar_US)#0) ctrlSetFade 1;
(GVAR(battBar_US)#0) ctrlCommit 0;

(GVAR(info_background_text_US)#0) ctrlSetText LLSTRING(info_background_text_US);
(GVAR(info_background_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(info_background_text_US)#0) ctrlSetPosition INFO_BACKGROUND_US_POS;
(GVAR(info_background_text_US)#0) ctrlSetFade 1;
(GVAR(info_background_text_US)#0) ctrlCommit 0;

//systemChat LLSTRING(info_background_text_US);

(GVAR(info_airRemain_text_US)#0) ctrlSetText "---";
(GVAR(info_airRemain_text_US)#0) ctrlSetTextColor GVAR(barTextColor);
(GVAR(info_airRemain_text_US)#0) ctrlSetPosition INFO_AIRREMAIN_TEXT_US_POS;
(GVAR(info_airRemain_text_US)#0) ctrlSetFade 1;
(GVAR(info_airRemain_text_US)#0) ctrlCommit 0;

(GVAR(info_battRemain_text_US)#0) ctrlSetText "---";
(GVAR(info_battRemain_text_US)#0) ctrlSetTextColor GVAR(barTextColor);
(GVAR(info_battRemain_text_US)#0) ctrlSetPosition INFO_BATTREMAIN_TEXT_US_POS;
(GVAR(info_battRemain_text_US)#0) ctrlSetFade 1;
(GVAR(info_battRemain_text_US)#0) ctrlCommit 0;

(GVAR(info_internalTemp_text_US)#0) ctrlSetText "---";
(GVAR(info_internalTemp_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(info_internalTemp_text_US)#0) ctrlSetPosition INFO_INTERNALTEMP_TEXT_US_POS;
(GVAR(info_internalTemp_text_US)#0) ctrlSetFade 1;
(GVAR(info_internalTemp_text_US)#0) ctrlCommit 0;

(GVAR(info_externalTemp_text_US)#0) ctrlSetText "---";
(GVAR(info_externalTemp_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(info_externalTemp_text_US)#0) ctrlSetPosition INFO_EXTERNALTEMP_TEXT_US_POS;
(GVAR(info_externalTemp_text_US)#0) ctrlSetFade 1;
(GVAR(info_externalTemp_text_US)#0) ctrlCommit 0;

(GVAR(info_thermalPowerBalance_text_US)#0) ctrlSetText "---";
(GVAR(info_thermalPowerBalance_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(info_thermalPowerBalance_text_US)#0) ctrlSetPosition INFO_THERMALPOWERBALANCE_TEXT_US_POS;
(GVAR(info_thermalPowerBalance_text_US)#0) ctrlSetFade 1;
(GVAR(info_thermalPowerBalance_text_US)#0) ctrlCommit 0;

(GVAR(info_timeUntilDang_text_US)#0) ctrlSetText "---";
(GVAR(info_timeUntilDang_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(info_timeUntilDang_text_US)#0) ctrlSetPosition INFO_TIMEUNTILDANG_TEXT_US_POS;
(GVAR(info_timeUntilDang_text_US)#0) ctrlSetFade 1;
(GVAR(info_timeUntilDang_text_US)#0) ctrlCommit 0;

(GVAR(info_externalAtmo_text_US)#0) ctrlSetText "---";
(GVAR(info_externalAtmo_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(info_externalAtmo_text_US)#0) ctrlSetPosition INFO_EXTERNALATMO_TEXT_US_POS;
(GVAR(info_externalAtmo_text_US)#0) ctrlSetFade 1;
(GVAR(info_externalAtmo_text_US)#0) ctrlCommit 0;

(GVAR(info_radPerHour_text_US)#0) ctrlSetText "---";
(GVAR(info_radPerHour_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(info_radPerHour_text_US)#0) ctrlSetPosition INFO_RADPERHOUR_TEXT_US_POS;
(GVAR(info_radPerHour_text_US)#0) ctrlSetFade 1;
(GVAR(info_radPerHour_text_US)#0) ctrlCommit 0;

(GVAR(info_lifetimeRad_text_US)#0) ctrlSetText "---";
(GVAR(info_lifetimeRad_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(info_lifetimeRad_text_US)#0) ctrlSetPosition INFO_LIFETIMERAD_TEXT_US_POS;
(GVAR(info_lifetimeRad_text_US)#0) ctrlSetFade 1;
(GVAR(info_lifetimeRad_text_US)#0) ctrlCommit 0;

(GVAR(weapon_currentWeapon_US)#0) ctrlSetText "";
(GVAR(weapon_currentWeapon_US)#0) ctrlSetTextColor GVAR(weaponBackgroundColor);
(GVAR(weapon_currentWeapon_US)#0) ctrlSetPosition WEAPON_CURRENTWEAPON_US_POS;
(GVAR(weapon_currentWeapon_US)#0) ctrlSetFade 1;
(GVAR(weapon_currentWeapon_US)#0) ctrlCommit 0;

(GVAR(weapon_secondWeapon_US)#0) ctrlSetText "";
(GVAR(weapon_secondWeapon_US)#0) ctrlSetTextColor GVAR(weaponBackgroundColor);
(GVAR(weapon_secondWeapon_US)#0) ctrlSetPosition WEAPON_SECONDWEAPON_US_POS;
(GVAR(weapon_secondWeapon_US)#0) ctrlSetFade 1;
(GVAR(weapon_secondWeapon_US)#0) ctrlCommit 0;

(GVAR(weapon_launcher_US)#0) ctrlSetText "";
(GVAR(weapon_launcher_US)#0) ctrlSetPosition WEAPON_LAUNCHER_US_POS;
(GVAR(weapon_launcher_US)#0) ctrlSetTextColor GVAR(weaponBackgroundColor);
(GVAR(weapon_launcher_US)#0) ctrlSetFade 1;
(GVAR(weapon_launcher_US)#0) ctrlCommit 0;
(GVAR(weapon_launcher_US)#0) ctrlSetAngle [90,0.5,0.5];

(GVAR(weapon_grenade_US)#0) ctrlSetText "";
(GVAR(weapon_grenade_US)#0) ctrlSetPosition WEAPON_GRENADE_US_POS;
(GVAR(weapon_grenade_US)#0) ctrlSetTextColor GVAR(weaponBackgroundColor);
(GVAR(weapon_grenade_US)#0) ctrlSetFade 1;
(GVAR(weapon_grenade_US)#0) ctrlCommit 0;

(GVAR(rangefinder_grid_US)#0) ctrlSetText "---";
(GVAR(rangefinder_grid_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(rangefinder_grid_US)#0) ctrlSetPosition RANGEFINDER_GRID_US_POS;
(GVAR(rangefinder_grid_US)#0) ctrlSetFade 1;
(GVAR(rangefinder_grid_US)#0) ctrlCommit 0;

(GVAR(rangefinder_bearing_US)#0) ctrlSetText "---";
(GVAR(rangefinder_bearing_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(rangefinder_bearing_US)#0) ctrlSetPosition RANGEFINDER_BEARING_US_POS;
(GVAR(rangefinder_bearing_US)#0) ctrlSetFade 1;
(GVAR(rangefinder_bearing_US)#0) ctrlCommit 0;

(GVAR(rangefinder_range_US)#0) ctrlSetText "---";
(GVAR(rangefinder_range_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(rangefinder_range_US)#0) ctrlSetPosition RANGEFINDER_RANGE_US_POS;
(GVAR(rangefinder_range_US)#0) ctrlSetFade 1;
(GVAR(rangefinder_range_US)#0) ctrlCommit 0;

(GVAR(weapon_weaponMagazines_text_US)#0) ctrlSetText "---";
(GVAR(weapon_weaponMagazines_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(weapon_weaponMagazines_text_US)#0) ctrlSetPosition WEAPON_WEAPONMAGAZINES_TEXT_US_POS;
(GVAR(weapon_weaponMagazines_text_US)#0) ctrlSetFade 1;
(GVAR(weapon_weaponMagazines_text_US)#0) ctrlCommit 0;

(GVAR(weapon_fireMode_text_US)#0) ctrlSetText "FullAuto";
(GVAR(weapon_fireMode_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(weapon_fireMode_text_US)#0) ctrlSetPosition WEAPON_FIREMODE_TEXT_US_POS;
(GVAR(weapon_fireMode_text_US)#0) ctrlSetFade 1;
(GVAR(weapon_fireMode_text_US)#0) ctrlCommit 0;

(GVAR(weapon_grenade_text_US)#0) ctrlSetText "M9 Frag Grenade";
(GVAR(weapon_grenade_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(weapon_grenade_text_US)#0) ctrlSetPosition WEAPON_GRENADE_TEXT_US_POS;
(GVAR(weapon_grenade_text_US)#0) ctrlSetFade 1;
(GVAR(weapon_grenade_text_US)#0) ctrlCommit 0;

(GVAR(weapon_grenadeAmount_text_US)#0) ctrlSetText "3";
(GVAR(weapon_grenadeAmount_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(weapon_grenadeAmount_text_US)#0) ctrlSetPosition WEAPON_GRENADEAMOUNT_TEXT_US_POS;
(GVAR(weapon_grenadeAmount_text_US)#0) ctrlSetFade 1;
(GVAR(weapon_grenadeAmount_text_US)#0) ctrlCommit 0;

(GVAR(weapon_weaponZero_text_US)#0) ctrlSetText "300m";
(GVAR(weapon_weaponZero_text_US)#0) ctrlSetTextColor GVAR(textColor);
(GVAR(weapon_weaponZero_text_US)#0) ctrlSetPosition WEAPON_WEAPONZERO_TEXT_US_POS;
(GVAR(weapon_weaponZero_text_US)#0) ctrlSetFade 1;
(GVAR(weapon_weaponZero_text_US)#0) ctrlCommit 0;

// -----------------------

(GVAR(squad_member0_text_US)#0) ctrlSetText "";
(GVAR(squad_member0_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member0_text_US)#0) ctrlSetPosition SQUAD_MEMBER0_TEXT_US_POS;
(GVAR(squad_member0_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member0_text_US)#0) ctrlCommit 0;

(GVAR(squad_member0_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member0_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member0_heart_US)#0) ctrlSetPosition SQUAD_MEMBER0_HEART_US_POS;
(GVAR(squad_member0_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member0_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member1_text_US)#0) ctrlSetText "";
(GVAR(squad_member1_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member1_text_US)#0) ctrlSetPosition SQUAD_MEMBER1_TEXT_US_POS;
(GVAR(squad_member1_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member1_text_US)#0) ctrlCommit 0;

(GVAR(squad_member1_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member1_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member1_heart_US)#0) ctrlSetPosition SQUAD_MEMBER1_HEART_US_POS;
(GVAR(squad_member1_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member1_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member2_text_US)#0) ctrlSetText "";
(GVAR(squad_member2_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member2_text_US)#0) ctrlSetPosition SQUAD_MEMBER2_TEXT_US_POS;
(GVAR(squad_member2_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member2_text_US)#0) ctrlCommit 0;

(GVAR(squad_member2_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member2_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member2_heart_US)#0) ctrlSetPosition SQUAD_MEMBER2_HEART_US_POS;
(GVAR(squad_member2_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member2_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member3_text_US)#0) ctrlSetText "";
(GVAR(squad_member3_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member3_text_US)#0) ctrlSetPosition SQUAD_MEMBER3_TEXT_US_POS;
(GVAR(squad_member3_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member3_text_US)#0) ctrlCommit 0;

(GVAR(squad_member3_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member3_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member3_heart_US)#0) ctrlSetPosition SQUAD_MEMBER3_HEART_US_POS;
(GVAR(squad_member3_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member3_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member4_text_US)#0) ctrlSetText "";
(GVAR(squad_member4_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member4_text_US)#0) ctrlSetPosition SQUAD_MEMBER4_TEXT_US_POS;
(GVAR(squad_member4_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member4_text_US)#0) ctrlCommit 0;

(GVAR(squad_member4_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member4_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member4_heart_US)#0) ctrlSetPosition SQUAD_MEMBER4_HEART_US_POS;
(GVAR(squad_member4_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member4_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member5_text_US)#0) ctrlSetText "";
(GVAR(squad_member5_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member5_text_US)#0) ctrlSetPosition SQUAD_MEMBER5_TEXT_US_POS;
(GVAR(squad_member5_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member5_text_US)#0) ctrlCommit 0;

(GVAR(squad_member5_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member5_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member5_heart_US)#0) ctrlSetPosition SQUAD_MEMBER5_HEART_US_POS;
(GVAR(squad_member5_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member5_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member6_text_US)#0) ctrlSetText "";
(GVAR(squad_member6_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member6_text_US)#0) ctrlSetPosition SQUAD_MEMBER6_TEXT_US_POS;
(GVAR(squad_member6_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member6_text_US)#0) ctrlCommit 0;

(GVAR(squad_member6_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member6_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member6_heart_US)#0) ctrlSetPosition SQUAD_MEMBER6_HEART_US_POS;
(GVAR(squad_member6_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member6_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member7_text_US)#0) ctrlSetText "";
(GVAR(squad_member7_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member7_text_US)#0) ctrlSetPosition SQUAD_MEMBER7_TEXT_US_POS;
(GVAR(squad_member7_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member7_text_US)#0) ctrlCommit 0;

(GVAR(squad_member7_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member7_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member7_heart_US)#0) ctrlSetPosition SQUAD_MEMBER7_HEART_US_POS;
(GVAR(squad_member7_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member7_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member8_text_US)#0) ctrlSetText "";
(GVAR(squad_member8_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member8_text_US)#0) ctrlSetPosition SQUAD_MEMBER8_TEXT_US_POS;
(GVAR(squad_member8_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member8_text_US)#0) ctrlCommit 0;

(GVAR(squad_member8_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member8_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member8_heart_US)#0) ctrlSetPosition SQUAD_MEMBER8_HEART_US_POS;
(GVAR(squad_member8_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member8_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member9_text_US)#0) ctrlSetText "";
(GVAR(squad_member9_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member9_text_US)#0) ctrlSetPosition SQUAD_MEMBER9_TEXT_US_POS;
(GVAR(squad_member9_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member9_text_US)#0) ctrlCommit 0;

(GVAR(squad_member9_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member9_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member9_heart_US)#0) ctrlSetPosition SQUAD_MEMBER9_HEART_US_POS;
(GVAR(squad_member9_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member9_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member10_text_US)#0) ctrlSetText "";
(GVAR(squad_member10_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member10_text_US)#0) ctrlSetPosition SQUAD_MEMBER10_TEXT_US_POS;
(GVAR(squad_member10_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member10_text_US)#0) ctrlCommit 0;

(GVAR(squad_member10_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member10_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member10_heart_US)#0) ctrlSetPosition SQUAD_MEMBER10_HEART_US_POS;
(GVAR(squad_member10_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member10_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member11_text_US)#0) ctrlSetText "";
(GVAR(squad_member11_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member11_text_US)#0) ctrlSetPosition SQUAD_MEMBER11_TEXT_US_POS;
(GVAR(squad_member11_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member11_text_US)#0) ctrlCommit 0;

(GVAR(squad_member11_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member11_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member11_heart_US)#0) ctrlSetPosition SQUAD_MEMBER11_HEART_US_POS;
(GVAR(squad_member11_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member11_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member12_text_US)#0) ctrlSetText "";
(GVAR(squad_member12_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member12_text_US)#0) ctrlSetPosition SQUAD_MEMBER12_TEXT_US_POS;
(GVAR(squad_member12_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member12_text_US)#0) ctrlCommit 0;

(GVAR(squad_member12_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member12_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member12_heart_US)#0) ctrlSetPosition SQUAD_MEMBER12_HEART_US_POS;
(GVAR(squad_member12_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member12_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member13_text_US)#0) ctrlSetText "";
(GVAR(squad_member13_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member13_text_US)#0) ctrlSetPosition SQUAD_MEMBER13_TEXT_US_POS;
(GVAR(squad_member13_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member13_text_US)#0) ctrlCommit 0;

(GVAR(squad_member13_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member13_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member13_heart_US)#0) ctrlSetPosition SQUAD_MEMBER13_HEART_US_POS;
(GVAR(squad_member13_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member13_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member14_text_US)#0) ctrlSetText "";
(GVAR(squad_member14_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member14_text_US)#0) ctrlSetPosition SQUAD_MEMBER14_TEXT_US_POS;
(GVAR(squad_member14_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member14_text_US)#0) ctrlCommit 0;

(GVAR(squad_member14_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member14_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member14_heart_US)#0) ctrlSetPosition SQUAD_MEMBER14_HEART_US_POS;
(GVAR(squad_member14_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member14_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member15_text_US)#0) ctrlSetText "";
(GVAR(squad_member15_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member15_text_US)#0) ctrlSetPosition SQUAD_MEMBER15_TEXT_US_POS;
(GVAR(squad_member15_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member15_text_US)#0) ctrlCommit 0;

(GVAR(squad_member15_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member15_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member15_heart_US)#0) ctrlSetPosition SQUAD_MEMBER15_HEART_US_POS;
(GVAR(squad_member15_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member15_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member16_text_US)#0) ctrlSetText "";
(GVAR(squad_member16_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member16_text_US)#0) ctrlSetPosition SQUAD_MEMBER16_TEXT_US_POS;
(GVAR(squad_member16_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member16_text_US)#0) ctrlCommit 0;

(GVAR(squad_member16_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member16_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member16_heart_US)#0) ctrlSetPosition SQUAD_MEMBER17_HEART_US_POS;
(GVAR(squad_member16_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member16_heart_US)#0) ctrlCommit 0;

(GVAR(squad_member17_text_US)#0) ctrlSetText "";
(GVAR(squad_member17_text_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member17_text_US)#0) ctrlSetPosition SQUAD_MEMBER17_TEXT_US_POS;
(GVAR(squad_member17_text_US)#0) ctrlSetFade 1;
(GVAR(squad_member17_text_US)#0) ctrlCommit 0;

(GVAR(squad_member17_heart_US)#0) ctrlSetText "z\exterra\addons\huds\data\hudUI_US\exterra_huds_squadHeart_US.paa";
(GVAR(squad_member17_heart_US)#0) ctrlSetTextColor [0,0,0,0];
(GVAR(squad_member17_heart_US)#0) ctrlSetPosition SQUAD_MEMBER17_HEART_US_POS;
(GVAR(squad_member17_heart_US)#0) ctrlSetFade 1;
(GVAR(squad_member17_heart_US)#0) ctrlCommit 0;

GVAR(squad_memberAddressArray_US) = [
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
    (GVAR(squad_member17_text_US)#0)
];

GVAR(squad_heartAddressArray_US) = [
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
    (GVAR(squad_member17_heart_US)#0)
];

GVAR(rangefinder_addressArray_US) = [
    (GVAR(rangefinder_range_US)#0),
    (GVAR(rangefinder_bearing_US)#0),
    (GVAR(rangefinder_grid_US)#0)
];

GVAR(weapon_addressArray_US) = [
    (GVAR(weapon_weaponMagazines_text_US)#0),
    (GVAR(weapon_fireMode_text_US)#0),
    (GVAR(weapon_weaponZero_text_US)#0)
];

GVAR(grenade_addressArray_US) = [
    (GVAR(weapon_grenade_text_US)#0),
    (GVAR(weapon_grenadeAmount_text_US)#0)
];

GVAR(weaponIcons_addressArray_US) = [
    (GVAR(weapon_currentWeapon_US)#0),
    (GVAR(weapon_secondWeapon_US)#0),
    (GVAR(weapon_launcher_US)#0),
    (GVAR(weapon_grenade_US)#0)
];






/*LRSS_fnc_mjolnirTriangulatePos = {
	_pos = _this select 0;
	_M = _this select 1;
	_360 = _this select 2;

	_NewX = _M * (sin _360) + (_Pos select 0);
	_NewY = _M * (cos _360) + (_Pos select 1);

	[_NewX,_NewY,0]
};*/
