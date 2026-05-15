#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(currentIntegrationInterval) = 1;
GVAR(lastIntegrationTime) = -86400;
GVAR(allLifeSupportAreas) = [];

GVAR(testTotal) = 0;

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// #include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
