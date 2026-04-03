class ACE_Medical_Injuries {
    class wounds {
        // each sub-class defines a valid wound type
        class Ebullism {
            bleeding = 0.00; // maximum blood loss per wound as a multiple of cardiac output, will be scaled by wound size. (default: 0)
            pain = 1.0; // maximum pain produced on a scale of 0..1, will be scaled by wound size (default: 0)
            causeLimping = 1; // 0 to ignore this wound type when determining whether damage to the legs is sufficient to cause limping (default: 0)
            causeFracture = 0; // 0 to prevent this wound type from causing fractures (default: 0)
        };
    };

    /*class damageTypes {
        // default values used if a damage type does not define them itself
        thresholds[] = {{0.1, 1}};
        selectionSpecific = 1;

        // list of damage handlers, which will be called in reverse order
        // each entry should be a SQF expression that returns a function
        // this can also be overridden for each damage type
        class woundHandlers {
            ace_medical_damage = QACEFUNC(medical_damage,woundsHandlerBase);
        };

        // each sub-class defines a valid damage type
        class bullet {
            // custom handling for this damage type
            // inherits from the default handlers - the function(s) defined here will be called first, then the default one(s)
            class woundHandlers: woundHandlers {
                GVAR(EbullismBullet) = QFUNC(woundHandlerEbullismBullet);
            };

            // one class for each type of wound this damage type is allowed to create
            // must match a wound type defined above
            class Ebullism {
                // used to determine the chance of producing this type of wound instead of another - see explanation above
                weighting[] = {{1, 1}, {0, 1}};

                // multiplier for incoming damage, applied before anything else is calculated (default: 1)
                damageMultiplier = 1;

                // multiplies the damage value used to determine wound size as shown in the UI.
                // size is used to scale bleeding & pain but *not* death or unconsciousness (default: 1)
                sizeMultiplier = 1;

                // multiplies bleeding rate (applied after size) (default: 1)
                //bleedingMultiplier = 1;

                // multiplies pain produced (applied after size) (default: 1)
                painMultiplier = 1;

                // multiplies the probability to create fractures (default: 1)
                //fractureMultiplier = 1;
            };
        };
    };*/
};
