#include "script_component.hpp"

["CBA_settingsInitialized", {

    [QGVAR(stormEvent),{
        params ["_duration", "_maxDose"];
        [_duration,_maxDose] call FUNC(updateSolarStorm);
    }] call CBA_fnc_addEventHandler;

    [QGVAR(stormEventEnded),{
        GVAR(solarStorm_PFH) call CBA_fnc_removePerFrameHandler;
        systemChat "Solar Storm PFH removed!";
    }] call CBA_fnc_addEventHandler;

}] call CBA_fnc_addEventHandler;
