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

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateRangefinder)";
    };
    case US_SUIT_FACTION: {
        _magazinesAddress = (GVAR(weapon_weaponMagazines_text_US)#0);
        _fireModeAddress = (GVAR(weapon_fireMode_text_US)#0);
        _zeroingAddress = (GVAR(weapon_weaponZero_text_US)#0);
    };
};


private _magCountInventory = nil;
private _compatibleMagazines = nil;
private _weaponState = if (PLAYER_VEHICLE == ACE_player) then {weaponState PLAYER_VEHICLE} else {weaponState [PLAYER_VEHICLE,((assignedVehicleRole ACE_player) select 1)]};

if (PLAYER_VEHICLE != ACE_player) then {
    if ((_weaponState select 0) != "") then {
        _compatibleMagazines = (_weaponState select 3);
        if ((assignedVehicleRole ACE_player) select 0 == "Cargo") then {
            _magCountInventory = { _x in _compatibleMagazines } count (magazines ACE_player);
            _currentWeaponMode = currentWeaponMode ACE_player;

            _magazinesAddress ctrlSetStructuredText parseText format["<t align='center'>%1", _magCountInventory];
            _fireModeAddress ctrlSetText _currentWeaponMode;
        } else {
            _magCountInventory = { _x in _compatibleMagazines } count (PLAYER_VEHICLE magazinesTurret [((assignedVehicleRole ACE_player) select 1),false]);
            if (_magCountInventory > 0) then {
                _magCountInventory = _magCountInventory - 1;
            };
            _currentWeaponMode = "---";

            _magazinesAddress ctrlSetStructuredText parseText format["<t align='center'>%1", _magCountInventory];
            _fireModeAddress ctrlSetText _currentWeaponMode;
        };
        _magazineCapacity = getNumber(configFile >> "CfgMagazines" >> ((_weaponState select 3)) >> "count");
    } else {
        _magCountInventory = "--";
        _currentWeaponMode = "---";

        _magazinesAddress ctrlSetStructuredText parseText format["<t align='center'>%1", _magCountInventory];
        _fireModeAddress ctrlSetText _currentWeaponMode;
    };
    _currentZeroing = "---";
    _zeroingAddress ctrlSetText format ["%1m", _currentZeroing];
} else {
    if (((_weaponState) select 0) == ((_weaponState) select 1)) then {
        _compatibleMagazines = currentWeapon PLAYER_VEHICLE call CBA_fnc_compatibleMagazines;
    } else {
        _compatibleMagazines = [configFile >> "CfgWeapons" >> ((_weaponState) select 0) >> ((_weaponState) select 1)] call CBA_fnc_compatibleMagazines;
    };

    _currentZeroing = currentZeroing ACE_player;
    _currentWeaponMode = currentWeaponMode ACE_player;
    _magCountInventory = { _x in _compatibleMagazines } count (magazines PLAYER_VEHICLE);

    _magazinesAddress ctrlSetStructuredText parseText format["<t align='center'>%1", _magCountInventory];
    _fireModeAddress ctrlSetText _currentWeaponMode;
    _zeroingAddress ctrlSetText format ["%1m", _currentZeroing];
};
