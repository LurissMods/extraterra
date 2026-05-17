#include "..\script_component.hpp"
/*
* Author: Luriss
* Handles switching between units
*
* Arguments:
* _unit <UNIT>
*
* Return Value:
* _staminaSetting <NUMBER>
* Returns either a 0, 1, or 2 for use in switch-cases
*
* Example:
* [] call exterra_common_fnc_getStaminaSetting
*
* Public: No
*/

params ["_newUnit", "_oldUnit"];

private _oldUnitSuitFaction = NO_SUIT_FACTION;
private _oldUnitSuitActivated = GET_SUIT_ACTIVATED(_oldUnit);

//systemChat format ["old: %1",_oldUnitSuitActivated];
//systemChat format ["new: %1",(GET_SUIT_ACTIVATED(_newUnit))];

if (!isNull _oldUnit) then {


};



if (GET_SUIT_ACTIVATED(_newUnit)) then {
    if (!_oldUnitSuitActivated) then {
        switch (GET_SUIT_FACTION(_newUnit)) do {
            case NO_SUIT_FACTION: {
                //systemChat "Switch fired case error! FUNC(common,handlePlayerSwitch)";
                WARNING("exterra_common_fnc_handlePlayerSwitch unexpected suit faction in switch-case!");
            };
            case US_SUIT_FACTION: {
                {_x ctrlSetFade 0; _x ctrlCommit 0.5} forEach EGVAR(huds,hudElementsArray_US);
                (EGVAR(huds,helmetOutline_US)#0) ctrlSetFade 1;
                (EGVAR(huds,helmetOutline_US)#0) ctrlCommit 0;

                //private _currentState = [_unit, EGVAR(lifesupport,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
                //[_unit, EGVAR(lifesupport,STATE_MACHINE), _currentState, "SuitActivated", {}, "PlayerSwitchingUnit"] call CBA_statemachine_fnc_manualTransition;
                //[_newUnit] call EFUNC(huds,shutdownHUD_US);
            };
        };
    };
} else {
    if (_oldUnitSuitActivated) then {
        [ACE_player,true] call EFUNC(huds,hideAllHuds);
        /*switch (GET_SUIT_FACTION(_oldUnit)) do {
            case NO_SUIT_FACTION: {
                systemChat "Switch fired case error! FUNC(common,handlePlayerSwitch)";
                WARNING("exterra_common_fnc_handlePlayerSwitch unexpected suit faction in switch-case!");
            };
            case US_SUIT_FACTION: {
                [_newUnit] call EFUNC(huds,shutdownHUD_all);
            };
        };*/
    };
};
