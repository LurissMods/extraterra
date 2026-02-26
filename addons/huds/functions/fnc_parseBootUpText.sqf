#include "..\script_component.hpp"
/*
* Author: Akaviri13, Luriss
* Recieves text from the addBootUpLine function and updates the boot up text control.
*
* Arguments:
* ["_bootUpLines"]  [<STRING>]
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_parseBootUpText
*
* Public: No
*/

params ["_bootUpLines"];

private _bootUpTextControl = nil;

switch (GET_SUIT_FACTION(ACE_player)) do {
    case NO_SUIT_FACTION: {
        ERROR_1("Suit faction undefined! Unit: %1",ACE_player);
    };
    case US_SUIT_FACTION: {
        _bootUpTextControl = (GVAR(hudBootText_US)#0);
    };
};

private _textScale = safeZoneH / 2;
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
