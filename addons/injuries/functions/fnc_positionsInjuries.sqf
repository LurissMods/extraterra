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

// note: being called by hud PFH

params ["_positionAdjustX", "_positionAdjustY"];

(GVAR(vomitMildScreen_UI)#0) ctrlSetPosition INJURY_POS_FULLSCREEN(_positionAdjustX,_positionAdjustY);
(GVAR(vomitMildScreen_UI)#0) ctrlCommit 0;

(GVAR(vomitModerateScreen_UI)#0) ctrlSetPosition INJURY_POS_FULLSCREEN(_positionAdjustX,_positionAdjustY);
(GVAR(vomitModerateScreen_UI)#0) ctrlCommit 0;

(GVAR(vomitSevereScreen_UI)#0) ctrlSetPosition INJURY_POS_FULLSCREEN(_positionAdjustX,_positionAdjustY);
(GVAR(vomitSevereScreen_UI)#0) ctrlCommit 0;

/*if (GVAR(vomitMild_screen)) then {
    (GVAR(vomitMild_UI)#0) ctrlSetPosition INJURY_POS_SCREEN_BOTTOM(_positionAdjustX,_positionAdjustY);
    (GVAR(vomitMild_UI)#0) ctrlSetFade 0;
    (GVAR(vomitMild_UI)#0) ctrlCommit 0;
    (GVAR(vomitMild_UI)#0) ctrlSetPosition INJURY_POS_FULLSCREEN(_positionAdjustX,_positionAdjustY);
    (GVAR(vomitMild_UI)#0) ctrlCommit 1;
    GVAR(vomitMild_screen) = false;
};*/
