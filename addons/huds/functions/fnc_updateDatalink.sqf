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

params ["_unitsNearPlayer"];

private _playerTeamUnitArray = units side ACE_Player;

// Array that holds all contacts. This will get quite large
private _datalinkedContacts = [];

/*// Filter out friendly nearby units
private _contacts = _unitsNearPlayer select {
    private _isUnitFriendly = side _x == side ACE_Player;
    !_isUnitFriendly;
};

// Keep nearby friendly units in a seperate array. This'll need to be readded later?
private _nearbyFriendlies = _unitsNearPlayer select {
    private _isUnitFriendly = side _x == side ACE_Player;
    _isUnitFriendly;
};*/


{
    _x params ["_friendlyUnit"];

    if (_friendlyUnit getVariable [QGVAR(isEmitting), false]) then {
        private _unitContacts = _unitsNearPlayer select {
            private _isDetected = (_friendlyUnit knowsAbout _x) >= KNOWS_ABOUT_IFF_THRESHOLD;
            //systemChat str _isDetected;
            //systemChat str (_friendlyUnit knowsAbout _x);
            _isDetected;
        };
        _datalinkedContacts append _unitContacts;
        //systemChat format ["%1 is emitting! Units: %2",_friendlyUnit,_unitContacts];
    } else {
        //systemChat format ["%1 is EMCON!",_friendlyUnit];
        continue;
    };

    // This removes duplicate contacts out of the array. Done here just in case the array gets really big and eats RAM
    _datalinkedContacts = _datalinkedContacts arrayIntersect _datalinkedContacts;

} forEach _playerTeamUnitArray;

// Perform knowsAbout for the player. Done to simulate the player's own suit FCS independent of a datalink
private _unitContacts = _unitsNearPlayer select {
    private _isDetected = (ACE_Player knowsAbout _x) >= KNOWS_ABOUT_IFF_THRESHOLD;
    _isDetected;
};
_datalinkedContacts append _unitContacts;

// Datalink AI knowledge
{
    _x params ["_friendlyUnit"];
    {
        _friendlyUnit reveal _x;

    } forEach _datalinkedContacts;

} forEach _playerTeamUnitArray;

// This removes duplicate contacts out of the array
_datalinkedContacts = _datalinkedContacts arrayIntersect _datalinkedContacts;

_datalinkedContacts;



// each unit has emit state
// check if unit is emitting
// if yes, check if Y unit knows about X unit
// do for each X unit
// next Y unit
// OR check for every X unit

// add option for simple datalink, this will melt people's fucking cpus
