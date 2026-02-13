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

QGVAR(HUD_US) cutText ["","PLAIN",-1,false];

QGVAR(HUD_US) cutRsc [QGVAR(HUD_US), "PLAIN", -1, false, false];

with uiNamespace do {
    private _displayHUD_US = uiNamespace getVariable QGVAR(HUD_US);

    GVAR(hudMasterControl_US) = _displayHUD_US displayCtrl 10028;
    GVAR(hudOutline_UStest) = _displayHUD_US displayCtrl 10029;
    GVAR(hudExtAtm_text_US) = _displayHUD_US displayCtrl 10030;
};

GVAR(hudMasterControl_US) = [uiNamespace getVariable QGVAR(hudMasterControl_US)];
GVAR(hudOutline_UStest) = [uiNamespace getVariable QGVAR(hudOutline_UStest)];
GVAR(hudExtAtm_text_US) = [uiNamespace getVariable QGVAR(hudExtAtm_text_US)];

//(GVAR(hudOutline_UStest)#0) ctrlSetPosition [0.5,0.5,1,1];
//(GVAR(hudOutline_UStest)#0) ctrlSetFade 0;
//(GVAR(hudOutline_UStest)#0) ctrlCommit 0;

(GVAR(hudOutline_UStest)#0) ctrlSetPosition [
    0,
    0,
    107 * pixelGridNoUIScale * pixelW,
    107 * pixelGridNoUIScale * pixelH
];
(GVAR(hudOutline_UStest)#0) ctrlSetFade 0;
(GVAR(hudOutline_UStest)#0) ctrlCommit 0;

(GVAR(hudExtAtm_text_US)#0) ctrlSetPosition [
    1.52,
    0.8,
    10 * pixelGridNoUIScale * pixelW,
    10 * pixelGridNoUIScale * pixelH
];
(GVAR(hudExtAtm_text_US)#0) ctrlSetText "1 ATM";
(GVAR(hudExtAtm_text_US)#0) ctrlSetTextColor [1,1,1,0.7];
(GVAR(hudExtAtm_text_US)#0) ctrlSetBackgroundColor [1,1,1,0];
(GVAR(hudExtAtm_text_US)#0) ctrlSetFade 0;
(GVAR(hudExtAtm_text_US)#0) ctrlCommit 0;

//["test", true, "staminaBar", false] call ace_ui_fnc_setElementVisibility;
