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

if (!LRSS_MJOLNIR_hudEventHandlerAdded) exitWith {};
LRSS_MJOLNIR_hudEventHandlerAdded = false;
(GVAR(hudOutline_US)#0) ctrlSetTextColor [0,0,0,0];
//(LRSS_US_hudOverlayColor#0) ctrlSetTextColor [0,0,0,0];
GVAR(hudInteriaHandle) call CBA_fnc_removePerFrameHandler;
