class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class exterra_injuries_cleanVomit {
                displayName = "Clean Vomit";
                condition = QUOTE([(_this select 0)] call FUNC(canCleanVomit));
                exceptions[] = {};
                statement = QUOTE(call FUNC(cleanVomit));
                icon = "";
            };
        };
    };
};
