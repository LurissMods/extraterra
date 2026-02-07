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

params ["_helmetBool", "_suitBool", "_currentAtmo"];

private _inSuit = nil;
private _prebreatheRatio = nil;

if (_helmetBool && {_suitBool}) then {
    _inSuit = true;
} else {
    _inSuit = false;
};

if (!_inSuit && {_currentAtmo != 0}) then {
    GVAR(atmoEnteredSuit) = _currentAtmo;

    switch (GVAR(atmoEnteredSuit)) do {
        case 1: { // 1 ATM
            GVAR(prebreathingTimer) = (GVAR(prebreathingTimer) + 1) min TIME_TO_FULL_PREBREATHE;
        };

        case 2: { // 0.3 ATM
            GVAR(prebreathingTimer) = 0 max (GVAR(prebreathingTimer) - 1);
        };
    };
} else {
    GVAR(prebreathingTimer) = (GVAR(prebreathingTimer) + 1) min TIME_TO_FULL_PREBREATHE; // place holder until I add suit atmo setting
};

_prebreatheRatio = GVAR(prebreathingTimer)/TIME_TO_FULL_PREBREATHE;

//systemChat str GVAR(prebreathingTimer);
//systemChat format ["Ratio: %1, Timer: %2",_prebreatheRatio,GVAR(prebreathingTimer)];

[_prebreatheRatio, _inSuit];
