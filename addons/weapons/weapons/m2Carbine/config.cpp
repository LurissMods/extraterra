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
            QUOTE(exterra_weapons),
        };
        units[] = {};
        weapons[] = {"exterra_m2Carbine_base", "exterra_m2Carbine"};
        VERSION_CONFIG;
    };
};

#include "CfgMovesBasic.hpp"
#include "CfgGesturesMale.hpp"
#include "CfgWeapons.hpp"
