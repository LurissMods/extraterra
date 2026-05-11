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

params ["_unit","_canLimp"];

// Note: Not the best way of doing this. Edge case where surviving asphyxiation can "cure" ace limping from an injury
if _canLimp then {
    _unit setHitPointDamage ["HitLegs", 0.5];
} else {
    _unit setHitPointDamage ["HitLegs", 0.0];
};
