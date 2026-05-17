
// --------------------------------------------------------------------------- General Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_solarIrradianceSim),
    "CHECKBOX",
    [LSTRING(CBAset_solarIrradianceSim_title), LSTRING(CBAset_solarIrradianceSim_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_localTemperatureSimToggle),
    "CHECKBOX",
    [LSTRING(CBAset_localTemperatureSimToggle_title), LSTRING(CBAset_localTemperatureSimToggle_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    true,
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_localTemperatureSimValue),
    "LIST",
    [LSTRING(CBAset_localTemperatureSimValue_title), LSTRING(CBAset_localTemperatureSimValue_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [
        [0, 1, 2, 3, 4],
        [LSTRING(CBAset_localTemperatureSimValue_opt0), LSTRING(CBAset_localTemperatureSimValue_opt1), LSTRING(CBAset_localTemperatureSimValue_opt2), LSTRING(CBAset_localTemperatureSimValue_opt3), LSTRING(CBAset_localTemperatureSimValue_opt4)],
        0
    ],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {
        params ["_value"];
        GVAR(CBAset_localTemperatureSimValue) = _value;
    },
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- Thermal Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_maxActiveCool_US),
    "SLIDER",
    [LSTRING(CBAset_maxActiveCool_US_title), LSTRING(CBAset_maxActiveCool_US_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 3000, DEFAULT_MAX_ACTIVE_COOL_US, 0],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_maxActiveHeat_US),
    "SLIDER",
    [LSTRING(CBAset_maxActiveHeat_US_title), LSTRING(CBAset_maxActiveHeat_US_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1, 3000, DEFAULT_MAX_ACTIVE_HEAT_US, 0],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_breathingPain),
    "SLIDER",
    [LSTRING(CBAset_breathingPain_title), LSTRING(CBAset_breathingPain_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat0)],
    [0, 1, 1, 2],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_homeostasisPower),
    "SLIDER",
    [LSTRING(CBAset_homeostasisPower_title), LSTRING(CBAset_homeostasisPower_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [1, 750, 275, 0],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_homeostasisDebug),
    "CHECKBOX",
    [LSTRING(CBAset_homeostasisDebug_title), LSTRING(CBAset_homeostasisDebug_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    false,
    0, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    false // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

// --------------------------------------------------------------------------- Radiation Settings --------------------------------------------------------------------------- //

[
    QGVAR(CBAset_radShield0),
    "SLIDER",
    [LSTRING(CBAset_radShield0_title), LSTRING(CBAset_radShield_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF0_DEFAULT, 3],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_radShield1),
    "SLIDER",
    [LSTRING(CBAset_radShield1_title), LSTRING(CBAset_radShield_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF1_DEFAULT, 3],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_radShield2),
    "SLIDER",
    [LSTRING(CBAset_radShield2_title), LSTRING(CBAset_radShield_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF2_DEFAULT, 3],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_radShield3),
    "SLIDER",
    [LSTRING(CBAset_radShield3_title), LSTRING(CBAset_radShield_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF3_DEFAULT, 3],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_radShield4),
    "SLIDER",
    [LSTRING(CBAset_radShield4_title), LSTRING(CBAset_radShield_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF4_DEFAULT, 3],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_radShield5),
    "SLIDER",
    [LSTRING(CBAset_radShield5_title), LSTRING(CBAset_radShield_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat2)],
    [0, 2, RAD_COEFF5_DEFAULT, 3],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_minExternalTemp),
    "SLIDER",
    [LSTRING(CBAset_minExternalTemp_title), LSTRING(CBAset_minExternalTemp_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 2273.15, DEFAULT_MIN_ENVIRON_TEMP, 2],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;

[
    QGVAR(CBAset_maxExternalTemp),
    "SLIDER",
    [LSTRING(CBAset_maxExternalTemp_title), LSTRING(CBAset_maxExternalTemp_desc)],
    [LSTRING(CBA_title), LSTRING(CBA_cat1)],
    [0, 2273.15, DEFAULT_MAX_ENVIRON_TEMP, 2],
    1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
    {},
    true // Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>
] call CBA_fnc_addSetting;
