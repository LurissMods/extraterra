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

GVAR(playerInSuit_handler) = ["playerInSuit", {SETVAR(player,GVAR(hasHelmAndSuit),true)}] call CBA_fnc_addEventHandler;
GVAR(playerOutSuit_handler) = ["playerOutSuit", {SETVAR(player,GVAR(hasHelmAndSuit),false)}] call CBA_fnc_addEventHandler;

GVAR(playerSuitCheck_handler) = [{

    private _inSuit = call FUNC(isInHelmAndSuit);
    private _currentAtmo = GETVAR(player,EGVAR(lifesupport,inAtmo),-1);

    if (_inSuit#0) then {
        ["playerInSuit", []] call CBA_fnc_localEvent;
    } else {
        ["playerOutSuit", []] call CBA_fnc_localEvent;
        if (GETVAR(player,GVAR(suitEnabled),false)) then {
            call FUNC(suitDeactivation)
        };
    };

    if ((_inSuit#2)) then {
        switch (_inSuit#3) do {
            case 0: {
                if (!GETVAR(player,GVAR(suitEnabled),false)) then {
                    (GVAR(helmetOutline_US)#0) ctrlSetFade 0;
                };
            };
        };
    } else {
        (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
    };

    if ((!(_inSuit#2) || !(_inSuit#4)) && {_currentAtmo == 0}) then {
        //[player] call EFUNC(injuries,vacExposure);
    };

    }, 0.05, []
] call CBA_fnc_addPerFrameHandler;
