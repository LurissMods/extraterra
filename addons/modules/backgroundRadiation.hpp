class GVAR(backgroundRadiation) : GVAR(base)
{
    displayName = "background radiation";
    //icon = "";
    category = QGVAR(lifeSupportCategory);
    function = QFUNC(backgroundRadiation);
    scope = 2;
    scopeCurator = 1;
    isGlobal = 0;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
    functionPriority = 5;
    isTriggerActivated = 1;
    isDisposable = 1;

    class Attributes : AttributesBase
    {
        class currentDose: Edit
        {
            property = QGVAR(backgroundRadiation_currentDose);
            displayName = "current dose";
            tooltip = "";
            typeName = QUOTE(NUMBER);
            defaultValue = QUOTE(100);
        };
    };

    class ModuleDescription : ModuleDescription
    {
        description = CSTRING(noSolarStorm_main_desc);
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
