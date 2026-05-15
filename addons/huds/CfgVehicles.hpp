class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class exterra_huds_activateSuit {
                displayName = "Activate Suit";
                condition = QUOTE([(_this select 0)] call FUNC(canSuitActivate));
                exceptions[] = {};
                statement = "['exterra_lifesupport_suitActivated', ACE_player] call CBA_fnc_localEvent";
                icon = "z\exterra\addons\huds\data\generalIcons\exterra_huds_powerOn_ca.paa";
            };
            class exterra_huds_deactivateSuit {
                displayName = "Deactivate Suit";
                condition = QUOTE([(_this select 0)] call FUNC(canSuitDeactivate));
                exceptions[] = {};
                statement = "['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent";
                icon = "z\exterra\addons\huds\data\generalIcons\exterra_huds_powerOff_ca.paa";
            };
        };
    };
};
