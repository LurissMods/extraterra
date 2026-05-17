#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"Luriss"};
        url = ECSTRING(main,url);
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            QUOTE(exterra_main),
            QUOTE(exterra_common),
            QUOTE(exterra_statemachine),
            QUOTE(exterra_modules),
            QUOTE(ace_common),
            QUOTE(ace_advanced_fatigue),
            QUOTE(ace_medical_vitals),
        };
        units[] = {};
        weapons[] = {};
        magazines[] = {QGVAR(airTankUS_patrol0),QGVAR(airTankUS_combat0),QGVAR(batteryUS)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
