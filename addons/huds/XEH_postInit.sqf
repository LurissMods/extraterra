#include "script_component.hpp"

if (!hasInterface) exitWith {};
if (!EGVAR(modules,mainLoopInitalized)) exitWith {};

["CBA_settingsInitialized", {
    //if (!GVAR(masterToggle)) exitWith {};

    //call FUNC(playerSuitCheckHandler); Redundant - moved check to statemachine
    call FUNC(initHUD_US);
    /*for "_i" from 0 to 0 do {
        [_i] call FUNC(hudInertia);
    };*/
    call FUNC(initPFH_HudInertia);

    ["CBA_SettingChanged", {
        params ["_name", "_value"];

        if (_name select [0, 13] != "exterra_huds_") exitWith {}; // This is here because the CBA event outputs debug info

        // keeping for now just in case I need it later

    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
