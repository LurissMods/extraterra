#include "..\script_component.hpp"
/*
* Author: Luriss
* Simulates the local temperature of the environment surrounding the player. Returns a ratio between 0 and 1 (0 means min temp, 1 means max temp).
*
* Arguments:
* _moonSurfaceTemp (Array -  [minTemp, maxTemp]). In Kelvin.
*
* Return Value:
* _tempAroundPlayer
*
* Example:
* [] call exterra_lifeSupport_fnc_localTemperature;
*
* Public: Yes
*/

params ["_unit", "_syncValue"];

private _helmetFaction = nil;
private _suitFaction = nil;
private _packFaction = nil;
private _helmetPassiveAirReserve = nil;
private _suitMobility = nil;
private _blackBodyEmissive = nil;
private _solarAbsorptance = nil;
private _suitThickness = nil;
private _unitSuitData = [];

{
private _helmetBool = headgear _unit in _x;
if (_helmetBool) exitWith {
    _helmetFaction = (_x#1)
    _helmetPassiveAirReserve = getNumber (configFile >> "CfgWeapons" >> (_x#0) >> "exterra_uniforms_passiveAirReserve");
    };

    if (_helmetPassiveAirReserve == 0) then {
        _helmetPassiveAirReserve = DEFAULT_SUIT_OFF_AIR_RESERVE;
    };

    _unitSuitData pushBack _helmetPassiveAirReserve;
} forEach GVAR(whitelistHelmets);

{
private _suitBool = uniform _unit in _x;
if (_suitBool) exitWith {
    _suitFaction = (_x#1)
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

    _unitSuitData pushBack _suitMobility;
    _unitSuitData pushBack _blackBodyEmissive;
    _unitSuitData pushBack _solarAbsorptance;
    _unitSuitData pushBack _suitThickness;
    };
} forEach GVAR(whitelistSuits);

{
private _packBool = backpack _unit in _x;
if (_packBool) exitWith {_packFaction = (_x#1)};
} forEach GVAR(whitelistPacks);

if (_helmetFaction == _suitFaction && {_helmetFaction == _packFaction}) then {
    _unit setVariable [QGVAR(unitSuitFaction), _helmetFaction, _syncValue];
} else {
    _unit setVariable [QGVAR(unitSuitFaction), NO_SUIT_FACTION, _syncValue];
};

if (_helmetBool && {_suitBool && {_packBool}}) then {
    _unit setVariable [QGVAR(unitSuitBools),[true,true,true,true],_syncValue];
} else {
    _unit setVariable [QGVAR(unitSuitBools), [false,_helmetBool,_suitBool,_packBool], _syncValue];
};

_unit setVariable [QGVAR(unitSuitData), _unitSuitData, _syncValue];
