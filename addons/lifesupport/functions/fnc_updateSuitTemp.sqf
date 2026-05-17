#include "..\script_component.hpp"
/*
* Author: Luriss
* Simulates internal suit temperature for each unit.
*
* Arguments:
* [_unit, _deltaT, _syncValue] [<UNIT>, <NUMBER>, <BOOL>]
* _unit - Current unit.
* _deltaT - Main loop is called at a variable rate e.g. 1.01 sec, 1.03 sec, this corrects for that
* _syncValue - Whether or not to sync the current update with the server
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateSuitTemp;
*
* Public: No
*/

params ["_unit","_deltaT","_syncValue"];
GET_SUIT_DATA(_unit) params ["_helmetPassiveAirReserve","_suitMobility","_suitBlackBodyCoeff","_suitSolarAbsorptance","_suitThickness"];

//private _suitData = _unit getVariable [QGVAR(unitSuitData),nil];
private _unitRadiatedCoreTemp = GET_RADIATED_CORE_HEAT(_unit);
private _sigma = STEFAN_BOLTZMANN_CONSTANT*(_suitBlackBodyCoeff)*HUMAN_SURFACE_AREA_SUIT;
//private _unitRadiatedCoreTemp = _unit getVariable [QGVAR(unitRadiatedCoreTemp),nil];

// https://ntrs.nasa.gov/api/citations/20230014577/downloads/ATA%202023%20Presentation.pdf Stuff on suit thermals

private _convectionTransferPower = 0;
private _conductionTransferPower = 0;
private _solarHeatingPower = 0;
private _tempAroundUnit = 0;
private _currentActiveCool = 0;
private _currentActiveHeat = 0;
private _moonSurfaceTemp = [GVAR(CBAset_minExternalTemp),GVAR(CBAset_maxExternalTemp)];

private _currentTemp = GETVAR(_unit,GVAR(unitSuitTemp),ROOM_TEMP);

