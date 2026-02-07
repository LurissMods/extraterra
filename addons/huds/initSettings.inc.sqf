[
    QGVAR(toggleBootUp),
    "CHECKBOX",
    [LSTRING(toggleBootUp_title), LSTRING(toggleBootUp_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    0,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(bootUpSpeed),
    "SLIDER",
    [LSTRING(bootUpSpeed_title), LSTRING(bootUpSpeed_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0.1, 4, 1, 1],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(tempMeasurementSystem),
    "LIST",
    [LSTRING(tempMeasurementSystem_title), LSTRING(tempMeasurementSystem_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [
        [0, 1, 2],
        [LSTRING(tempMeasurementSystem_opt0), LSTRING(tempMeasurementSystem_opt1), LSTRING(tempMeasurementSystem_opt2)],
        0
    ],
    0,
    {
        params ["_value"];
        GVAR(tempMeasurementSystem) = _value;
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistHelmetsUS_setting),
    "EDITBOX",
    [LSTRING(whitelistHelmetsUS_setting_title), LSTRING(whitelistHelmetsUS_setting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "exterra_uniforms_usHelmet0,exterra_uniforms_usHelmet0_camo",
    0,
    {
        private _whitelistArray = GVAR(whitelistHelmetsUS_setting) splitString ",";
        {GVAR(whitelistHelmets) append [[_x, 0]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistSuitsUS_setting),
    "EDITBOX",
    [LSTRING(whitelistSuitsUS_setting_title), LSTRING(whitelistSuitsUS_setting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "exterra_uniforms_usUndersuit,exterra_uniforms_usBDU0",
    0,
    {
        private _whitelistArray = GVAR(whitelistSuitsUS_setting) splitString ",";
        {GVAR(whitelistSuits) append [[_x, 0]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistPacksUS_setting),
    "EDITBOX",
    [LSTRING(whitelistPacksUS_setting_title), LSTRING(whitelistPacksUS_setting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "B_AssaultPack_blk",
    0,
    {
        private _whitelistArray = GVAR(whitelistPacksUS_setting) splitString ",";
        {GVAR(whitelistPacks) append [[_x, 0]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistHelmetsPRC_setting),
    "EDITBOX",
    [LSTRING(whitelistHelmetsPRC_setting_title), LSTRING(whitelistHelmetsPRC_setting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "H_MilCap_blue",
    0,
    {
        private _whitelistArray = GVAR(whitelistHelmetsPRC_setting) splitString ",";
        {GVAR(whitelistHelmets) append [[_x, 1]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistSuitsPRC_setting),
    "EDITBOX",
    [LSTRING(whitelistSuitsPRC_setting_title), LSTRING(whitelistSuitsPRC_setting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "U_O_GhillieSuit",
    0,
    {
        private _whitelistArray = GVAR(whitelistSuitsPRC_setting) splitString ",";
        {GVAR(whitelistSuits) append [[_x, 1]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(whitelistPacksPRC_setting),
    "EDITBOX",
    [LSTRING(whitelistPacksPRC_setting_title), LSTRING(whitelistPacksPRC_setting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    "B_AssaultPack_blk",
    0,
    {
        private _whitelistArray = GVAR(whitelistPacksUS_setting) splitString ",";
        {GVAR(whitelistPacks) append [[_x, 0]]} forEach _whitelistArray;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(toggleHUDppEffects),
    "CHECKBOX",
    [LSTRING(toggleHUDppEffects_title), LSTRING(toggleHUDppEffects_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    0,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(hudPixelation_power),
    "SLIDER",
    [LSTRING(hudPixelation_power_title), LSTRING(hudPixelation_power_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [10, 3000, 1200, 0],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(hudChromAb_power),
    "SLIDER",
    [LSTRING(hudChromAb_power_title), LSTRING(hudChromAb_power_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 0.1, 0.005, 4],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(hudRadialBlur_power),
    "SLIDER",
    [LSTRING(hudRadialBlur_power_title), LSTRING(hudRadialBlur_power_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 0.1, 0.005, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(hudRadialBlur_offset),
    "SLIDER",
    [LSTRING(hudRadialBlur_offset_title), LSTRING(hudRadialBlur_offset_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 1, 0.3, 2],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(filmGrain_power),
    "SLIDER",
    [LSTRING(filmGrain_power_title), LSTRING(filmGrain_power_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 1, 0.1, 2],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_Datalink),
    "LIST",
    [LSTRING(fireControl_Datalink_title), LSTRING(fireControl_Datalink_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [
        [0, 1, 2],
        [LSTRING(fireControl_Datalink_opt0), LSTRING(fireControl_Datalink_opt1), LSTRING(fireControl_Datalink_opt2)],
        0
    ],
    0,
    {
        params ["_value"];
        GVAR(fireControl_Datalink) = _value;
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_groupColor),
    "COLOR",
    [LSTRING(fireControl_groupColor_title), LSTRING(fireControl_groupColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1.000, 1.000, 1.000, 1.000],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_friendColor),
    "COLOR",
    [LSTRING(fireControl_friendColor_title), LSTRING(fireControl_friendColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 1.000, 0.5, 1.000],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_neutralColor),
    "COLOR",
    [LSTRING(fireControl_neutralColor_title), LSTRING(fireControl_neutralColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1.000, 1.000, 0.000, 1.000],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_enemyColor),
    "COLOR",
    [LSTRING(fireControl_enemyColor_title), LSTRING(fireControl_enemyColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1.000, 0.200, 0.200, 1.000],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_humanIconFriend),
    "EDITBOX",
    [LSTRING(fireControl_humanIconFriend_title), LSTRING(fireControl_humanIconFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\exterra_huds_friendlyIFF_US.paa",
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_humanSizeFriend),
    "SLIDER",
    [LSTRING(fireControl_humanSizeFriend_title), LSTRING(fireControl_humanSizeFriend_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.01, 10.00, 0.30, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_humanIconEnemy),
    "EDITBOX",
    [LSTRING(fireControl_humanIconEnemy_title), LSTRING(fireControl_humanIconEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\exterra_huds_enemyIFF_US.paa",
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_humanSizeEnemy),
    "SLIDER",
    [LSTRING(fireControl_humanSizeEnemy_title), LSTRING(fireControl_humanSizeEnemy_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.01, 10.00, 0.30, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_staticIcon),
    "EDITBOX",
    [LSTRING(fireControl_staticIcon_title), LSTRING(fireControl_staticIcon_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\OPTRE_MJOLNIR_hudTargetEmplacement.paa",
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_staticSize),
    "SLIDER",
    [LSTRING(fireControl_staticSize_title), LSTRING(fireControl_staticSize_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.01, 10.00, 0.40, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_vehicleIcon),
    "EDITBOX",
    [LSTRING(fireControl_vehicleIcon_title), LSTRING(fireControl_vehicleIcon_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\OPTRE_MJOLNIR_hudTargetVehicle.paa",
    nil,
    {}
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_vehicleSize),
    "SLIDER",
    [LSTRING(fireControl_vehicleSize_title), LSTRING(fireControl_vehicleSize_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.01, 10.00, 0.6, 3],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairIcon),
    "EDITBOX",
    [LSTRING(fireControl_crosshairIcon_title), LSTRING(fireControl_crosshairIcon_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    "z\exterra\addons\huds\data\hudUI_US\exterra_huds_crosshair_US.paa",
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairColor),
    "COLOR",
    [LSTRING(fireControl_crosshairColor_title), LSTRING(fireControl_crosshairColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0.7, 1, 1, 1],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairMaxRange),
    "SLIDER",
    [LSTRING(fireControl_crosshairMaxRange_title), LSTRING(fireControl_crosshairMaxRange_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1, 1000, 250, 0],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairMinOpacity),
    "SLIDER",
    [LSTRING(fireControl_crosshairMinOpacity_title), LSTRING(fireControl_crosshairMinOpacity_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 1, 0, 2],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(fireControl_crosshairMaxOpacity),
    "SLIDER",
    [LSTRING(fireControl_crosshairMaxOpacity_title), LSTRING(fireControl_crosshairMaxOpacity_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 1, 1, 2],
    0,
    {},
    false
] call CBA_fnc_addSetting;


[
    QGVAR(hudOutlineColor),
    "COLOR",
    [LSTRING(hudOutlineColor_title), LSTRING(hudOutlineColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(infoBackgroundColor),
    "COLOR",
    [LSTRING(infoBackgroundColor_title), LSTRING(infoBackgroundColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(weaponBackgroundColor),
    "COLOR",
    [LSTRING(weaponBackgroundColor_title), LSTRING(weaponBackgroundColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(airBarColor),
    "COLOR",
    [LSTRING(airBarColor_title), LSTRING(airBarColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(battBarColor),
    "COLOR",
    [LSTRING(battBarColor_title), LSTRING(battBarColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(barTextColor),
    "COLOR",
    [LSTRING(barTextColor_title), LSTRING(barTextColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(textColor),
    "COLOR",
    [LSTRING(textColor_title), LSTRING(textColor_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.7, 1.0, 1.0, 0.6],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(textColor_safe),
    "COLOR",
    [LSTRING(textColor_safe_title), LSTRING(textColor_safe_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0.0, 1.0, 0.0, 0.8],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(textColor_caution),
    "COLOR",
    [LSTRING(textColor_caution_title), LSTRING(textColor_caution_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [1.0, 1.0, 0.0, 0.8],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(textColor_danger),
    "COLOR",
    [LSTRING(textColor_danger_title), LSTRING(textColor_danger_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [1.0, 0.0, 0.0, 0.8],
    0,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(bootTextColor),
    "COLOR",
    [LSTRING(bootTextColor_title), LSTRING(bootTextColor_desc)],
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
