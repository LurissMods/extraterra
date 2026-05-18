#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates the HUD's internal & external temp, thermal power balance, time until dangerous temperature values.
* Called by the statemachine (lifesupport, handleUnitLifesupport).
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateSuitTempDisplay
*
* Public: No
*/

params ["_deltaT"];

private _intTempText = "";
private _extTempText = "";
private _thermalPwrBalanceText = "";
private _timeUntilDangerText = "";
private _suitMaxActiveCool = 0;
private _suitMaxActiveHeat = 0;
private _timeUntilDangerousTemp = 0;

private _currentActiveCool = GET_ACTIVE_COOL(ACE_player);
private _currentActiveHeat = GET_ACTIVE_HEAT(ACE_player);
private _suitTemp = GET_SUIT_TEMP(ACE_player);
private _tempAroundPlayer = GET_ENVIRONMENT_TEMP(ACE_player);
private _netHeatPower = GET_NET_HEAT(ACE_player);
private _deltaTemp = GET_DELTA_TEMP(ACE_player);

switch (GET_SUIT_FACTION(ACE_player)) do {
    case NO_SUIT_FACTION: {
        ERROR_1("Suit faction undefined! Unit: %1",ACE_player);
    };
    case US_SUIT_FACTION: {
        _intTempText = (GVAR(hudTempInt_text_US)#0);
        _extTempText = (GVAR(hudTempExt_text_US)#0);
        _thermalPwrBalanceText = (GVAR(hudTempWatt_text_US)#0);
        _timeUntilDangerText = (GVAR(hudTmeDangTemp_text_US)#0);
        _suitMaxActiveCool = EGVAR(lifesupport,CBAset_maxActiveCool_US);
        _suitMaxActiveHeat = EGVAR(lifesupport,CBAset_maxActiveHeat_US);
    };
};

switch GVAR(CBAset_tempMeasurementSystem) do {
    case 0: {
        _intTempText ctrlSetStructuredText parseText format ["<t size='0.8'>%1°C", round(KELVIN_TO_CELCIUS(_suitTemp))];
        _extTempText ctrlSetStructuredText parseText format ["<t size='0.8'>%1°C", round(KELVIN_TO_CELCIUS(_tempAroundPlayer))];
    };
    case 1: {
        _intTempText ctrlSetStructuredText parseText format ["<t size='0.8'>%1°F", round(KELVIN_TO_FAHRENHEIT(_suitTemp))];
        _extTempText ctrlSetStructuredText parseText format ["<t size='0.8'>%1°F", round(KELVIN_TO_FAHRENHEIT(_tempAroundPlayer))];
    };
    case 2: {
        _intTempText ctrlSetStructuredText parseText format ["<t size='0.8'>%1K", round(_suitTemp)];
        _extTempText ctrlSetStructuredText parseText format ["<t size='0.8'>%1K", round(_tempAroundPlayer)];
    };
};

_thermalPwrBalanceText ctrlSetStructuredText parseText format ["<t size='0.8'>%1W", round _netHeatPower];


if (_currentActiveCool == _suitMaxActiveCool && {_netHeatPower > 0}) then {
    _timeUntilDangerousTemp = ((HUMAN_DANGEROUS_TEMPS#1 - _suitTemp)/_deltaTemp)*_deltaT;

    if (abs _timeUntilDangerousTemp > 3600) then {
        _timeUntilDangerText ctrlSetStructuredText parseText format ["<t size='0.8'>%1 h", round(abs _timeUntilDangerousTemp/3600)];
        _timeUntilDangerText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_normal);
        _thermalPwrBalanceText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_danger);
    } else {
        _timeUntilDangerText ctrlSetStructuredText parseText format ["<t size='0.8'>%1 m", floor(abs _timeUntilDangerousTemp/60) min 999];
        _timeUntilDangerText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_caution);
        _thermalPwrBalanceText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_danger);
    };

} else {
    if (_currentActiveHeat == _suitMaxActiveHeat && {_netHeatPower < 0}) then {
        _timeUntilDangerousTemp = (_suitTemp - HUMAN_DANGEROUS_TEMPS#0)/_deltaTemp;

        if (abs _timeUntilDangerousTemp > 3600) then {
            _timeUntilDangerText ctrlSetStructuredText parseText format ["<t size='0.8'>%1 h", round(abs _timeUntilDangerousTemp/3600)];
            _timeUntilDangerText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_normal);
            _thermalPwrBalanceText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_danger);
        } else {
            _timeUntilDangerText ctrlSetStructuredText parseText format ["<t size='0.8'>%1 m", floor(abs _timeUntilDangerousTemp/60) min 999];
            _timeUntilDangerText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_caution);
            _thermalPwrBalanceText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_danger);
        };

    } else {
        _timeUntilDangerText ctrlSetStructuredText parseText "<t size='0.8'>STBLE";
        _timeUntilDangerText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_normal);
        _thermalPwrBalanceText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_normal);
    };
};

if (_suitTemp < HUMAN_DANGEROUS_TEMPS#0 || {_suitTemp > HUMAN_DANGEROUS_TEMPS#1}) then {
    _timeUntilDangerText ctrlSetStructuredText parseText "<t size='0.8'>DNGR";
    _timeUntilDangerText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_danger);
    _intTempText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_danger);
} else {
    _intTempText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_normal);
};

if (_suitTemp < HUMAN_DANGEROUS_TEMPS#0 && {_netHeatPower > 0}) then {
    _thermalPwrBalanceText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_normal);
} else {
    if (_suitTemp > HUMAN_DANGEROUS_TEMPS#1 && {_netHeatPower < 0}) then {
        _thermalPwrBalanceText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_normal);
    } else {
        if (_suitTemp < HUMAN_DANGEROUS_TEMPS#0 || {_suitTemp > HUMAN_DANGEROUS_TEMPS#1}) then {
            _thermalPwrBalanceText ctrlSetTextColor GVAR(CBAset_hudTextColorUS_danger);
        };
    };
};
