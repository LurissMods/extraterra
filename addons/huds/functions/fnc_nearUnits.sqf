#include "..\script_component.hpp"
/*
 * Author: Akaviri13 (Inherited from his code)
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


private _filteredUnits = [];
private _nearUnits = nearestObjects [player, ["MAN","CAR","TANK","AIR","StaticWeapon"], GVAR(IFF_range), true];

private _nearUnitsArray = _nearUnits select {
    private _unitBlocked = lineIntersects [eyePos player, eyePos _x, vehicle player, _x] OR terrainIntersectASL [eyePos player, eyePos _x];
    alive _x && vehicle _x != vehicle player && !_unitBlocked && !(_x isKindOf "Animal");
};

_nearUnitsArray;
