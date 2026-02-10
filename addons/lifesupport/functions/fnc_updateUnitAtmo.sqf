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

params ["_unit","_syncValue"];

private _unitPreviousArea = GETVAR(_unit,GVAR(unitInAtmo),nil);
private _unitInArea = false;

{
    if (_unit inArea (_x select 0)) then {
        _unitInArea = true;
        if (_unitPreviousArea != ((_x select 1) select 0)) then {
            _syncValue = true;

            SETPVAR(_unit,GVAR(unitInAtmo),((_x select 1) select 0));
            SETPVAR(_unit,GVAR(unitInRadShield),((_x select 1) select 1));

            if (_unitPreviousArea == ATMO_STATE_VACUUM) then {
                _unit removePrimaryWeaponItem QUOTE(exterra_vacuumMuzzle);
                _unit removeSecondaryWeaponItem QUOTE(exterra_vacuumMuzzle);
            };

            _syncValue;
        };
    };
} forEach EGVAR(modules,allLifeSupportAreas);

if (!_unitInArea && {_unitPreviousArea != ATMO_STATE_VACUUM}) then {
    _syncValue = true;

    _unit setVariable [QGVAR(unitInAtmo), ATMO_STATE_VACUUM, _syncValue];
    _unit setVariable [QGVAR(unitInRadShield), RAD_COEFF0_DEFAULT, _syncValue];

    _unit addPrimaryWeaponItem  QUOTE(exterra_vacuumMuzzle);
    _unit addSecondaryWeaponItem  QUOTE(exterra_vacuumMuzzle);
};

_syncValue;
