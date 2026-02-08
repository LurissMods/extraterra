#include "..\script_component.hpp"
/*
 * Author: Luriss
 * Checks if player is in direct sunlight. Returns thermal heating in watts.
 *
 * Arguments:
 * _metabolicHeatPower <NUMBER> - Radiated body heat in watts. Passed from exterra_lifesupport_fnc_coreTemp;
 *
 * Return Value:
 * _newTemp <NUMBER> - New suit temperature in Kelvin. Note that this represents internal suit/skin temperature (they're abstracted as the same thing in this mod).
 *
 * Example:
 * [] call exterra_lifeSupport_fnc_thermalSimulation;
 *
 * Public: Yes
 */

/*params ["_suitFaction", "_metabolicHeatPower"];

private _suitEmissive = 0.7; // This also counts as insulation (lower = better insulation).
private _sigma = STEFAN_BOLTZMANN_CONSTANT*_suitEmissive*HUMAN_SURFACE_AREA_SUIT;
private _distCheck = [1,1,1]; // here just in case, remove later

// https://ntrs.nasa.gov/api/citations/20230014577/downloads/ATA%202023%20Presentation.pdf Stuff on suit thermals


private _convectionTransferPower = 0;
private _conductionTransferPower = 0;
private _solarHeatingPower = 0;
private _tempAroundPlayer = 0;
private _currentActiveCool = 0;
private _currentActiveHeat = 0;
private _moonSurfaceTemp = [223.15,366.15];

private _currentTemp = GETVAR(ace_player,GVAR(unitSuitTemp),ROOM_TEMP);

if (GVAR(solarIrradianceSim)) then {
    private _isPlayerInSun = [ace_player,"VIEW"] checkVisibility [eyePos ace_player, eyePos ace_player vectorDiff ((getLighting#2) vectorMultiply IS_IN_SUN_CHECK_VECTOR_LENGTH)];
    _solarHeatingPower = [_isPlayerInSun] call FUNC(solarIrradiance);
} else {
    _solarHeatingPower = ((AREAHUMAN_FRONT*AREAHUMAN_SIDE*AREAHUMAN_TOP)/3)*SOLAR_RADIATION_WATTAGE_1AU;
};

_atmAroundPlayer = GETVAR(ace_player,GVAR(unitInAtmo),-1);
switch _atmAroundPlayer do {
    case 0: {
        if (sunOrMoon > 0) then {
            _tempAroundPlayer = [_moonSurfaceTemp] call FUNC(localTemperature);
        } else {
            _tempAroundPlayer = _moonSurfaceTemp#0; // If night time, just return the provided minimum temperature value.
        };
    };
    case 1: {
        _tempAroundPlayer = ROOM_TEMP;
        _conductionTransferCoefficient = (1/(1+(THERMAL_CONDUCT_CONSTANT/((EARTH_ATMO_PRESSURE_PA*SUIT_THICKNESS)/_tempAroundPlayer))))*0.026;
        _convectionTransferPower = THERMAL_CONVECTION_COEFF_1ATM*HUMAN_SURFACE_AREA_SUIT*(_currentTemp - _tempAroundPlayer);
        _conductionTransferPower = ((_conductionTransferCoefficient*HUMAN_SURFACE_AREA_SUIT)*(_currentTemp - _tempAroundPlayer)/SUIT_THICKNESS);
    };
    case 2: {
        _tempAroundPlayer = ROOM_TEMP;
        _convectionTransferCoefficient = 0 max ((1.13285*(((EARTH_ATMO_PRESSURE_PA*0.3)/EARTH_ATMO_PRESSURE_PA)^3)) - (0.798924*(((EARTH_ATMO_PRESSURE_PA*0.3)/EARTH_ATMO_PRESSURE_PA)^2)) + (4.67225*((EARTH_ATMO_PRESSURE_PA*0.3)/EARTH_ATMO_PRESSURE_PA)) - 0.0064124);
        _conductionTransferCoefficient = (1/(1+(THERMAL_CONDUCT_CONSTANT/(((EARTH_ATMO_PRESSURE_PA*0.3)*SUIT_THICKNESS)/_tempAroundPlayer))))*0.026;
        _convectionTransferPower = _convectionTransferCoefficient*HUMAN_SURFACE_AREA_SUIT*(_currentTemp - _tempAroundPlayer);
        _conductionTransferPower = ((_conductionTransferCoefficient*HUMAN_SURFACE_AREA_SUIT)*(_currentTemp - _tempAroundPlayer)/SUIT_THICKNESS);
        //systemChat format ["Conduction Coeff 0.3: %1", _conductionTransferCoefficient];
    };
};

_radiationTransferPower = _sigma*((_currentTemp^4) - (_tempAroundPlayer^4)); // Stefan-Boltzmann equation. Uses the local temperature calculated above as the environment temperature. Return is negative when player is gaining thermal energy.
private _netHeatPower = _metabolicHeatPower + _solarHeatingPower - _radiationTransferPower - _convectionTransferPower - _conductionTransferPower; // Movement energy + the energy derived above. Double negative.

if (GETVAR(player,EGVAR(huds,suitEnabled),false)) then {
    private _suitMaxActiveCool = 0;
    private _suitMaxActiveHeat = 0;

    switch (_suitFaction) do {
    case 0: {
        _suitMaxActiveCool = GVAR(maxActiveCool_US);
        _suitMaxActiveHeat = GVAR(maxActiveHeat_US);
        };
    };

    _currentActiveCool = 0 max (_suitMaxActiveCool - (_suitMaxActiveCool - _netHeatPower)) min _suitMaxActiveCool;
    _currentActiveHeat = 0 max (_suitMaxActiveHeat - (_suitMaxActiveHeat + _netHeatPower)) min _suitMaxActiveHeat;

    if (_netHeatPower > 0) then {
        if (_currentTemp > 294.15) then {
            _currentActiveCool = _suitMaxActiveCool;
            _netHeatPower = _netHeatPower - _currentActiveCool;
        } else {
            if (_currentTemp < 294.15 && {(abs( _currentTemp - 294.15) > 0.01)}) then {
                _currentActiveHeat = _suitMaxActiveHeat;
                _netHeatPower = _netHeatPower + _currentActiveHeat;
                _currentActiveCool = 0;
            } else {
                _currentActiveCool = _currentActiveCool min _suitMaxActiveCool;
                _netHeatPower = _netHeatPower - _currentActiveCool;
            };
        };
    } else {
        if (_netHeatPower < 0) then {
            if (_currentTemp < 294.15) then {
                _currentActiveHeat = _suitMaxActiveHeat;
                _netHeatPower = _netHeatPower + _currentActiveHeat;
            } else {
                if (_currentTemp > 294.15 && {(abs( _currentTemp - 294.15) > 0.01)}) then {
                    _currentActiveCool = _suitMaxActiveCool;
                    _netHeatPower = _netHeatPower - _currentActiveCool;
                    _currentActiveHeat = 0;
                } else {
                    _currentActiveHeat = _currentActiveHeat min _suitMaxActiveHeat;
                    _netHeatPower = _netHeatPower + _currentActiveHeat;
                };
            };
        };
    };
};

private _deltaTemp = ((_netHeatPower)/(HUMAN_SPECIFC_HEAT_CAPACITY*HUMAN_MASS)); // Specific heat capacity formula. Finds the change in temperature per second for the current thermal power balance.
private _newTemp = _currentTemp + _deltaTemp;

[_newTemp, _currentActiveCool, _currentActiveHeat, _tempAroundPlayer, _netHeatPower, _deltaTemp];*/
