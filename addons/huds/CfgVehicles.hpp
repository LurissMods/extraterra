class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class exterra_huds_activateSuit {
                displayName = "Activate Suit";
                condition = "(((_this select 0) getVariable ['exterra_lifesupport_unitSuitBools',false]) select 0) && {!((_this select 0) getVariable ['exterra_lifesupport_suitActivated',false])}";
                exceptions[] = {};
                //statement = "_player call";
                statement = "['exterra_lifesupport_suitActivated', ACE_player] call CBA_fnc_localEvent";
                icon = "z\exterra\addons\huds\data\generalIcons\exterra_huds_powerOn_ca.paa";
            };
            class exterra_huds_deactivateSuit {
                displayName = "Deactivate Suit";
                condition = "(((_this select 0) getVariable ['exterra_lifesupport_unitSuitBools',false]) select 0) && {((_this select 0) getVariable ['exterra_lifesupport_suitActivated',false])}";
                exceptions[] = {};
                //statement = "_player call";
                statement = "['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent";
                icon = "z\exterra\addons\huds\data\generalIcons\exterra_huds_powerOff_ca.paa";
            };
        };
    };
};
