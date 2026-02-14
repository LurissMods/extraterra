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

private _currentWeapon = currentWeapon ACE_player;
private _currentThrowable = currentThrowable ACE_player;
private _primaryWeapon = primaryWeapon ACE_player;
private _handgunWeapon = handgunWeapon ACE_player;
private _launcherWeapon = secondaryWeapon ACE_player;
private _primaryIconAddress = nil;
private _secondaryIconAddress = nil;
private _launcherIconAddress = nil;
private _grenadeIconAddress = nil;

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateWeaponIcons)";
    };
    case US_SUIT_FACTION: {
        _primaryIconAddress = (GVAR(hudWeaponPrimary_US)#0);
        _secondaryIconAddress = (GVAR(hudWeaponSecondary_US)#0);
        _launcherIconAddress = (GVAR(hudWeaponLauncher_US)#0);
        _grenadeIconAddress = (GVAR(hudWeaponGrenade_US)#0);
    };
};

//set the correct icon for the weapons
private _primaryIcon = getText (configFile >> QUOTE(CfgWeapons) >> _primaryWeapon >> QUOTE(exterra_huds_icon));
private _handgunIcon = getText (configFile >> QUOTE(CfgWeapons) >> _handgunWeapon >> QUOTE(exterra_huds_icon));
private _launcherIcon = getText (configFile >> QUOTE(CfgWeapons) >> _launcherWeapon >> QUOTE(exterra_huds_icon));
private _getPrimaryIcon = [_primaryIcon, "z\exterra\addons\huds\data\weaponIcons\Unknown\unknownWeapon_icon.paa"] select ((_primaryWeapon != "") && (_primaryIcon == ""));
private _getHandgunIcon = [_handgunIcon, "z\exterra\addons\huds\data\weaponIcons\Unknown\unknownWeapon_icon.paa"] select ((_handgunWeapon != "") && (_handgunIcon == ""));
private _getLauncherIcon = [_launcherIcon, "z\exterra\addons\huds\data\weaponIcons\Unknown\unknownWeapon_icon.paa"] select ((_launcherWeapon != "") && (_launcherIcon == ""));

//please forgive me for this, I wrote it at 7am without any sleep
//It's ok Akaviri, it doesn't get any better with sleep
if (_currentWeapon != "") then {
    switch (true) do {
        case (_currentWeapon == _primaryWeapon): {
            if (_handgunWeapon == "") then {
                _primaryIconAddress ctrlSetText _getPrimaryIcon;
                _secondaryIconAddress ctrlSetText _getLauncherIcon;
                _launcherIconAddress ctrlSetText "";
            } else {
                if (_handgunWeapon == "") then {
                    _primaryIconAddress ctrlSetText _getPrimaryIcon;
                    _secondaryIconAddress ctrlSetText _getLauncherIcon;
                    _launcherIconAddress ctrlSetText "";
                } else {
                    _primaryIconAddress ctrlSetText _getPrimaryIcon;
                    _secondaryIconAddress ctrlSetText _getHandgunIcon;
                    _launcherIconAddress ctrlSetText _getLauncherIcon;
                };
            };
        };
        case (_currentWeapon == _handgunWeapon): {
            if (_primaryWeapon == "") then {
                _primaryIconAddress ctrlSetText _getHandgunIcon;
                _secondaryIconAddress ctrlSetText _getLauncherIcon;
                _launcherIconAddress ctrlSetText "";
            } else {
                _primaryIconAddress ctrlSetText _getHandgunIcon;
                _secondaryIconAddress ctrlSetText _getPrimaryIcon;
                _launcherIconAddress ctrlSetText _getLauncherIcon;
            };
        };
        case (_currentWeapon == _launcherWeapon): {
            if (_primaryWeapon == "") then {
                _primaryIconAddress ctrlSetText _getLauncherIcon;
                _secondaryIconAddress ctrlSetText _getHandgunIcon;
                _launcherIconAddress ctrlSetText "";
            } else {
                if (_handgunWeapon == "") then {
                    _primaryIconAddress ctrlSetText _getLauncherIcon;
                    _secondaryIconAddress ctrlSetText _getPrimaryIcon;
                    _launcherIconAddress ctrlSetText "";
                } else {
                    _primaryIconAddress ctrlSetText _getLauncherIcon;
                    _secondaryIconAddress ctrlSetText _getHandgunIcon;
                    _launcherIconAddress ctrlSetText _getPrimaryIcon;
                };
            };
        };
        default {};
    };
} else {
    if (_launcherWeapon == "") then {
        if (_primaryWeapon == "") then {
            if (_handgunWeapon == "") then {
                _primaryIconAddress ctrlSetText "";
                _secondaryIconAddress ctrlSetText "";
                _launcherIconAddress ctrlSetText "";
            } else {
                _primaryIconAddress ctrlSetText _getHandgunIcon;
                _secondaryIconAddress ctrlSetText "";
                _launcherIconAddress ctrlSetText "";
            };
        } else {
            if (_handgunWeapon == "") then {
                _primaryIconAddress ctrlSetText _getPrimaryIcon;
                _secondaryIconAddress ctrlSetText "";
                _launcherIconAddress ctrlSetText "";
            } else {
                _primaryIconAddress ctrlSetText _getPrimaryIcon;
                _secondaryIconAddress ctrlSetText _getHandgunIcon;
                _launcherIconAddress ctrlSetText "";
            };
        };
    } else {
        if (_primaryWeapon == "") then {
            if (_handgunWeapon == "") then {
                _primaryIconAddress ctrlSetText _getLauncherIcon;
                _secondaryIconAddress ctrlSetText "";
                _launcherIconAddress ctrlSetText "";
            } else {
                _primaryIconAddress ctrlSetText _getHandgunIcon;
                _secondaryIconAddress ctrlSetText _getLauncherIcon;
                _launcherIconAddress ctrlSetText "";
            };
        } else {
            if (_handgunWeapon == "") then {
                _primaryIconAddress ctrlSetText _getPrimaryIcon;
                _secondaryIconAddress ctrlSetText _getLauncherIcon;
                _launcherIconAddress ctrlSetText "";
            } else {
                _primaryIconAddress ctrlSetText _getPrimaryIcon;
                _secondaryIconAddress ctrlSetText _getHandgunIcon;
                _launcherIconAddress ctrlSetText _getLauncherIcon;
            };
        };
    };
};

//GVAR(selectedWeapon) = _currentWeapon;

//set correct icon for the grenade
_getGrenadeIcon = "";
if (count _currentThrowable == 0) then {
    //GVAR(selectedThrowable) = "NOWEAPON";
    _getGrenadeIcon = "\z\exterra\addons\huds\data\weaponIcons\Unknown\unknownGrenade_icon.paa";
} else {
    //GVAR(selectedThrowable) = (_currentThrowable select 0);
    _grenadeIcon = getText (configFile >> QUOTE(CfgMagazines) >> (_currentThrowable select 0) >> QUOTE(exterra_huds_icon));
    //_getGrenadeIcon = if (_grenadeIcon == "") then {"z\exterra\addons\huds\data\hudUI_US\weaponIcons\Unknown\unknownGrenade_icon.paa"} else {_grenadeIcon};
    _getGrenadeIcon = [_grenadeIcon, "\z\exterra\addons\huds\data\weaponIcons\Unknown\unknownGrenade_icon.paa"] select (_grenadeIcon == "");
};
_grenadeIconAddress ctrlSetText _getGrenadeIcon;
