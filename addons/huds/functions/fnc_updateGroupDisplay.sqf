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
private _hrAddressArray = nil;
private _bpAddressArray = nil;
private _datalinkAddressArray = nil;

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateGroupDisplay)";
    };
    case US_SUIT_FACTION: {
        _nameAddressArray = [
            (GVAR(hudSquad_name0_text_US)#0),
            (GVAR(hudSquad_name1_text_US)#0),
            (GVAR(hudSquad_name2_text_US)#0),
            (GVAR(hudSquad_name3_text_US)#0),
            (GVAR(hudSquad_name4_text_US)#0),
            (GVAR(hudSquad_name5_text_US)#0),
            (GVAR(hudSquad_name6_text_US)#0),
            (GVAR(hudSquad_name7_text_US)#0),
            (GVAR(hudSquad_name8_text_US)#0),
            (GVAR(hudSquad_name9_text_US)#0)
        ];

        _hrAddressArray = [
            (GVAR(hudSquad_hr0_text_US)#0),
            (GVAR(hudSquad_hr1_text_US)#0),
            (GVAR(hudSquad_hr2_text_US)#0),
            (GVAR(hudSquad_hr3_text_US)#0),
            (GVAR(hudSquad_hr4_text_US)#0),
            (GVAR(hudSquad_hr5_text_US)#0),
            (GVAR(hudSquad_hr6_text_US)#0),
            (GVAR(hudSquad_hr7_text_US)#0),
            (GVAR(hudSquad_hr8_text_US)#0),
            (GVAR(hudSquad_hr9_text_US)#0)
        ];

        _bpAddressArray = [
            (GVAR(hudSquad_bp0_text_US)#0),
            (GVAR(hudSquad_bp1_text_US)#0),
            (GVAR(hudSquad_bp2_text_US)#0),
            (GVAR(hudSquad_bp3_text_US)#0),
            (GVAR(hudSquad_bp4_text_US)#0),
            (GVAR(hudSquad_bp5_text_US)#0),
            (GVAR(hudSquad_bp6_text_US)#0),
            (GVAR(hudSquad_bp7_text_US)#0),
            (GVAR(hudSquad_bp8_text_US)#0),
            (GVAR(hudSquad_bp9_text_US)#0)
        ];

        _datalinkAddressArray = [
            (GVAR(hudSquad_datalink0_text_US)#0),
            (GVAR(hudSquad_datalink1_text_US)#0),
            (GVAR(hudSquad_datalink2_text_US)#0),
            (GVAR(hudSquad_datalink3_text_US)#0),
            (GVAR(hudSquad_datalink4_text_US)#0),
            (GVAR(hudSquad_datalink5_text_US)#0),
            (GVAR(hudSquad_datalink6_text_US)#0),
            (GVAR(hudSquad_datalink7_text_US)#0),
            (GVAR(hudSquad_datalink8_text_US)#0),
            (GVAR(hudSquad_datalink9_text_US)#0)
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
private _groupSize = (count units PLAYER_GROUP) min 10;
private _transparency = GVAR(fireControl_groupColor_cbaSetting) select 3;
private _groupHudText = [];

if (_prevGroupSize != _groupSize) then {
    for "_i" from 0 to _groupSize do {
        (_nameAddressArray select _i) ctrlSetText "";
        (_hrAddressArray select _i) ctrlSetText "";
        (_bpAddressArray select _i) ctrlSetText "";
        (_datalinkAddressArray select _i) ctrlSetText "";
    };
};



private _groupLeaderHeartRate = GET_HEART_RATE(leader PLAYER_GROUP);

private _groupLeaderBloodPressure = GET_BLOOD_PRESSURE(leader PLAYER_GROUP) params ["_bloodPressureL", "_bloodPressureH"];
private _groupLeaderMeanBP = (2/3) * _bloodPressureH + (1/3) * _bloodPressureL;

private _convertedHeartRate = nil;
private _convertedBloodPressure = nil;
private _groupLeaderDatalink = nil;

if (_groupLeaderHeartRate < DEFAULT_HEART_RATE) then {
    _convertedHeartRate = linearConversion[HEART_RATE_FATAL_LOW,DEFAULT_HEART_RATE,_groupLeaderHeartRate,0,1,true];
} else {
    _convertedHeartRate = linearConversion[DEFAULT_HEART_RATE,HEART_RATE_FATAL_HIGH,_groupLeaderHeartRate,1,0,true];
};

if (_groupLeaderMeanBP < BLOOD_PRESSURE_NORMAL) then {
    _convertedBloodPressure = linearConversion[BLOOD_PRESSURE_FATAL_LOW,BLOOD_PRESSURE_NORMAL,_groupLeaderMeanBP,0,1,true];
} else {
    _convertedBloodPressure = linearConversion[BLOOD_PRESSURE_NORMAL,BLOOD_PRESSURE_FATAL_HIGH,_groupLeaderMeanBP,1,0,true];
};

if (GETVAR(leader PLAYER_GROUP,EGVAR(lifesupport,unitDatalink),false)) then {
    _groupLeaderDatalink = "TRMIT";
    _datalinkAddressArray#0 ctrlSetTextColor GVAR(textColor_safe_cbaSetting);
} else {
    _groupLeaderDatalink = "EMCON";
    _datalinkAddressArray#0 ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
};

_colour = switch (assignedTeam (leader PLAYER_GROUP)) do {
    case "MAIN": {[1,1,1,_transparency]};
    case "RED": {[1,0,0,_transparency]};
    case "GREEN": {[0,1,0,_transparency]};
    case "BLUE": {[0,0,1,_transparency]};
    case "YELLOW": {[1,1,0,_transparency]};
};

_groupHudText set [0,format ["%1", name(leader PLAYER_GROUP)]];

_nameAddressArray#0 ctrlSetStructuredText parseText format ["<t size='0.5'> %1", _groupHudText#0];
_nameAddressArray#0 ctrlSetTextColor _colour;

_hrAddressArray#0 ctrlSetStructuredText parseText format ["<t size='0.5'> %1", floor _groupLeaderHeartRate];
_hrAddressArray#0 ctrlSetTextColor [(1 - _convertedHeartRate),_convertedHeartRate,0,_transparency];

_bpAddressArray#0 ctrlSetStructuredText parseText format ["<t size='0.5'> %1/%2", _bloodPressureH,_bloodPressureL];
_bpAddressArray#0 ctrlSetTextColor [(1 - _convertedBloodPressure),_convertedBloodPressure,0,_transparency];

_datalinkAddressArray#0 ctrlSetStructuredText parseText format ["<t size='0.5'> %1", _groupLeaderDatalink];

for "_i" from 1 to (_groupSize - 1) do {

    private _unit = _playerGroupUnitsNoLeader select (_i - 1);

    private _currentUnitHeartRate = GET_HEART_RATE(_unit);

    private _currentUnitBloodPressure = GET_BLOOD_PRESSURE(_unit) params ["_bloodPressureL", "_bloodPressureH"];
    private _currentUnitMeanBP = (2/3) * _bloodPressureH + (1/3) * _bloodPressureL;

    private _convertedHeartRate = nil;
    private _convertedBloodPressure = nil;
    private _currentUnitDatalink = nil;

    if (GETVAR(_unit,EGVAR(lifesupport,unitDatalink),false)) then {
        _currentUnitDatalink = "TRMIT";
        (_datalinkAddressArray select _i) ctrlSetTextColor GVAR(textColor_safe_cbaSetting);
    } else {
        _currentUnitDatalink = "EMCON";
        (_datalinkAddressArray select _i) ctrlSetTextColor GVAR(textColor_caution_cbaSetting);
    };

    if (_currentUnitHeartRate < DEFAULT_HEART_RATE) then {
        _convertedHeartRate = linearConversion[HEART_RATE_FATAL_LOW,DEFAULT_HEART_RATE,_currentUnitHeartRate,0,1,true];
    } else {
        _convertedHeartRate = linearConversion[DEFAULT_HEART_RATE,HEART_RATE_FATAL_HIGH,_currentUnitHeartRate,1,0,true];
    };

    if (_currentUnitMeanBP < BLOOD_PRESSURE_NORMAL) then {
        _convertedBloodPressure = linearConversion[BLOOD_PRESSURE_FATAL_LOW,BLOOD_PRESSURE_NORMAL,_currentUnitMeanBP,0,1,true];
    } else {
        _convertedBloodPressure = linearConversion[BLOOD_PRESSURE_NORMAL,BLOOD_PRESSURE_FATAL_HIGH,_currentUnitMeanBP,1,0,true];
    };

    _colour = switch (assignedTeam _unit) do {
        case "MAIN": {[1,1,1,_transparency]};
        case "RED": {[1,0,0,_transparency]};
        case "GREEN": {[0,1,0,_transparency]};
        case "BLUE": {[0,0,1,_transparency]};
        case "YELLOW": {[1,1,0,_transparency]};
    };

    _groupHudText pushBack (format ["%1", name _unit]);

    (_nameAddressArray select _i) ctrlSetStructuredText parseText format ["<t size='0.5'> %1", (_groupHudText select _i)];
    (_nameAddressArray select _i) ctrlSetTextColor _colour;

    (_hrAddressArray select _i) ctrlSetStructuredText parseText format ["<t size='0.5'> %1", floor _currentUnitHeartRate];
    (_hrAddressArray select _i) ctrlSetTextColor [(1 - _convertedHeartRate),_convertedHeartRate,0,_transparency];

    (_bpAddressArray select _i) ctrlSetStructuredText parseText format ["<t size='0.5'> %1/%2", _bloodPressureH,_bloodPressureL];
    (_bpAddressArray select _i) ctrlSetTextColor [(1 - _convertedBloodPressure),_convertedBloodPressure,0,_transparency];

    (_datalinkAddressArray select _i) ctrlSetStructuredText parseText format ["<t size='0.5'> %1", _currentUnitDatalink];
};

//_prevGroupSize = _groupSize;
SETVAR(ACE_player,GVAR(prevGroupSize),_groupSize);
