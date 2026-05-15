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

params ["_unit"];

if (_unit != ACE_player) exitWith {};
if (!hasInterface) exitWith {};
if (GETVAR(_unit,GVAR(initInjuryUI_Activated),false)) exitWith {};

//systemChat format ["initInjuryUI ran for unit! %1",_unit];
_unit setVariable [QGVAR(initInjuryUI_Activated), true, true];

QGVAR(vomit_UI) cutText ["","PLAIN",-1,false];

QGVAR(vomit_UI) cutRsc [QGVAR(vomit_UI), "PLAIN", -1, false, true];

with uiNamespace do {
    private _display_vomit_UI = uiNamespace getVariable QGVAR(vomit_UI);

    GVAR(vomitMildScreen_UI) = _display_vomit_UI displayCtrl IDC_VOMIT_MILD_SCREEN;
    GVAR(vomitModerateScreen_UI) = _display_vomit_UI displayCtrl IDC_VOMIT_MODERATE_SCREEN;
    GVAR(vomitSevereScreen_UI) = _display_vomit_UI displayCtrl IDC_VOMIT_SEVERE_SCREEN;
};

GVAR(vomitMildScreen_UI) = [uiNamespace getVariable QGVAR(vomitMildScreen_UI)];
GVAR(vomitModerateScreen_UI) = [uiNamespace getVariable QGVAR(vomitModerateScreen_UI)];
GVAR(vomitSevereScreen_UI) = [uiNamespace getVariable QGVAR(vomitSevereScreen_UI)];

(GVAR(vomitMildScreen_UI)#0) ctrlSetTextColor [1,1,1,1];
(GVAR(vomitMildScreen_UI)#0) ctrlSetFade 1;
(GVAR(vomitMildScreen_UI)#0) ctrlCommit 0;

(GVAR(vomitModerateScreen_UI)#0) ctrlSetTextColor [1,1,1,1];
(GVAR(vomitModerateScreen_UI)#0) ctrlSetFade 1;
(GVAR(vomitModerateScreen_UI)#0) ctrlCommit 0;

(GVAR(vomitSevereScreen_UI)#0) ctrlSetTextColor [1,1,1,1];
(GVAR(vomitSevereScreen_UI)#0) ctrlSetFade 1;
(GVAR(vomitSevereScreen_UI)#0) ctrlCommit 0;
