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

params ["_positionAdjustX", "_positionAdjustY"];

(GVAR(helmetOutline_US)#0) ctrlSetPosition HUD_HELMET_BACKGROUND_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(helmetOutline_US)#0) ctrlCommit 0;

(GVAR(hudOutline_US)#0) ctrlSetPosition HUD_MASTER_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudOutline_US)#0) ctrlCommit 0;

(GVAR(hudLines_US)#0) ctrlSetPosition HUD_MASTER_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudLines_US)#0) ctrlCommit 0;

(GVAR(hudText_US)#0) ctrlSetPosition HUD_MASTER_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudText_US)#0) ctrlCommit 0;

(GVAR(hudBootLogo_US)#0) ctrlSetPosition HUD_BOOT_LOGO_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudBootBist_US)#0) ctrlSetPosition HUD_BOOT_BIST_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudBootText_US)#0) ctrlSetPosition HUD_BOOT_TEXT_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudBootLogo_US)#0) ctrlCommit 0;
(GVAR(hudBootBist_US)#0) ctrlCommit 0;
(GVAR(hudBootText_US)#0) ctrlCommit 0;

(GVAR(hudExtAtm_text_US)#0) ctrlSetPosition HUD_EXT_ATM_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudExtAtm_text_US)#0) ctrlCommit 0;

(GVAR(hudEnvironRad_text_US)#0) ctrlSetPosition HUD_ENVIRON_RAD_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudEnvironRad_text_US)#0) ctrlCommit 0;

(GVAR(hudRadTotal_text_US)#0) ctrlSetPosition HUD_RAD_TOTAL_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudRadTotal_text_US)#0) ctrlCommit 0;

(GVAR(hudTempInt_text_US)#0) ctrlSetPosition HUD_TEMP_INT_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudTempInt_text_US)#0) ctrlCommit 0;

(GVAR(hudTempExt_text_US)#0) ctrlSetPosition HUD_TEMP_EXT_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudTempExt_text_US)#0) ctrlCommit 0;

(GVAR(hudTmeDangTemp_text_US)#0) ctrlSetPosition HUD_TME_DANG_TEMP_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudTmeDangTemp_text_US)#0) ctrlCommit 0;

(GVAR(hudTempWatt_text_US)#0) ctrlSetPosition HUD_TEMP_WATT_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudTempWatt_text_US)#0) ctrlCommit 0;

(GVAR(hudBearing_text_US)#0) ctrlSetPosition HUD_BEARING_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudBearing_text_US)#0) ctrlCommit 0;

(GVAR(hudGrid_text_US)#0) ctrlSetPosition HUD_GRID_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudGrid_text_US)#0) ctrlCommit 0;

(GVAR(hudRange_text_US)#0) ctrlSetPosition HUD_RANGE_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudRange_text_US)#0) ctrlCommit 0;

(GVAR(hudAirEstTime_text_US)#0) ctrlSetPosition HUD_AIR_EST_TIME_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudAirEstTime_text_US)#0) ctrlCommit 0;

(GVAR(hudBattEstTime_text_US)#0) ctrlSetPosition HUD_BATT_EST_TIME_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudBattEstTime_text_US)#0) ctrlCommit 0;

(GVAR(hudMagCount_text_US)#0) ctrlSetPosition HUD_MAG_COUNT_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudMagCount_text_US)#0) ctrlCommit 0;

(GVAR(hudFireMode_text_US)#0) ctrlSetPosition HUD_FIRE_MODE_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudFireMode_text_US)#0) ctrlCommit 0;

(GVAR(hudWeaponZero_text_US)#0) ctrlSetPosition HUD_WEAPON_ZERO_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudWeaponZero_text_US)#0) ctrlCommit 0;

(GVAR(hudGrenadeCount_text_US)#0) ctrlSetPosition HUD_GRENADE_COUNT_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudGrenadeCount_text_US)#0) ctrlCommit 0;

(GVAR(hudWeaponPrimary_US)#0) ctrlSetPosition HUD_WEAPON_PRIMARY_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudWeaponPrimary_US)#0) ctrlCommit 0;

(GVAR(hudWeaponSecondary_US)#0) ctrlSetPosition HUD_WEAPON_SECONDARY_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudWeaponSecondary_US)#0) ctrlCommit 0;

(GVAR(hudWeaponLauncher_US)#0) ctrlSetPosition HUD_WEAPON_LAUNCHER_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudWeaponLauncher_US)#0) ctrlCommit 0;

(GVAR(hudWeaponGrenade_US)#0) ctrlSetPosition HUD_WEAPON_GRENADE_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudWeaponGrenade_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name0_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME0_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr0_text_US)#0) ctrlSetPosition HUD_SQUAD_HR0_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp0_text_US)#0) ctrlSetPosition HUD_SQUAD_BP0_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink0_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK0_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name0_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr0_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp0_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink0_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name1_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME1_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr1_text_US)#0) ctrlSetPosition HUD_SQUAD_HR1_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp1_text_US)#0) ctrlSetPosition HUD_SQUAD_BP1_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink1_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK1_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name1_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr1_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp1_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink1_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name2_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME2_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr2_text_US)#0) ctrlSetPosition HUD_SQUAD_HR2_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp2_text_US)#0) ctrlSetPosition HUD_SQUAD_BP2_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink2_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK2_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name2_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr2_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp2_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink2_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name3_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME3_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr3_text_US)#0) ctrlSetPosition HUD_SQUAD_HR3_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp3_text_US)#0) ctrlSetPosition HUD_SQUAD_BP3_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink3_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK3_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name3_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr3_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp3_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink3_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name4_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME4_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr4_text_US)#0) ctrlSetPosition HUD_SQUAD_HR4_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp4_text_US)#0) ctrlSetPosition HUD_SQUAD_BP4_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink4_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK4_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name4_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr4_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp4_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink4_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name5_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME5_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr5_text_US)#0) ctrlSetPosition HUD_SQUAD_HR5_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp5_text_US)#0) ctrlSetPosition HUD_SQUAD_BP5_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink5_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK5_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name5_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr5_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp5_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink5_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name6_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME6_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr6_text_US)#0) ctrlSetPosition HUD_SQUAD_HR6_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp6_text_US)#0) ctrlSetPosition HUD_SQUAD_BP6_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink6_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK6_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name6_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr6_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp6_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink6_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name7_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME7_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr7_text_US)#0) ctrlSetPosition HUD_SQUAD_HR7_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp7_text_US)#0) ctrlSetPosition HUD_SQUAD_BP7_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink7_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK7_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name7_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr7_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp7_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink7_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name8_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME8_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr8_text_US)#0) ctrlSetPosition HUD_SQUAD_HR8_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp8_text_US)#0) ctrlSetPosition HUD_SQUAD_BP8_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink8_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK8_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name8_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr8_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp8_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink8_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name9_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME9_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_hr9_text_US)#0) ctrlSetPosition HUD_SQUAD_HR9_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_bp9_text_US)#0) ctrlSetPosition HUD_SQUAD_BP9_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_datalink9_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK9_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudSquad_name9_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_hr9_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_bp9_text_US)#0) ctrlCommit 0;
(GVAR(hudSquad_datalink9_text_US)#0) ctrlCommit 0;

//(GVAR(hudMasterControl_US)#0) ctrlSetPosition HUD_MASTER_US_POS(_positionAdjustX,_positionAdjustY);
//(GVAR(hudMasterControl_US)#0) ctrlCommit 0;

(GVAR(hudAirProgress_US)#0) ctrlSetPosition HUD_AIR_PROGRESS_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudAirProgress_US)#0) ctrlCommit 0;

(GVAR(hudBattProgress_US)#0) ctrlSetPosition HUD_BATT_PROGRESS_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudBattProgress_US)#0) ctrlCommit 0;
