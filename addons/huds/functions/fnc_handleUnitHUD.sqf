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

// This should ONLY run on the player client for that specific player
/*if (hasInterface && {_unit == ACE_player}) then {

    [call FUNC(nearUnits)] call FUNC(IFF); // Note: This doesn't work, just used a PFH in the startup state
    call FUNC(weaponCrosshair);
    call FUNC(nametags);

};*/

private _lastTimeUpdated = GETVAR(_unit,GVAR(lastTimeUpdated),0);
private _deltaT = (CBA_missionTime - _lastTimeUpdated) min 10;
if (_deltaT < 1) exitWith { false }; // state machines could be calling this very rapidly depending on number of local units

SETVAR(_unit,GVAR(lastTimeUpdated),CBA_missionTime);
private _lastTimeValuesSynced = GETVAR(_unit,GVAR(lastMomentValuesSynced),0);
private _syncValue = (CBA_missionTime - _lastTimeValuesSynced) >= (10 + floor(random 10)); // Randomness is to avoid every unit syncing at the same time and killing the server

if (_syncValue) then {
    SETVAR(_unit,GVAR(lastMomentValuesSynced),CBA_missionTime);
};
