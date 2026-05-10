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

params ["_unit","_currentRad","_syncValue"];

private _radFeverStart = ((_unit getVariable [QGVAR(unitRadLimArray),nil]) select 6);
private _maxRadLim = ((_unit getVariable [QGVAR(unitRadLimArray),nil]) select 8);

private _xValue = linearConversion [_radFeverStart,_maxRadLim,_currentRad,0,3,true];
// https://www.wolframalpha.com/input?i=fit+curve+%7B%5B0%2C0%5D%2C%5B1.5%2C3%5D%2C%5B3%2C1.5%5D%7D
private _feverOffset = (-_xValue^2) + (3.5*_xValue);

_unit setVariable [QEGVAR(injuries,unitFeverTempAdjustment),_feverOffset,_syncValue];
