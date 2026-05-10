class CfgFunctions {
    class overwrite_ace_medical_vitals {
        tag = "ace_medical_vitals";
        class ace_medical_vitals {
            class consumeMedications {
                file = QPATHTOF(functions\fnc_consumeMedications.sqf);
            };
        };
    };
};
