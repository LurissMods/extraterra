#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(hudPixelation_PP) = ppEffectCreate ["Resolution", 1];
GVAR(hudChromAb_PP) = ppEffectCreate ["ChromAberration", 200];
GVAR(hudRadialBlur_PP) = ppEffectCreate ["RadialBlur", 100];
GVAR(filmGrain_PP) = ppEffectCreate ["FilmGrain", 2000];

// ------------------------------------ DO NOT TOUCH ------------------------------------
GVAR(whitelistHelmets) = [];
GVAR(whitelistSuits) = [];
GVAR(whitelistPacks) = [];

GVAR(oldViewAngleX);
GVAR(oldViewAngleY);
GVAR(hudAngleX) = 0;
GVAR(hudAngleY) = 0;

GVAR(bootIteration) = 0;
GVAR(bootAnimIteration) = 0;
GVAR(displayedBootText) = [];
// ------------------------------------ DO NOT TOUCH ------------------------------------

GVAR(IFF_range) = DEFAULT_IFF_RANGE; // Maybe change to a CBA setting?

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
