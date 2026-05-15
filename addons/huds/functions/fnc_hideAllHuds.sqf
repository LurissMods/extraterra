#include "..\script_component.hpp"
/*
* Author: Luriss
*  Hides all HUDs. Used in fnc_handlePlayerSwitch.
*
* Arguments:
* ["_unit"]     [<UNIT>]
* _unit = ACE_player
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_shutdownHUD_US
*
* Public: No
*/

params ["_unit","_isSwitch"];

if (_unit != ACE_player) exitWith {};

// ---------------------------------------------------------- US HUD ---------------------------------------------------------- //

GVAR(initPFH_FireControl_Activated) = false;
GVAR(initPFH_HudGeneral_Activated) = false;
GVAR(initPFH_hudInertia_Activated) = false;

GVAR(hudPixelation_PP) ppEffectEnable false;
GVAR(hudPixelation_PP) ppEffectCommit 0;

GVAR(hudChromAb_PP) ppEffectEnable false;
GVAR(hudChromAb_PP) ppEffectCommit 0;

GVAR(hudRadialBlur_PP) ppEffectEnable false;
GVAR(hudRadialBlur_PP) ppEffectCommit 0;

GVAR(filmGrain_PP) ppEffectEnable false;
GVAR(filmGrain_PP) ppEffectCommit 0;

{_x ctrlSetFade 1; _x ctrlCommit 0} forEach GVAR(hudElementsArray_US);

GET_SUIT_BOOLS(_unit) params ["_inFullSuit","_helmetBool","_suitBool","_packBool"];

if (_isSwitch) then {
    if (GET_SUIT_FACTION(_unit) == US_SUIT_FACTION && {_helmetBool}) then {
        (GVAR(helmetOutline_US)#0) ctrlSetFade 0;
        (GVAR(helmetOutline_US)#0) ctrlCommit 0;
    } else {
        (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
        (GVAR(helmetOutline_US)#0) ctrlCommit 0;
    };
} else {
    (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
    (GVAR(helmetOutline_US)#0) ctrlCommit 0;
};



(GVAR(hudBootText_US)#0) ctrlSetText "";
(GVAR(hudBootText_US)#0) ctrlCommit 0;

GVAR(bootIteration) = 0;
GVAR(bootAnimIteration) = 0;
GVAR(displayedBootText) = [];
