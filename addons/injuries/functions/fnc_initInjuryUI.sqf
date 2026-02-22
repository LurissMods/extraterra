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

if (!isPlayer _unit) exitWith {systemChat format ["(initHUD) Unit not a player: %1",_unit]};
if (!hasInterface) exitWith {systemChat format ["(initHUD) Unit client has no interface: %1",_unit]};
if (GETVAR(_unit,GVAR(initInjuryUI_Activated),false)) exitWith {systemChat format ["initHUD_US called twice! Unit: %1",_unit]};

systemChat format ["initInjuryUI ran for unit! %1",_unit];
_unit setVariable [QGVAR(initInjuryUI_Activated), true, true];

QGVAR(vomit_UI) cutText ["","PLAIN",-1,false];

QGVAR(vomit_UI) cutRsc [QGVAR(vomit_UI), "PLAIN", -1, false, true];

with uiNamespace do {
    private _display_vomit_UI = uiNamespace getVariable QGVAR(vomit_UI);

    GVAR(vomitMild_UI) = _display_vomit_UI displayCtrl IDC_VOMIT_MILD;
};

GVAR(vomitMild_UI) = [uiNamespace getVariable QGVAR(vomitMild_UI)];

(GVAR(vomitMild_UI)#0) ctrlSetTextColor [1,1,1,1];
(GVAR(vomitMild_UI)#0) ctrlSetFade 1;
(GVAR(vomitMild_UI)#0) ctrlCommit 0;
