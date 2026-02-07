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

params ["_suitFaction", "_currentBatteryCapacity", "_maxBatteryCapacity", "_currentCurrentDraw"];



switch (_suitFaction) do {
    case 0: {
        (GVAR(battBar_US)#0) progressSetPosition (_currentBatteryCapacity/_maxBatteryCapacity);
        [_currentBatteryCapacity, _currentCurrentDraw, (GVAR(info_battRemain_text_US)#0)] call FUNC(secondsToBase60Time);
    };
};
