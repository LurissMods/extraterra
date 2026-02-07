#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    //systemChat "Post init running";


    // - Add main loop at 1 second interval -------------------------------------------------------------
    //[FUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
