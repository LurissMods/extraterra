
// --------------------------------------------------------------------------- General Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_toggleBootUp),
    "CHECKBOX",
    [LSTRING(CBAset_toggleBootUp_title), LSTRING(CBAset_toggleBootUp_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_bootUpSpeed),
    "SLIDER",
    [LSTRING(CBAset_bootUpSpeed_title), LSTRING(CBAset_bootUpSpeed_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0.01, 4, 1, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_tempMeasurementSystem),
    "LIST",
    [LSTRING(CBAset_tempMeasurementSystem_title), LSTRING(CBAset_tempMeasurementSystem_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [
        [0, 1, 2],
        [LSTRING(CBAset_tempMeasurementSystem_opt0), LSTRING(CBAset_tempMeasurementSystem_opt1), LSTRING(CBAset_tempMeasurementSystem_opt2)],
        0
    ],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        params ["_value"];
        GVAR(CBAset_tempMeasurementSystem) = _value;
    },
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_toggleIFF),
    "CHECKBOX",
    [LSTRING(CBAset_toggleIFF_title), LSTRING(CBAset_toggleIFF_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_datalink),
    "LIST",
    [LSTRING(CBAset_datalink_title), LSTRING(CBAset_datalink_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [
        [0, 1, 2],
        [LSTRING(CBAset_datalink_opt0), LSTRING(CBAset_datalink_opt1), LSTRING(CBAset_datalink_opt2)],
        0
    ],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        params ["_value"];
        GVAR(CBAset_datalink) = _value;
    },
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- Suit Whitelist Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_whitelistHelmetsUS),
    "EDITBOX",
    [LSTRING(CBAset_whitelistHelmetsUS_title), LSTRING(CBAset_whitelistHelmetsUS_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "exterra_uniforms_usHelmet0,exterra_uniforms_usHelmet0_camo",
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        private _whitelistArray = GVAR(CBAset_whitelistHelmetsUS) splitString ",";
        {GVAR(whitelistHelmets) append [[_x, US_SUIT_FACTION]]} forEach _whitelistArray;
    },
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_whitelistSuitsUS),
    "EDITBOX",
    [LSTRING(CBAset_whitelistSuitsUS_title), LSTRING(CBAset_whitelistSuitsUS_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "exterra_uniforms_usUndersuit,exterra_uniforms_usBDU0",
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        private _whitelistArray = GVAR(CBAset_whitelistSuitsUS) splitString ",";
        {GVAR(whitelistSuits) append [[_x, US_SUIT_FACTION]]} forEach _whitelistArray;
    },
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_whitelistPacksUS),
    "EDITBOX",
    [LSTRING(CBAset_whitelistPacksUS_title), LSTRING(CBAset_whitelistPacksUS_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "B_Bergen_mcamo_F,B_Carryall_blk",
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        private _whitelistArray = GVAR(CBAset_whitelistPacksUS) splitString ",";
        {GVAR(whitelistPacks) append [[_x, US_SUIT_FACTION]]} forEach _whitelistArray;
    },
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_whitelistHelmetsPRC),
    "EDITBOX",
    [LSTRING(CBAset_whitelistHelmetsPRC_title), LSTRING(CBAset_whitelistHelmetsPRC_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "H_MilCap_blue",
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        private _whitelistArray = GVAR(CBAset_whitelistHelmetsPRC) splitString ",";
        {GVAR(whitelistHelmets) append [[_x, PRC_SUIT_FACTION]]} forEach _whitelistArray;
    },
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_whitelistSuitsPRC),
    "EDITBOX",
    [LSTRING(CBAset_whitelistSuitsPRC_title), LSTRING(CBAset_whitelistSuitsPRC_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "U_O_GhillieSuit",
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        private _whitelistArray = GVAR(CBAset_whitelistSuitsPRC) splitString ",";
        {GVAR(whitelistSuits) append [[_x, PRC_SUIT_FACTION]]} forEach _whitelistArray;
    },
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_whitelistPacksPRC),
    "EDITBOX",
    [LSTRING(CBAset_whitelistPacksPRC_title), LSTRING(CBAset_whitelistPacksPRC_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "B_AssaultPack_blk",
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        private _whitelistArray = GVAR(CBAset_whitelistPacksUS) splitString ",";
        {GVAR(whitelistPacks) append [[_x, PRC_SUIT_FACTION]]} forEach _whitelistArray;
    },
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- HUD PP effects Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_toggleHUDppEffects),
    "CHECKBOX",
    [LSTRING(CBAset_toggleHUDppEffects_title), LSTRING(CBAset_toggleHUDppEffects_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    true,
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudPixelationPower),
    "SLIDER",
    [LSTRING(CBAset_hudPixelationPower_title), LSTRING(CBAset_hudPixelationPower_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [10, 3000, 1200, 0],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudChromAbPower),
    "SLIDER",
    [LSTRING(CBAset_hudChromAbPower_title), LSTRING(CBAset_hudChromAbPower_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 0.1, 0.005, 4],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudRadialBlurPower),
    "SLIDER",
    [LSTRING(CBAset_hudRadialBlurPower_title), LSTRING(CBAset_hudRadialBlurPower_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 0.1, 0.005, 3],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudRadialBlurOffset),
    "SLIDER",
    [LSTRING(CBAset_hudRadialBlurOffset_title), LSTRING(CBAset_hudRadialBlurOffset_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 1, 0.3, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_filmGrainPower),
    "SLIDER",
    [LSTRING(CBAset_filmGrainPower_title), LSTRING(CBAset_filmGrainPower_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 1, 0.1, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- HUD Colour Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_hudOutlineColorUS),
    "COLOR",
    [LSTRING(hudOutlineColor_cbaSetting_title), LSTRING(hudOutlineColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [0.5, 0.84062, 1, 0.6],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudLinesColorUS),
    "COLOR",
    [LSTRING(hudLinesColor_cbaSetting_title), LSTRING(hudLinesColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [1, 1, 1, 0.8],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_airBarColorUS),
    "COLOR",
    [LSTRING(airBarColor_cbaSetting_title), LSTRING(airBarColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [0, 0.405354, 1, 0.6],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_battBarColorUS),
    "COLOR",
    [LSTRING(battBarColor_cbaSetting_title), LSTRING(battBarColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [0.700905, 0.636422, 0, 0.6],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudTextColorUS_normal),
    "COLOR",
    [LSTRING(textColor_cbaSetting_title), LSTRING(textColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [1, 1, 1, 0.8],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudTextColorUS_safe),
    "COLOR",
    [LSTRING(textColor_safe_cbaSetting_title), LSTRING(textColor_safe_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [0.0, 0.85, 0.0, 0.8],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudTextColorUS_caution),
    "COLOR",
    [LSTRING(textColor_caution_cbaSetting_title), LSTRING(textColor_caution_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [0.8, 0.7, 0.0, 0.8],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_hudTextColorUS_danger),
    "COLOR",
    [LSTRING(textColor_danger_cbaSetting_title), LSTRING(textColor_danger_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [0.85, 0.0, 0.0, 0.8],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_groupColorIFF),
    "COLOR",
    [LSTRING(CBAset_groupColorIFF_title), LSTRING(CBAset_groupColorIFF_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [1.000, 1.000, 1.000, 1.000],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_friendColorIFF),
    "COLOR",
    [LSTRING(CBAset_friendColorIFF_title), LSTRING(CBAset_friendColorIFF_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [0, 1.000, 0.5, 1.000],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_neutralColorIFF),
    "COLOR",
    [LSTRING(CBAset_neutralColorIFF_title), LSTRING(CBAset_neutralColorIFF_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [1.000, 1.000, 0.000, 1.000],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_enemyColorIFF),
    "COLOR",
    [LSTRING(CBAset_enemyColorIFF_title), LSTRING(CBAset_enemyColorIFF_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat3)],
    [1.000, 0.200, 0.200, 1.000],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- HUD Crosshair Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_crosshairIcon),
    "EDITBOX",
    [LSTRING(CBAset_crosshairIcon_title), LSTRING(CBAset_crosshairIcon_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat4)],
    QPATHTOF(data\hudUI_US\exterra_huds_crosshair_US.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_crosshairColor),
    "COLOR",
    [LSTRING(CBAset_crosshairColor_title), LSTRING(CBAset_crosshairColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat4)],
    [0.5, 0.84062, 1, 0.4],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_crosshairMaxRange),
    "SLIDER",
    [LSTRING(CBAset_crosshairMaxRange_title), LSTRING(CBAset_crosshairMaxRange_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat4)],
    [1, 1000, 250, 0],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_crosshairMinOpacity),
    "SLIDER",
    [LSTRING(CBAset_crosshairMinOpacity_title), LSTRING(CBAset_crosshairMinOpacity_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat4)],
    [0, 1, 0, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_crosshairMaxOpacity),
    "SLIDER",
    [LSTRING(CBAset_crosshairMaxOpacity_title), LSTRING(CBAset_crosshairMaxOpacity_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat4)],
    [0, 1, 1, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;


// --------------------------------------------------------------------------- HUD Infantry IFF Icon Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_infantryIFF_iconFriend),
    "EDITBOX",
    [LSTRING(CBAset_infantryIFF_iconFriend_title), LSTRING(CBAset_infantryIFF_iconFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    QPATHTOF(data\hudUI_US\exterra_huds_infFriend_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_infantryIFF_maxSizeFriend),
    "SLIDER",
    [LSTRING(CBAset_infantryIFF_maxSizeFriend_title), LSTRING(CBAset_infantryIFF_maxSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    [0.01, 5.00, DEFAULT_MAX_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_infantryIFF_minSizeFriend),
    "SLIDER",
    [LSTRING(CBAset_infantryIFF_minSizeFriend_title), LSTRING(CBAset_infantryIFF_minSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    [0.01, 5, DEFAULT_MIN_IFF_INFANTRY_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_infantryIFF_iconEnemy),
    "EDITBOX",
    [LSTRING(CBAset_infantryIFF_iconEnemy_title), LSTRING(CBAset_infantryIFF_iconEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    QPATHTOF(data\hudUI_US\exterra_huds_infEnemy_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_infantryIFF_maxSizeEnemy),
    "SLIDER",
    [LSTRING(CBAset_infantryIFF_maxSizeEnemy_title), LSTRING(CBAset_infantryIFF_maxSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    [0.01, 5, DEFAULT_MAX_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_infantryIFF_minSizeEnemy),
    "SLIDER",
    [LSTRING(CBAset_infantryIFF_minSizeEnemy_title), LSTRING(CBAset_infantryIFF_minSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    [0.01, 5, DEFAULT_MIN_IFF_INFANTRY_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_infantryIFF_iconNeutral),
    "EDITBOX",
    [LSTRING(CBAset_infantryIFF_iconNeutral_title), LSTRING(CBAset_infantryIFF_iconNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    QPATHTOF(data\hudUI_US\exterra_huds_infNeutral_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_infantryIFF_maxSizeNeutral),
    "SLIDER",
    [LSTRING(CBAset_infantryIFF_maxSizeNeutral_title), LSTRING(CBAset_infantryIFF_maxSizeNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    [0.01, 5, DEFAULT_MAX_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_infantryIFF_minSizeNeutral),
    "SLIDER",
    [LSTRING(CBAset_infantryIFF_minSizeNeutral_title), LSTRING(CBAset_infantryIFF_minSizeNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat5)],
    [0.01, 5, DEFAULT_MIN_IFF_INFANTRY_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- HUD Vehicle IFF Icon Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_vehicleIFF_iconFriend),
    "EDITBOX",
    [LSTRING(CBAset_vehicleIFF_iconFriend_title), LSTRING(CBAset_vehicleIFF_iconFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    QPATHTOF(data\hudUI_US\exterra_huds_vicFriend_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_vehicleIFF_maxSizeFriend),
    "SLIDER",
    [LSTRING(CBAset_vehicleIFF_maxSizeFriend_title), LSTRING(CBAset_vehicleIFF_maxSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    [0.01, 5, DEFAULT_MAX_IFF_VEHICLES_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_vehicleIFF_minSizeFriend),
    "SLIDER",
    [LSTRING(CBAset_vehicleIFF_minSizeFriend_title), LSTRING(CBAset_vehicleIFF_minSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    [0.01, 5, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_vehicleIFF_iconEnemy),
    "EDITBOX",
    [LSTRING(CBAset_vehicleIFF_iconEnemy_title), LSTRING(CBAset_vehicleIFF_iconEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    QPATHTOF(data\hudUI_US\exterra_huds_vicEnemy_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_vehicleIFF_maxSizeEnemy),
    "SLIDER",
    [LSTRING(CBAset_vehicleIFF_maxSizeEnemy_title), LSTRING(CBAset_vehicleIFF_maxSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    [0.01, 5, DEFAULT_MAX_IFF_VEHICLES_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_vehicleIFF_minSizeEnemy),
    "SLIDER",
    [LSTRING(CBAset_vehicleIFF_minSizeEnemy_title), LSTRING(CBAset_vehicleIFF_minSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    [0.01, 10.00, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_vehicleIFF_iconNeutral),
    "EDITBOX",
    [LSTRING(CBAset_vehicleIFF_iconNeutral_title), LSTRING(CBAset_vehicleIFF_iconNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    QPATHTOF(data\hudUI_US\exterra_huds_vicNeutral_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_vehicleIFF_maxSizeNeutral),
    "SLIDER",
    [LSTRING(CBAset_vehicleIFF_maxSizeNeutral_title), LSTRING(CBAset_vehicleIFF_maxSizeNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    [0.01, 5, DEFAULT_MAX_IFF_VEHICLES_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_vehicleIFF_minSizeNeutral),
    "SLIDER",
    [LSTRING(CBAset_vehicleIFF_minSizeNeutral_title), LSTRING(CBAset_vehicleIFF_minSizeNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat6)],
    [0.01, 5, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- HUD Aircraft IFF Icon Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_aircraftIFF_iconFriend),
    "EDITBOX",
    [LSTRING(CBAset_aircraftIFF_iconFriend_title), LSTRING(CBAset_aircraftIFF_iconFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    QPATHTOF(data\hudUI_US\exterra_huds_airFriend_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_aircraftIFF_maxSizeFriend),
    "SLIDER",
    [LSTRING(CBAset_aircraftIFF_maxSizeFriend_title), LSTRING(CBAset_aircraftIFF_maxSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    [0.01, 5, DEFAULT_MAX_IFF_AIRCRAFT_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_aircraftIFF_minSizeFriend),
    "SLIDER",
    [LSTRING(CBAset_aircraftIFF_minSizeFriend_title), LSTRING(CBAset_aircraftIFF_minSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    [0.01, 5, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_aircraftIFF_iconEnemy),
    "EDITBOX",
    [LSTRING(CBAset_aircraftIFF_iconEnemy_title), LSTRING(CBAset_aircraftIFF_iconEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    QPATHTOF(data\hudUI_US\exterra_huds_airEnemy_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_aircraftIFF_maxSizeEnemy),
    "SLIDER",
    [LSTRING(CBAset_aircraftIFF_maxSizeEnemy_title), LSTRING(CBAset_aircraftIFF_maxSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    [0.01, 5, DEFAULT_MAX_IFF_AIRCRAFT_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_aircraftIFF_minSizeEnemy),
    "SLIDER",
    [LSTRING(CBAset_aircraftIFF_minSizeEnemy_title), LSTRING(CBAset_aircraftIFF_minSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    [0.01, 5, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_aircraftIFF_iconNeutral),
    "EDITBOX",
    [LSTRING(CBAset_aircraftIFF_iconNeutral_title), LSTRING(CBAset_aircraftIFF_iconNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    QPATHTOF(data\hudUI_US\exterra_huds_airNeutral_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_aircraftIFF_maxSizeNeutral),
    "SLIDER",
    [LSTRING(CBAset_aircraftIFF_maxSizeNeutral_title), LSTRING(CBAset_aircraftIFF_maxSizeNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    [0.01, 5, DEFAULT_MAX_IFF_AIRCRAFT_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_aircraftIFF_minSizeNeutral),
    "SLIDER",
    [LSTRING(CBAset_aircraftIFF_minSizeNeutral_title), LSTRING(CBAset_aircraftIFF_minSizeNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat7)],
    [0.01, 5, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- HUD Static IFF Icon Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_staticIFF_iconFriend),
    "EDITBOX",
    [LSTRING(CBAset_staticIFF_iconFriend_title), LSTRING(CBAset_staticIFF_iconFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    QPATHTOF(data\hudUI_US\exterra_huds_staFriend_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_staticIFF_maxSizeFriend),
    "SLIDER",
    [LSTRING(CBAset_staticIFF_maxSizeFriend_title), LSTRING(CBAset_staticIFF_maxSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    [0.01, 5, DEFAULT_MAX_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_staticIFF_minSizeFriend),
    "SLIDER",
    [LSTRING(CBAset_staticIFF_minSizeFriend_title), LSTRING(CBAset_staticIFF_minSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    [0.01, 5, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_staticIFF_iconEnemy),
    "EDITBOX",
    [LSTRING(CBAset_staticIFF_iconEnemy_title), LSTRING(CBAset_staticIFF_iconEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    QPATHTOF(data\hudUI_US\exterra_huds_staEnemy_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_staticIFF_maxSizeEnemy),
    "SLIDER",
    [LSTRING(CBAset_staticIFF_maxSizeEnemy_title), LSTRING(CBAset_staticIFF_maxSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    [0.01, 5, DEFAULT_MAX_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_staticIFF_minSizeEnemy),
    "SLIDER",
    [LSTRING(CBAset_staticIFF_minSizeEnemy_title), LSTRING(CBAset_staticIFF_minSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    [0.01, 5, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_staticIFF_iconNeutral),
    "EDITBOX",
    [LSTRING(CBAset_staticIFF_iconNeutral_title), LSTRING(CBAset_staticIFF_iconNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    QPATHTOF(data\hudUI_US\exterra_huds_staNeutral_US_ca.paa),
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_staticIFF_maxSizeNeutral),
    "SLIDER",
    [LSTRING(CBAset_staticIFF_maxSizeNeutral_title), LSTRING(CBAset_staticIFF_maxSizeNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    [0.01, 5, DEFAULT_MAX_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_staticIFF_minSizeNeutral),
    "SLIDER",
    [LSTRING(CBAset_staticIFF_minSizeNeutral_title), LSTRING(CBAset_staticIFF_minSizeNeutral_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat8)],
    [0.01, 5, DEFAULT_MIN_IFF_OTHER_FOV, 2],
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;
