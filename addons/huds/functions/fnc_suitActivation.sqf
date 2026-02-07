#include "..\script_component.hpp"
/*
 * Author: Luriss
 * Checks if player is in direct sunlight. Returns thermal heating in watts.
 *
 * Arguments:
 * _selectedHud <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call exterra_huds_fnc_suitActivation
 *
 * Public: No
 */

params ["_suitFaction"];

//systemChat str _suitFaction;

switch (_suitFaction) do {
    //case 0: {call FUNC(hudInit_US)};
    //[_suitFaction] call FUNC(hudInertia);
    call FUNC(bootUp_US);
};
