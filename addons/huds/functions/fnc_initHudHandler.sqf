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

params ["_squadMemberArray","_squadHeartArray","_rangefinderArray","_weaponArray","_grenadeArray","_weaponIconArray"];

/*_compatibleMagazines = currentWeapon (vehicle player) call CBA_fnc_compatibleMagazines;
_availableMagCount = {_x in _compatibleMagazines} count magazines (vehicle player);
_currentAmmo = (vehicle player) ammo currentWeapon (vehicle player);
_magazineCapacity = getNumber(configfile >> "CfgMagazines" >> ((weaponState (vehicle player)) select 3) >> "count");
_currentZeroing = currentZeroing player;
_currentWeaponMode = currentWeaponMode player;
_currentThrowable = [];
_currentThrowableName = "";
_currentThrowableAmount = 0;
_currentThrowableIcon = "";*/



//isNull objectParent player
GVAR(generalHud_handler) = [{
    private _playerVehicle = vehicle player;
    private _prevGroupSize = 0;
    private _currentWeapon = currentWeapon player;
    private _currentThrowable = currentThrowable player;
    private _weaponState = if (_playerVehicle == player) then {weaponState _playerVehicle} else {weaponState [_playerVehicle,((assignedVehicleRole player) select 1)]};

    //_weaponArray = ((_this#0)#3);

    //systemChat str ((_this#0)#3);

    [((_this#0)#3), _playerVehicle, _weaponState, _currentWeapon] call FUNC(weaponDisplay);
    [((_this#0)#4), _currentWeapon, _currentThrowable] call FUNC(grenadeDisplay);
    [((_this#0)#2)] call FUNC(rangefinderDisplay);
    [((_this#0)#0), ((_this#0)#1), _prevGroupSize] call FUNC(groupDisplay);

    if (((_this#0)#6) != _currentWeapon || {((_this#0)#7) != (_currentThrowable select 0)}) then {
        [_currentWeapon, _currentThrowable, ((_this#0)#5)] call FUNC(hudWeaponIcons);
    };


    }, 0.01, [_squadMemberArray, _squadHeartArray, _rangefinderArray, _weaponArray, _grenadeArray, _weaponIconArray, GVAR(selectedWeapon), GVAR(selectedThrowable)]
] call CBA_fnc_addPerFrameHandler;
