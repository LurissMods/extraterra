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

if (GVAR(fireControlHandlerAdded)) exitWith {};
GVAR(fireControlHandlerAdded) = true;

GVAR(fireControl_handler) = [{

    [call FUNC(nearUnits)] call FUNC(IFF);
    call FUNC(weaponCrosshair);
    call FUNC(nametags);

    }, 0.01, []
] call CBA_fnc_addPerFrameHandler;
