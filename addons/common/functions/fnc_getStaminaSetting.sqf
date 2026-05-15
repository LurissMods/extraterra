#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks the current fatigue setting of mission/unit.
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
* Public: Yes
*/

params ["_unit"];

private _staminaSetting = -1;

switch true do {
    case (ACEGVAR(advanced_fatigue,enabled)): {
        _staminaSetting = 0;
    };
    case (isStaminaEnabled _unit): {
        _staminaSetting = 1;
    };
    default {
        _staminaSetting = 2;
    };
};

_staminaSetting;
