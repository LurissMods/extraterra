#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

GVAR(mainLoopInitalized) = false;
GVAR(currentEnvironRadiationPerHour) = NORMAL_BACKGROUND_RADIATION;
GVAR(allLifeSupportAreas) = [];

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

// #include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
