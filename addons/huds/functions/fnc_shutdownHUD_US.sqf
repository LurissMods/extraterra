#include "..\script_component.hpp"
/*
* Author: Luriss
* Shutdown the US HUD. Called by the suitDeactivated CBA local event (see (huds, CfgVehicles) and (lifesupport_statemachine, startSuitShutdown)).
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

params ["_unit"];

if (_unit != ACE_player) exitWith {};

//GVAR(hudPFH_fireControl) call CBA_fnc_removePerFrameHandler;
//GVAR(hudPFH_HudGeneral) call CBA_fnc_removePerFrameHandler;
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

(GVAR(helmetOutline_US)#0) ctrlSetFade 0;
(GVAR(helmetOutline_US)#0) ctrlCommit 0;

(GVAR(hudBootText_US)#0) ctrlSetText "";
(GVAR(hudBootText_US)#0) ctrlCommit 0;

GVAR(bootIteration) = 0;
GVAR(bootAnimIteration) = 0;
GVAR(displayedBootText) = [];

ACE_player setVariable [QEGVAR(lifesupport,suitActivated), false, true];
