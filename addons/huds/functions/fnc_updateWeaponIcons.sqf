#include "..\script_component.hpp"
/*
* Author: Akaviri13
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

//params ["_currentWeapon","_currentThrowable","_weaponIconAddressArray"];

//set the correct icon for the weapons
_primaryWeapon = primaryWeapon ACE_player;
_handgunWeapon = handgunWeapon ACE_player;
_launcherWeapon = secondaryWeapon ACE_player;
_primaryIcon = getText (configFile >> QUOTE(CfgWeapons) >> _primaryWeapon >> QUOTE(exterra_huds_icon));
_handgunIcon = getText (configFile >> QUOTE(CfgWeapons) >> _handgunWeapon >> QUOTE(exterra_huds_icon));
_launcherIcon = getText (configFile >> QUOTE(CfgWeapons) >> _launcherWeapon >> QUOTE(exterra_huds_icon));
//_getPrimaryIcon = if (_primaryWeapon != "" && _primaryIcon == "") then {"z\exterra\addons\huds\data\hudUI_US\weaponIcons\Unknown\unknownWeapon_icon.paa"} else {_primaryIcon};
//_getHandgunIcon = if (_handgunWeapon != "" && _handgunIcon == "")  then {"z\exterra\addons\huds\data\hudUI_US\weaponIcons\Unknown\unknownWeapon_icon.paa"} else {_handgunIcon};
//_getLauncherIcon = if (_launcherWeapon != "" && _launcherIcon == "") then {"z\exterra\addons\huds\data\hudUI_US\weaponIcons\Unknown\unknownWeapon_icon.paa"} else {_launcherIcon};
_getPrimaryIcon = [_primaryIcon, "z\exterra\addons\huds\data\weaponIcons\Unknown\unknownWeapon_icon.paa"] select ((_primaryWeapon != "") && (_primaryIcon == ""));
_getHandgunIcon = [_handgunIcon, "z\exterra\addons\huds\data\weaponIcons\Unknown\unknownWeapon_icon.paa"] select ((_handgunWeapon != "") && (_handgunIcon == ""));
_getLauncherIcon = [_launcherIcon, "z\exterra\addons\huds\data\weaponIcons\Unknown\unknownWeapon_icon.paa"] select ((_launcherWeapon != "") && (_launcherIcon == ""));

//please forgive me for this, I wrote it at 7am without any sleep
//It's ok Akaviri, it doesn't get any better with sleep
if (_currentWeapon != "") then {
    switch (true) do {
        case (_currentWeapon == _primaryWeapon): {
            if (_handgunWeapon == "") then {
                (_weaponIconAddressArray#0) ctrlSetText _getPrimaryIcon;
                (_weaponIconAddressArray#1) ctrlSetText _getLauncherIcon;
                (_weaponIconAddressArray#2) ctrlSetText "";
            } else {
                if (_handgunWeapon == "") then {
                    (_weaponIconAddressArray#0) ctrlSetText _getPrimaryIcon;
                    (_weaponIconAddressArray#1) ctrlSetText _getLauncherIcon;
                    (_weaponIconAddressArray#2) ctrlSetText "";
                } else {
                    (_weaponIconAddressArray#0) ctrlSetText _getPrimaryIcon;
                    (_weaponIconAddressArray#1) ctrlSetText _getHandgunIcon;
                    (_weaponIconAddressArray#2) ctrlSetText _getLauncherIcon;
                };
            };
        };
        case (_currentWeapon == _handgunWeapon): {
            if (_primaryWeapon == "") then {
                (_weaponIconAddressArray#0) ctrlSetText _getHandgunIcon;
                (_weaponIconAddressArray#1) ctrlSetText _getLauncherIcon;
                (_weaponIconAddressArray#2) ctrlSetText "";
            } else {
                (_weaponIconAddressArray#0) ctrlSetText _getHandgunIcon;
                (_weaponIconAddressArray#1) ctrlSetText _getPrimaryIcon;
                (_weaponIconAddressArray#2) ctrlSetText _getLauncherIcon;
            };
        };
        case (_currentWeapon == _launcherWeapon): {
            if (_primaryWeapon == "") then {
                (_weaponIconAddressArray#0) ctrlSetText _getLauncherIcon;
                (_weaponIconAddressArray#1) ctrlSetText _getHandgunIcon;
                (_weaponIconAddressArray#2) ctrlSetText "";
            } else {
                if (_handgunWeapon == "") then {
                    (_weaponIconAddressArray#0) ctrlSetText _getLauncherIcon;
                    (_weaponIconAddressArray#1) ctrlSetText _getPrimaryIcon;
                    (_weaponIconAddressArray#2) ctrlSetText "";
                } else {
                    (_weaponIconAddressArray#0) ctrlSetText _getLauncherIcon;
                    (_weaponIconAddressArray#1) ctrlSetText _getHandgunIcon;
                    (_weaponIconAddressArray#2) ctrlSetText _getPrimaryIcon;
                };
            };
        };
        default {};
    };
} else {
    if (_launcherWeapon == "") then {
        if (_primaryWeapon == "") then {
            if (_handgunWeapon == "") then {
                (_weaponIconAddressArray#0) ctrlSetText "";
                (_weaponIconAddressArray#1) ctrlSetText "";
                (_weaponIconAddressArray#2) ctrlSetText "";
            } else {
                (_weaponIconAddressArray#0) ctrlSetText _getHandgunIcon;
                (_weaponIconAddressArray#1) ctrlSetText "";
                (_weaponIconAddressArray#2) ctrlSetText "";
            };
        } else {
            if (_handgunWeapon == "") then {
                (_weaponIconAddressArray#0) ctrlSetText _getPrimaryIcon;
                (_weaponIconAddressArray#1) ctrlSetText "";
                (_weaponIconAddressArray#2) ctrlSetText "";
            } else {
                (_weaponIconAddressArray#0) ctrlSetText _getPrimaryIcon;
                (_weaponIconAddressArray#1) ctrlSetText _getHandgunIcon;
                (_weaponIconAddressArray#2) ctrlSetText "";
            };
        };
    } else {
        if (_primaryWeapon == "") then {
            if (_handgunWeapon == "") then {
                (_weaponIconAddressArray#0) ctrlSetText _getLauncherIcon;
                (_weaponIconAddressArray#1) ctrlSetText "";
                (_weaponIconAddressArray#2) ctrlSetText "";
            } else {
                (_weaponIconAddressArray#0) ctrlSetText _getHandgunIcon;
                (_weaponIconAddressArray#1) ctrlSetText _getLauncherIcon;
                (_weaponIconAddressArray#2) ctrlSetText "";
            };
        } else {
            if (_handgunWeapon == "") then {
                (_weaponIconAddressArray#0) ctrlSetText _getPrimaryIcon;
                (_weaponIconAddressArray#1) ctrlSetText _getLauncherIcon;
                (_weaponIconAddressArray#2) ctrlSetText "";
            } else {
                (_weaponIconAddressArray#0) ctrlSetText _getPrimaryIcon;
                (_weaponIconAddressArray#1) ctrlSetText _getHandgunIcon;
                (_weaponIconAddressArray#2) ctrlSetText _getLauncherIcon;
            };
        };
    };
};

GVAR(selectedWeapon) = _currentWeapon;

//set correct icon for the grenade
_getGrenadeIcon = "";
if (count _currentThrowable == 0) then {
    GVAR(selectedThrowable) = "NOWEAPON";
    _getGrenadeIcon = "\z\exterra\addons\huds\data\weaponIcons\Unknown\unknownGrenade_icon.paa";
} else {
    GVAR(selectedThrowable) = (_currentThrowable select 0);
    _grenadeIcon = getText (configFile >> QUOTE(CfgMagazines) >> (_currentThrowable select 0) >> QUOTE(exterra_huds_icon));
    //_getGrenadeIcon = if (_grenadeIcon == "") then {"z\exterra\addons\huds\data\hudUI_US\weaponIcons\Unknown\unknownGrenade_icon.paa"} else {_grenadeIcon};
    _getGrenadeIcon = [_grenadeIcon, "\z\exterra\addons\huds\data\weaponIcons\Unknown\unknownGrenade_icon.paa"] select (_grenadeIcon == "");
};
(_weaponIconAddressArray#3) ctrlSetText _getGrenadeIcon;
