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

params ["_currentLine"];
if (count GVAR(displayedBootText) > 23) then { // This controls the size of the list, provided it's smaller than the control group size. Default 14
    GVAR(displayedBootText) deleteAt 0; // This creates the scrolling effect - deletes "top" of list
};

GVAR(displayedBootText) pushBack [_currentLine];

[GVAR(displayedBootText)] call FUNC(parseBootUpText);
