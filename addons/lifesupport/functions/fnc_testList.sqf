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

/*private _medMenu = findDisplay 38580; //med menu IDD
_testBox = _medMenu ctrlCreate ["RscListBox", 4510];

//_testBox ctrlSetText "test";
_testBox lbSetText [0,"test"];
_testBox lbSetColor [0, [1,1,0,1]];
_testBox ctrlSetPosition [0.0555 * safeZoneW,0.02 * safeZoneH,0.3375 * safeZoneW,0.15 * safeZoneH];
_testBox ctrlSetFade 0;
_testBox ctrlSetTextColor [1,1,0,1];
_testBox ctrlCommit 0;*/

//with uiNamespace do {};

/*private _injuryListArray = [];
private _control = findDisplay 38580; //med menu IDD

//if (isNil _control) exitWith {systemChat "Med menu closed"};

_injuryList = _control displayCtrl 1410; //injury list IDC
//_injuryListReturn = lbText [1410, 0];
_injuryListSize = lbSize 1410;

if (_injuryListSize < 1) exitWith {systemChat "list empty"};

for "_i" from 0 to (_injuryListSize-1) do {
	_injuryListArray pushBack lbText [1410, _i];
};

_injuryListArray pushBack "test";

// Add all entries to injury list
lbClear _injuryList;

{
    //_x params ["_text", "_color"];
    _color = [1,1,1,1];

    _injuryList lbSetColor [_injuryList lbAdd _x, _color];
} forEach _injuryListArray;

_ctrl lbSetCurSel -1;

systemChat str _injuryList;
systemChat str _injuryListArray;*/
