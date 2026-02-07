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

params ["_unit"];

if (GVAR(vacExposeCalled)) exitWith {};
GVAR(vacExposeCalled) = true;

if (hasInterface) then {
    //[_unit, 1] call FUNC(barotrauma);
    ["exposedVacuum", 0, true] call ace_common_fnc_setHearingCapability;

    GVAR(vacExposureBlur_PP) ppEffectEnable true;
    GVAR(vacExposureBlur_PP) ppEffectAdjust [10];
    GVAR(vacExposureBlur_PP) ppEffectCommit 0.05;

    GVAR(vacExposureColor_PP) ppEffectEnable true;
    GVAR(vacExposureColor_PP) ppEffectAdjust [0,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,0]];
    GVAR(vacExposureColor_PP) ppEffectCommit 15;
};

GVAR(vacExpose_handler) = [{
    private _spo2DrainRate = 3;

    private _currentSPO2 = (_this#0) getVariable ["ace_medical_spo2", 100];
    _currentSPO2 = 1.5 max (_currentSPO2 - _spo2DrainRate);
    (_this#0) setVariable ["ace_medical_spo2", _currentSPO2];

    /*if () then {

    };*/


    if ((lifeState (_this#0)) == "INCAPACITATED") then {
        private _timer = ((_this#0) getVariable [QGVAR(vacExposeTimer), 0]) + 1;
        (_this#0) setVariable [QGVAR(vacExposeTimer), _timer];
        //systemChat format ["%1, %2 sec, %3 spo2", _this, _timer, _debugSPO2];

        if (_timer >= 45) exitWith {
            [(_this#0), "Vacuum Exposure", objNull, objNull] call ace_common_fnc_setDead;
            (_this#0) setVariable [QGVAR(vacExposeTimer), 0];
            if (hasInterface) then {
                GVAR(vacExposureBlur_PP) ppEffectEnable false;
                GVAR(vacExposureColor_PP) ppEffectEnable false;
                GVAR(vacExposureBlur_PP) ppEffectCommit 0;
                GVAR(vacExposureColor_PP) ppEffectCommit 0;
                ["exposedVacuum", 1, false] call ace_common_fnc_setHearingCapability;
            };
            [GVAR(vacExpose_handler)] call CBA_fnc_removePerFrameHandler;
        };
    } else {
        (_this#0) setVariable [QGVAR(vacExposeTimer), 0];
    };
}, 1, _unit
] call CBA_fnc_addPerFrameHandler;
