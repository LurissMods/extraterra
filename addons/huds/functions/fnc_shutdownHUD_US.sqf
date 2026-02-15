#include "..\script_component.hpp"
/*
* Author: Akaviri13 (Inherited from his code)
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
params ["_unit"];

if (_unit != ACE_player) exitWith {};

GVAR(hudPFH_fireControl) call CBA_fnc_removePerFrameHandler;
GVAR(hudPFH_HudGeneral) call CBA_fnc_removePerFrameHandler;
//GVAR(hudPFH_hudInertia) call CBA_fnc_removePerFrameHandler;

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

ACE_player setVariable [QEGVAR(lifesupport,suitActivated), false, true];

systemChat "Remove PFH fired!";
