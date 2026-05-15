#include "..\script_component.hpp"
/*
* Author: Akaviri13, Luriss
* Manages a global array (not broadcasted) that presents the boot up sequence text to the player.
*
* Arguments:
* ["_currentLine"] [<STRING>]
* Feed from the bootupText array defined in the bootHUD_XX functions
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_addBootUpLine
*
* Public: No
*/

params ["_currentLine"];
if (count GVAR(displayedBootText) > 23) then { // This controls the size of the list, provided it's smaller than the control group size. Default 14
    GVAR(displayedBootText) deleteAt 0; // This creates the scrolling effect - deletes "top" of list
};

GVAR(displayedBootText) pushBack [_currentLine];

[GVAR(displayedBootText)] call FUNC(parseBootUpText);
