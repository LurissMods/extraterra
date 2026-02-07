#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(vacExposeCalled);
GVAR(vacExposeTimer);
GVAR(barotraumaTimer) = 0;
GVAR(vacExposureColor_PP) = ppEffectCreate ["ColorCorrections", 3000];
GVAR(vacExposureBlur_PP) = ppEffectCreate ["DynamicBlur", 400];
//GVAR(barotraumaDizziness_PP) = ppEffectCreate ["RadialBlur", 100];

GVAR(vacExpose_handler);
GVAR(barotraumaInit) = false;

GVAR(unitCurrentCoreTempFlag) = nil;

GVAR(cardiacArrestTimer) = 0;
GVAR(cardiacArrestFlag) = false;

GVAR(radLim0Time) = 0;
GVAR(radLim1Time) = 0;
GVAR(radLim2Time) = 0;
GVAR(radLim3Time) = 0;
GVAR(radLim4Time) = 0;
GVAR(radLim5Time) = 0;

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
