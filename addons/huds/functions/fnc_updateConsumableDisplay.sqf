#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates progress bars and calls the secondsToBase60Time function to update the consumable controls.
* Called by the statemachine (lifesupport, handleUnitLifesupport).
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateConsumeableDisplay
*
* Public: No
*/

params ["_deltaT"];

//params ["_suitFaction", "_oxygenSupply", "_oxygenReserveWhenFull", "_currentOxygenConsumptionRate"];
//params ["_suitFaction", "_currentBatteryCapacity", "_maxBatteryCapacity", "_currentCurrentDraw"];

private _airBarAddress = nil;
private _airTextAddress = nil;
private _battBarAddress = nil;
private _battTextAddress = nil;

//private _currentOxygenConsumption = GETVAR(ACE_player,EGVAR(lifesupport,unitAirConsumption),nil);
//private _currentOxygenSupply = GETVAR(ACE_player,EGVAR(lifesupport,unitAirReserve),1000);
//private _maxOxygenSupply = GETVAR(ACE_player,EGVAR(lifesupport,unitAirMaxReserve),1000); // Temp, need to implement air tank system

private _currentOxygenConsumption = GET_AIR_CONSUMPTION(ACE_player);
private _currentOxygenSupply = GET_AIR_RESERVE(ACE_player);
private _maxOxygenSupply = GET_AIR_RESERVE_MAX(ACE_player);

private _currentPowerDraw = GET_POWER_DRAW(ACE_player);
private _currentBatterySupply = GET_BATTERY_RESERVE(ACE_player);
private _maxBatterySupply = GET_BATTERY_RESERVE_MAX(ACE_player);

//private _currentPowerDraw = GETVAR(ACE_player,EGVAR(lifesupport,unitPowerDraw),nil);
//private _currentBatterySupply = GETVAR(ACE_player,EGVAR(lifesupport,unitCurrentBatteryCapacity),nil);
//private _maxBatterySupply = GETVAR(ACE_player,EGVAR(lifesupport,unitMaxBatteryCapacity),100000); // Temp, need to implement batt system

switch (GET_SUIT_FACTION(ACE_player)) do {
    case NO_SUIT_FACTION: {
        ERROR_1("Suit faction undefined! Unit: %1",ACE_player);
    };
    case US_SUIT_FACTION: {
        _airBarAddress = (GVAR(hudAirProgress_US)#0);
        _airTextAddress = (GVAR(hudAirEstTime_text_US)#0);
        _battBarAddress = (GVAR(hudBattProgress_US)#0);
        _battTextAddress = (GVAR(hudBattEstTime_text_US)#0);
    };
};

_airBarAddress progressSetPosition (_currentOxygenSupply/_maxOxygenSupply);
[_currentOxygenSupply,_currentOxygenConsumption,_airTextAddress,_deltaT] call FUNC(secondsToBase60Time);

_battBarAddress progressSetPosition (_currentBatterySupply/_maxBatterySupply);
[_currentBatterySupply,_currentPowerDraw,_battTextAddress,_deltaT] call FUNC(secondsToBase60Time);
