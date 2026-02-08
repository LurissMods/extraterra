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

private _sigma = HUMAN_SURFACE_AREA*HUMAN_SKIN_BLACKBODY_EMISSIVE*STEFAN_BOLTZMANN_CONSTANT;
private _currentMetabolicHeatWattage = 0;
private _deltaTemp = 0;

private _coreTemp = GETVAR(_unit,GVAR(unitCoreTemp),HUMAN_NATURAL_CORETEMP);
private _suitTemp = GETVAR(_unit,GVAR(unitSuitTemp),ROOM_TEMP);
private _bodyHomeostatisCapacity = GVAR(homeostasisPower); // Defined in CBA settings

// Note: I'm repurposing the first part of the ace_advanced_fatigue_fnc_mainloop function so I can get the params for the ace_advanced_fatigue_fnc_getMetabolicCosts function. The marked lines are from here: https://github.com/acemod/ACE3/blob/master/addons/advanced_fatigue/functions/fnc_mainLoop.sqf
private _velocity = velocity _unit; // Mark start
private _normal = surfaceNormal (getPosWorld _unit);
private _movementVector = vectorNormalized _velocity;
private _fwdAngle = asin (_movementVector select 2);
private _sideAngle = if ((getPosATL _unit) select 2 > 0.01) then {
    0
} else {
    private _sideVector = vectorNormalized (_movementVector vectorCrossProduct _normal);
    asin (_sideVector select 2);
};
if (ACEGVAR(advanced_fatigue,isSwimming)) then {
    _fwdAngle = 0;
    _sideAngle = 0;
};

private _currentMetabolicHeatWattage = HUMAN_BASAL_METABOLIC_RATE;
private _currentSpeed = (vectorMagnitude _velocity) min 6;


if (ACEGVAR(advanced_fatigue,isProne)) then {
    _currentSpeed = _currentSpeed min 1.5;
};

private _terrainGradient = abs _fwdAngle;
private _terrainFactor = 1;
private _gearMass = 0 max (((_unit getVariable ["ace_movement_totalLoad", loadAbs _unit]) / 22.046 - 3.5) * ACEGVAR(advanced_fatigue,loadFactor));

if (isNull objectParent _unit && {_currentSpeed > 0.1} && {isTouchingGround _unit || {underwater _unit}}) then {
    if (!ACEGVAR(advanced_fatigue,isSwimming)) then {

        if (_fwdAngle < 0) then {
            _terrainGradient = 0.15 * _terrainGradient;
        };


        if (_sideAngle != 0) then {
            private _sideGradient = abs (_sideAngle / 45) min 1;

            _terrainFactor = 1 + _sideGradient ^ 4;
        };
    };


    _currentMetabolicHeatWattage = [_gearMass, _terrainGradient * ACEGVAR(advanced_fatigue,terrainGradientFactor) * 0.1, _terrainFactor, _currentSpeed] call ACEFUNC(advanced_fatigue,getMetabolicCosts);
};
// Mark end

private _radiationHeatWattage = _sigma*((_coreTemp^4) - (_suitTemp^4));
private _convectionTransferPower = HUMAN_SKIN_CONVECTION_COEFF*HUMAN_SURFACE_AREA*(_coreTemp - _suitTemp);

private _totalRadiatedCoreHeat = _radiationHeatWattage + _convectionTransferPower;

private _netHeatPower = _currentMetabolicHeatWattage - _totalRadiatedCoreHeat;
private _currentBodyHomeostatisCapacityRemaining = 0 max (_bodyHomeostatisCapacity - abs _netHeatPower);
private _currentBodyHomeostatisUsed = _bodyHomeostatisCapacity - _currentBodyHomeostatisCapacityRemaining;

if (GVAR(homeostasisDebug)) then {
    systemChat format ['Homeostatis Used: %1', _currentBodyHomeostatisUsed];
    systemChat format ['Homeostatis Remaining: %1', (_bodyHomeostatisCapacity - abs _netHeatPower)];
    systemChat format ['Core Temp: %1 C', _coreTemp - 273.15];
};

if (_netHeatPower > 0) then {
    _netHeatPower = 0 max (_netHeatPower - _bodyHomeostatisCapacity);
    _deltaTemp = ((abs _netHeatPower)/(HUMAN_SPECIFC_HEAT_CAPACITY*HUMAN_MASS));
    _coreTemp = _coreTemp + (_deltaTemp*_deltaT);
} else {
    if (_netHeatPower < 0) then {
        _netHeatPower = (_netHeatPower + _bodyHomeostatisCapacity) min 0;
        _deltaTemp = ((abs _netHeatPower)/(HUMAN_SPECIFC_HEAT_CAPACITY*HUMAN_MASS));
        _coreTemp = _coreTemp - (_deltaTemp*_deltaT);
    };
};

if (_netHeatPower == 0 && {(_coreTemp > HUMAN_NATURAL_CORETEMP) && {(abs( _coreTemp - HUMAN_NATURAL_CORETEMP) > 0.001)}}) then {

    _deltaTemp = ((_currentBodyHomeostatisCapacityRemaining)/(HUMAN_SPECIFC_HEAT_CAPACITY*HUMAN_MASS));
    _coreTemp = _coreTemp - (_deltaTemp*_deltaT);
} else {
    if (_netHeatPower == 0 && {(_coreTemp < HUMAN_NATURAL_CORETEMP) && {(abs( _coreTemp - HUMAN_NATURAL_CORETEMP) > 0.001)}}) then {

        _deltaTemp = ((_currentBodyHomeostatisCapacityRemaining)/(HUMAN_SPECIFC_HEAT_CAPACITY*HUMAN_MASS));
        _coreTemp = _coreTemp + (_deltaTemp*_deltaT);
    };
};

_unit setVariable [QGVAR(unitCoreTemp),_coreTemp,_syncValue];
_unit setVariable [QGVAR(unitRadiatedCoreTemp),_totalRadiatedCoreHeat,_syncValue];
