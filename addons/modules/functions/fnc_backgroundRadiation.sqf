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

// e^(-5x^2)

private _logic = _this param [0,objnull,[objnull]];
private _isActivated = _this param [2,true,[true]];

private _currentDose = NORMAL_BACKGROUND_RADIATION min GETVAR(_logic,currentDose,nil);

if _isActivated then {
    EGVAR(common,currentEnvironRadiationPerHour) = _currentDose;
    publicVariable QEGVAR(common,currentEnvironRadiationPerHour);
    deleteVehicle _logic;
};



/*private _totalIntegralArea = 1 - (1/exp(4));



if _isActivated then {
    sleep 5;
    for "_i" from 1 to 10 do {

        //private _exponent = linearConversion [1,_duration,_i,0,1];
        //private _exponent = linearConversion [1,_duration,_i,0,1];

        private _upper = _i/10;
        private _lower = (_i - 1)/10;

        systemChat format ["Upper: %1",_upper];
        systemChat format ["Lower: %1",_lower];

        //private _currentIntegral = (((0.5)*sqrt(pi/5)*(sqrt(5)*_upper)) - ((0.5)*sqrt(pi/5)*(sqrt(5)*_lower)));
        private _currentIntegral = (-exp(-4*_upper)) - (-exp(-4*_lower));
        private _integralRatio = _currentIntegral/_totalIntegralArea;

        systemChat str _currentIntegral;

        private _currentRad = (_integralRatio*_maxDose)/(_duration/10);

        //GVAR(currentEnvironRadiationPerHour) = (_maxDose)*exp (-4*_exponent);
        //GVAR(currentEnvironRadiationPerHour) = _maxDose*exp (-5*_exponent^2);
        GVAR(currentEnvironRadiationPerHour) = _currentRad*3600;
        publicVariable QGVAR(currentEnvironRadiationPerHour);
		sleep (_duration/10);
    };

    private _finalRadDose = GVAR(currentEnvironRadiationPerHour);

    for "_i" from 0 to 9 do {
        systemChat "fired";
        private _transitionDose = linearConversion [0,9,_i,_finalRadDose,NORMAL_BACKGROUND_RADIATION];
        GVAR(currentEnvironRadiationPerHour) = _transitionDose;
        publicVariable QGVAR(currentEnvironRadiationPerHour);
        sleep (1 max _duration/100);
    };

    deleteVehicle _logic;
};

// maxDose*e^-4x


for "_i" from 1 to _transitionTime do {
		GVAR(currentEnvironRadiationPerHour) = _minValue max (GVAR(currentEnvironRadiationPerHour) + _changeInRadiationPerSecond) min _maxValue;
        publicVariable QGVAR(currentEnvironRadiationPerHour);
		sleep 1;
	};

	deleteVehicle _logic;
*/
