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

params ["_unit","_deltaT","_syncValue"];

private _unitCoreTemp = GET_CORE_TEMP(_unit);

if (_unitCoreTemp > (HUMAN_NATURAL_CORETEMP - CORE_TEMP_ERROR)) exitWith {};

private _unitHashmap = _unit getVariable [QGVAR(unitHashmap),nil];

private _fatigueSeverity = linearConversion [HUMAN_NATURAL_CORETEMP,HYPOTHERMIA_DEATH,_unitCoreTemp,0,1,true];
private _heartRateSeverity = linearConversion [HYPOTHERMIA_MILD,HYPOTHERMIA_DEATH,_unitCoreTemp,0,HYPOTHERMIA_HR_LIMIT];
private _painSeverity = linearConversion [HYPOTHERMIA_MILD,HYPOTHERMIA_DEATH,_unitCoreTemp,0,HYPOTHERMIA_PAIN_LIMIT,true];

switch true do {
    case (_unitCoreTemp < HYPOTHERMIA_DEATH): {
        // Death - 0.03% chance per second (~66% chance 1 hour)
        if (random 1 < 0.0003) then {
            _unitHashmap set [((sID_DEATH*ID_RADIX) + iID_HYPOTHERM),[nil,nil,nil]];
        };

        // Cardiac Arrest
        _unitHashmap set [((sID_CARDIAC_ARREST*ID_RADIX) + iID_HYPOTHERM),[nil,nil,nil]];

        if !(GET_CYANOSIS_BOOL(_unit)) then {
            _unitHashmap set [((sID_CYANOSIS*ID_RADIX) + iID_HYPOTHERM),[true,nil,nil]];
        };
    };
    case (_unitCoreTemp < HYPOTHERMIA_SEVERE): {
        // Uncon - 0.03% chance per second (~66% chance 1 hour)
        if (random 1 < 0.0003) then {
            _unitHashmap set [((sID_UNCON*ID_RADIX) + iID_HYPOTHERM),[nil,nil,nil]];
        };

        if !(GET_CYANOSIS_BOOL(_unit)) then {
            _unitHashmap set [((sID_CYANOSIS*ID_RADIX) + iID_HYPOTHERM),[true,nil,nil]];
        };
    };
    case (_unitCoreTemp < HYPOTHERMIA_MODERATE): {
        if !(GET_CYANOSIS_BOOL(_unit)) then {
            _unitHashmap set [((sID_CYANOSIS*ID_RADIX) + iID_HYPOTHERM),[true,nil,nil]];
        };
    };
    case (_unitCoreTemp < HYPOTHERMIA_MILD): {
        if (GET_CYANOSIS_BOOL(_unit)) then {
            _unitHashmap set [((sID_CYANOSIS*ID_RADIX) + iID_HYPOTHERM),[false,nil,nil]];
        };
    };
    default {
        if (GET_CYANOSIS_BOOL(_unit)) then {
            _unitHashmap set [((sID_CYANOSIS*ID_RADIX) + iID_HYPOTHERM),[false,nil,nil]];
        };
    };
};

// Fatigue + Weakness
_unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_HYPOTHERM),[_fatigueSeverity,nil,nil]];
_unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_HYPOTHERM),[_fatigueSeverity,nil,nil]];
// Heart Rate
_unitHashmap set [((sID_HR*ID_RADIX) + iID_HYPOTHERM),[_heartRateSeverity,nil,nil]];
// Pain
_unitHashmap set [((sID_PAIN*ID_RADIX) + iID_HYPOTHERM),[_painSeverity,nil,nil]];
