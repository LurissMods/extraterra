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

params ["_suitFaction", "_currentLifetimeExposure", "_currentEnvironRadPerHour", "_shieldCoeff"];

private _currentRadHrtext = nil;
private _lifeExposureText = nil;

switch (_suitFaction) do {
    case 0: {
        _currentRadHrtext = (GVAR(info_radPerHour_text_US)#0);
        _lifeExposureText = (GVAR(info_lifetimeRad_text_US)#0);
    };
};

if ((_shieldCoeff*_currentEnvironRadPerHour) < 1) then {
    (_currentRadHrtext) ctrlSetStructuredText parseText format ["<t align='center'> %1 uSv/h", round((_shieldCoeff*_currentEnvironRadPerHour)*1000)];
    (_currentRadHrtext) ctrlSetTextColor GVAR(textColor_cbaSetting);
} else {
    if ((_shieldCoeff*_currentEnvironRadPerHour) > 1000) then {
        (_currentRadHrtext) ctrlSetStructuredText parseText format ["<t align='center'> %1 Sv/h", round((_shieldCoeff*_currentEnvironRadPerHour)/1000)];
        (_currentRadHrtext) ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
    } else {
        (_currentRadHrtext) ctrlSetStructuredText parseText format ["<t align='center'> %1 mSv/h", round(_shieldCoeff*_currentEnvironRadPerHour)];
        (_currentRadHrtext) ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
    };
};

(_lifeExposureText) ctrlSetStructuredText parseText format ["<t align='center'> %1", round(_currentLifetimeExposure)];
if (_currentLifetimeExposure > 1500) then {
    (_lifeExposureText) ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
} else {
    if (_currentLifetimeExposure > 500) then {
        (_lifeExposureText) ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
    } else {
        (_lifeExposureText) ctrlSetTextColor GVAR(textColor_cbaSetting);
    };
};
