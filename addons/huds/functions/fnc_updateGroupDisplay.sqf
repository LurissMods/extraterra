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

//params ["_squadMemberAddressArray", "_squadMemberHealthAddressArray", "_prevGroupSize"];

private _prevGroupSize = GETVAR(ACE_player,GVAR(prevGroupSize),nil);

{
    if (_x != ACE_player && {lifeState _x == "DEAD"}) then {
        [_x] join grpNull;
    };
} forEach (units PLAYER_GROUP);

private _playerGroupUnitsNoLeader = (units PLAYER_GROUP) - [leader PLAYER_GROUP];
private _groupSize = (count units PLAYER_GROUP) min 18;
private _transparency = GVAR(fireControl_groupColor_cbaSetting) select 3;
private _groupHudText = [];

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

    _groupLeaderHeartRate = GET_HEART_RATE(leader PLAYER_GROUP); //getVariable [QACEGVAR(medical,heartRate), 80];
    _convertedHeartRate = linearConversion[HEART_RATE_FATAL_LOW,HEART_RATE_FATAL_HIGH,_groupLeaderHeartRate,-1,1];

    _colour = switch (assignedTeam (leader PLAYER_GROUP)) do {
        case "MAIN": {[1,1,1,_transparency]};
        case "RED": {[1,0,0,_transparency]};
        case "GREEN": {[0,1,0,_transparency]};
        case "BLUE": {[0,0,1,_transparency]};
        case "YELLOW": {[1,1,0,_transparency]};
    };

    _groupHudText set [0,format ["%1", name(leader PLAYER_GROUP)]];
    _squadMemberAddressArray#0 ctrlSetStructuredText parseText format ["<t size='0.8'> %1", _groupHudText#0];
    _squadMemberAddressArray#0 ctrlSetTextColor _colour;
    _squadMemberHealthAddressArray#0 ctrlSetTextColor [(abs(_convertedHeartRate)*2 min 1),(abs(2 - (abs(_convertedHeartRate)*2) min 1)),0,_transparency];
    //systemChat str [(abs(_convertedHeartRate)*2 min 1),(abs(2 - (abs(_convertedHeartRate)*2) min 1)),0,_transparency];

    for "_i" from 1 to (_groupSize - 1) do {

        _currentUnitHeartRate = GET_HEART_RATE(_playerGroupUnitsNoLeader select (_i - 1)); //getVariable ["ace_medical_heartRate", 80];
        _convertedHeartRate = linearConversion[HEART_RATE_FATAL_LOW,HEART_RATE_FATAL_HIGH,_currentUnitHeartRate,-1,1];

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
//_prevGroupSize = _groupSize;
SETVAR(ACE_player,GVAR(prevGroupSize),_groupSize);
