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

params ["_squadMemberAddressArray", "_squadMemberHealthAddressArray", "_prevGroupSize"];

_playerGroup = (group player);

{
    if (_x != player && {lifeState _x == "DEAD"}) then {
        [_x] join grpNull;
    };
} forEach (units _playerGroup);

_playerGroupUnitsNoLeader = (units _playerGroup) - [leader _playerGroup];
_groupSize = (count units _playerGroup) min 18;
_transparency = GVAR(fireControl_groupColor) select 3;
_groupHudText = [];

if (_prevGroupSize != _groupSize) then {
    for "_i" from 0 to _groupSize do {
        (_squadMemberAddressArray select _i) ctrlSetText "";
        (_squadMemberHealthAddressArray select _i) ctrlSetTextColor [0,0,0,0];
    };
};

if (_groupSize < 2) then {
    {
        _x ctrlSetText "";
    } forEach _squadMemberAddressArray;

    {
        _x ctrlSetTextColor [0,0,0,0];
    } forEach _squadMemberHealthAddressArray;
} else {

    _groupLeaderHeartRate = (leader _playerGroup) getVariable ["ace_medical_heartRate", 80];
    _convertedHeartRate = (linearConversion[0,160,_groupLeaderHeartRate,-1,1]);

    _colour = switch (assignedTeam (leader _playerGroup)) do {
        case "MAIN": {[1,1,1,_transparency]};
        case "RED": {[1,0,0,_transparency]};
        case "GREEN": {[0,1,0,_transparency]};
        case "BLUE": {[0,0,1,_transparency]};
        case "YELLOW": {[1,1,0,_transparency]};
    };

    _groupHudText set [0,format ["%1", name(leader _playerGroup)]];
    _squadMemberAddressArray#0 ctrlSetStructuredText parseText format ["<t size='0.8'> %1", _groupHudText#0];
    _squadMemberAddressArray#0 ctrlSetTextColor _colour;
    _squadMemberHealthAddressArray#0 ctrlSetTextColor [(abs(_convertedHeartRate)*2 min 1),(abs(2 - (abs(_convertedHeartRate)*2) min 1)),0,_transparency];
    //systemChat str [(abs(_convertedHeartRate)*2 min 1),(abs(2 - (abs(_convertedHeartRate)*2) min 1)),0,_transparency];

    for "_i" from 1 to (_groupSize - 1) do {

        _currentUnitHeartRate = (_playerGroupUnitsNoLeader select (_i - 1)) getVariable ["ace_medical_heartRate", 80];
        _convertedHeartRate = (linearConversion[0,160,_currentUnitHeartRate,-1,1]);

        _colour = switch (assignedTeam (_playerGroupUnitsNoLeader select (_i - 1))) do {
            case "MAIN": {[1,1,1,_transparency]};
            case "RED": {[1,0,0,_transparency]};
            case "GREEN": {[0,1,0,_transparency]};
            case "BLUE": {[0,0,1,_transparency]};
            case "YELLOW": {[1,1,0,_transparency]};
        };

        _groupHudText pushBack (format ["%1", name (_playerGroupUnitsNoLeader select (_i - 1))]);
        (_squadMemberAddressArray select _i) ctrlSetStructuredText parseText format ["<t size='0.8'> %1", (_groupHudText select _i)];
        (_squadMemberAddressArray select _i) ctrlSetTextColor _colour;
        (_squadMemberHealthAddressArray select _i) ctrlSetTextColor [(abs(_convertedHeartRate)*2 min 1),(abs(2 - (abs(_convertedHeartRate)*2) min 1)),0,_transparency];
    };
};
_prevGroupSize = _groupSize;
