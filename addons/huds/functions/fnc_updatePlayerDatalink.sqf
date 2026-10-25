#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates unit datalinking.
* Called by the Fire Control PFH.
*
* Arguments:
* ["_unitsNearPlayer"]  [<ARRAY>]
* _unitsNearPlayer = Array of units surrounding the player.
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateDatalink
*
* Public: No
*/

params ["_visibleUnits"];

private _privateDatalink = [];

// Perform knowsAbout for the player. Done to simulate the player's own suit FCS independent of a datalink
private _unitContacts = _visibleUnits select {
    private _isDetected = (ACE_Player knowsAbout _x) >= KNOWS_ABOUT_IFF_THRESHOLD;
    _isDetected;
};

switch (side ACE_Player) do {
    case blufor: {
        _privateDatalink = +EGVAR(statemachine,datalinkBlufor);
    };
    case opfor: {
        _privateDatalink = +EGVAR(statemachine,datalinkOpfor);
    };
    case independent: {
        _privateDatalink = +EGVAR(statemachine,datalinkIndep);
    };
    case civilian: {
        _privateDatalink = +EGVAR(statemachine,datalinkCiv);
    };
    default {};
};

_privateDatalink append _unitContacts;
_privateDatalink = _privateDatalink arrayIntersect _privateDatalink;

// Update player knowsAbout with units picked up by the team datalink
{
    ACE_Player reveal _x;

} forEach _privateDatalink;

_privateDatalink;
