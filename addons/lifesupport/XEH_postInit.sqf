#include "script_component.hpp"

if (!hasInterface) exitWith {};
if (!EGVAR(modules,mainLoopInitalized)) exitWith {};

["CBA_settingsInitialized", {
    if (!GVAR(masterToggle)) exitWith {};
    //systemChat "Post init running";

    SETVAR(ace_player,GVAR(suitTemp),NORMAL_TEMP);
    SETVAR(ace_player,GVAR(coreTemp),HUMAN_NATURAL_CORETEMP);

    /*GVAR(testList_handler) = [{


        [ace_medical_gui_updateInjuryListWounds, [[] call FUNC(testList)], 0] call CBA_fnc_waitAndExecute;
        //[] call FUNC(testList);


    }, 0, []
    ] call CBA_fnc_addPerFrameHandler;*/



    //["unit", LINKFUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;

    // - Add main loop at 1 second interval -------------------------------------------------------------
    //[FUNC(mainLoop), [], 1] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
