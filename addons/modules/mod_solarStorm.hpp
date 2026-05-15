class GVAR(solarStorm) : GVAR(base)
{
    displayName = CSTRING(solarStorm_displayName);
    //icon = "";
    category = QGVAR(lifeSupportCategory);
    function = QFUNC(solarStorm);
    scope = 2;
    scopeCurator = 1;
    isGlobal = 0;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
    functionPriority = 5;
    isTriggerActivated = 1;
    isDisposable = 1;

    class Attributes : AttributesBase
    {
        class totalDose: Edit
        {
            property = QGVAR(solarStorm_totalDose);
            displayName = "total dose";
            tooltip = "";
            typeName = QUOTE(NUMBER);
            defaultValue = QUOTE(300);
        };

        class duration: Edit
        {
            property = QGVAR(solarStorm_duration);
            displayName = "duration";
            tooltip = "";
            typeName = QUOTE(NUMBER);
            defaultValue = QUOTE(3600);
        };
        class ModuleDescription : ModuleDescription {}; // Module description should be shown last
    };

    class ModuleDescription : ModuleDescription
    {
        description = CSTRING(solarStorm_desc);
        sync[] = { "LocationArea_F" };

        class LocationArea_F
        {
            position = 1;
            direction = 1;
            optional = 1;
            duplicate = 0;
            synced[] = { "AnyBrain" };
        };
    };
};
