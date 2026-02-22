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

(GVAR(vomitMild_UI)#0) ctrlSetPosition INJURY_POS_FULLSCREEN(_positionAdjustX,_positionAdjustY);
(GVAR(vomitMild_UI)#0) ctrlCommit 0;
