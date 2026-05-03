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

/*if ((CBA_missionTime - GVAR(lastIntegrationTime)) > (_duration/10)) then {
    if (GVAR(currentIntegrationInterval) < 11) then {
        //private _duration = 60;
        //private _maxDose = 1000;
        private _totalIntegralArea = 1 - (1/exp(4));

        private _upper = GVAR(currentIntegrationInterval)/10;
        private _lower = (GVAR(currentIntegrationInterval) - 1)/10;

        systemChat format ["Upper: %1",_upper];
        systemChat format ["Lower: %1",_lower];
        private _currentIntegral = (-exp(-4*_upper)) - (-exp(-4*_lower));
        private _integralRatio = _currentIntegral/_totalIntegralArea;

        systemChat str _currentIntegral;

        private _currentRad = (_integralRatio*_maxDose)/(_duration/10);
        EGVAR(modules,currentEnvironRadiationPerHour) = _currentRad*3600;
        publicVariable QEGVAR(modules,currentEnvironRadiationPerHour);

        GVAR(currentIntegrationInterval) = GVAR(currentIntegrationInterval) + 1;
        GVAR(lastIntegrationTime) = CBA_missionTime;
    } else {
        EGVAR(modules,currentEnvironRadiationPerHour) = NORMAL_BACKGROUND_RADIATION;
        publicVariable QEGVAR(modules,currentEnvironRadiationPerHour);

        EGVAR(modules,stormParams) = [false,0,0];
    };
};*/

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

                /*for "_i" from 0 to 100 do {
                    private _currentRad = linearConversion [0,3,_i,EGVAR(common,currentEnvironRadiationPerHour),NORMAL_BACKGROUND_RADIATION];

                    systemChat str _currentRad;
                };*/

                [QGVAR(stormEventEnded)] call CBA_fnc_serverEvent;
            };
        };
    },
    0,
    [_duration,_maxDose]
] call CBA_fnc_addPerFrameHandler;



/*[
    {CBA_missionTime >= _nextInterval},
    {[_duration,_maxDose] call FUNC(updateSolarStorm)},
    0,
    _stormComplete,
    {systemChat "storm complete!"}
] call CBA_fnc_waitUntilAndExecute;*/
