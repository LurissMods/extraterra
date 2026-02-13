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

params ["_positionAdjustX", "_positionAdjustY"];

private _rangefinderControlGroup = (GVAR(rangefinder_controlGroup_US)#0);
private _infoControlGroup = (GVAR(info_controlGroup_US)#0);
private _weaponControlGroup = (GVAR(weapon_controlGroup_US)#0);
private _squadControlGroup = (GVAR(squad_controlGroup_US)#0);
private _helmetOutline = (GVAR(helmetOutline_US)#0);
private _hudOutline = (GVAR(hudOutline_US)#0);
private _airBar = (GVAR(airBar_US)#0);
private _battBar = (GVAR(battBar_US)#0);

private _testHud = (GVAR(hudMasterControl_US)#0);
private _testHudPos = [
    safeZoneX + (safeZoneW * 0.5) - ((107 * pixelGridNoUIScale * pixelW) * 0.5) + _positionAdjustX,
    safeZoneY + (safeZoneH * 0.5) - ((107 * pixelGridNoUIScale * pixelH) * 0.5) + _positionAdjustY,
    107 * pixelGridNoUIScale * pixelW,
    107 * pixelGridNoUIScale * pixelH
];
_testHud ctrlSetPosition _testHudPos;
_testHud ctrlSetFade 0;
_testHud ctrlCommit 0;

private _infoControlPosition = [0.275 * safeZoneW + safeZoneX + _positionAdjustX,-0.0425 * safeZoneH + safeZoneY + _positionAdjustY,0.45 * safeZoneW,0.2 * safeZoneH];
private _rangefinderControlPosition = [0.4296875 * safeZoneW + safeZoneX + _positionAdjustX,0.0535 * safeZoneH + safeZoneY + _positionAdjustY,0.140625 * safeZoneW,0.125 * safeZoneH];
private _squadControlPosition = [0 * safeZoneW + safeZoneX + _positionAdjustX,0.75 * safeZoneH + safeZoneY + _positionAdjustY,0.28125 * safeZoneW,0.25 * safeZoneH];
private _weaponControlPosition = [0.716737 * safeZoneW + safeZoneX + _positionAdjustX,0.753 * safeZoneH + safeZoneY + _positionAdjustY,0.28125 * safeZoneW,0.25 * safeZoneH];
private _hudOutlinePositions = [-0.0625 * safeZoneW + safeZoneX + _positionAdjustX, -0.54 * safeZoneH + safeZoneY + _positionAdjustY, 1.125 * safeZoneW, 2 * safeZoneH];
private _airBarPosition = [0.419 * safeZoneW + safeZoneX + _positionAdjustX,-0.035 * safeZoneH + safeZoneY + _positionAdjustY,0.061875 * safeZoneW,0.11 * safeZoneH];
private _battBarPosition = [0.419 * safeZoneW + safeZoneX + _positionAdjustX,0.02275 * safeZoneH + safeZoneY + _positionAdjustY,0.0691875 * safeZoneW,0.123 * safeZoneH];

_rangefinderControlGroup ctrlSetPosition _rangefinderControlPosition;
_infoControlGroup ctrlSetPosition _infoControlPosition;
_squadControlGroup ctrlSetPosition _squadControlPosition;
_weaponControlGroup ctrlSetPosition _weaponControlPosition;
_airBar ctrlSetPosition _airBarPosition;
_battBar ctrlSetPosition _battBarPosition;
_helmetOutline ctrlSetPosition _hudOutlinePositions;
_hudOutline ctrlSetPosition _hudOutlinePositions;

_rangefinderControlGroup ctrlCommit 0;
_infoControlGroup ctrlCommit 0;
_weaponControlGroup ctrlCommit 0;
_squadControlGroup ctrlCommit 0;
_airBar ctrlCommit 0;
_battBar ctrlCommit 0;
_helmetOutline ctrlCommit 0;
_hudOutline ctrlCommit 0;
