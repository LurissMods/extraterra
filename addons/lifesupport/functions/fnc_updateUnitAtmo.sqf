#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates the current atmosphere surrounding a unit.
*
* Arguments:
* [_unit, _syncValue] [<UNIT>, <BOOL>]
* _unit - Current unit.
* _syncValue - Whether or not to sync the current update with the server
*
* Return Value:
* [_syncValue] [<BOOL>]
* _syncValue - Will sync with the server if a unit changes atmo state
*
* Example:
* [] call exterra_lifeSupport_fnc_updateUnitAtmo;
*
* Public: No
*/

params ["_unit","_syncValue"];

//private _unitPreviousArea = GETVAR(_unit,GVAR(unitInAtmo),nil);
private _unitPreviousArea = GET_ATMO(_unit);
private _unitInArea = false;

{
    if (_unit inArea (_x select 0)) then {
        _unitInArea = true;
        if (_unitPreviousArea != ((_x select 1) select 0)) then {
            _syncValue = true;

            //SETPVAR(_unit,GVAR(unitInAtmo),((_x select 1) select 0));
            //SETPVAR(_unit,GVAR(unitRadShieldCase),((_x select 1) select 1));
            SET_ATMO(_unit,((_x select 1) select 0),_syncValue);
            SET_RAD_SHIELD_CASE(_unit,((_x select 1) select 1),_syncValue);

            if (_unitPreviousArea == ATMO_STATE_VACUUM) then {
                _unit removePrimaryWeaponItem QUOTE(exterra_sounds_vacuumMuzzle);
                _unit removeSecondaryWeaponItem QUOTE(exterra_sounds_vacuumMuzzle);
            };

            _syncValue;
        };
    };
} forEach EGVAR(modules,allLifeSupportAreas);

if (!_unitInArea && {_unitPreviousArea != ATMO_STATE_VACUUM}) then {
    _syncValue = true;

    //_unit setVariable [QGVAR(unitInAtmo), ATMO_STATE_VACUUM, _syncValue];
    //_unit setVariable [QGVAR(unitRadShieldCase), 0, _syncValue];
    SET_ATMO(_unit,ATMO_STATE_VACUUM,_syncValue);
    SET_RAD_SHIELD_CASE(_unit,0,_syncValue);

    _unit addPrimaryWeaponItem QUOTE(exterra_sounds_vacuumMuzzle);
    _unit addSecondaryWeaponItem QUOTE(exterra_sounds_vacuumMuzzle);
};

_syncValue;
