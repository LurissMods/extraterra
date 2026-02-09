[
    QGVAR(toggleBootUp_cbaSetting),
    "CHECKBOX",
    [LSTRING(toggleBootUp_cbaSetting_title), LSTRING(toggleBootUp_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    0,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(bootUpSpeed_cbaSetting),
    "SLIDER",
    [LSTRING(bootUpSpeed_cbaSetting_title), LSTRING(bootUpSpeed_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0.1, 4, 1, 1],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(tempMeasurementSystem_cbaSetting),
    "LIST",
    [LSTRING(tempMeasurementSystem_cbaSetting_title), LSTRING(tempMeasurementSystem_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [
        [0, 1, 2],
        [LSTRING(tempMeasurementSystem_cbaSetting_opt0), LSTRING(tempMeasurementSystem_cbaSetting_opt1), LSTRING(tempMeasurementSystem_cbaSetting_opt2)],
        0
    ],
    0,
    {
        params ["_value"];
        GVAR(tempMeasurementSystem_cbaSetting) = _value;
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistHelmetsUS_cbaSetting),
    "EDITBOX",
    [LSTRING(whitelistHelmetsUS_cbaSetting_title), LSTRING(whitelistHelmetsUS_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "exterra_uniforms_usHelmet0,exterra_uniforms_usHelmet0_camo",
    0,
    {
        private _whitelistArray = GVAR(whitelistHelmetsUS_cbaSetting) splitString ",";
        {GVAR(whitelistHelmets) append [[_x, 0]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistSuitsUS_cbaSetting),
    "EDITBOX",
    [LSTRING(whitelistSuitsUS_cbaSetting_title), LSTRING(whitelistSuitsUS_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "exterra_uniforms_usUndersuit,exterra_uniforms_usBDU0",
    0,
    {
        private _whitelistArray = GVAR(whitelistSuitsUS_cbaSetting) splitString ",";
        {GVAR(whitelistSuits) append [[_x, 0]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistPacksUS_cbaSetting),
    "EDITBOX",
    [LSTRING(whitelistPacksUS_cbaSetting_title), LSTRING(whitelistPacksUS_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "B_AssaultPack_blk",
    0,
    {
        private _whitelistArray = GVAR(whitelistPacksUS_cbaSetting) splitString ",";
        {GVAR(whitelistPacks) append [[_x, 0]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistHelmetsPRC_cbaSetting),
    "EDITBOX",
    [LSTRING(whitelistHelmetsPRC_cbaSetting_title), LSTRING(whitelistHelmetsPRC_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "H_MilCap_blue",
    0,
    {
        private _whitelistArray = GVAR(whitelistHelmetsPRC_cbaSetting) splitString ",";
        {GVAR(whitelistHelmets) append [[_x, 1]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistSuitsPRC_cbaSetting),
    "EDITBOX",
    [LSTRING(whitelistSuitsPRC_cbaSetting_title), LSTRING(whitelistSuitsPRC_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "U_O_GhillieSuit",
    0,
    {
        private _whitelistArray = GVAR(whitelistSuitsPRC_cbaSetting) splitString ",";
        {GVAR(whitelistSuits) append [[_x, 1]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistPacksPRC_cbaSetting),
    "EDITBOX",
    [LSTRING(whitelistPacksPRC_cbaSetting_title), LSTRING(whitelistPacksPRC_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "B_AssaultPack_blk",
    0,
    {
        private _whitelistArray = GVAR(whitelistPacksUS_cbaSetting) splitString ",";
        {GVAR(whitelistPacks) append [[_x, 0]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(toggleHUDppEffects_cbaSetting),
    "CHECKBOX",
    [LSTRING(toggleHUDppEffects_cbaSetting_title), LSTRING(toggleHUDppEffects_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    0,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(hudPixelation_power_cbaSetting),
    "SLIDER",
    [LSTRING(hudPixelation_power_cbaSetting_title), LSTRING(hudPixelation_power_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [10, 3000, 1200, 0],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(hudChromAb_power_cbaSetting),
    "SLIDER",
    [LSTRING(hudChromAb_power_cbaSetting_title), LSTRING(hudChromAb_power_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 0.1, 0.005, 4],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(hudRadialBlur_power_cbaSetting),
    "SLIDER",
    [LSTRING(hudRadialBlur_power_cbaSetting_title), LSTRING(hudRadialBlur_power_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 0.1, 0.005, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(hudRadialBlur_offset_cbaSetting),
    "SLIDER",
    [LSTRING(hudRadialBlur_offset_cbaSetting_title), LSTRING(hudRadialBlur_offset_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 1, 0.3, 2],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(filmGrain_power_cbaSetting),
    "SLIDER",
    [LSTRING(filmGrain_power_cbaSetting_title), LSTRING(filmGrain_power_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 1, 0.1, 2],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_IFF_cbaSetting),
    "CHECKBOX",
    [LSTRING(fireControl_IFF_cbaSetting_title), LSTRING(fireControl_IFF_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    0,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_datalink_cbaSetting),
    "LIST",
    [LSTRING(fireControl_datalink_cbaSetting_title), LSTRING(fireControl_datalink_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [
        [0, 1, 2],
        [LSTRING(fireControl_datalink_cbaSetting_opt0), LSTRING(fireControl_datalink_cbaSetting_opt1), LSTRING(fireControl_datalink_cbaSetting_opt2)],
        0
    ],
    0,
    {
        params ["_value"];
        GVAR(fireControl_datalink_cbaSetting) = _value;
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_groupColor_cbaSetting),
    "COLOR",
    [LSTRING(fireControl_groupColor_cbaSetting_title), LSTRING(fireControl_groupColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1.000, 1.000, 1.000, 1.000],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_friendColor_cbaSetting),
    "COLOR",
    [LSTRING(fireControl_friendColor_cbaSetting_title), LSTRING(fireControl_friendColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 1.000, 0.5, 1.000],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_neutralColor_cbaSetting),
    "COLOR",
    [LSTRING(fireControl_neutralColor_cbaSetting_title), LSTRING(fireControl_neutralColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1.000, 1.000, 0.000, 1.000],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_enemyColor_cbaSetting),
    "COLOR",
    [LSTRING(fireControl_enemyColor_cbaSetting_title), LSTRING(fireControl_enemyColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1.000, 0.200, 0.200, 1.000],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_humanIconFriend_cbaSetting),
    "EDITBOX",
    [LSTRING(fireControl_humanIconFriend_cbaSetting_title), LSTRING(fireControl_humanIconFriend_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\exterra_huds_friendlyIFF_US.paa",
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_humanSizeFriend_cbaSetting),
    "SLIDER",
    [LSTRING(fireControl_humanSizeFriend_cbaSetting_title), LSTRING(fireControl_humanSizeFriend_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.01, 10.00, 0.30, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_humanIconEnemy_cbaSetting),
    "EDITBOX",
    [LSTRING(fireControl_humanIconEnemy_cbaSetting_title), LSTRING(fireControl_humanIconEnemy_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\exterra_huds_enemyIFF_US.paa",
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_humanSizeEnemy_cbaSetting),
    "SLIDER",
    [LSTRING(fireControl_humanSizeEnemy_cbaSetting_title), LSTRING(fireControl_humanSizeEnemy_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.01, 10.00, 0.30, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_staticIcon_cbaSetting),
    "EDITBOX",
    [LSTRING(fireControl_staticIcon_cbaSetting_title), LSTRING(fireControl_staticIcon_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\OPTRE_MJOLNIR_hudTargetEmplacement.paa",
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_staticSize_cbaSetting),
    "SLIDER",
    [LSTRING(fireControl_staticSize_cbaSetting_title), LSTRING(fireControl_staticSize_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.01, 10.00, 0.40, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_vehicleIcon_cbaSetting),
    "EDITBOX",
    [LSTRING(fireControl_vehicleIcon_cbaSetting_title), LSTRING(fireControl_vehicleIcon_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\OPTRE_MJOLNIR_hudTargetVehicle.paa",
    nil,
    {}
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_vehicleSize_cbaSetting),
    "SLIDER",
    [LSTRING(fireControl_vehicleSize_cbaSetting_title), LSTRING(fireControl_vehicleSize_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.01, 10.00, 0.6, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairIcon_cbaSetting),
    "EDITBOX",
    [LSTRING(fireControl_crosshairIcon_cbaSetting_title), LSTRING(fireControl_crosshairIcon_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\exterra_huds_crosshair_US.paa",
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairColor_cbaSetting),
    "COLOR",
    [LSTRING(fireControl_crosshairColor_cbaSetting_title), LSTRING(fireControl_crosshairColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.7, 1, 1, 1],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairMaxRange_cbaSetting),
    "SLIDER",
    [LSTRING(fireControl_crosshairMaxRange_cbaSetting_title), LSTRING(fireControl_crosshairMaxRange_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1, 1000, 250, 0],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairMinOpacity_cbaSetting),
    "SLIDER",
    [LSTRING(fireControl_crosshairMinOpacity_cbaSetting_title), LSTRING(fireControl_crosshairMinOpacity_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 1, 0, 2],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairMaxOpacity_cbaSetting),
    "SLIDER",
    [LSTRING(fireControl_crosshairMaxOpacity_cbaSetting_title), LSTRING(fireControl_crosshairMaxOpacity_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 1, 1, 2],
    0,
    {},
    false
] call CBA_fnc_addSetting;


[
    QGVAR(hudOutlineColor_cbaSetting),
    "COLOR",
    [LSTRING(hudOutlineColor_cbaSetting_title), LSTRING(hudOutlineColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(infoBackgroundColor_cbaSetting),
    "COLOR",
    [LSTRING(infoBackgroundColor_cbaSetting_title), LSTRING(infoBackgroundColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(weaponBackgroundColor_cbaSetting),
    "COLOR",
    [LSTRING(weaponBackgroundColor_cbaSetting_title), LSTRING(weaponBackgroundColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(airBarColor_cbaSetting),
    "COLOR",
    [LSTRING(airBarColor_cbaSetting_title), LSTRING(airBarColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(battBarColor_cbaSetting),
    "COLOR",
    [LSTRING(battBarColor_cbaSetting_title), LSTRING(battBarColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(barTextColor_cbaSetting),
    "COLOR",
    [LSTRING(barTextColor_cbaSetting_title), LSTRING(barTextColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(textColor_cbaSetting),
    "COLOR",
    [LSTRING(textColor_cbaSetting_title), LSTRING(textColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(textColor_safe_cbaSetting),
    "COLOR",
    [LSTRING(textColor_safe_cbaSetting_title), LSTRING(textColor_safe_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.0, 1.0, 0.0, 0.8],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(textColor_caution_cbaSetting),
    "COLOR",
    [LSTRING(textColor_caution_cbaSetting_title), LSTRING(textColor_caution_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [1.0, 1.0, 0.0, 0.8],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(textColor_danger_cbaSetting),
    "COLOR",
    [LSTRING(textColor_danger_cbaSetting_title), LSTRING(textColor_danger_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [1.0, 0.0, 0.0, 0.8],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(bootTextColor_cbaSetting),
    "COLOR",
    [LSTRING(bootTextColor_cbaSetting_title), LSTRING(bootTextColor_cbaSetting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [1.0, 1.0, 1.0, 1.0],
    0,
    {},
    false
] call CBA_fnc_addSetting;

/*[
    QGVAR(localTemperatureSim),
    "CHECKBOX",
    [LSTRING(localTemperatureSim_title), LSTRING(localTemperatureSim_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    1,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(homeostasisPower),
    "SLIDER",
    [LSTRING(homeostasisPower_title), LSTRING(homeostasisPower_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1, 750, 275, 0],
    1,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;*/
