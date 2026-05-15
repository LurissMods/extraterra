#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates the HUD's current external atmosphere control.
* Called by the statemachine (lifesupport, handleUnitLifesupport).
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateExternalAtmoDisplay
*
* Public: No
*/

private _extAtmText = nil;

switch (GET_SUIT_FACTION(ACE_player)) do {
    case NO_SUIT_FACTION: {
        ERROR_1("Suit faction undefined! Unit: %1",ACE_player);
    };
    case US_SUIT_FACTION: {
        _extAtmText = (GVAR(hudExtAtm_text_US)#0);
    };
};

//_atmAroundPlayer = (GETVAR(ACE_player,EGVAR(lifesupport,unitInAtmo),ATMO_STATE_ERROR));
switch (GET_ATMO(ACE_player)) do {
    case 0: {
        _extAtmText ctrlSetStructuredText parseText "<t size='1.0'>VACUUM</t>";
        _extAtmText ctrlSetTextColor GVAR(textColor_US_danger_cbaSetting);
    };
    case 1: {
        _extAtmText ctrlSetStructuredText parseText "<t size='1.0'>1 ATM</t>";
        _extAtmText ctrlSetTextColor GVAR(textColor_US_safe_cbaSetting);
    };
    case 2: {
        _extAtmText ctrlSetStructuredText parseText "<t size='1.0'>0.3 ATM</t>";
        _extAtmText ctrlSetTextColor GVAR(textColor_US_caution_cbaSetting);
        /*if (_prebreatheRatio < PREBREATHE_SAFE_THRESHOLD) then {
            (_extAtmText) ctrlSetTextColor GVAR(textColor_safe_cbaSetting);
        } else {
            (_extAtmText) ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
        };*/
    };
};
