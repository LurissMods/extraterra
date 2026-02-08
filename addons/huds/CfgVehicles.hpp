class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class exterra_huds_activateSuit {
                displayName = "Activate Suit";
                condition = "true";
                exceptions[] = {};
                //statement = "_player call";
                statement = QUOTE(_player call FUNC(suitActivation));
                //icon = "\z\dance.paa";
            };
        };
    };
};
