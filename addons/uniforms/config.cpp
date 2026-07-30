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
        weapons[] = {QGVAR(usUndersuit),QGVAR(usBDU0),QGVAR(usHelmet0),QGVAR(usHelmet0_camo),QGVAR(usVestClean)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
