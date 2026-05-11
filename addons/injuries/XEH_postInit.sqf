#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {

    [ACE_player] call FUNC(initInjuryUI);
    call FUNC(aceMedicalAPIs);

    GVAR(originalPerformanceFactor) = ACEGVAR(advanced_fatigue,performanceFactor);
    GVAR(originalRecoveryFactor) = ACEGVAR(advanced_fatigue,recoveryFactor);
    GVAR(originalLoadFactor) = ACEGVAR(advanced_fatigue,loadFactor);
    GVAR(originalTerrainGradientFactor) = ACEGVAR(advanced_fatigue,terrainGradientFactor);

    GVAR(injuriesPFH_lowOxygenPP) = [{

        call FUNC(lowBloodFlowEffectPP);

        }, 0, []
    ] call CBA_fnc_addPerFrameHandler;

}] call CBA_fnc_addEventHandler;
