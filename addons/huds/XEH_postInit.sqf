#include "script_component.hpp"

//if (!EGVAR(modules,mainLoopInitalized)) exitWith {};

["CBA_settingsInitialized", {

    call FUNC(initHUD_US);

    [ACE_player] call FUNC(initPFH_HudInertia);
    call FUNC(initPFH_FireControl);
    call FUNC(initPFH_HudGeneral);
    call FUNC(initPFH_HudVisibility);

    call FUNC(initPFH_QuickSuitCheck);

    /*["CBA_SettingChanged", {
        params ["_name", "_value"];

        if (_name select [0, 13] != "exterra_huds_") exitWith {}; // This is here because the CBA event outputs debug info

        // keeping for now just in case I need it later

    }] call CBA_fnc_addEventHandler;*/
}] call CBA_fnc_addEventHandler;
