#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks whether or not a unit is wearing a space suit, and the faction that suit belongs to
*
* Arguments:
* [_unit, _syncValue] [<UNIT>, <BOOL>]
* _unit - Current unit.
* _syncValue - Whether or not to sync the current update with the server
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateUnitSuit;
*
* Public: No
*/

params ["_unit", "_syncValue"];
GET_SUIT_BOOLS(_unit) params ["_prevMasterBool","_prevHelmetBool","_prevSuitBool","_prevPackBool"];

private _helmetFaction = nil;
private _suitFaction = nil;
private _packFaction = nil;
private _helmetBool = false;
private _suitBool = false;
private _packBool = false;

private _helmetPassiveAirReserve = nil;
private _suitMobility = nil;
private _blackBodyEmissive = nil;
private _solarAbsorptance = nil;
private _suitThickness = nil;
private _unitSuitData = [];

{
    _helmetBool = headgear _unit in _x;
    if (_helmetBool) exitWith {
        _helmetFaction = (_x#1);
        _helmetPassiveAirReserve = getNumber (configFile >> "CfgWeapons" >> (_x#0) >> "exterra_uniforms_passiveAirReserve");

        if (_helmetPassiveAirReserve == 0) then {
            _helmetPassiveAirReserve = DEFAULT_SUIT_OFF_AIR_RESERVE;
        };
    };
} forEach EGVAR(huds,whitelistHelmets);

{
    _suitBool = uniform _unit in _x;
    if (_suitBool) exitWith {
        _suitFaction = (_x#1);
        _suitMobility = getNumber (configFile >> "CfgWeapons" >> (_x#0) >> "exterra_uniforms_suitMobility");
        _blackBodyEmissive = getNumber (configFile >> "CfgWeapons" >> (_x#0) >> "exterra_uniforms_blackBodyEmmissive");
        _solarAbsorptance = getNumber (configFile >> "CfgWeapons" >> (_x#0) >> "exterra_uniforms_solarAbsorptance");
        _suitThickness = getNumber (configFile >> "CfgWeapons" >> (_x#0) >> "exterra_uniforms_suitThickness");

        if (_suitMobility == 0) then {
            _suitMobility = DEFAULT_SUIT_MOBILITY;
        };
        if (_blackBodyEmissive == 0) then {
            _blackBodyEmissive = DEFAULT_SUIT_BLACK_BODY;
        };
        if (_solarAbsorptance == 0) then {
            _solarAbsorptance = DEFAULT_SUIT_SOLAR_ABSORB;
        };
        if (_suitThickness == 0) then {
            _suitThickness = DEFAULT_SUIT_THICKNESS;
        };
    };
} forEach EGVAR(huds,whitelistSuits);

{
_packBool = backpack _unit in _x;
    if (_packBool) exitWith {_packFaction = (_x#1)};
} forEach EGVAR(huds,whitelistPacks);

// -----------------------------------------------------------------------------------

if !_helmetBool then {
    _helmetPassiveAirReserve = 0;
};
if !_suitBool then {
    _suitMobility = DEFAULT_CLOTHES_MOBILITY;
    _blackBodyEmissive = DEFAULT_SUIT_BLACK_BODY;
    _solarAbsorptance = DEFAULT_SUIT_SOLAR_ABSORB;
    _suitThickness = DEFAULT_CLOTHES_THICKNESS;
};
if !_packBool then {
    //_helmetPassiveAirReserve = 0;
};

_unitSuitData pushBack _helmetPassiveAirReserve;
_unitSuitData pushBack _suitMobility;
_unitSuitData pushBack _blackBodyEmissive;
_unitSuitData pushBack _solarAbsorptance;
_unitSuitData pushBack _suitThickness;

// -----------------------------------------------------------------------------------
// Semi-temp solution. Flesh out later when air tanks added

if (CBA_missionTime < 3) then {
    SET_AIR_RESERVE_MAX(_unit,_helmetPassiveAirReserve,_syncValue);
    SET_AIR_RESERVE(_unit,_helmetPassiveAirReserve,_syncValue);
    //systemChat "air reserve init";
} else {
    if (_prevHelmetBool != _helmetBool || {_prevSuitBool != _suitBool}) then {
        _syncValue = true;

        if (_helmetBool || {_suitBool}) then {
            if (GET_ATMO(_unit) == 0) then {
                SET_AIR_RESERVE_MAX(_unit,_helmetPassiveAirReserve,_syncValue);
                SET_AIR_RESERVE(_unit,0,_syncValue);
                //systemChat "Helmet on in vacuum";
            } else {
                SET_AIR_RESERVE_MAX(_unit,_helmetPassiveAirReserve,_syncValue);
                SET_AIR_RESERVE(_unit,_helmetPassiveAirReserve,_syncValue);
                //systemChat "Helmet on";
            };
        } else {
            //systemChat "Helmet off";
            SET_AIR_RESERVE_MAX(_unit,0,_syncValue);
            SET_AIR_RESERVE(_unit,0,_syncValue);
        };
    };
};


// -----------------------------------------------------------------------------------

if (_helmetFaction == _suitFaction && {_helmetFaction == _packFaction}) then {
    //systemChat format ["Faction: %1, Unit: %2", _helmetFaction,_unit];
    //_unit setVariable [QGVAR(unitSuitFaction), _helmetFaction, _syncValue];
    SET_SUIT_FACTION(_unit,_helmetFaction,_syncValue);
    //systemChat format ["Unit: %1, Suit true",_unit];
} else {
    //_unit setVariable [QGVAR(unitSuitFaction), NO_SUIT_FACTION, _syncValue];
    SET_SUIT_FACTION(_unit,NO_SUIT_FACTION,_syncValue);
    //systemChat format ["Unit: %1, Suit false",_unit];
};

if (_helmetBool && {_suitBool && {_packBool}}) then {
    //_unit setVariable [QGVAR(unitSuitBools),[true,true,true,true],_syncValue];
    private _boolArray = [true,true,true,true];
    SET_SUIT_BOOLS(_unit,_boolArray,_syncValue);
    //systemChat format ["Unit: %1, Suit bool true",_unit];
} else {
    //_unit setVariable [QGVAR(unitSuitBools), [false,_helmetBool,_suitBool,_packBool], _syncValue];
    private _boolArray = [false,_helmetBool,_suitBool,_packBool];
    SET_SUIT_BOOLS(_unit,_boolArray,_syncValue);
    //systemChat format ["Unit: %1, Suit bool false: %2",_unit,[false,_helmetBool,_suitBool,_packBool]];
};

//_unit setVariable [QGVAR(unitSuitData), _unitSuitData, _syncValue];
SET_SUIT_DATA(_unit,_unitSuitData,_syncValue);

_syncValue;
