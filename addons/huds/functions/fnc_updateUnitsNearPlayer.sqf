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

private _fovTop = getResolution#6;
private _fovSide = getResolution#7;
private _fovRatio = getObjectFOV ACE_Player/_fovTop;

private _viewTheta = deg((_fovSide*_fovRatio)/2) min 89.99;

private _frustumAdjacent = getObjectViewDistance#0;
private _frustumOpposite = _frustumAdjacent * tan(_viewTheta);

// NOTE: positionCameraToWorld uses [x,z,y] format
viewFrustum = [(positionCameraToWorld  [-0.5,0,0]), (positionCameraToWorld  [-_frustumOpposite,0,_frustumAdjacent]), (positionCameraToWorld  [_frustumOpposite,0,_frustumAdjacent]), (positionCameraToWorld  [0.5,0,0])];

private _allUnits = entities [["MAN","CAR","TANK","AIR","StaticWeapon"], ["HeadlessClient_F"], false, true];

private _filterKnowledge = [_allUnits] call FUNC(updatePlayerDatalink);

private _filterFrustum = _filterKnowledge select {
    _x inPolygon viewFrustum;
};

private _filterUnitState = _filterFrustum select {
    _x != vehicle ACE_player && {lifeState _x != "INCAPACITATED"};
};

// This is split from the check above due to being wildly CPU intensive. Ideally the check above will cull some non-valid units before it gets to this check
private _nearUnitsLOSArray = _filterUnitState select {
    private _unitBlocked = (terrainIntersectASL [eyePos ACE_player, eyePos _x] || {lineIntersects [eyePos ACE_player, eyePos _x, vehicle ACE_player, _x]});
    !_unitBlocked;
    //true;
};

_nearUnitsLOSArray;
