#include "..\script_component.hpp"
/*
* Author: Akaviri13, Luriss
* Checks what units are surrounding the player. Run every frame.
* Called by the Fire Control PFH.
*
* Arguments:
* None
*
* Return Value:
* _nearUnitsArray   <ARRAY>
* _nearUnitsArray = Array of units surrounding the player.
*
* Example:
* [] call exterra_lifeSupport_fnc_updateUnitsNearPlayer
*
* Public: No
*/


private _filteredUnits = [];
private _nearUnits = nearestObjects [ACE_player, ["MAN","CAR","TANK","AIR","StaticWeapon"], (getObjectViewDistance select 0), true];
_nearUnits = _nearUnits - entities QUOTE(HeadlessClient_F);

private _nearUnitsArray = _nearUnits select {
    alive _x && {vehicle _x != vehicle ACE_player && {!(_x isKindOf "Animal")}};
};

// This is split from the check above due to being wildly CPU intensive. Ideally the check above will cull some non-valid units before it gets to this check
private _nearUnitsLOSArray = _nearUnitsArray select {
    private _unitBlocked = lineIntersects [eyePos ACE_player, eyePos _x, vehicle ACE_player, _x] OR terrainIntersectASL [eyePos ACE_player, eyePos _x];
    !_unitBlocked;
};

_nearUnitsLOSArray;
