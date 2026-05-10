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

params ["_unit","_severity","_visorType"];

if (!isPlayer _unit) exitWith {};

switch _severity do {
    case 0: {
        playSound QGVAR(vomitMild_snd);
        (GVAR(vomitMildScreen_UI)#0) ctrlSetFade 0;
        (GVAR(vomitMildScreen_UI)#0) ctrlCommit 0;
    };
    case 1: {
        (GVAR(vomitMildScreen_UI)#0) ctrlSetFade 1;
        (GVAR(vomitMildScreen_UI)#0) ctrlCommit 0;

        playSound QGVAR(vomitMild_snd);
        (GVAR(vomitModerateScreen_UI)#0) ctrlSetFade 0;
        (GVAR(vomitModerateScreen_UI)#0) ctrlCommit 0;
    };
    case 2: {
        (GVAR(vomitMildScreen_UI)#0) ctrlSetFade 1;
        (GVAR(vomitMildScreen_UI)#0) ctrlCommit 0;
        (GVAR(vomitModerateScreen_UI)#0) ctrlSetFade 1;
        (GVAR(vomitModerateScreen_UI)#0) ctrlCommit 0;

        playSound QGVAR(vomitMild_snd);
        (GVAR(vomitSevereScreen_UI)#0) ctrlSetFade 0;
        (GVAR(vomitSevereScreen_UI)#0) ctrlCommit 0;
    };
};
