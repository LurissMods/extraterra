#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {

    [ACE_player] call FUNC(initInjuryUI);
    call FUNC(aceMedicalAPIs);

    GVAR(originalPerformanceFactor) = ACEGVAR(advanced_fatigue,performanceFactor);
    GVAR(originalRecoveryFactor) = ACEGVAR(advanced_fatigue,recoveryFactor);
    GVAR(originalLoadFactor) = ACEGVAR(advanced_fatigue,loadFactor);
    GVAR(originalTerrainGradientFactor) = ACEGVAR(advanced_fatigue,terrainGradientFactor);

    [] call FUNC(init);

    /*[QACEGVAR(medical,handleUnitVitals),{

        params ["_unit", "_deltaT"];

        private _syncValues = false;

        [_unit,_deltaT,_syncValues] call FUNC(barotrauma);

    }] call CBA_fnc_addEventHandler;*/

}] call CBA_fnc_addEventHandler;
