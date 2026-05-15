#include "..\script_component.hpp"
/*
* Author: Luriss
* Changes the radiation level of the mission.
*
* Arguments:
* Passed from module. Check CfgVehicles.hpp for attribute classes.
*
* Return Value:
* None
*
* Example:
* Called via module in CfgVehicles.hpp.
*
* Public: No
*/

params ["_duration", "_maxDose"];

GVAR(solarStorm_PFH) = [
    {
        (_this#0) params ["_duration", "_maxDose"];

        private _deltaT = CBA_missionTime - GVAR(lastIntegrationTime);

        if (_deltaT > (_duration/10)) then {
            if (GVAR(currentIntegrationInterval) < 11) then {
                //private _duration = 60;
                //private _maxDose = 1000;
                private _totalIntegralArea = 1 - (1/exp(4));

                private _upper = GVAR(currentIntegrationInterval)/10;
                private _lower = (GVAR(currentIntegrationInterval) - 1)/10;

                //systemChat format ["Upper: %1",_upper];
                //systemChat format ["Lower: %1",_lower];
                private _currentIntegral = (-exp(-4*_upper)) - (-exp(-4*_lower));
                private _integralRatio = _currentIntegral/_totalIntegralArea;

                //systemChat str _currentIntegral;

                private _currentRad = (_integralRatio*_maxDose)/(_duration/10);
                EGVAR(common,currentEnvironRadiationPerHour) = _currentRad*3600;
                publicVariable QEGVAR(common,currentEnvironRadiationPerHour);

                GVAR(currentIntegrationInterval) = GVAR(currentIntegrationInterval) + 1;
                GVAR(lastIntegrationTime) = CBA_missionTime;
            } else {
                EGVAR(common,currentEnvironRadiationPerHour) = NORMAL_BACKGROUND_RADIATION;
                publicVariable QEGVAR(common,currentEnvironRadiationPerHour);
                GVAR(currentIntegrationInterval) = 1;

                [QGVAR(stormEventEnded)] call CBA_fnc_serverEvent;
            };
        };
    },
    0,
    [_duration,_maxDose]
] call CBA_fnc_addPerFrameHandler;
