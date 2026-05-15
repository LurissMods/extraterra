#include "\a3\ui_f\hpp\defineDIKCodes.inc"
["Extraterra", GVAR(menuToggleKeybind), LLSTRING(suitMenuKeybind_title), {
    // Conditions: canInteract
    //if !([ACE_player, objNull, ["isNotInside", "isNotSwimming", "isNotEscorting", "isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    //[ACE_player, -1] call FUNC(displayPatientInformation);
    call FUNC(menuToggle);
    false
}, {
    /*if (CBA_missionTime - GVAR(peekLastOpenedOn) > GVAR(peekMedicalInfoReleaseDelay)) then {
        [{
            CBA_missionTime - GVAR(peekLastOpenedOn) > GVAR(peekMedicalInfoReleaseDelay)
        }, {
            QGVAR(RscPatientInfo) cutFadeOut 0.3;
        }] call CBA_fnc_waitUntilAndExecute;
    };
    GVAR(peekLastOpenedOn) = CBA_missionTime;*/
}, [DIK_BACKSLASH, [false, false, false]], false, 0] call CBA_fnc_addKeybind;
