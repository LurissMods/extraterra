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

params ["_targetDisplayAddressArray"];

_ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0],AGLToASL positionCameraToWorld [0,0,5000],vehicle player,objNull,true,1,"FIRE","NONE"];
_cursor_distance = if (count _ins > 0) then [{(_ins select 0 select 0) vectorDistance (eyePos player)},{5000}];

if (count _ins > 0) then {
    if ((round _cursor_distance) < 10) then {(_targetDisplayAddressArray#0) ctrlSetText format["000%1m", (round _cursor_distance)];} else {
        if ((round _cursor_distance) < 100) then {(_targetDisplayAddressArray#0) ctrlSetText format["00%1m", (round _cursor_distance)];} else {
            if ((round _cursor_distance) < 1000) then {(_targetDisplayAddressArray#0) ctrlSetText format["0%1m",(round _cursor_distance)];} else {
                (_targetDisplayAddressArray#0) ctrlSetText format["%1m",(round _cursor_distance)];
            };
        };
    };
} else {(_targetDisplayAddressArray#0) ctrlSetText format["- - - - m"]};

_aim_pos = (_ins select 0) select 0;
_mapGrid = if (count _ins > 0) then [{mapGridPosition _aim_pos},{"- - - - - -"}];

_cameraview = getCameraViewDirection player;
_azimuth = (_cameraview select 0) atan2 (_cameraview select 1);
_azimuth = round((_azimuth + 360) % 360);
if (_azimuth == 360) then {_azimuth = 0};

// Luriss: This formats the bearing into a 000 format. Otherwise it'll just be 9 instead of 009
if (_azimuth < 10) then {(_targetDisplayAddressArray#1) ctrlSetText format["00%1°", _azimuth];} else {
    if (_azimuth < 100) then {(_targetDisplayAddressArray#1) ctrlSetText format["0%1°", _azimuth];} else {
        (_targetDisplayAddressArray#1) ctrlSetText format["%1°", _azimuth];
    };
};

(_targetDisplayAddressArray#2) ctrlSetText format["%1", _mapGrid];
