#include "..\script_component.hpp"
/*
 * Author: Luriss
 * Simulates the local temperature of the environment surrounding the player. Returns a ratio between 0 and 1 (0 means min temp, 1 means max temp).
 *
 * Arguments:
 * _moonSurfaceTemp (Array -  [minTemp, maxTemp]). In Kelvin.
 *
 * Return Value:
 * _tempAroundPlayer
 *
 * Example:
 * [] call exterra_lifeSupport_fnc_localTemperature;
 *
 * Public: Yes
 */


params ["_newUnit", "_oldUnit"];

systemChat "I fired?";
