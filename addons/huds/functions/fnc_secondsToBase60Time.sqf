#include "..\script_component.hpp"
/*
* Author: Luriss
* Converts seconds into base 60 time for display on the HUD.
*
* Arguments:
* ["_supply", "_currentConsumption", "_hudText"]    [<NUMBER>, <NUMBER>, <CONTROL>]
* _supply = Current supply of a given consumable.
* _currentConsumption = Current consumption rate of a given consumable.
* _hudText = Control ID of the given timer on the HUD.
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_secondsToBase60Time
*
* Public: No
*/

params ["_supply", "_currentConsumption", "_hudText", "_deltaT"];

private _estTimeRemainingSec = (_supply/_currentConsumption)*_deltaT;
private _estTimeRemainingSecConv = floor _estTimeRemainingSec % 60;
private _estTimeRemainingMin = (_estTimeRemainingSec/60) % 60;
private _estTimeRemainingHour = (_estTimeRemainingSec/60^2) min 99;

if (floor _estTimeRemainingHour < 10) then {
    if (floor _estTimeRemainingMin < 10) then {
        if (floor _estTimeRemainingSecConv < 10) then {
            (_hudText) ctrlSetStructuredText parseText format["<t size='0.8'> EST TME: 0%1:0%2:0%3", (floor _estTimeRemainingHour), (floor _estTimeRemainingMin), (_estTimeRemainingSecConv)];
        } else {
            (_hudText) ctrlSetStructuredText parseText format["<t size='0.8'> EST TME: 0%1:0%2:%3", (floor _estTimeRemainingHour), (floor _estTimeRemainingMin), (_estTimeRemainingSecConv)];
        };
} else {
        if (floor _estTimeRemainingSecConv < 10) then {
            (_hudText) ctrlSetStructuredText parseText format["<t size='0.8'> EST TME: 0%1:%2:0%3", (floor _estTimeRemainingHour), (floor _estTimeRemainingMin), (_estTimeRemainingSecConv)];
        } else {
            (_hudText) ctrlSetStructuredText parseText format["<t size='0.8'> EST TME: 0%1:%2:%3", (floor _estTimeRemainingHour), (floor _estTimeRemainingMin), (_estTimeRemainingSecConv)];
        };
    };
} else {
    if (floor _estTimeRemainingMin < 10) then {
        if (floor _estTimeRemainingSecConv < 10) then {
            (_hudText) ctrlSetStructuredText parseText format["<t size='0.8'> EST TME: %1:0%2:0%3", (floor _estTimeRemainingHour), (floor _estTimeRemainingMin), (_estTimeRemainingSecConv)];
        } else {
            (_hudText) ctrlSetStructuredText parseText format["<t size='0.8'> EST TME: %1:0%2:%3", (floor _estTimeRemainingHour), (floor _estTimeRemainingMin), (_estTimeRemainingSecConv)];
        };
} else {
        if (floor _estTimeRemainingSecConv < 10) then {
            (_hudText) ctrlSetStructuredText parseText format["<t size='0.8'> EST TME: %1:%2:0%3", (floor _estTimeRemainingHour), (floor _estTimeRemainingMin), (_estTimeRemainingSecConv)];
        } else {
            (_hudText) ctrlSetStructuredText parseText format["<t size='0.8'> EST TME: %1:%2:%3", (floor _estTimeRemainingHour), (floor _estTimeRemainingMin), (_estTimeRemainingSecConv)];
        };
    };
};
