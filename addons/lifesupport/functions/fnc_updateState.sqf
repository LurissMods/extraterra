#include "..\script_component.hpp"
/*
* Author: Luriss
* Simulates the body's core tempeature. Note that this function uses the ace_advanced_fatigue_fnc_getMetabolicCosts function from ACE.
*
* Arguments:
* None
*
* Return Value:
* [_coreTemp, _totalRadiatedHeatAproxWattage] [<NUMBER>,<NUMBER>] - First is body core temperature in Kelvin, second is radiated body heat in watts.
*
* Example:
* [] call exterra_lifeSupport_fnc_thermalSimulation;
*
* Public: Yes
*/

params ["_unit", "_syncValues"];
