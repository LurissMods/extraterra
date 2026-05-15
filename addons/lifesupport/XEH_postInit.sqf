#include "script_component.hpp"

//if (!hasInterface) exitWith {};
if (!EGVAR(modules,mainLoopInitalized)) exitWith {};

["CBA_settingsInitialized", {
    if (!GVAR(masterToggle)) exitWith {};

    call FUNC(addAceInteraction);

    [[
        QEGVAR(lifesupport,airTankUS),
        QEGVAR(lifesupport,batteryUS)
    ], "Life Support", "\z\exterra\addons\lifesupport\data\exterra_lifesupport_lsArsenalIcon_ca.paa", -1, false] call ace_arsenal_fnc_addRightPanelButton

}] call CBA_fnc_addEventHandler;
