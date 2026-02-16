#include "..\script_component.hpp"
/*
* Author: Luriss
* Updates the current radiation shielding and lifetime radiation exposure of a unit.
*
* Arguments:
* [_unit, _syncValue] [<UNIT>, <BOOL>]
* _unit - Current unit.
* _syncValue - Whether or not to sync the current update with the server
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_updateUnitRadiation;
*
* Public: No
*/

params ["_unit","_syncValue"];

private _currentLifetimeExposure = GETVAR(_unit,GVAR(unitLifetimeRadLevel),nil); // in mSv
private _currentEnvironRadPerHour = EGVAR(modules,currentEnvironRadiationPerHour); // Defined by module, global
private _shielding = GETVAR(_unit,GVAR(unitInRadShield),RAD_SHIELD_ERROR); // Set by the modules
private _shieldCoeff = 0;

switch _shielding do {
    case 0: {
        _shieldCoeff = GVAR(radShield_coeff0);
    };
    case 1: {
        _shieldCoeff = GVAR(radShield_coeff1);
    };
    case 2: {
        _shieldCoeff = GVAR(radShield_coeff2);
    };
    case 3: {
        _shieldCoeff = GVAR(radShield_coeff3);
    };
    case 4: {
        _shieldCoeff = GVAR(radShield_coeff4);
    };
    case 5: {
        _shieldCoeff = GVAR(radShield_coeff5);
    };
};
_currentLifetimeExposure = _currentLifetimeExposure + ((_shieldCoeff*_currentEnvironRadPerHour)/3600);

_unit setVariable [QGVAR(unitRadShieldCoeff),_shieldCoeff,_syncValue];
_unit setVariable [QGVAR(unitLifetimeRadLevel),_currentLifetimeExposure,_syncValue];
