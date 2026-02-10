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

//params ["_suitFaction", "_suitTemp", "_currentActiveCool", "_currentActiveHeat", "_tempAroundPlayer", "_netHeatPower", "_deltaTemp"];

private _intTempText = "";
private _extTempText = "";
private _thermalPwrBalanceText = "";
private _timeUntilDangerText = "";
private _suitMaxActiveCool = 0;
private _suitMaxActiveHeat = 0;
private _timeUntilDangerousTemp = 0;

private _currentActiveCool = GETVAR(ACE_player,EGVAR(lifesupport,unitActiveThermalCool),nil);
private _currentActiveHeat = GETVAR(ACE_player,EGVAR(lifesupport,unitActiveThermalHeat),nil);
private _suitTemp = GETVAR(ACE_player,EGVAR(lifesupport,unitSuitTemp),nil);
private _tempAroundPlayer = GETVAR(ACE_player,EGVAR(lifesupport,unitEnvTemp),nil);
private _netHeatPower = GETVAR(ACE_player,EGVAR(lifesupport,unitNetHeatPwr),nil);
private _deltaTemp = GETVAR(ACE_player,EGVAR(lifesupport,unitDeltaTemp),nil);

//systemChat str _tempAroundPlayer;

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateRangefinder)";
    };
    case US_SUIT_FACTION: {
        _intTempText = (GVAR(info_internalTemp_text_US)#0);
        _extTempText = (GVAR(info_externalTemp_text_US)#0);
        _thermalPwrBalanceText = (GVAR(info_thermalPowerBalance_text_US)#0);
        _timeUntilDangerText = (GVAR(info_timeUntilDang_text_US)#0);
        _suitMaxActiveCool = EGVAR(lifesupport,maxActiveCool_US);
        _suitMaxActiveHeat = EGVAR(lifesupport,maxActiveHeat_US);
    };
};

switch GVAR(tempMeasurementSystem_cbaSetting) do {
    case 0: {
        _intTempText ctrlSetStructuredText parseText format ["<t align='center'>%1°C", round(KELVIN_TO_CELCIUS(_suitTemp))];
        _extTempText ctrlSetStructuredText parseText format ["<t align='center'>%1°C", round(KELVIN_TO_CELCIUS(_tempAroundPlayer))];
    };
    case 1: {
        _intTempText ctrlSetStructuredText parseText format ["<t align='center'>%1°F", round(KELVIN_TO_FAHRENHEIT(_suitTemp))];
        _extTempText ctrlSetStructuredText parseText format ["<t align='center'>%1°F", round(KELVIN_TO_FAHRENHEIT(_tempAroundPlayer))];
    };
    case 2: {
        _intTempText ctrlSetStructuredText parseText format ["<t align='center'>%1K", round(_suitTemp)];
        _extTempText ctrlSetStructuredText parseText format ["<t align='center'>%1K", round(_tempAroundPlayer)];
    };
};

_thermalPwrBalanceText ctrlSetStructuredText parseText format ["<t align='center'>%1W", round _netHeatPower];


if (_currentActiveCool == _suitMaxActiveCool && {_netHeatPower > 0}) then {
    _timeUntilDangerousTemp = (HUMAN_DANGEROUS_TEMPS#1 - _suitTemp)/_deltaTemp;

    if (abs _timeUntilDangerousTemp > 3600) then {
        _timeUntilDangerText ctrlSetStructuredText parseText format ["<t align='center'>%1 h", round(abs _timeUntilDangerousTemp/3600)];
        _timeUntilDangerText ctrlSetTextColor GVAR(textColor_cbaSetting);
        _thermalPwrBalanceText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
    } else {
        _timeUntilDangerText ctrlSetStructuredText parseText format ["<t align='center'>%1 m", floor(abs _timeUntilDangerousTemp/60) min 999];
        _timeUntilDangerText ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
        _thermalPwrBalanceText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
    };

} else {
    if (_currentActiveHeat == _suitMaxActiveHeat && {_netHeatPower < 0}) then {
        _timeUntilDangerousTemp = (_suitTemp - HUMAN_DANGEROUS_TEMPS#0)/_deltaTemp;

        if (abs _timeUntilDangerousTemp > 3600) then {
            _timeUntilDangerText ctrlSetStructuredText parseText format ["<t align='center'>%1 h", round(abs _timeUntilDangerousTemp/3600)];
            _timeUntilDangerText ctrlSetTextColor GVAR(textColor_cbaSetting);
            _thermalPwrBalanceText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
        } else {
            _timeUntilDangerText ctrlSetStructuredText parseText format ["<t align='center'>%1 m", floor(abs _timeUntilDangerousTemp/60) min 999];
            _timeUntilDangerText ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
            _thermalPwrBalanceText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
        };

    } else {
        _timeUntilDangerText ctrlSetStructuredText parseText "<t align='center'>STBLE";
        _timeUntilDangerText ctrlSetTextColor GVAR(textColor_cbaSetting);
        _thermalPwrBalanceText ctrlSetTextColor GVAR(textColor_cbaSetting);
    };
};

if (_suitTemp < HUMAN_DANGEROUS_TEMPS#0 || {_suitTemp > HUMAN_DANGEROUS_TEMPS#1}) then {
    _timeUntilDangerText ctrlSetStructuredText parseText "<t align='center'>DNGR";
    _timeUntilDangerText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
    _intTempText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
} else {
    _intTempText ctrlSetTextColor GVAR(textColor_cbaSetting);
};

if (_suitTemp < HUMAN_DANGEROUS_TEMPS#0 && {_netHeatPower > 0}) then {
    _thermalPwrBalanceText ctrlSetTextColor GVAR(textColor_cbaSetting);
} else {
    if (_suitTemp > HUMAN_DANGEROUS_TEMPS#1 && {_netHeatPower < 0}) then {
        _thermalPwrBalanceText ctrlSetTextColor GVAR(textColor_cbaSetting);
    } else {
        if (_suitTemp < HUMAN_DANGEROUS_TEMPS#0 || {_suitTemp > HUMAN_DANGEROUS_TEMPS#1}) then {
            _thermalPwrBalanceText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
        };
    };
};
