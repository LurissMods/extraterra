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
            QUOTE(exterra_modules),
        };
        units[] = {};
        weapons[] = {QUOTE(exterra_weapons_m2Carbine)};
        magazines[] = {QUOTE(exterra_weapons_30rnd_5p56x55mm), QUOTE(exterra_weapons_30rnd_5p56x55mm_tracer)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMovesBasic.hpp"
#include "CfgGesturesMale.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgRecoils.hpp"
#include "CfgWeapons.hpp"
