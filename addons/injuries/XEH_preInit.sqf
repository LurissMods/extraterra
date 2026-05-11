#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(vacExposureColor_PP) = ppEffectCreate ["ColorCorrections", 3000];
GVAR(vacExposureBlur_PP) = ppEffectCreate ["DynamicBlur", 400];
//GVAR(barotraumaDizziness_PP) = ppEffectCreate ["RadialBlur", 100];


// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
