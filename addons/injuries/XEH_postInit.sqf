#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {

    [ACE_player] call FUNC(initInjuryUI);

    GVAR(originalPerformanceFactor) = ACEGVAR(advanced_fatigue,performanceFactor);
    GVAR(originalRecoveryFactor) = ACEGVAR(advanced_fatigue,recoveryFactor);

    [] call FUNC(init);

}] call CBA_fnc_addEventHandler;
