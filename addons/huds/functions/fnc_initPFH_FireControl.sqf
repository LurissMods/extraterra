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

if (GVAR(initPFH_FireControl_Activated)) exitWith {};
GVAR(initPFH_FireControl_Activated) = true;

GVAR(hudPFH_fireControl) = [{

    if (isNull(findDisplay 312)) exitWith{};

    [call FUNC(updateUnitsNearPlayer)] call FUNC(updateIFF);
    call FUNC(updateWeaponCrosshair);
    call FUNC(updateNametags);
    call FUNC(updateTargetPosInfo);

    }, 0, []
] call CBA_fnc_addPerFrameHandler;

/*GVAR(hudPFH_Crosshair) = [{



    }, 0, []
] call CBA_fnc_addPerFrameHandler;

GVAR(hudPFH_Nametags) = [{



    }, 0, []
] call CBA_fnc_addPerFrameHandler;*/
