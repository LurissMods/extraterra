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
        weapons[] = {QUOTE(exterra_uniforms_usUndersuit),QUOTE(exterra_uniforms_usBDU0),QUOTE(exterra_uniforms_usHelmet0),QUOTE(exterra_uniforms_usHelmet0_camo)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
