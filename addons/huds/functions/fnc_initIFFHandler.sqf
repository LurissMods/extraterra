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

if (GVAR(iffHandlerAdded)) exitWith {};
GVAR(iffHandlerAdded) = true;

GVAR(iff_handler) = [{

    [call FUNC(nearUnits)] call FUNC(IFF);

    }, 0.01, []
] call CBA_fnc_addPerFrameHandler;
