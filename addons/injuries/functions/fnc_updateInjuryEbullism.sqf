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

params ["_unit","_deltaT","_syncValue"];

private _unitHashmap = GET_SYMPTOM_HASHMAP(_unit);

GET_SUIT_BOOLS(_unit) params ["_inFullSuit","_helmetBool","_suitBool","_packBool"];

switch (GET_ATMO(_unit)) do {
    case ATMO_STATE_VACUUM: {

        if (_inFullSuit && {!(GET_VAC_EXPOSE_BOOL(_unit))}) exitWith {_syncValue};

        if (!_inFullSuit) then {
            if !(GET_VAC_EXPOSE_BOOL(_unit)) then {
                _syncValue = true;
                SET_VAC_EXPOSE_TIME(_unit,CBA_missionTime,_syncValue);
                SET_VAC_EXPOSE_BOOL(_unit,true,_syncValue);
            };

            GET_VAC_EXPOSE_ARRAY(_unit) params ["_unconTime","_cardiacArrestTime","_deathTime"];
            private _vacExposeTimeRelative = (CBA_missionTime - (GET_VAC_EXPOSE_TIME(_unit)));

            //systemChat str _vacExposeTimeRelative;

            switch true do {
                case (_vacExposeTimeRelative >= _deathTime): {
                    _unitHashmap set [((sID_DEATH*ID_RADIX) + iID_EBULLISM),[nil,nil,nil]];
                };
                case (_vacExposeTimeRelative >= _cardiacArrestTime): {
                    _unitHashmap set [((sID_CARDIAC_ARREST*ID_RADIX) + iID_EBULLISM),[nil,nil,nil]];
                };
                case (_vacExposeTimeRelative >= _unconTime): {
                    //_unitHashmap set [((sID_UNCON*ID_RADIX) + iID_EBULLISM),[_deathTime,nil,nil]];
                };
                case (_vacExposeTimeRelative >= 0): {
                    // Tinnitus
                    _unitHashmap set [((sID_TINNITUS*ID_RADIX) + iID_EBULLISM),[EBULLISM_TINNITUS_INTENSITY,nil,nil]];
                    // Pain
                    _unitHashmap set [((sID_PAIN*ID_RADIX) + iID_EBULLISM),[EBULLISM_PAIN,nil,nil]];
                    // Vision blur
                    _unitHashmap set [((sID_BLUR_VIS*ID_RADIX) + iID_EBULLISM),[EBULLISM_BLUR_INTENSITY,0.01,nil]];
                    // Deafness
                    _unitHashmap set [((sID_DEAFNESS*ID_RADIX) + iID_INJURY_AGNOSTIC),[0,true,nil]];
                    // Fatigue + Weakness
                    _unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_EBULLISM),[EBULLISM_FATIGUE_WEAKNESS,nil,nil]];
                    _unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_EBULLISM),[EBULLISM_FATIGUE_WEAKNESS,nil,nil]];
                    // SPO2
                    _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_EBULLISM),[0,nil,nil]];
                };
                default {};
            };
        } else {
            if (GET_VAC_EXPOSE_BOOL(_unit)) then {
                // Vision blur
                _unitHashmap set [((sID_BLUR_VIS*ID_RADIX) + iID_EBULLISM),[0,EBULLISM_RECOVERY_TIME,nil]];
                // SPO2
                _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_EBULLISM),[1,nil,nil]];
                private _vacExposeTimeRelative = (CBA_missionTime - (GET_VAC_EXPOSE_TIME(_unit)));
                if (_vacExposeTimeRelative <= EBULLISM_RECOVERY_TIME) then {
                    systemChat str _vacExposeTimeRelative;
                    private _deafnessCoeff = linearConversion [0,EBULLISM_RECOVERY_TIME,_vacExposeTimeRelative,0,1];
                    private _fatigueWeaknessCoeff = linearConversion [0,EBULLISM_RECOVERY_TIME,_vacExposeTimeRelative,EBULLISM_FATIGUE_WEAKNESS,0];

                    // Deafness
                    _unitHashmap set [((sID_DEAFNESS*ID_RADIX) + iID_INJURY_AGNOSTIC),[_deafnessCoeff,true,nil]];
                    // Fatigue + Weakness
                    _unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_EBULLISM),[_fatigueWeaknessCoeff,nil,nil]];
                    _unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_EBULLISM),[_fatigueWeaknessCoeff,nil,nil]];
                } else {
                    _syncValue = true;
                    // Deafness
                    _unitHashmap set [((sID_DEAFNESS*ID_RADIX) + iID_INJURY_AGNOSTIC),[1,false,nil]];
                    // Fatigue + Weakness
                    _unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_EBULLISM),[0,nil,nil]];
                    _unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_EBULLISM),[0,nil,nil]];

                    SET_VAC_EXPOSE_BOOL(_unit,false,_syncValue);
                };
            };
        };


    };
    default {
        if (GET_VAC_EXPOSE_BOOL(_unit)) then {
            // Vision blur
            _unitHashmap set [((sID_BLUR_VIS*ID_RADIX) + iID_EBULLISM),[0,EBULLISM_RECOVERY_TIME,nil]];
            // SPO2
            _unitHashmap set [((sID_SPO2*ID_RADIX) + iID_EBULLISM),[1,nil,nil]];
            private _vacExposeTimeRelative = (CBA_missionTime - (GET_VAC_EXPOSE_TIME(_unit)));
            if (_vacExposeTimeRelative <= EBULLISM_RECOVERY_TIME) then {
                systemChat str _vacExposeTimeRelative;
                private _deafnessCoeff = linearConversion [0,EBULLISM_RECOVERY_TIME,_vacExposeTimeRelative,0,1];
                private _fatigueWeaknessCoeff = linearConversion [0,EBULLISM_RECOVERY_TIME,_vacExposeTimeRelative,EBULLISM_FATIGUE_WEAKNESS,0];

                // Deafness
                _unitHashmap set [((sID_DEAFNESS*ID_RADIX) + iID_INJURY_AGNOSTIC),[_deafnessCoeff,true,nil]];
                // Fatigue + Weakness
                _unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_EBULLISM),[_fatigueWeaknessCoeff,nil,nil]];
                _unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_EBULLISM),[_fatigueWeaknessCoeff,nil,nil]];
            } else {
                _syncValue = true;
                // Deafness
                _unitHashmap set [((sID_DEAFNESS*ID_RADIX) + iID_INJURY_AGNOSTIC),[1,false,nil]];
                // Fatigue + Weakness
                _unitHashmap set [((sID_FATIGUE*ID_RADIX) + iID_EBULLISM),[0,nil,nil]];
                _unitHashmap set [((sID_WEAKNESS*ID_RADIX) + iID_EBULLISM),[0,nil,nil]];

                SET_VAC_EXPOSE_BOOL(_unit,false,_syncValue);
            };
        };
    };
};

_syncValue;
