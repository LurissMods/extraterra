#include "script_component.hpp"

if (!hasInterface) exitWith {};

["CBA_settingsInitialized", {
    //systemChat "Post init running";

}] call CBA_fnc_addEventHandler;
