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

params ["_unit"];

private _lastTimeUpdated = GETVAR(_unit,GVAR(lastTimeUpdated),0);
private _deltaT = (CBA_missionTime - _lastTimeUpdated) min 10;
if (_deltaT < 1) exitWith { false }; // state machines could be calling this very rapidly depending on number of local units

SETVAR(_unit,GVAR(lastTimeUpdated),CBA_missionTime);
private _lastTimeValuesSynced = GETVAR(_unit,GVAR(lastMomentValuesSynced),0);
private _syncValue = (CBA_missionTime - _lastTimeValuesSynced) >= (10 + floor(random 10)); // Randomness is to avoid every unit syncing at the same time and killing the server

if (_syncValue) then {
    SETVAR(_unit,GVAR(lastMomentValuesSynced),CBA_missionTime);
};

//BEGIN_COUNTER(lifeSupport);

// Check what suit a unit is wearing and retrieve it's stats
[_unit, _syncValue] call FUNC(updateUnitSuit);

if (hasInterface) then {

    // Updates current air intake for players
    [_unit, _deltaT, _syncValue] call FUNC(updateUnitBreathing);

    // Updates the core temperature for players
    [_unit, _deltaT, _syncValue] call FUNC(updateCoreTemp);

    // Updates the suit temperature for players
    [_unit, _deltaT, _syncValue] call FUNC(updateSuitTemp);

    // Updates the radiation exposure for players
    [_unit, _syncValue] call FUNC(updateUnitRadiation);

} else {

};

private _currentAtmo = GETVAR(player,GVAR(unitInAtmo),-1);
private _inSuit = call EFUNC(huds,isInHelmAndSuit);
private _coreTempResults = [player] call FUNC(unitCoreTemp);
private _thermalSimulationResults = [(_inSuit#1),(_coreTempResults#1)] call FUNC(thermalSimulation);
private _radiationSimulationResults = call FUNC(radiationExposure);
private _prebreatheReturn = [(_inSuit#2),(_inSuit#4),_currentAtmo] call FUNC(prebreathing);

//[false,(_prebreatheReturn#0),(_prebreatheReturn#1),_currentAtmo] call EFUNC(injuries,barotrauma);

[(_inSuit#1),(_prebreatheReturn#0)] call EFUNC(huds,externalAtmoHud);
[(_inSuit#1),(_radiationSimulationResults#0),(_radiationSimulationResults#1),(_radiationSimulationResults#2)] call EFUNC(huds,radHud);

if (GETVAR(player,EGVAR(huds,suitEnabled),false)) then {
    [
        (_inSuit#1),
        (_thermalSimulationResults#0),
        (_thermalSimulationResults#1),
        (_thermalSimulationResults#2),
        (_thermalSimulationResults#3),
        (_thermalSimulationResults#4),
        (_thermalSimulationResults#5)
    ] call EFUNC(huds,suitTempsHud);
};

if ((_inSuit#0)) then {
    [(_inSuit#1)] call FUNC(breathingSimulation);
    [(_inSuit#1),(_thermalSimulationResults#1),(_thermalSimulationResults#2)] call FUNC(batterySimulation);
};

//END_COUNTER(lifeSupport);

true
