#include "script_component.hpp"

/*if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    if (!GVAR(masterToggle)) exitWith {};

    // - Add main loop at 1 second interval -------------------------------------------------------------
    [FUNC(thermalSimulation), [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;*/

["unit", LINKFUNC(handlePlayerSwitch)] call CBA_fnc_addPlayerEventHandler;
