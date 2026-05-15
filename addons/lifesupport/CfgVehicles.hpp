class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(lsConsumeables) {
                displayName = CSTRING(aceInteract_lsMain);
                condition = "((_this select 0) getVariable ['exterra_lifesupport_unitSuitFaction',nil]) != 0";
                exceptions[] = {};
                statement = "";
                icon = "z\exterra\addons\lifesupport\data\exterra_lifesupport_lsArsenalIcon_ca.paa";
                //insertChildren = QGVAR(lsEquipAirTank);

                class GVAR(lsEquipAirTank) {
                    displayName = CSTRING(aceInteract_equipAirTank);
                    condition = "[(_this select 0)] call exterra_lifesupport_fnc_getAirTanks && {!((_this select 0) getVariable ['exterra_lifesupport_unitAirTankBool',nil])}";
                    exceptions[] = {};
                    statement = "";
                    insertChildren = QUOTE([_this select 0] call FUNC(setAirTank));
                    //statement = QUOTE([(_this select 0)] call FUNC(setAirTank));
                    icon = "z\exterra\addons\lifesupport\data\exterra_lifesupport_airTankAdd_ca.paa";
                };
                class GVAR(lsUnequipAirTank) {
                    displayName = CSTRING(aceInteract_unequipAirTank);
                    condition = "(_this select 0) getVariable ['exterra_lifesupport_unitAirTankBool', false]";
                    exceptions[] = {};
                    //statement = "['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent";
                    statement = QUOTE([(_this select 0)] call FUNC(removeAirTank));
                    icon = "z\exterra\addons\lifesupport\data\exterra_lifesupport_airTankRemove_ca.paa";
                };

                class GVAR(lsEquipBattery) {
                    displayName = CSTRING(aceInteract_equipBattery);
                    //condition = QUOTE([(_this select 0)] call FUNC(getBatteries));
                    condition = "[(_this select 0)] call exterra_lifesupport_fnc_getBatteries && {!((_this select 0) getVariable ['exterra_lifesupport_unitBatteryBool',nil])}";
                    exceptions[] = {};
                    statement = "";
                    insertChildren = QUOTE([_this select 0] call FUNC(setBattery));
                    //statement = QUOTE([(_this select 0)] call FUNC(setBattery));
                    icon = "z\exterra\addons\lifesupport\data\exterra_lifesupport_batteryAdd_ca.paa";
                };
                class GVAR(lsUnequipBattery) {
                    displayName = CSTRING(aceInteract_unequipBattery);
                    condition = "(_this select 0) getVariable ['exterra_lifesupport_unitBatteryBool', false]";
                    exceptions[] = {};
                    //statement = "['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent";
                    statement = QUOTE([(_this select 0)] call FUNC(removeBattery));
                    icon = "z\exterra\addons\lifesupport\data\exterra_lifesupport_batteryRemove_ca.paa";
                };
            };
        };
    };
};
