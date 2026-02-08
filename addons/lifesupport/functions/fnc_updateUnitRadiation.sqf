#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks if player is in direct sunlight. Returns thermal heating in watts.
*
* Arguments:
* None
*
* Return Value:
* _currentLifetimeExposure <NUMBER>
*
* Example:
* [] call exterra_lifeSupport_fnc_thermalSimulation;
*
* Public: Yes
*/

params ["_unit", "_syncValue"]

private _currentLifetimeExposure = GETVAR(_unit,GVAR(unitLifetimeRadLevel),0); // in mSv
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

_unit setVariable [QGVAR(unitLifetimeRadLevel),_currentLifetimeExposure,_syncValue];
