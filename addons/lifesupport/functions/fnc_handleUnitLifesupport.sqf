#include "..\script_component.hpp"
/*
* Author: Luriss
* Main loop for life support calculations and HUD updates. Run on every local unit.
*
* Arguments:
* [_unit] [<UNIT>]
* _unit - nth Unit from an array of all units local to a client. Called by the statemachine (check lifesupport_statemachine)
*
* Return Value:
* [true] [<BOOL>] - Currently not used. Used to check if function has run or not
*
* Example:
* [_unit] call exterra_lifeSupport_fnc_handleUnitLifesupport;
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

_syncValue = [_unit,_syncValue] call FUNC(updateUnitAtmo);

// Check what suit a unit is wearing and retrieve it's stats
_syncValue = [_unit, _syncValue] call FUNC(updateUnitSuit);

// Updates current air intake for units
[_unit, _deltaT, _syncValue] call FUNC(updateUnitBreathing);

// Updates the core temperature for units
[_unit, _deltaT, _syncValue] call FUNC(updateCoreTemp);

// Updates the suit temperature for units
[_unit, _deltaT, _syncValue] call FUNC(updateSuitTemp);

// Updates the radiation exposure for units
[_unit, _syncValue] call FUNC(updateUnitRadiation);

if (GET_SUIT_ACTIVATED(_unit)) then {
    [_unit, _deltaT, _syncValue] call FUNC(updateBattery);

    if (hasInterface && {_unit == ACE_player}) then {
        //systemChat format ["%1 is ACE_player", _unit];
        //systemChat str _deltaT;
        call EFUNC(huds,updateRadDisplay);
        call EFUNC(huds,updateExternalAtmoDisplay);
        call EFUNC(huds,updateSuitTempDisplay);
        call EFUNC(huds,updateConsumableDisplay);
    };
};

//systemChat str (ACE_player getVariable [QACEGVAR(advanced_fatigue,respiratoryRate),-10]);

// Injuries
[_unit, _deltaT, _syncValue] call EFUNC(injuries,barotrauma);
[_unit, _deltaT, _syncValue] call EFUNC(injuries,ars);

//private _prebreatheReturn = [(_inSuit#2),(_inSuit#4),_currentAtmo] call FUNC(prebreathing);

//[(_inSuit#1),(_prebreatheReturn#0)] call EFUNC(huds,externalAtmoHud);
//[(_inSuit#1),(_radiationSimulationResults#0),(_radiationSimulationResults#1),(_radiationSimulationResults#2)] call EFUNC(huds,radHud);

/*if (GETVAR(player,EGVAR(huds,suitEnabled),false)) then {
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
};*/

//END_COUNTER(lifeSupport);

true
