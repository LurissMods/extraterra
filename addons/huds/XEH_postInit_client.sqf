#include "script_component.hpp"

if (!hasInterface) exitWith {};
if (!EGVAR(modules,mainLoopInitalized)) exitWith {};

["CBA_settingsInitialized", {
    //if (!GVAR(masterToggle)) exitWith {};

    call FUNC(playerSuitCheckHandler);
    call FUNC(hudInit_US);
    for "_i" from 0 to 0 do {
        [_i] call FUNC(hudInertia);
    };

    call FUNC(mainInit);

    //[0] call FUNC(suitActivation);


    // - Add main loop at 1 second interval -------------------------------------------------------------
    //[FUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
