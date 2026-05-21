#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (!GVAR(masterToggle)) exitWith {};

    //call FUNC(addAceInteraction);

    [[
        QEGVAR(lifesupport,airTankUS_patrol0),
        QEGVAR(lifesupport,airTankUS_combat0),
        QEGVAR(lifesupport,batteryUS)
    ], "Life Support", "\z\exterra\addons\lifesupport\data\exterra_lifesupport_lsArsenalIcon_ca.paa", -1, false] call ace_arsenal_fnc_addRightPanelButton

}] call CBA_fnc_addEventHandler;