if (GVAR(CBAset_solarIrradianceSim)) then {
    private _isUnitInSun = [_unit,"VIEW"] checkVisibility [eyePos _unit, eyePos _unit vectorDiff ((getLighting#2) vectorMultiply IS_IN_SUN_CHECK_VECTOR_LENGTH)];
    _solarHeatingPower = [_isUnitInSun,_suitSolarAbsorptance,_unit] call FUNC(updateSolarIrradiance);
} else {
    _solarHeatingPower = ((AREAHUMAN_FRONT*AREAHUMAN_SIDE*AREAHUMAN_TOP)/3)*(SOLAR_RADIATION_WATTAGE_1AU*_suitSolarAbsorptance);
};

switch (GETVAR(_unit,GVAR(unitInAtmo),ATMO_STATE_ERROR)) do {
    case ATMO_STATE_VACUUM: {
        if (sunOrMoon > 0) then {
            _tempAroundUnit = [_unit,_moonSurfaceTemp,_syncValue] call FUNC(updateLocalTemp);
        } else {
            _tempAroundUnit = _moonSurfaceTemp#0; // If night time, just return the provided minimum temperature value.
        };
    };
    case ATMO_STATE_1ATM: {
        _tempAroundUnit = ROOM_TEMP; // Kept seperate just in case I want to make this variable in future.

        _conductionTransferCoefficient = (1/(1+(THERMAL_CONDUCT_CONSTANT/((PRESSURE_PA_1ATM*_suitThickness)/_tempAroundUnit))))*0.026;

        _convectionTransferPower = THERMAL_CONVECTION_COEFF_1ATM*HUMAN_SURFACE_AREA_SUIT*(_currentTemp - _tempAroundUnit);
        _conductionTransferPower = ((_conductionTransferCoefficient*HUMAN_SURFACE_AREA_SUIT)*(_currentTemp - _tempAroundUnit)/_suitThickness);
    };
    case ATMO_STATE_0P3ATM: {
        _tempAroundUnit = ROOM_TEMP; // Kept seperate just in case I want to make this variable in future.

        _conductionTransferCoefficient = (1/(1+(THERMAL_CONDUCT_CONSTANT/((PRESSURE_PA_0P3ATM*_suitThickness)/_tempAroundUnit))))*0.026;

        _convectionTransferPower = THERMAL_CONVECTION_COEFF_0P3ATM*HUMAN_SURFACE_AREA_SUIT*(_currentTemp - _tempAroundUnit);
        _conductionTransferPower = ((_conductionTransferCoefficient*HUMAN_SURFACE_AREA_SUIT)*(_currentTemp - _tempAroundUnit)/_suitThickness);
    };
};

private _radiationTransferPower = _sigma*((_currentTemp^4) - (_tempAroundUnit^4)); // Stefan-Boltzmann equation. Uses the local temperature calculated above as the environment temperature. Return is negative when unit is gaining thermal energy.
private _netHeatPower = _unitRadiatedCoreTemp + _solarHeatingPower - _radiationTransferPower - _convectionTransferPower - _conductionTransferPower;

// ------------------------------------------------------------------------------------------- Now checking if the unit is wearing an active suit and model the active heating/cooling

if (GET_SUIT_ACTIVATED(_unit)) then {
    private _suitMaxActiveCool = 0;
    private _suitMaxActiveHeat = 0;

    switch (GET_SUIT_FACTION(_unit)) do {
        default {ERROR_1("Suit faction undefined! Unit: %1",_unit)};
        case NO_SUIT_FACTION: {
            _suitMaxActiveCool = 0;
            _suitMaxActiveHeat = 0;
        };
        case US_SUIT_FACTION: {
            _suitMaxActiveCool = GVAR(CBAset_maxActiveCool_US);
            _suitMaxActiveHeat = GVAR(CBAset_maxActiveHeat_US);
        };
    };

    _currentActiveCool = 0 max (_suitMaxActiveCool - (_suitMaxActiveCool - _netHeatPower)) min _suitMaxActiveCool;
    _currentActiveHeat = 0 max (_suitMaxActiveHeat - (_suitMaxActiveHeat + _netHeatPower)) min _suitMaxActiveHeat;

    // Messy. But ehhhhh it works
    if (_netHeatPower > 0) then {
        if (_currentTemp > ROOM_TEMP) then {
            _currentActiveCool = _suitMaxActiveCool;
            _netHeatPower = _netHeatPower - _currentActiveCool;
            SET_ACTIVE_COOL(_unit,_currentActiveCool,_syncValue);
            SET_ACTIVE_HEAT(_unit,0,_syncValue);
            //_unit setVariable [QGVAR(unitActiveThermalCool),_currentActiveCool,_syncValue];
            //_unit setVariable [QGVAR(unitActiveThermalHeat),0,_syncValue];
        } else {
            if (_currentTemp < ROOM_TEMP && {(abs( _currentTemp - ROOM_TEMP) > 0.01)}) then {
                _currentActiveHeat = _suitMaxActiveHeat;
                _netHeatPower = _netHeatPower + _currentActiveHeat;
                _currentActiveCool = 0;
                SET_ACTIVE_HEAT(_unit,_currentActiveHeat,_syncValue);
                SET_ACTIVE_COOL(_unit,0,_syncValue);
                //_unit setVariable [QGVAR(unitActiveThermalHeat),_currentActiveHeat,_syncValue];
                //_unit setVariable [QGVAR(unitActiveThermalCool),0,_syncValue];
            } else {
                _currentActiveCool = _currentActiveCool min _suitMaxActiveCool;
                _netHeatPower = _netHeatPower - _currentActiveCool;
                SET_ACTIVE_COOL(_unit,_currentActiveCool,_syncValue);
                SET_ACTIVE_HEAT(_unit,0,_syncValue);
                //_unit setVariable [QGVAR(unitActiveThermalCool),_currentActiveCool,_syncValue];
                //_unit setVariable [QGVAR(unitActiveThermalHeat),0,_syncValue];
            };
        };
    } else {
        if (_netHeatPower < 0) then {
            if (_currentTemp < ROOM_TEMP) then {
                _currentActiveHeat = _suitMaxActiveHeat;
                _netHeatPower = _netHeatPower + _currentActiveHeat;
                SET_ACTIVE_HEAT(_unit,_currentActiveHeat,_syncValue);
                SET_ACTIVE_COOL(_unit,0,_syncValue);
                //_unit setVariable [QGVAR(unitActiveThermalHeat),_currentActiveHeat,_syncValue];
                //_unit setVariable [QGVAR(unitActiveThermalCool),0,_syncValue];
            } else {
                if (_currentTemp > ROOM_TEMP && {(abs( _currentTemp - ROOM_TEMP) > 0.01)}) then {
                    _currentActiveCool = _suitMaxActiveCool;
                    _netHeatPower = _netHeatPower - _currentActiveCool;
                    _currentActiveHeat = 0;
                    SET_ACTIVE_COOL(_unit,_currentActiveCool,_syncValue);
                    SET_ACTIVE_HEAT(_unit,0,_syncValue);
                    //_unit setVariable [QGVAR(unitActiveThermalCool),_currentActiveCool,_syncValue];
                    //_unit setVariable [QGVAR(unitActiveThermalHeat),0,_syncValue];
                } else {
                    _currentActiveHeat = _currentActiveHeat min _suitMaxActiveHeat;
                    _netHeatPower = _netHeatPower + _currentActiveHeat;
                    SET_ACTIVE_HEAT(_unit,_currentActiveHeat,_syncValue);
                    SET_ACTIVE_COOL(_unit,0,_syncValue);
                    //_unit setVariable [QGVAR(unitActiveThermalHeat),_currentActiveHeat,_syncValue];
                    //_unit setVariable [QGVAR(unitActiveThermalCool),0,_syncValue];
                };
            };
        };
    };
};

_netHeatPower = (_netHeatPower*_deltaT); // Treating the wattage like Joules here

private _deltaTemp = (_netHeatPower/(HUMAN_SPECIFC_HEAT_CAPACITY*HUMAN_MASS)); // Specific heat capacity formula. Finds the change in temperature per second for the current thermal power balance.
private _newTemp = _currentTemp + _deltaTemp;

SET_NET_HEAT(_unit,_netHeatPower,_syncValue);
SET_DELTA_TEMP(_unit,_deltaTemp,_syncValue);
SET_ENVIRONMENT_TEMP(_unit,_tempAroundUnit,_syncValue);
SET_SUIT_TEMP(_unit,_newTemp,_syncValue);
//_unit setVariable [QGVAR(unitNetHeatPwr),_netHeatPower,_syncValue];
//_unit setVariable [QGVAR(unitDeltaTemp),_deltaTemp,_syncValue];
//_unit setVariable [QGVAR(unitEnvTemp),_tempAroundUnit,_syncValue];
//_unit setVariable [QGVAR(unitSuitTemp),_newTemp,_syncValue];
