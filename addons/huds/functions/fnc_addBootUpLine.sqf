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

params ["_text", "_bootUpLines", "_suitFaction"];
if (count _bootUpLines > 45) then { // This controls the size of the list, provided it's smaller than the control group size. Default 14
    _bootUpLines deleteAt 0; // This creates the scrolling effect - deletes "top" of list
};

_bootUpLines pushBack [_text];

[_suitFaction,_bootUpLines] call FUNC(parseBootUpText);
