class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class exterra_huds_activateSuit {
                displayName = "Activate Suit";
                condition = "true";
                exceptions[] = {};
                //statement = "_player call";
                statement = "['exterra_lifesupport_suitActivated', ACE_player] call CBA_fnc_localEvent";
                //icon = "\z\dance.paa";
            };
        };
    };
};
