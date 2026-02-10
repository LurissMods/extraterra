#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks if player is in direct sunlight. Returns thermal heating in watts.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_mainLoop
*
* Public: No
*/

private _extAtmText = nil;

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateRangefinder)";
    };
    case US_SUIT_FACTION: {
        _extAtmText = (GVAR(info_externalAtmo_text_US)#0);
    };
};


_atmAroundPlayer = (GETVAR(ACE_player,EGVAR(lifesupport,unitInAtmo),ATMO_STATE_ERROR));
switch _atmAroundPlayer do {
    case 0: {
        _extAtmText ctrlSetStructuredText parseText "<t align='center'> VACUUM";
        _extAtmText ctrlSetTextColor GVAR(textColor_danger_cbaSetting);
    };
    case 1: {
        _extAtmText ctrlSetStructuredText parseText "<t align='center'> 1 ATM";
        _extAtmText ctrlSetTextColor GVAR(textColor_safe_cbaSetting);
    };
    case 2: {
        _extAtmText ctrlSetStructuredText parseText "<t align='center'> 0.3 ATM";
        _extAtmText ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
        /*if (_prebreatheRatio < PREBREATHE_SAFE_THRESHOLD) then {
            (_extAtmText) ctrlSetTextColor GVAR(textColor_safe_cbaSetting);
        } else {
            (_extAtmText) ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
        };*/
    };
};
