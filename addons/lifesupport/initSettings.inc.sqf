[
    QGVAR(masterToggle),
    "CHECKBOX",
    [LSTRING(masterToggle_title), LSTRING(masterToggle_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    1,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(solarIrradianceSim),
    "CHECKBOX",
    [LSTRING(solarIrradianceSim_title), LSTRING(solarIrradianceSim_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    1,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
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
    QGVAR(localTemperatureSim_setting),
    "LIST",
    [LSTRING(localTemperatureSim_setting_title), LSTRING(localTemperatureSim_setting_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [
        [0, 1, 2, 3, 4],
        [LSTRING(localTemperatureSim_setting_opt0), LSTRING(localTemperatureSim_setting_opt1), LSTRING(localTemperatureSim_setting_opt2), LSTRING(localTemperatureSim_setting_opt3), LSTRING(localTemperatureSim_setting_opt4)],
        2
    ],
    1,
    {
        params ["_value"];
        GVAR(localTemperatureSim_setting) = _value;
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(maxActiveCool_US),
    "SLIDER",
    [LSTRING(maxActiveCool_US_title), LSTRING(maxActiveCool_US_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 3000, DEFAULT_MAX_ACTIVE_COOL_US, 0],
    1,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(maxActiveHeat_US),
    "SLIDER",
    [LSTRING(maxActiveHeat_US_title), LSTRING(maxActiveHeat_US_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1, 3000, DEFAULT_MAX_ACTIVE_HEAT_US, 0],
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
] call CBA_fnc_addSetting;

[
    QGVAR(homeostasisDebug),
    "CHECKBOX",
    [LSTRING(homeostasisDebug_title), LSTRING(homeostasisDebug_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    false,
    1,
    {
        //[QGVAR(lifeSupportEnabled), _this] call EFUNC(common,cbaSettings_settingChanged)
    },
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(breathingPain_coeff),
    "SLIDER",
    [LSTRING(breathingPain_coeff_title), LSTRING(breathingPain_coeff_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 1, RAD_COEFF0_DEFAULT, 2],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(radShield_coeff0),
    "SLIDER",
    [LSTRING(radShield_coeff0_title), LSTRING(radShield_coeff_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF0_DEFAULT, 3],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(radShield_coeff1),
    "SLIDER",
    [LSTRING(radShield_coeff1_title), LSTRING(radShield_coeff_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF1_DEFAULT, 3],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(radShield_coeff2),
    "SLIDER",
    [LSTRING(radShield_coeff2_title), LSTRING(radShield_coeff_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF2_DEFAULT, 3],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(radShield_coeff3),
    "SLIDER",
    [LSTRING(radShield_coeff3_title), LSTRING(radShield_coeff_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF3_DEFAULT, 3],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(radShield_coeff4),
    "SLIDER",
    [LSTRING(radShield_coeff4_title), LSTRING(radShield_coeff_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF4_DEFAULT, 3],
    1,
    {},
    false
] call CBA_fnc_addSetting;

[
    QGVAR(radShield_coeff5),
    "SLIDER",
    [LSTRING(radShield_coeff5_title), LSTRING(radShield_coeff_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF5_DEFAULT, 3],
    1,
    {},
    false
] call CBA_fnc_addSetting;
