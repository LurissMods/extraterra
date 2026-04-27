#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {

    [ACE_player] call FUNC(initInjuryUI);
    call FUNC(addEventHandlers);

    GVAR(originalPerformanceFactor) = ACEGVAR(advanced_fatigue,performanceFactor);
    GVAR(originalRecoveryFactor) = ACEGVAR(advanced_fatigue,recoveryFactor);

    [] call FUNC(init);

    /*[QACEGVAR(medical,handleUnitVitals),{

        params ["_unit", "_deltaT"];

        private _syncValues = false;

        [_unit,_deltaT,_syncValues] call FUNC(barotrauma);

    }] call CBA_fnc_addEventHandler;*/

}] call CBA_fnc_addEventHandler;
