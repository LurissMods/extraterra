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

params ["_suitFaction", "_bootUpLines"];

private _bootUpTextControl = nil;

switch (_suitFaction) do {
    case 0: {
        _bootUpTextControl = (GVAR(bootup_text_US)#0);
    };
};

private _textScale = safeZoneH / 3.5;
private _structuredText = "<t align='left'" + format [" size='%1'>",_textScale] + "%1</t>";
private _textToShow = "";
if (count _bootUpLines == 0) exitWith {
    _bootUpTextControl ctrlSetStructuredText parseText format [_structuredText, _textToShow];
    _bootUpTextControl ctrlSetTextColor [1,1,1,1];
};
{
    _textToShow = _textToShow + (_x select 0) + "<br/>";
} forEach _bootUpLines;

_bootUpTextControl ctrlSetStructuredText parseText format [_structuredText, _textToShow];
_bootUpTextControl ctrlSetTextColor [1,1,1,1];
