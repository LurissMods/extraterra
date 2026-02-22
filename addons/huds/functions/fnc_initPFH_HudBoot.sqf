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

params ["_bootupText","_bootUpAnims"];

GVAR(timeSinceLastLine) = CBA_missionTime;

GVAR(hudPFH_bootAnim) = [{
    params ["_inputArgs"];

    private _bootupText = _inputArgs select 0;
    private _bootUpAnims = _inputArgs select 1;

    //systemChat str ((_bootupText select GVAR(bootIteration))#1);

    private _timePassed = CBA_missionTime - GVAR(timeSinceLastLine);
    if (_timePassed < ((_bootupText select GVAR(bootIteration))#1)) exitWith {};

    [((_bootupText select GVAR(bootIteration))#0)] call FUNC(addBootUpLine);

    if (((_bootupText select GVAR(bootIteration))#0) != "&#160;") then {
        playSound QGVAR(hudTypingSound0);
    };

    if (GVAR(bootIteration) == ((_bootUpAnims select GVAR(bootAnimIteration)) select 1)) then {
        call compile ((_bootUpAnims select GVAR(bootAnimIteration)) select 0);
        GVAR(bootAnimIteration) = GVAR(bootAnimIteration) + 1;
    };

    if (GVAR(bootIteration) == ((count _bootupText) - 1) || {!(GET_SUIT_ACTIVATED(ACE_player))}) then {
        [GVAR(hudPFH_bootAnim)] call CBA_fnc_removePerFrameHandler;
    } else {
        GVAR(timeSinceLastLine) = CBA_missionTime;
        GVAR(bootIteration) = GVAR(bootIteration) + 1;
    };

}, 0.01, [_bootupText,_bootUpAnims]] call CBA_fnc_addPerFrameHandler;
