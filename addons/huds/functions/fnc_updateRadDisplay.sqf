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

//params ["_unit"];

private _currentRadHrtext = nil;
private _lifeExposureText = nil;
private _shieldCoeff = GETVAR(ACE_player,EGVAR(lifesupport,unitInRadShield),nil);
private _currentLifetimeExposure = GETVAR(ACE_player,EGVAR(lifesupport,unitLifetimeRadLevel),nil);
private _currentEnvironRadPerHour = EGVAR(modules,currentEnvironRadiationPerHour);

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateRangefinder)";
    };
    case US_SUIT_FACTION: {
        _currentRadHrtext = (GVAR(hudEnvironRad_text_US)#0);
        _lifeExposureText = (GVAR(hudRadTotal_text_US)#0);
    };
};

if ((_shieldCoeff*_currentEnvironRadPerHour) < 1) then {
    _currentRadHrtext ctrlSetStructuredText parseText format ["<t size='0.8'>%1 uSv/h", round((_shieldCoeff*_currentEnvironRadPerHour)*1000)];
    _currentRadHrtext ctrlSetTextColor GVAR(textColor_cbaSetting);
} else {
    if ((_shieldCoeff*_currentEnvironRadPerHour) > 1000) then {
        _currentRadHrtext ctrlSetStructuredText parseText format ["<t size='0.8'>%1 Sv/h", round((_shieldCoeff*_currentEnvironRadPerHour)/1000)];
        _currentRadHrtext ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
    } else {
        _currentRadHrtext ctrlSetStructuredText parseText format ["<t size='0.8'>%1 mSv/h", round(_shieldCoeff*_currentEnvironRadPerHour)];
        _currentRadHrtext ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
    };
};

_lifeExposureText ctrlSetStructuredText parseText format ["<t size='0.8'>%1 mGy", round(_currentLifetimeExposure)];
if (_currentLifetimeExposure > 1500) then {
    _lifeExposureText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
} else {
    if (_currentLifetimeExposure > 500) then {
        _lifeExposureText ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
    } else {
        _lifeExposureText ctrlSetTextColor GVAR(textColor_cbaSetting);
    };
};
