#include "..\script_component.hpp"
/*
* Author: Luriss
* Main loop for life support calculations and HUD updates. Run on every local unit.
*
* Arguments:
* [_unit] [<UNIT>]
* _unit - nth Unit from an array of all units local to a client. Called by the statemachine (check statemachine)
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

[_unit, _syncValue] call FUNC(activateSuitAI); // Note: For some reason returning syncValue from this breaks everything?

_syncValue = [_unit, _deltaT, _syncValue] call FUNC(updateConsumeables);

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
        call EFUNC(huds,updateRadDisplay);
        call EFUNC(huds,updateExternalAtmoDisplay);
        [_deltaT] call EFUNC(huds,updateSuitTempDisplay);
        [_deltaT] call EFUNC(huds,updateConsumableDisplay);
    };
};

// Injuries
_syncValue = [_unit, _deltaT, _syncValue] call EFUNC(injuries,updateInjuryEbullism);
_syncValue = [_unit, _deltaT, _syncValue] call EFUNC(injuries,updateInjuryArs);
[_unit, _deltaT, _syncValue] call EFUNC(injuries,updateInjuryAsphyxiation);
[_unit, _deltaT, _syncValue] call EFUNC(injuries,updateInjuryHyperthermia);
[_unit, _deltaT, _syncValue] call EFUNC(injuries,updateInjuryHypothermia);
[_unit, _deltaT, _syncValue] call EFUNC(injuries,updateSymptoms);

if (_unit == ACE_player) then {
    //systemChat str _deltaT;
};

//END_COUNTER(lifeSupport);

true
