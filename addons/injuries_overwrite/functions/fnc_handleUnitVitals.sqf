#include "..\script_component.hpp"
/*
* Author: Glowbal
* Updates the vitals. Called from the statemachine's onState functions.
*
* Arguments:
* 0: The Unit <OBJECT>
*
* Return Value:
* Update Ran (at least 1 second between runs) <BOOL>
*
* Example:
* [player] call ace_medical_vitals_fnc_handleUnitVitals
*
* Public: No
*/

params ["_unit"];

private _lastTimeUpdated = _unit getVariable [QACEGVAR(medical_vitals,lastTimeUpdated), 0];
private _deltaT = (CBA_missionTime - _lastTimeUpdated) min 10;
if (_deltaT < 1) exitWith { false }; // state machines could be calling this very rapidly depending on number of local units

//BEGIN_COUNTER(Vitals);

_unit setVariable [QACEGVAR(medical_vitals,lastTimeUpdated), CBA_missionTime];
private _lastTimeValuesSynced = _unit getVariable [QACEGVAR(medical_vitals,lastMomentValuesSynced), 0];
private _syncValues = (CBA_missionTime - _lastTimeValuesSynced) >= (10 + floor(random 10));

if (_syncValues) then {
    _unit setVariable [QACEGVAR(medical_vitals,lastMomentValuesSynced), CBA_missionTime];
};

// Update SPO2 intake and usage since last update
[_unit, _deltaT, _syncValues] call ACEFUNC(medical_vitals,updateOxygen);

// Update blood volume
[_unit, _deltaT, _syncValues] call ACEFUNC(medical_vitals,updateBloodVolume);

// Update pain (currently only tourniquets)
[_unit, _syncValues] call ACEFUNC(medical_vitals,updatePain);

// Consume medications
_syncValues = [_unit, _deltaT, _syncValues] call ACEFUNC(medical_vitals,consumeMedications);

if (EGVAR(modules,mainLoopInitalized)) then {
    [_unit,_deltaT,_syncValues] call EFUNC(injuries,hyperthermia);
    [_unit,_deltaT,_syncValues] call EFUNC(injuries,hypothermia);
    [_unit,_deltaT,_syncValues] call EFUNC(injuries,ars);

    [_unit] call EFUNC(injuries,cardiacArrest);
};

// Update blood presure
[_unit, _syncValues] call ACEFUNC(medical_vitals,updateBloodPressure);

// Update statemachine and status variables
[_unit, _syncValues] call ACEFUNC(medical_vitals,updateState);

//END_COUNTER(Vitals);



[QACEGVAR(medical,handleUnitVitals), [_unit, _deltaT]] call CBA_fnc_localEvent;

true
