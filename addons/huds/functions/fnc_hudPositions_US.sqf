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

params ["_positionAdjustX", "_positionAdjustY"];

(GVAR(hudOutline_US)#0) ctrlSetPosition HUD_MASTER_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudOutline_US)#0) ctrlCommit 0;

(GVAR(hudMasterControl_US)#0) ctrlSetPosition HUD_MASTER_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudMasterControl_US)#0) ctrlCommit 0;

(GVAR(hudAirProgress_US)#0) ctrlSetPosition HUD_AIR_PROGRESS_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudAirProgress_US)#0) ctrlCommit 0;

(GVAR(hudBattProgress_US)#0) ctrlSetPosition HUD_BATT_PROGRESS_US_POS(_positionAdjustX,_positionAdjustY);
(GVAR(hudBattProgress_US)#0) ctrlCommit 0;
