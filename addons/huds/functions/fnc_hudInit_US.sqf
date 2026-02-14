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

QGVAR(HUD_US) cutText ["","PLAIN",-1,false];

QGVAR(HUD_US) cutRsc [QGVAR(HUD_US), "PLAIN", -1, false, false];

with uiNamespace do {
    private _displayHUD_US = uiNamespace getVariable QGVAR(HUD_US);

    GVAR(hudMasterControl_US) = _displayHUD_US displayCtrl MASTER_CONTROL_US_IDC;
    GVAR(hudOutline_US) = _displayHUD_US displayCtrl HUD_OUTLINE_US_IDC;

    GVAR(hudAirProgress_US) = _displayHUD_US displayCtrl HUD_AIR_PROGRESS_US_IDC;
    GVAR(hudBattProgress_US) = _displayHUD_US displayCtrl HUD_BATT_PROGRESS_US_IDC;

    GVAR(hudLines_US) = _displayHUD_US displayCtrl HUD_OUTLINE_LINES_US_IDC;
    GVAR(hudText_US) = _displayHUD_US displayCtrl HUD_OUTLINE_TEXT_US_IDC;

    GVAR(hudExtAtm_text_US) = _displayHUD_US displayCtrl HUD_EXT_ATM_US_IDC;
    GVAR(hudEnvironRad_text_US) = _displayHUD_US displayCtrl HUD_ENVIRON_RAD_US_IDC;
    GVAR(hudRadTotal_text_US) = _displayHUD_US displayCtrl HUD_RAD_TOTAL_US_IDC;
    GVAR(hudTempInt_text_US) = _displayHUD_US displayCtrl HUD_TEMP_INT_US_IDC;
    GVAR(hudTempExt_text_US) = _displayHUD_US displayCtrl HUD_TEMP_EXT_US_IDC;
    GVAR(hudTmeDangTemp_text_US) = _displayHUD_US displayCtrl HUD_TME_DANG_TEMP_US_IDC;
    GVAR(hudTempWatt_text_US) = _displayHUD_US displayCtrl HUD_TEMP_WATT_US_IDC;
    GVAR(hudBearing_text_US) = _displayHUD_US displayCtrl HUD_BEARING_US_IDC;
    GVAR(hudGrid_text_US) = _displayHUD_US displayCtrl HUD_GRID_US_IDC;
    GVAR(hudRange_text_US) = _displayHUD_US displayCtrl HUD_RANGE_US_IDC;
    GVAR(hudAirEstTime_text_US) = _displayHUD_US displayCtrl HUD_AIR_EST_TIME_US_IDC;
    GVAR(hudBattEstTime_text_US) = _displayHUD_US displayCtrl HUD_BATT_EST_TIME_US_IDC;

    GVAR(hudMagCount_text_US) = _displayHUD_US displayCtrl HUD_MAG_COUNT_US_IDC;
    GVAR(hudFireMode_text_US) = _displayHUD_US displayCtrl HUD_FIRE_MODE_US_IDC;
    GVAR(hudWeaponZero_text_US) = _displayHUD_US displayCtrl HUD_WEAPON_ZERO_US_IDC;
    GVAR(hudGrenadeCount_text_US) = _displayHUD_US displayCtrl HUD_GRENADE_COUNT_US_IDC;
    GVAR(hudWeaponPrimary_US) = _displayHUD_US displayCtrl HUD_WEAPON_PRIMARY_US_IDC;
    GVAR(hudWeaponSecondary_US) = _displayHUD_US displayCtrl HUD_WEAPON_SECONDARY_US_IDC;
    GVAR(hudWeaponLauncher_US) = _displayHUD_US displayCtrl HUD_WEAPON_LAUNCHER_US_IDC;
    GVAR(hudWeaponGrenade_US) = _displayHUD_US displayCtrl HUD_WEAPON_GRENADE_US_IDC;

    GVAR(hudSquad_name0_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME0_US_IDC;
    GVAR(hudSquad_hr0_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR0_US_IDC;
    GVAR(hudSquad_bp0_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP0_US_IDC;
    GVAR(hudSquad_datalink0_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK0_US_IDC;

    GVAR(hudSquad_name1_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME1_US_IDC;
    GVAR(hudSquad_hr1_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR1_US_IDC;
    GVAR(hudSquad_bp1_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP1_US_IDC;
    GVAR(hudSquad_datalink1_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK1_US_IDC;

    GVAR(hudSquad_name2_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME2_US_IDC;
    GVAR(hudSquad_hr2_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR2_US_IDC;
    GVAR(hudSquad_bp2_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP2_US_IDC;
    GVAR(hudSquad_datalink2_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK2_US_IDC;

    GVAR(hudSquad_name3_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME3_US_IDC;
    GVAR(hudSquad_hr3_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR3_US_IDC;
    GVAR(hudSquad_bp3_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP3_US_IDC;
    GVAR(hudSquad_datalink3_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK3_US_IDC;

    GVAR(hudSquad_name4_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME4_US_IDC;
    GVAR(hudSquad_hr4_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR4_US_IDC;
    GVAR(hudSquad_bp4_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP4_US_IDC;
    GVAR(hudSquad_datalink4_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK4_US_IDC;

    GVAR(hudSquad_name5_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME5_US_IDC;
    GVAR(hudSquad_hr5_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR5_US_IDC;
    GVAR(hudSquad_bp5_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP5_US_IDC;
    GVAR(hudSquad_datalink5_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK5_US_IDC;

    GVAR(hudSquad_name6_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME6_US_IDC;
    GVAR(hudSquad_hr6_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR6_US_IDC;
    GVAR(hudSquad_bp6_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP6_US_IDC;
    GVAR(hudSquad_datalink6_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK6_US_IDC;

    GVAR(hudSquad_name7_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME7_US_IDC;
    GVAR(hudSquad_hr7_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR7_US_IDC;
    GVAR(hudSquad_bp7_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP7_US_IDC;
    GVAR(hudSquad_datalink7_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK7_US_IDC;

    GVAR(hudSquad_name8_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME8_US_IDC;
    GVAR(hudSquad_hr8_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR8_US_IDC;
    GVAR(hudSquad_bp8_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP8_US_IDC;
    GVAR(hudSquad_datalink8_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK8_US_IDC;

    GVAR(hudSquad_name9_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_NAME9_US_IDC;
    GVAR(hudSquad_hr9_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_HR9_US_IDC;
    GVAR(hudSquad_bp9_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_BP9_US_IDC;
    GVAR(hudSquad_datalink9_text_US) = _displayHUD_US displayCtrl HUD_SQUAD_DATALINK9_US_IDC;

};

GVAR(hudMasterControl_US) = [uiNamespace getVariable QGVAR(hudMasterControl_US)];
GVAR(hudOutline_US) = [uiNamespace getVariable QGVAR(hudOutline_US)];

GVAR(hudAirProgress_US) = [uiNamespace getVariable QGVAR(hudAirProgress_US)];
GVAR(hudBattProgress_US) = [uiNamespace getVariable QGVAR(hudBattProgress_US)];

GVAR(hudLines_US) = [uiNamespace getVariable QGVAR(hudLines_US)];
GVAR(hudText_US) = [uiNamespace getVariable QGVAR(hudText_US)];

GVAR(hudExtAtm_text_US) = [uiNamespace getVariable QGVAR(hudExtAtm_text_US)];
GVAR(hudEnvironRad_text_US) = [uiNamespace getVariable QGVAR(hudEnvironRad_text_US)];
GVAR(hudRadTotal_text_US) = [uiNamespace getVariable QGVAR(hudRadTotal_text_US)];
GVAR(hudTempInt_text_US) = [uiNamespace getVariable QGVAR(hudTempInt_text_US)];
GVAR(hudTempExt_text_US) = [uiNamespace getVariable QGVAR(hudTempExt_text_US)];
GVAR(hudTmeDangTemp_text_US) = [uiNamespace getVariable QGVAR(hudTmeDangTemp_text_US)];
GVAR(hudTempWatt_text_US) = [uiNamespace getVariable QGVAR(hudTempWatt_text_US)];
GVAR(hudBearing_text_US) = [uiNamespace getVariable QGVAR(hudBearing_text_US)];
GVAR(hudGrid_text_US) = [uiNamespace getVariable QGVAR(hudGrid_text_US)];
GVAR(hudRange_text_US) = [uiNamespace getVariable QGVAR(hudRange_text_US)];
GVAR(hudAirEstTime_text_US) = [uiNamespace getVariable QGVAR(hudAirEstTime_text_US)];
GVAR(hudBattEstTime_text_US) = [uiNamespace getVariable QGVAR(hudBattEstTime_text_US)];

GVAR(hudMagCount_text_US) = [uiNamespace getVariable QGVAR(hudMagCount_text_US)];
GVAR(hudFireMode_text_US) = [uiNamespace getVariable QGVAR(hudFireMode_text_US)];
GVAR(hudWeaponZero_text_US) = [uiNamespace getVariable QGVAR(hudWeaponZero_text_US)];
GVAR(hudGrenadeCount_text_US) = [uiNamespace getVariable QGVAR(hudGrenadeCount_text_US)];
GVAR(hudWeaponPrimary_US) = [uiNamespace getVariable QGVAR(hudWeaponPrimary_US)];
GVAR(hudWeaponSecondary_US) = [uiNamespace getVariable QGVAR(hudWeaponSecondary_US)];
GVAR(hudWeaponLauncher_US) = [uiNamespace getVariable QGVAR(hudWeaponLauncher_US)];
GVAR(hudWeaponGrenade_US) = [uiNamespace getVariable QGVAR(hudWeaponGrenade_US)];

GVAR(hudSquad_name0_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name0_text_US)];
GVAR(hudSquad_hr0_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr0_text_US)];
GVAR(hudSquad_bp0_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp0_text_US)];
GVAR(hudSquad_datalink0_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink0_text_US)];

GVAR(hudSquad_name1_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name1_text_US)];
GVAR(hudSquad_hr1_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr1_text_US)];
GVAR(hudSquad_bp1_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp1_text_US)];
GVAR(hudSquad_datalink1_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink1_text_US)];

GVAR(hudSquad_name2_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name2_text_US)];
GVAR(hudSquad_hr2_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr2_text_US)];
GVAR(hudSquad_bp2_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp2_text_US)];
GVAR(hudSquad_datalink2_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink2_text_US)];

GVAR(hudSquad_name3_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name3_text_US)];
GVAR(hudSquad_hr3_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr3_text_US)];
GVAR(hudSquad_bp3_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp3_text_US)];
GVAR(hudSquad_datalink3_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink3_text_US)];

GVAR(hudSquad_name4_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name4_text_US)];
GVAR(hudSquad_hr4_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr4_text_US)];
GVAR(hudSquad_bp4_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp4_text_US)];
GVAR(hudSquad_datalink4_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink4_text_US)];

GVAR(hudSquad_name5_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name5_text_US)];
GVAR(hudSquad_hr5_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr5_text_US)];
GVAR(hudSquad_bp5_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp5_text_US)];
GVAR(hudSquad_datalink5_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink5_text_US)];

GVAR(hudSquad_name6_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name6_text_US)];
GVAR(hudSquad_hr6_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr6_text_US)];
GVAR(hudSquad_bp6_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp6_text_US)];
GVAR(hudSquad_datalink6_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink6_text_US)];

GVAR(hudSquad_name7_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name7_text_US)];
GVAR(hudSquad_hr7_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr7_text_US)];
GVAR(hudSquad_bp7_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp7_text_US)];
GVAR(hudSquad_datalink7_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink7_text_US)];

GVAR(hudSquad_name8_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name8_text_US)];
GVAR(hudSquad_hr8_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr8_text_US)];
GVAR(hudSquad_bp8_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp8_text_US)];
GVAR(hudSquad_datalink8_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink8_text_US)];

GVAR(hudSquad_name9_text_US) = [uiNamespace getVariable QGVAR(hudSquad_name9_text_US)];
GVAR(hudSquad_hr9_text_US) = [uiNamespace getVariable QGVAR(hudSquad_hr9_text_US)];
GVAR(hudSquad_bp9_text_US) = [uiNamespace getVariable QGVAR(hudSquad_bp9_text_US)];
GVAR(hudSquad_datalink9_text_US) = [uiNamespace getVariable QGVAR(hudSquad_datalink9_text_US)];

(GVAR(hudOutline_US)#0) ctrlSetPosition HUD_OUTLINE_US_POS;
(GVAR(hudOutline_US)#0) ctrlSetFade 0;
(GVAR(hudOutline_US)#0) ctrlCommit 0;

(GVAR(hudLines_US)#0) ctrlSetPosition HUD_OUTLINE_LINES_US_POS;
(GVAR(hudLines_US)#0) ctrlSetFade 0;
(GVAR(hudLines_US)#0) ctrlCommit 0;

(GVAR(hudText_US)#0) ctrlSetPosition HUD_OUTLINE_TEXT_US_POS;
(GVAR(hudText_US)#0) ctrlSetFade 0;
(GVAR(hudText_US)#0) ctrlCommit 0;

(GVAR(hudAirProgress_US)#0) progressSetPosition 1;
(GVAR(hudAirProgress_US)#0) ctrlSetTextColor [0,0,1,1];
(GVAR(hudAirProgress_US)#0) ctrlSetFade 0;
(GVAR(hudAirProgress_US)#0) ctrlCommit 0;

(GVAR(hudBattProgress_US)#0) progressSetPosition 1;
(GVAR(hudBattProgress_US)#0) ctrlSetTextColor [0.5,0.5,0,1];
(GVAR(hudBattProgress_US)#0) ctrlSetFade 0;
(GVAR(hudBattProgress_US)#0) ctrlCommit 0;

(GVAR(hudExtAtm_text_US)#0) ctrlSetPosition HUD_EXT_ATM_US_POS;
(GVAR(hudExtAtm_text_US)#0) ctrlSetStructuredText parseText "<t size='1.0'>Error</t>";
(GVAR(hudExtAtm_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudExtAtm_text_US)#0) ctrlSetFade 0;
(GVAR(hudExtAtm_text_US)#0) ctrlCommit 0;

(GVAR(hudEnvironRad_text_US)#0) ctrlSetPosition HUD_ENVIRON_RAD_US_POS;
(GVAR(hudEnvironRad_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudEnvironRad_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudEnvironRad_text_US)#0) ctrlSetFade 0;
(GVAR(hudEnvironRad_text_US)#0) ctrlCommit 0;

(GVAR(hudRadTotal_text_US)#0) ctrlSetPosition HUD_RAD_TOTAL_US_POS;
(GVAR(hudRadTotal_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudRadTotal_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudRadTotal_text_US)#0) ctrlSetFade 0;
(GVAR(hudRadTotal_text_US)#0) ctrlCommit 0;

(GVAR(hudTempInt_text_US)#0) ctrlSetPosition HUD_TEMP_INT_US_POS;
(GVAR(hudTempInt_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudTempInt_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudTempInt_text_US)#0) ctrlSetFade 0;
(GVAR(hudTempInt_text_US)#0) ctrlCommit 0;

(GVAR(hudTempExt_text_US)#0) ctrlSetPosition HUD_TEMP_EXT_US_POS;
(GVAR(hudTempExt_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudTempExt_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudTempExt_text_US)#0) ctrlSetFade 0;
(GVAR(hudTempExt_text_US)#0) ctrlCommit 0;

(GVAR(hudTmeDangTemp_text_US)#0) ctrlSetPosition HUD_TME_DANG_TEMP_US_POS;
(GVAR(hudTmeDangTemp_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudTmeDangTemp_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudTmeDangTemp_text_US)#0) ctrlSetFade 0;
(GVAR(hudTmeDangTemp_text_US)#0) ctrlCommit 0;

(GVAR(hudTempWatt_text_US)#0) ctrlSetPosition HUD_TEMP_WATT_US_POS;
(GVAR(hudTempWatt_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudTempWatt_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudTempWatt_text_US)#0) ctrlSetFade 0;
(GVAR(hudTempWatt_text_US)#0) ctrlCommit 0;

(GVAR(hudBearing_text_US)#0) ctrlSetPosition HUD_BEARING_US_POS;
(GVAR(hudBearing_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudBearing_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudBearing_text_US)#0) ctrlSetFade 0;
(GVAR(hudBearing_text_US)#0) ctrlCommit 0;

(GVAR(hudGrid_text_US)#0) ctrlSetPosition HUD_GRID_US_POS;
(GVAR(hudGrid_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudGrid_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudGrid_text_US)#0) ctrlSetFade 0;
(GVAR(hudGrid_text_US)#0) ctrlCommit 0;

(GVAR(hudRange_text_US)#0) ctrlSetPosition HUD_RANGE_US_POS;
(GVAR(hudRange_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudRange_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudRange_text_US)#0) ctrlSetFade 0;
(GVAR(hudRange_text_US)#0) ctrlCommit 0;

(GVAR(hudAirEstTime_text_US)#0) ctrlSetPosition HUD_AIR_EST_TIME_US_POS;
(GVAR(hudAirEstTime_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudAirEstTime_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudAirEstTime_text_US)#0) ctrlSetFade 0;
(GVAR(hudAirEstTime_text_US)#0) ctrlCommit 0;

(GVAR(hudBattEstTime_text_US)#0) ctrlSetPosition HUD_BATT_EST_TIME_US_POS;
(GVAR(hudBattEstTime_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudBattEstTime_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudBattEstTime_text_US)#0) ctrlSetFade 0;
(GVAR(hudBattEstTime_text_US)#0) ctrlCommit 0;

(GVAR(hudMagCount_text_US)#0) ctrlSetPosition HUD_MAG_COUNT_US_POS;
(GVAR(hudMagCount_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudMagCount_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudMagCount_text_US)#0) ctrlSetFade 0;
(GVAR(hudMagCount_text_US)#0) ctrlCommit 0;

(GVAR(hudFireMode_text_US)#0) ctrlSetPosition HUD_FIRE_MODE_US_POS;
(GVAR(hudFireMode_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudFireMode_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudFireMode_text_US)#0) ctrlSetFade 0;
(GVAR(hudFireMode_text_US)#0) ctrlCommit 0;

(GVAR(hudWeaponZero_text_US)#0) ctrlSetPosition HUD_WEAPON_ZERO_US_POS;
(GVAR(hudWeaponZero_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudWeaponZero_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudWeaponZero_text_US)#0) ctrlSetFade 0;
(GVAR(hudWeaponZero_text_US)#0) ctrlCommit 0;

(GVAR(hudGrenadeCount_text_US)#0) ctrlSetPosition HUD_GRENADE_COUNT_US_POS;
(GVAR(hudGrenadeCount_text_US)#0) ctrlSetStructuredText parseText "<t size='0.8'>Error</t>";
(GVAR(hudGrenadeCount_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudGrenadeCount_text_US)#0) ctrlSetFade 0;
(GVAR(hudGrenadeCount_text_US)#0) ctrlCommit 0;

(GVAR(hudWeaponPrimary_US)#0) ctrlSetPosition HUD_WEAPON_PRIMARY_US_POS;
(GVAR(hudWeaponPrimary_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudWeaponPrimary_US)#0) ctrlSetFade 0;
(GVAR(hudWeaponPrimary_US)#0) ctrlCommit 0;

(GVAR(hudWeaponSecondary_US)#0) ctrlSetPosition HUD_WEAPON_SECONDARY_US_POS;
(GVAR(hudWeaponSecondary_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudWeaponSecondary_US)#0) ctrlSetFade 0;
(GVAR(hudWeaponSecondary_US)#0) ctrlCommit 0;

(GVAR(hudWeaponLauncher_US)#0) ctrlSetPosition HUD_WEAPON_LAUNCHER_US_POS;
(GVAR(hudWeaponLauncher_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudWeaponLauncher_US)#0) ctrlSetFade 0;
(GVAR(hudWeaponLauncher_US)#0) ctrlCommit 0;

(GVAR(hudWeaponGrenade_US)#0) ctrlSetPosition HUD_WEAPON_GRENADE_US_POS;
(GVAR(hudWeaponGrenade_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudWeaponGrenade_US)#0) ctrlSetFade 0;
(GVAR(hudWeaponGrenade_US)#0) ctrlCommit 0;


(GVAR(hudSquad_name0_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME0_US_POS;
(GVAR(hudSquad_name0_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name0_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name0_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name0_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr0_text_US)#0) ctrlSetPosition HUD_SQUAD_HR0_US_POS;
(GVAR(hudSquad_hr0_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr0_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr0_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr0_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp0_text_US)#0) ctrlSetPosition HUD_SQUAD_BP0_US_POS;
(GVAR(hudSquad_bp0_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp0_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp0_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp0_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink0_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK0_US_POS;
(GVAR(hudSquad_datalink0_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink0_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink0_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink0_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name1_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME1_US_POS;
(GVAR(hudSquad_name1_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name1_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name1_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name1_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr1_text_US)#0) ctrlSetPosition HUD_SQUAD_HR1_US_POS;
(GVAR(hudSquad_hr1_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr1_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr1_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr1_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp1_text_US)#0) ctrlSetPosition HUD_SQUAD_BP1_US_POS;
(GVAR(hudSquad_bp1_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp1_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp1_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp1_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink1_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK1_US_POS;
(GVAR(hudSquad_datalink1_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink1_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink1_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink1_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name2_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME2_US_POS;
(GVAR(hudSquad_name2_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name2_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name2_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name2_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr2_text_US)#0) ctrlSetPosition HUD_SQUAD_HR2_US_POS;
(GVAR(hudSquad_hr2_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr2_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr2_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr2_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp2_text_US)#0) ctrlSetPosition HUD_SQUAD_BP2_US_POS;
(GVAR(hudSquad_bp2_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp2_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp2_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp2_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink2_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK2_US_POS;
(GVAR(hudSquad_datalink2_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink2_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink2_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink2_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name3_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME3_US_POS;
(GVAR(hudSquad_name3_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name3_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name3_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name3_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr3_text_US)#0) ctrlSetPosition HUD_SQUAD_HR3_US_POS;
(GVAR(hudSquad_hr3_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr3_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr3_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr3_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp3_text_US)#0) ctrlSetPosition HUD_SQUAD_BP3_US_POS;
(GVAR(hudSquad_bp3_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp3_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp3_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp3_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink3_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK3_US_POS;
(GVAR(hudSquad_datalink3_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink3_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink3_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink3_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name4_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME4_US_POS;
(GVAR(hudSquad_name4_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name4_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name4_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name4_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr4_text_US)#0) ctrlSetPosition HUD_SQUAD_HR4_US_POS;
(GVAR(hudSquad_hr4_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr4_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr4_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr4_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp4_text_US)#0) ctrlSetPosition HUD_SQUAD_BP4_US_POS;
(GVAR(hudSquad_bp4_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp4_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp4_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp4_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink4_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK4_US_POS;
(GVAR(hudSquad_datalink4_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink4_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink4_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink4_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name5_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME5_US_POS;
(GVAR(hudSquad_name5_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name5_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name5_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name5_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr5_text_US)#0) ctrlSetPosition HUD_SQUAD_HR5_US_POS;
(GVAR(hudSquad_hr5_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr5_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr5_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr5_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp5_text_US)#0) ctrlSetPosition HUD_SQUAD_BP5_US_POS;
(GVAR(hudSquad_bp5_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp5_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp5_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp5_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink5_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK5_US_POS;
(GVAR(hudSquad_datalink5_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink5_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink5_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink5_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name6_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME6_US_POS;
(GVAR(hudSquad_name6_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name6_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name6_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name6_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr6_text_US)#0) ctrlSetPosition HUD_SQUAD_HR6_US_POS;
(GVAR(hudSquad_hr6_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr6_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr6_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr6_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp6_text_US)#0) ctrlSetPosition HUD_SQUAD_BP6_US_POS;
(GVAR(hudSquad_bp6_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp6_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp6_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp6_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink6_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK6_US_POS;
(GVAR(hudSquad_datalink6_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink6_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink6_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink6_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name7_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME7_US_POS;
(GVAR(hudSquad_name7_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name7_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name7_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name7_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr7_text_US)#0) ctrlSetPosition HUD_SQUAD_HR7_US_POS;
(GVAR(hudSquad_hr7_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr7_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr7_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr7_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp7_text_US)#0) ctrlSetPosition HUD_SQUAD_BP7_US_POS;
(GVAR(hudSquad_bp7_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp7_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp7_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp7_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink7_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK7_US_POS;
(GVAR(hudSquad_datalink7_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink7_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink7_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink7_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name8_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME8_US_POS;
(GVAR(hudSquad_name8_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name8_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name8_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name8_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr8_text_US)#0) ctrlSetPosition HUD_SQUAD_HR8_US_POS;
(GVAR(hudSquad_hr8_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr8_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr8_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr8_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp8_text_US)#0) ctrlSetPosition HUD_SQUAD_BP8_US_POS;
(GVAR(hudSquad_bp8_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp8_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp8_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp8_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink8_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK8_US_POS;
(GVAR(hudSquad_datalink8_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink8_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink8_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink8_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_name9_text_US)#0) ctrlSetPosition HUD_SQUAD_NAME9_US_POS;
(GVAR(hudSquad_name9_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_name9_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_name9_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_name9_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_hr9_text_US)#0) ctrlSetPosition HUD_SQUAD_HR9_US_POS;
(GVAR(hudSquad_hr9_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_hr9_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_hr9_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_hr9_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_bp9_text_US)#0) ctrlSetPosition HUD_SQUAD_BP9_US_POS;
(GVAR(hudSquad_bp9_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_bp9_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_bp9_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_bp9_text_US)#0) ctrlCommit 0;

(GVAR(hudSquad_datalink9_text_US)#0) ctrlSetPosition HUD_SQUAD_DATALINK9_US_POS;
(GVAR(hudSquad_datalink9_text_US)#0) ctrlSetStructuredText parseText "<t size='0.5'></t>";
(GVAR(hudSquad_datalink9_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudSquad_datalink9_text_US)#0) ctrlSetFade 0;
(GVAR(hudSquad_datalink9_text_US)#0) ctrlCommit 0;


//["test", true, "staminaBar", false] call ace_ui_fnc_setElementVisibility;
