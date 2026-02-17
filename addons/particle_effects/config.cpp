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
        };
        units[] = {};
        weapons[] = {};
        vehicles[] = {QUOTE(exterra_particle_effects_FxCartridge_5p56x55mm)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgCloudlets.hpp"
#include "CfgVehicles.hpp"
#include "complexEffects.hpp"
