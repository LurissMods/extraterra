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

private _unitPreviousArea = GET_ATMO(_unit);
private _unitInArea = false;

{
    _x params ["_positionData", "_lifeSupportData"];
    _lifeSupportData params ["_atmoValue", "_radShieldValue"];

    if (_unit inArea _positionData) then {
        _unitInArea = true;
        if (_unitPreviousArea != _atmoValue) then {
            _syncValue = true;

            SET_ATMO(_unit,_atmoValue,_syncValue);
            SET_RAD_SHIELD_CASE(_unit,_radShieldValue,_syncValue);

            if (_unitPreviousArea == ATMO_STATE_VACUUM) then {
                _unit removePrimaryWeaponItem QUOTE(exterra_sounds_vacuumMuzzle);
                _unit removeSecondaryWeaponItem QUOTE(exterra_sounds_vacuumMuzzle);
            };
        };
    };
} forEach EGVAR(modules,allLifeSupportAreas);

if (!_unitInArea && {_unitPreviousArea != ATMO_STATE_VACUUM}) then {
    _syncValue = true;

    SET_ATMO(_unit,ATMO_STATE_VACUUM,_syncValue);
    SET_RAD_SHIELD_CASE(_unit,0,_syncValue);

    _unit addPrimaryWeaponItem QUOTE(exterra_sounds_vacuumMuzzle);
    _unit addSecondaryWeaponItem QUOTE(exterra_sounds_vacuumMuzzle);
};

_syncValue;
