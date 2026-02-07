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
        weapons[] = {"exterra_vacuumMuzzle"};
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"

class cfgSoundShaders {
	#include "m2CarbineSoundShaders.hpp"
};

class cfgSoundSets {
	#include "m2CarbineSoundSets.hpp"
};
