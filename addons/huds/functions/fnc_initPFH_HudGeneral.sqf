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

if (GVAR(initPFH_HudGeneral_Activated)) exitWith {};
GVAR(initPFH_HudGeneral_Activated) = true;

GVAR(hudPFH_HudGeneral) = [{

    //[call FUNC(nearUnits)] call FUNC(IFF);

    }, 0, []
] call CBA_fnc_addPerFrameHandler;
