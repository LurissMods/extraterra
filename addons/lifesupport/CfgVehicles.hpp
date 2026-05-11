class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(lsConsumeables) {
                displayName = "Life Support";
                condition = "true";
                exceptions[] = {};
                statement = "true";
                icon = "z\exterra\addons\huds\data\generalIcons\exterra_huds_powerOff_ca.paa";
                insertChildren = QGVAR(lsEquipAirTank);

                class GVAR(lsEquipAirTank) {
                    displayName = "Equip Air Tank";
                    condition = QUOTE([(_this select 0)] call FUNC(getAirTanks));
                    exceptions[] = {};
                    //statement = "['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent";
                    statement = QUOTE([(_this select 0)] call FUNC(setAirTank));
                    icon = "";
                };
                class GVAR(lsUnequipAirTank) {
                    displayName = "Unequip Air Tank";
                    condition = "count ((_this select 0) getVariable ['exterra_lifesupport_unitAirTank',[]]) != 0";
                    exceptions[] = {};
                    //statement = "['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent";
                    statement = QUOTE([(_this select 0)] call FUNC(removeAirTank));
                    icon = "";
                };

                class GVAR(lsEquipBattery) {
                    displayName = "Equip Battery";
                    condition = QUOTE([(_this select 0)] call FUNC(getBatteries));
                    exceptions[] = {};
                    //statement = "['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent";
                    statement = QUOTE([(_this select 0)] call FUNC(setBattery));
                    icon = "";
                };
                class GVAR(lsUnequipBattery) {
                    displayName = "Unequip Battery";
                    condition = "count ((_this select 0) getVariable ['exterra_lifesupport_unitBattery',[]]) != 0";
                    exceptions[] = {};
                    //statement = "['exterra_lifesupport_suitDeactivated', ACE_player] call CBA_fnc_localEvent";
                    statement = QUOTE([(_this select 0)] call FUNC(removeBattery));
                    icon = "";
                };
            };
        };
    };
};
