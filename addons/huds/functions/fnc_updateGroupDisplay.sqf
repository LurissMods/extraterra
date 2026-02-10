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

private _nameAddressArray = nil;
private _heartAddressArray = nil;

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateRangefinder)";
    };
    case US_SUIT_FACTION: {
        _nameAddressArray = [
        (GVAR(squad_member0_text_US)#0),
        (GVAR(squad_member1_text_US)#0),
        (GVAR(squad_member2_text_US)#0),
        (GVAR(squad_member3_text_US)#0),
        (GVAR(squad_member4_text_US)#0),
        (GVAR(squad_member5_text_US)#0),
        (GVAR(squad_member6_text_US)#0),
        (GVAR(squad_member7_text_US)#0),
        (GVAR(squad_member8_text_US)#0),
        (GVAR(squad_member9_text_US)#0),
        (GVAR(squad_member10_text_US)#0),
        (GVAR(squad_member11_text_US)#0),
        (GVAR(squad_member12_text_US)#0),
        (GVAR(squad_member13_text_US)#0),
        (GVAR(squad_member14_text_US)#0),
        (GVAR(squad_member15_text_US)#0),
        (GVAR(squad_member16_text_US)#0),
        (GVAR(squad_member17_text_US)#0)
    ];

    _heartAddressArray = [
        (GVAR(squad_member0_heart_US)#0),
        (GVAR(squad_member1_heart_US)#0),
        (GVAR(squad_member2_heart_US)#0),
        (GVAR(squad_member3_heart_US)#0),
        (GVAR(squad_member4_heart_US)#0),
        (GVAR(squad_member5_heart_US)#0),
        (GVAR(squad_member6_heart_US)#0),
        (GVAR(squad_member7_heart_US)#0),
        (GVAR(squad_member8_heart_US)#0),
        (GVAR(squad_member9_heart_US)#0),
        (GVAR(squad_member10_heart_US)#0),
        (GVAR(squad_member11_heart_US)#0),
        (GVAR(squad_member12_heart_US)#0),
        (GVAR(squad_member13_heart_US)#0),
        (GVAR(squad_member14_heart_US)#0),
        (GVAR(squad_member15_heart_US)#0),
        (GVAR(squad_member16_heart_US)#0),
        (GVAR(squad_member17_heart_US)#0)
    ];
    };
};

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
        (_nameAddressArray select _i) ctrlSetText "";
        (_heartAddressArray select _i) ctrlSetTextColor [0,0,0,0];
    };
};

if (_groupSize < 2) then {
    {
        _x ctrlSetText "";
    } forEach _nameAddressArray;

    {
        _x ctrlSetTextColor [0,0,0,0];
    } forEach _heartAddressArray;
} else {

    private _groupLeaderHeartRate = GET_HEART_RATE(leader PLAYER_GROUP);
    private _convertedHeartRate = nil;
    if (_groupLeaderHeartRate < DEFAULT_HEART_RATE) then {
        _convertedHeartRate = linearConversion[HEART_RATE_FATAL_LOW,DEFAULT_HEART_RATE,_groupLeaderHeartRate,0,1,true];
    } else {
        _convertedHeartRate = linearConversion[DEFAULT_HEART_RATE,HEART_RATE_FATAL_HIGH,_groupLeaderHeartRate,1,0,true];
    };

    _colour = switch (assignedTeam (leader PLAYER_GROUP)) do {
        case "MAIN": {[1,1,1,_transparency]};
        case "RED": {[1,0,0,_transparency]};
        case "GREEN": {[0,1,0,_transparency]};
        case "BLUE": {[0,0,1,_transparency]};
        case "YELLOW": {[1,1,0,_transparency]};
    };

    _groupHudText set [0,format ["%1", name(leader PLAYER_GROUP)]];
    _nameAddressArray#0 ctrlSetStructuredText parseText format ["<t size='0.8'> %1", _groupHudText#0];
    _nameAddressArray#0 ctrlSetTextColor _colour;
    _heartAddressArray#0 ctrlSetTextColor [(1 - _convertedHeartRate),_convertedHeartRate,0,_transparency];

    for "_i" from 1 to (_groupSize - 1) do {

        _currentUnitHeartRate = GET_HEART_RATE(_playerGroupUnitsNoLeader select (_i - 1));
        private _convertedHeartRate = nil;
        if (_currentUnitHeartRate < DEFAULT_HEART_RATE) then {
            _convertedHeartRate = linearConversion[HEART_RATE_FATAL_LOW,DEFAULT_HEART_RATE,_currentUnitHeartRate,0,1,true];
        } else {
            _convertedHeartRate = linearConversion[DEFAULT_HEART_RATE,HEART_RATE_FATAL_HIGH,_currentUnitHeartRate,1,0,true];
        };

        _colour = switch (assignedTeam (_playerGroupUnitsNoLeader select (_i - 1))) do {
            case "MAIN": {[1,1,1,_transparency]};
            case "RED": {[1,0,0,_transparency]};
            case "GREEN": {[0,1,0,_transparency]};
            case "BLUE": {[0,0,1,_transparency]};
            case "YELLOW": {[1,1,0,_transparency]};
        };

        _groupHudText pushBack (format ["%1", name (_playerGroupUnitsNoLeader select (_i - 1))]);
        (_nameAddressArray select _i) ctrlSetStructuredText parseText format ["<t size='0.8'> %1", (_groupHudText select _i)];
        (_nameAddressArray select _i) ctrlSetTextColor _colour;
        (_heartAddressArray select _i) ctrlSetTextColor [(1 - _convertedHeartRate),_convertedHeartRate,0,_transparency];
    };
};
//_prevGroupSize = _groupSize;
SETVAR(ACE_player,GVAR(prevGroupSize),_groupSize);
