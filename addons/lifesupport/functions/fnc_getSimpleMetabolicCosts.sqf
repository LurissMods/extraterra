#include "..\script_component.hpp"
/*
* Author: BaerMitUmlaut, ulteq, Luriss
* Lightweight version of ace_advanced_fatigue_fnc_getMetabolicCosts to be used if advanced fatigue is disabled
*
* Arguments:
* [_unit] [<UNIT>]
* _unit - nth Unit from an array of all units local to a client. Called by the statemachine (check statemachine)
*
* Return Value:
* [true] [<BOOL>] - Currently not used. Used to check if function has run or not
*
* Example:
* [_unit] call exterra_lifeSupport_fnc_handleUnitLifesupport;
*
* Public: No
*/

params ["_unit","_gearMass", "_terrainGradient", "_terrainFactor", "_speed"];

private _duty = [_unit, animationState _unit] call ACEFUNC(advanced_fatigue,getAnimDuty);

if (_speed > 2) then {
    // Running
    (
        2.1 * HUMAN_MASS
        + 4 * (HUMAN_MASS + _gearMass) * ((_gearMass / HUMAN_MASS) ^ 2)
        + _terrainFactor * (HUMAN_MASS + _gearMass) * (0.9 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient)
    ) * BIOMECH_EFFICIENCY * _duty
} else {
    // Walking
    (
        1.05 * HUMAN_MASS
        + 2 * (HUMAN_MASS + _gearMass) * ((_gearMass / HUMAN_MASS) ^ 2)
        + _terrainFactor * (HUMAN_MASS + _gearMass) * (1.15 * (_speed ^ 2) + 0.66 * _speed * _terrainGradient)
    ) * BIOMECH_EFFICIENCY * _duty
};
