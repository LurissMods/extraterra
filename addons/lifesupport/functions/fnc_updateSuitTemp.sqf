#include "..\script_component.hpp"
/*
* Author: Luriss
* Simulates the body's core tempeature. Note that this function uses the ace_advanced_fatigue_fnc_getMetabolicCosts function from ACE.
*
* Arguments:
* None
*
* Return Value:
* [_coreTemp, _totalRadiatedHeatAproxWattage] [<NUMBER>,<NUMBER>] - First is body core temperature in Kelvin, second is radiated body heat in watts.
*
* Example:
* [] call exterra_lifeSupport_fnc_thermalSimulation;
*
* Public: Yes
*/

params ["_unit","_deltaT","_syncValue"];

private _suitData = _unit getVariable [QGVAR(unitSuitData),"Error!"];
private _sigma = STEFAN_BOLTZMANN_CONSTANT*(_suitData#2)*HUMAN_SURFACE_AREA_SUIT; // _suitData#2 is suit black body coefficient. Pulled from uniform config
private _unitRadiatedCoreTemp = _unit getVariable [QGVAR(unitRadiatedCoreTemp),"Error!"];

// https://ntrs.nasa.gov/api/citations/20230014577/downloads/ATA%202023%20Presentation.pdf Stuff on suit thermals

private _convectionTransferPower = 0;
private _conductionTransferPower = 0;
private _solarHeatingPower = 0;
private _tempAroundUnit = 0;
private _currentActiveCool = 0;
private _currentActiveHeat = 0;
private _moonSurfaceTemp = [223.15,366.15]; // Note: Move to CBA settings?

private _currentTemp = GETVAR(_unit,GVAR(unitSuitTemp),ROOM_TEMP);

if (GVAR(solarIrradianceSim)) then {
    private _isUnitInSun = [_unit,"VIEW"] checkVisibility [eyePos _unit, eyePos _unit vectorDiff ((getLighting#2) vectorMultiply IS_IN_SUN_CHECK_VECTOR_LENGTH)];
    _solarHeatingPower = [_isUnitInSun,(_suitData#3),_unit] call FUNC(updateSolarIrradiance);
} else {
    _solarHeatingPower = ((AREAHUMAN_FRONT*AREAHUMAN_SIDE*AREAHUMAN_TOP)/3)*(SOLAR_RADIATION_WATTAGE_1AU*(_suitData#3)); // _suitData#3 is solar absorbtion. Pulled from uniform config
};

switch (GETVAR(_unit,GVAR(unitInAtmo),ATMO_STATE_ERROR)) do {
    case ATMO_STATE_VACUUM: {
        if (sunOrMoon > 0) then {
            _tempAroundUnit = [_unit,_moonSurfaceTemp] call FUNC(updateLocalTemp);
        } else {
            _tempAroundUnit = _moonSurfaceTemp#0; // If night time, just return the provided minimum temperature value.
        };
    };
    case ATMO_STATE_1ATM: {
        _tempAroundUnit = ROOM_TEMP; // Kept seperate just in case I want to make this variable in future.

        _conductionTransferCoefficient = (1/(1+(THERMAL_CONDUCT_CONSTANT/((PRESSURE_PA_1ATM*(_suitData#4))/_tempAroundUnit))))*0.026; // _suitData#4 is suit thickness. Pulled from uniform config

        _convectionTransferPower = THERMAL_CONVECTION_COEFF_1ATM*HUMAN_SURFACE_AREA_SUIT*(_currentTemp - _tempAroundUnit);
        _conductionTransferPower = ((_conductionTransferCoefficient*HUMAN_SURFACE_AREA_SUIT)*(_currentTemp - _tempAroundUnit)/(_suitData#4));
    };
    case ATMO_STATE_0P3ATM: {
        _tempAroundUnit = ROOM_TEMP; // Kept seperate just in case I want to make this variable in future.

        _conductionTransferCoefficient = (1/(1+(THERMAL_CONDUCT_CONSTANT/((PRESSURE_PA_0P3ATM*(_suitData#4))/_tempAroundUnit))))*0.026;

        _convectionTransferPower = THERMAL_CONVECTION_COEFF_0P3ATM*HUMAN_SURFACE_AREA_SUIT*(_currentTemp - _tempAroundUnit);
        _conductionTransferPower = ((_conductionTransferCoefficient*HUMAN_SURFACE_AREA_SUIT)*(_currentTemp - _tempAroundUnit)/(_suitData#4));
    };
};

private _radiationTransferPower = _sigma*((_currentTemp^4) - (_tempAroundUnit^4)); // Stefan-Boltzmann equation. Uses the local temperature calculated above as the environment temperature. Return is negative when unit is gaining thermal energy.
private _netHeatPower = _unitRadiatedCoreTemp + _solarHeatingPower - _radiationTransferPower - _convectionTransferPower - _conductionTransferPower;

// ------------------------------------------------------------------------------------------- Now checking if the unit is wearing an active suit and model the active heating/cooling

if (GETVAR(_unit,EGVAR(huds,suitEnabled),false)) then {
    private _suitMaxActiveCool = 0;
    private _suitMaxActiveHeat = 0;

    switch (GETVAR(_unit,GVAR(unitSuitFaction),NO_SUIT_FACTION)) do {
        case NO_SUIT_FACTION: {
            _suitMaxActiveCool = 0;
            _suitMaxActiveHeat = 0;
        };
        case US_SUIT_FACTION: {
            _suitMaxActiveCool = GVAR(maxActiveCool_US);
            _suitMaxActiveHeat = GVAR(maxActiveHeat_US);
        };
    };

    _currentActiveCool = 0 max (_suitMaxActiveCool - (_suitMaxActiveCool - _netHeatPower)) min _suitMaxActiveCool;
    _currentActiveHeat = 0 max (_suitMaxActiveHeat - (_suitMaxActiveHeat + _netHeatPower)) min _suitMaxActiveHeat;

    // Messy. But ehhhhh it works
    if (_netHeatPower > 0) then {
        if (_currentTemp > ROOM_TEMP) then {
            _currentActiveCool = _suitMaxActiveCool;
            _netHeatPower = _netHeatPower - _currentActiveCool;
            _unit setVariable [QGVAR(unitActiveThermalCool),_currentActiveCool,_syncValue];
            _unit setVariable [QGVAR(unitActiveThermalHeat),0,_syncValue];
        } else {
            if (_currentTemp < ROOM_TEMP && {(abs( _currentTemp - ROOM_TEMP) > 0.01)}) then {
                _currentActiveHeat = _suitMaxActiveHeat;
                _netHeatPower = _netHeatPower + _currentActiveHeat;
                _currentActiveCool = 0;
                _unit setVariable [QGVAR(unitActiveThermalHeat),_currentActiveHeat,_syncValue];
                _unit setVariable [QGVAR(unitActiveThermalCool),0,_syncValue];
            } else {
                _currentActiveCool = _currentActiveCool min _suitMaxActiveCool;
                _netHeatPower = _netHeatPower - _currentActiveCool;
                _unit setVariable [QGVAR(unitActiveThermalCool),_currentActiveCool,_syncValue];
                _unit setVariable [QGVAR(unitActiveThermalHeat),0,_syncValue];
            };
        };
    } else {
        if (_netHeatPower < 0) then {
            if (_currentTemp < ROOM_TEMP) then {
                _currentActiveHeat = _suitMaxActiveHeat;
                _netHeatPower = _netHeatPower + _currentActiveHeat;
                _unit setVariable [QGVAR(unitActiveThermalHeat),_currentActiveHeat,_syncValue];
                _unit setVariable [QGVAR(unitActiveThermalCool),0,_syncValue];
            } else {
                if (_currentTemp > ROOM_TEMP && {(abs( _currentTemp - ROOM_TEMP) > 0.01)}) then {
                    _currentActiveCool = _suitMaxActiveCool;
                    _netHeatPower = _netHeatPower - _currentActiveCool;
                    _currentActiveHeat = 0;
                    _unit setVariable [QGVAR(unitActiveThermalCool),_currentActiveCool,_syncValue];
                    _unit setVariable [QGVAR(unitActiveThermalHeat),0,_syncValue];
                } else {
                    _currentActiveHeat = _currentActiveHeat min _suitMaxActiveHeat;
                    _netHeatPower = _netHeatPower + _currentActiveHeat;
                    _unit setVariable [QGVAR(unitActiveThermalHeat),_currentActiveHeat,_syncValue];
                    _unit setVariable [QGVAR(unitActiveThermalCool),0,_syncValue];
                };
            };
        };
    };
};

private _deltaTemp = ((_netHeatPower)/(HUMAN_SPECIFC_HEAT_CAPACITY*HUMAN_MASS)); // Specific heat capacity formula. Finds the change in temperature per second for the current thermal power balance.
private _newTemp = _currentTemp + (_deltaTemp*_deltaT);

_unit setVariable [QGVAR(unitSuitTemp),_newTemp,_syncValue];
