class CfgFunctions {
   /* class overwrite_ace_medical_status {
        tag = "ace_medical_status";
        class ace_medical_status {
            class hasStableVitals {
                file = QPATHTOF(functions\fnc_hasStableVitals.sqf);
            };
            class addMedicationAdjustment {
                file = QPATHTOF(functions\fnc_addMedicationAdjustment.sqf);
            };
            class getBloodPressure {
                file = QPATHTOF(functions\fnc_getBloodPressure.sqf);
            };
        };
    };*/
    class overwrite_ace_medical_vitals {
        tag = "ace_medical_vitals";
        class ace_medical_vitals {
            class handleUnitVitals {
                file = QPATHTOF(functions\fnc_handleUnitVitals.sqf);
            };
            /*class updateHeartRate {
                file = QPATHTOF(functions\fnc_updateHeartRate.sqf);
            };*/
        };
    };
    class overwrite_ace_medical_statemachine {
        tag = "ace_medical_statemachine";
        class ace_medical_statemachine {
            class handleStateDefault {
                file = QPATHTOF(functions\fnc_handleStateDefault.sqf);
            };
            /*class updateHeartRate {
                file = QPATHTOF(functions\fnc_updateHeartRate.sqf);
            };*/
        };
    };
    /*class overwrite_ace_medical_feedback {
        tag = "ace_medical_feedback";
        class ace_medical_feedback {
            class handleEffects {
                file = QPATHTOF(functions\fnc_handleEffects.sqf);
            };
        };
    };
    class overwrite_ace_medicalTreatment {
        tag = "ace_medical_treatment";
        class ace_medical_treatment {
            class medicationLocal {
                file = QPATHTOF(functions\fnc_medicationLocal.sqf);
            };
            class tourniquetRemove {
                file = QPATHTOF(functions\fnc_tourniquetRemove.sqf);
            };
            class treatment {
                file = QPATHTOF(functions\fnc_treatment.sqf);
            };
            class treatmentSuccess {
                file = QPATHTOF(functions\fnc_treatmentSuccess.sqf);
            };
            class useItem {
                file = QPATHTOF(functions\fnc_useItem.sqf);
            };
        };
    };
    class overwrite_ace_medical_engine {
        tag = "ace_medical_engine";
        class ace_medical_engine {
            class updateDamageEffects {
                file = QPATHTOF(functions\fnc_updateDamageEffects.sqf);
            };
        };
    };
    class ace_medical {
        tag = "ace_medical";
        class ace_medical {
            class setUnconscious {
                file = QPATHTOF(functions\fnc_setUnconscious.sqf);
            };
        };
    };
    class overwrite_ace_medical_statemachine {
        tag = "ace_medical_statemachine";
        class ace_medical_statemachine {
            class conditionExecutionDeath {
                file = QPATHTOF(functions\fnc_conditionExecutionDeath.sqf);
            };
            class conditionSecondChance {
                file = QPATHTOF(functions\fnc_conditionSecondChance.sqf);
            };
        };
    };*/
};
