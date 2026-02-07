#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

GVAR(menuToggleKeybind);
GVAR(lastOpenedOn);
GVAR(menuPFH) = -1;
GVAR(currentSelectedAirTank) = 0;
GVAR(unitInventoryChangedEH);

// #include "initSettings.inc.sqf"
#include "initKeybinds.inc.sqf"
