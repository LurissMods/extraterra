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

//systemChat "Main loop running!";

/*private _lastTimeUpdated = ACE_player getVariable [QACEGVAR(medical_vitals,lastTimeUpdated), 0]; // Note: ACE_player put here until multiplayer compat
private _deltaT = (CBA_missionTime - _lastTimeUpdated) min 10;
if (_deltaT < 1) exitWith { false };*/

/*
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

//SETVAR(ace_player,GVAR(currentActiveCool),0);
//SETVAR(ace_player,GVAR(currentActiveHeat),0);
SETVAR(ace_player,GVAR(unitSuitTemp),(_thermalSimulationResults#0));
SETVAR(ace_player,GVAR(unitLifetimeRadLevel),(_radiationSimulationResults#0));
SETVAR(ace_player,GVAR(unitCoreTemp),(_coreTempResults#0));

true;

[LINKFUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
*/
