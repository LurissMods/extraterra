#include "..\script_component.hpp"
/*
* Author: Akaviri13 and Luriss
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

//params ["_targetDisplayAddressArray"];

private _rangefinderAddressName = nil;
private _bearingAddressName = nil;
private _gridAddressName = nil;

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateRangefinder)";
    };
    case US_SUIT_FACTION: {
        _rangefinderAddressName = (GVAR(rangefinder_range_US)#0);
        _bearingAddressName = (GVAR(rangefinder_bearing_US)#0);
        _gridAddressName = (GVAR(rangefinder_grid_US)#0);
    };
};

_ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle ACE_player,objNull,true,1,"FIRE","NONE"];
_cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyePos ACE_player)},{5000}];

if (count _ins > 0) then {
    if ((round _cursor_distance) < 10) then {_rangefinderAddressName ctrlSetText format["000%1m", (round _cursor_distance)];} else {
        if ((round _cursor_distance) < 100) then {_rangefinderAddressName ctrlSetText format["00%1m", (round _cursor_distance)];} else {
            if ((round _cursor_distance) < 1000) then {_rangefinderAddressName ctrlSetText format["0%1m",(round _cursor_distance)];} else {
                _rangefinderAddressName ctrlSetText format["%1m",(round _cursor_distance)];
            };
        };
    };
} else {_rangefinderAddressName ctrlSetText format["- - - - m"]};

_aim_pos = (_ins select 0) select 0;
_mapGrid = if (count _ins > 0) then [{mapGridPosition _aim_pos},{"- - - - - -"}];

_cameraview = getCameraViewDirection ACE_player;
_azimuth = (_cameraview select 0) atan2 (_cameraview select 1);
_azimuth = round((_azimuth + 360) % 360);
if (_azimuth == 360) then {_azimuth = 0};

// Luriss: This formats the bearing into a 000 format. Otherwise it'll just be 9 instead of 009
if (_azimuth < 10) then {_bearingAddressName ctrlSetText format["00%1°", _azimuth];} else {
    if (_azimuth < 100) then {_bearingAddressName ctrlSetText format["0%1°", _azimuth];} else {
        _bearingAddressName ctrlSetText format["%1°", _azimuth];
    };
};

_gridAddressName ctrlSetText format["%1", _mapGrid];
