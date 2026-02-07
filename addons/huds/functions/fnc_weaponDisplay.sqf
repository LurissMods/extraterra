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

params ["_weaponDisplayAddressArray", "_playerVehicle", "_weaponState", "_currentWeapon"];

private _magCountInventory = nil;
private _compatibleMagazines = nil;

if (_playerVehicle != player) then {
    if ((_weaponState select 0) != "") then {
        _compatibleMagazines = (_weaponState select 3);
        if ((assignedVehicleRole player) select 0 == "Cargo") then {
            _magCountInventory = { _x in _compatibleMagazines } count (magazines player);
            _currentWeaponMode = currentWeaponMode player;

            (_weaponDisplayAddressArray#0) ctrlSetStructuredText parseText format["<t align='center'>%1", _magCountInventory];
            (_weaponDisplayAddressArray#1) ctrlSetText _currentWeaponMode;
        } else {
            _magCountInventory = { _x in _compatibleMagazines } count (_playerVehicle magazinesTurret [((assignedVehicleRole player) select 1),false]);
            if (_magCountInventory > 0) then {
                _magCountInventory = _magCountInventory - 1;
            };
            _currentWeaponMode = "---";

            (_weaponDisplayAddressArray#0) ctrlSetStructuredText parseText format["<t align='center'>%1", _magCountInventory];
            (_weaponDisplayAddressArray#1) ctrlSetText _currentWeaponMode;
        };
        _magazineCapacity = getNumber(configFile >> "CfgMagazines" >> ((_weaponState select 3)) >> "count");
    } else {
        _magCountInventory = "--";
        _currentWeaponMode = "---";

        (_weaponDisplayAddressArray#0) ctrlSetStructuredText parseText format["<t align='center'>%1", _magCountInventory];
        (_weaponDisplayAddressArray#1) ctrlSetText _currentWeaponMode;
    };
    _currentZeroing = "---";
    (_weaponDisplayAddressArray#2) ctrlSetText format ["%1m", _currentZeroing];
} else {
    if (((_weaponState) select 0) == ((_weaponState) select 1)) then {
        _compatibleMagazines = currentWeapon _playerVehicle call CBA_fnc_compatibleMagazines;
    } else {
        _compatibleMagazines = [configFile >> "CfgWeapons" >> ((_weaponState) select 0) >> ((_weaponState) select 1)] call CBA_fnc_compatibleMagazines;
    };

    _currentZeroing = currentZeroing player;
    _currentWeaponMode = currentWeaponMode player;
    _magCountInventory = { _x in _compatibleMagazines } count (magazines _playerVehicle);

    (_weaponDisplayAddressArray#0) ctrlSetStructuredText parseText format["<t align='center'>%1", _magCountInventory];
    (_weaponDisplayAddressArray#1) ctrlSetText _currentWeaponMode;
    (_weaponDisplayAddressArray#2) ctrlSetText format ["%1m", _currentZeroing];
};


/*if (typeName _currentAmmo isEqualTo "SCALAR" && typename _magazineCapacity isEqualTo "SCALAR" && _currentWeapon != "") then {

    if (_magCountInventory == 0) then {
        (_weaponDisplayAddressArray#0) ctrlSetTextColor LRSS_DANGER_TEXT_COLOR;
    } else {
        (_weaponDisplayAddressArray#0) ctrlSetTextColor LRSS_TEXT_DISPLAY_COLOR;
    };
} else {
    //(_weaponDisplayAddressArray#1) ctrlSetTextColor LRSS_MJOLNIR_INFOTEXT_COLOR;
    (_weaponDisplayAddressArray#0) ctrlSetTextColor LRSS_TEXT_DISPLAY_COLOR;
};*/
