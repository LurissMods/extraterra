#include "script_component.hpp"

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(masterToggle);
GVAR(solarIrradianceSim);
GVAR(localTemperatureSim);
GVAR(localTemperatureSim_setting);
GVAR(homeostasisPower);
GVAR(homeostasisDebug);
GVAR(radShield_coeff0);
GVAR(radShield_coeff1);
GVAR(radShield_coeff2);
GVAR(radShield_coeff3);
GVAR(radShield_coeff4);
GVAR(radShield_coeff5);
GVAR(maxActiveCool_US) = temp;
GVAR(maxActiveHeat_US) = temp;

//GVAR(lifeSupportEnabled) = false;
GVAR(inAtmo) = 0;
GVAR(atmoEnteredSuit) = 1;
GVAR(prebreathingTimer) = TIME_TO_FULL_PREBREATHE;
GVAR(inRadShield) = 0;
GVAR(suitTemp) = NORMAL_TEMP;
GVAR(coreTemp) = HUMAN_NATURAL_CORETEMP;
GVAR(currentBatteryCapacity);

GVAR(playerAirReserve);

GVAR(lifetimeRadLevel) = 0;

GVAR(currentAirTank) = objNull;
GVAR(playerAirMaxReserve) = 100; //temp value

// private _category = [QUOTE(MOD_NAME), LLSTRING(displayName)];

#include "initSettings.inc.sqf"
// #include "initKeybinds.inc.sqf"
