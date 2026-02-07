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

params ["_suitFaction", "_oxygenSupply", "_oxygenReserveWhenFull", "_currentOxygenConsumptionRate"];

switch (_suitFaction) do {
    case 0: {
        //systemChat str _oxygenSupply;
        //systemChat str _oxygenReserveWhenFull;
        (GVAR(airBar_US)#0) progressSetPosition (_oxygenSupply/_oxygenReserveWhenFull);
        [_oxygenSupply, _currentOxygenConsumptionRate, (GVAR(info_airRemain_text_US)#0)] call FUNC(secondsToBase60Time);
    };
};
