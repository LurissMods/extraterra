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
            QUOTE(ace_advanced_fatigue),
        };
        units[] = {};
        weapons[] = {};
        magazines[] = {};
        VERSION_CONFIG;
    };
};

#include "Statemachine.hpp"
#include "CfgEventHandlers.hpp"
