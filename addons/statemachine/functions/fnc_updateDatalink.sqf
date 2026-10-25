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

params ["_unit"];

if (isPlayer _unit) exitWith {}; // Player HUD datalink is updated in exterra_huds_fnc_updatePlayerDatalink

private _unitDatalinkBool = GET_DATALINK(_unit);

if (_unitDatalinkBool) then {

    private _allUnits = entities [["MAN","CAR","TANK","AIR","StaticWeapon"], ["HeadlessClient_F"], false, true];
    private _prevDatalinkArray = []; // This is here to track changes in the datalink lists. The variable should only be broadcast if it has changed

    private _unitContacts = _allUnits select {
        private _isDetected = (_unit knowsAbout _x) >= KNOWS_ABOUT_IFF_THRESHOLD;
        _isDetected;
    };

    switch (side _unit) do {
        case blufor: {
            _prevDatalinkArray = +GVAR(datalinkBlufor);

            GVAR(datalinkBlufor) append _unitContacts;
            GVAR(datalinkBlufor) = GVAR(datalinkBlufor) arrayIntersect GVAR(datalinkBlufor);

            // Done to remove lost contacts from the list
            GVAR(datalinkBlufor) = GVAR(datalinkBlufor) select {
                blufor knowsAbout _x >= KNOWS_ABOUT_IFF_THRESHOLD;
            };

            if (_prevDatalinkArray isNotEqualTo GVAR(datalinkBlufor)) then {
                publicVariable QGVAR(datalinkBlufor);
            };
        };
        case opfor: {
            _prevDatalinkArray = +GVAR(datalinkOpfor);

            GVAR(datalinkOpfor) append _unitContacts;
            GVAR(datalinkOpfor) = GVAR(datalinkOpfor) arrayIntersect GVAR(datalinkOpfor);

            // Done to remove lost contacts from the list
            GVAR(datalinkOpfor) = GVAR(datalinkOpfor) select {
                opfor knowsAbout _x >= KNOWS_ABOUT_IFF_THRESHOLD;
            };

            if (_prevDatalinkArray isNotEqualTo GVAR(datalinkOpfor)) then {
                publicVariable QGVAR(datalinkOpfor);
            };
        };
        case independent: {
            _prevDatalinkArray = +GVAR(datalinkIndep);

            GVAR(datalinkIndep) append _unitContacts;
            GVAR(datalinkIndep) = GVAR(datalinkIndep) arrayIntersect GVAR(datalinkIndep);

            // Done to remove lost contacts from the list
            GVAR(datalinkIndep) = GVAR(datalinkIndep) select {
                independent knowsAbout _x >= KNOWS_ABOUT_IFF_THRESHOLD;
            };

            if (_prevDatalinkArray isNotEqualTo GVAR(datalinkIndep)) then {
                publicVariable QGVAR(datalinkIndep);
            };
        };
        case civilian: {
            _prevDatalinkArray = +GVAR(datalinkCiv);

            GVAR(datalinkCiv) append _unitContacts;
            GVAR(datalinkCiv) = GVAR(datalinkCiv) arrayIntersect GVAR(datalinkCiv);

            // Done to remove lost contacts from the list
            GVAR(datalinkCiv) = GVAR(datalinkCiv) select {
                civilian knowsAbout _x >= KNOWS_ABOUT_IFF_THRESHOLD;
            };

            if (_prevDatalinkArray isNotEqualTo GVAR(datalinkCiv)) then {
                publicVariable QGVAR(datalinkCiv);
            };
        };
        default {};
    };
};
