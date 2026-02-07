#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"

EGVAR(lifesupport,STATE_MACHINE) = (configFile >> "exterra_lifesupport_statemachine") call CBA_statemachine_fnc_createFromConfig;

ADDON = true;
