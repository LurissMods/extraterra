#include "..\script_component.hpp"
/*
* Author: Glowbal, mharis001
* Handles opening the Medical Menu. Called from onLoad event.
*
* Arguments:
* 0: Medical Menu display <DISPLAY>
*
* Return Value:
* None
*
* Example:
* [DISPLAY] call ace_medical_gui_fnc_onMenuOpen
*
* Public: No
*/

//if (EGVAR(interact_menu,menuBackground) == 1) then {[QGVAR(id), false] call EFUNC(common,blurScreen)};
//if (EGVAR(interact_menu,menuBackground) == 2) then {(uiNamespace getVariable [QEGVAR(interact_menu,menuBackground), displayNull]) closeDisplay 0};

["loadout", GVAR(unitInventoryChangedEH)] call CBA_fnc_removePlayerEventHandler;

if (GVAR(currentSelectedAirTank) != 0) then {
    GVAR(currentSelectedAirTank) = 1;
};

//GVAR(pendingReopen) = false;
GVAR(menuPFH) call CBA_fnc_removePerFrameHandler;
GVAR(menuPFH) = -1;
