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

//params ["_suitFaction", "_oxygenSupply", "_oxygenReserveWhenFull", "_currentOxygenConsumptionRate"];
//params ["_suitFaction", "_currentBatteryCapacity", "_maxBatteryCapacity", "_currentCurrentDraw"];

private _airBarAddress = nil;
private _airTextAddress = nil;
private _battBarAddress = nil;
private _battTextAddress = nil;

private _currentOxygenConsumption = GETVAR(ACE_player,EGVAR(lifesupport,unitAirConsumption),nil);
private _currentOxygenSupply = GETVAR(ACE_player,EGVAR(lifesupport,unitAirReserve),1000);
private _maxOxygenSupply = GETVAR(ACE_player,EGVAR(lifesupport,unitAirMaxReserve),1000); // Temp, need to implement air tank system

private _currentPowerDraw = GETVAR(ACE_player,EGVAR(lifesupport,unitPowerDraw),nil);
private _currentBatterySupply = GETVAR(ACE_player,EGVAR(lifesupport,unitCurrentBatteryCapacity),nil);
private _maxBatterySupply = GETVAR(ACE_player,EGVAR(lifesupport,unitMaxBatteryCapacity),100000); // Temp, need to implement batt system

switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
    case NO_SUIT_FACTION: {
        systemChat "Error! No suit faction in FUNC(huds,updateRangefinder)";
    };
    case US_SUIT_FACTION: {
        _airBarAddress = (GVAR(airBar_US)#0);
        _airTextAddress = (GVAR(info_airRemain_text_US)#0);
        _battBarAddress = (GVAR(battBar_US)#0);
        _battTextAddress = (GVAR(info_battRemain_text_US)#0);
    };
};

_airBarAddress progressSetPosition (_currentOxygenSupply/_maxOxygenSupply);
[_currentOxygenSupply,_currentOxygenConsumption,_airTextAddress] call FUNC(secondsToBase60Time);

_battBarAddress progressSetPosition (_currentBatterySupply/_maxBatterySupply);
[_currentBatterySupply,_currentPowerDraw,_battTextAddress] call FUNC(secondsToBase60Time);
