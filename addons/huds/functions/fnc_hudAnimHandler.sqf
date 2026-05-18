#include "..\script_component.hpp"
/*
* Author: Luriss
* Initalizes a PFH to manage the animated boot sequence. Will automatically remove itself once the sequence is cancelled/complete.
* Note: I'm not really happy that this is wasting PFH ids but I can't really think of a better solution. In practice it *should* be fine (maybe ~200 wasted IDs in a mission at most?), if a bit wasteful.
*
* Arguments:
* ["_bootupText","_bootUpAnims"]    [<MATRIX>, <MATRIX>]
* _bootupText = Matrix fed from bootHUD_XX. Contains each text line in the boot up sequence and the wait time for that line in seconds.
* _bootUpAnims = Matrix fed from bootHUD_XX. Contains the HUD controls and a line number that corresponds to _bootupText. Reveals the controls on the corresponding line.
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_initPFH_HudBoot
*
* Public: No
*/

//params ["_inputArgs"];

//private _bootupText = _inputArgs select 0;
//private _bootUpAnims = _inputArgs select 1;

if !(GET_BOOT_ACTIVE(ACE_player)) exitWith {};

// These are overwritten with the correct anims when the QGVAR(hudBootCalled) fires. Should never be synced with other clients!
private _bootupText = GVAR(currentBootText);
private _bootUpAnims = GVAR(currentBootAnims);

private _currentAnimTimer = ((_bootupText select GVAR(bootIteration))#1);

private _timePassed = CBA_missionTime - GVAR(timeSinceLastLine);
if (_timePassed < (_currentAnimTimer*GVAR(CBAset_bootUpSpeed))) exitWith {};

[((_bootupText select GVAR(bootIteration))#0)] call FUNC(addBootUpLine);

if (((_bootupText select GVAR(bootIteration))#0) != "&#160;") then {
    playSound QGVAR(hudTypingSound0);
};

if (GVAR(bootIteration) == ((_bootUpAnims select GVAR(bootAnimIteration)) select 1)) then {
    call compile ((_bootUpAnims select GVAR(bootAnimIteration)) select 0);
    GVAR(bootAnimIteration) = GVAR(bootAnimIteration) + 1;
};

if (GVAR(bootIteration) == ((count _bootupText) - 1) || {!(GET_SUIT_ACTIVATED(ACE_player))}) then {
    SET_BOOT_ACTIVE(ACE_player,false,false);
} else {
    GVAR(timeSinceLastLine) = CBA_missionTime;
    GVAR(bootIteration) = GVAR(bootIteration) + 1;
};
