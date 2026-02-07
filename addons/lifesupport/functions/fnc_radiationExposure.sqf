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

private _currentLifetimeExposure = GETVAR(ace_player,GVAR(lifetimeRadLevel),0); // in mSv
private _currentEnvironRadPerHour = EGVAR(modules,currentEnvironRadiationPerHour);
private _shielding = GETVAR(ACE_player,GVAR(inRadShield),-1);
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

[_currentLifetimeExposure,_currentEnvironRadPerHour,_shieldCoeff];


/*if (player getVariable ["LRSS_LS_enabled", false]) then {
    call lrss_fnc_radiationExposureSuit;
};*/
