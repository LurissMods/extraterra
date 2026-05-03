class GVAR(enableExterra) : exterra_modules_base
{
    displayName = CSTRING(enableExterra_main_displayName);				// Name displayed in the menu
    //icon = "";	// Map icon. Delete this entry to use the default icon.
    category = QGVAR(lifeSupportCategory);
    function = QFUNC(enableExterra);	// Name of function triggered once conditions are met
    scope = 2;
    scopeCurator = 1;

    // Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
    class Attributes : AttributesBase
    {
        class ModuleDescription : ModuleDescription {}; // Module description should be shown last
    };

    // Module description (must inherit from base class, otherwise pre-defined entities won't be available)
    class ModuleDescription : ModuleDescription
    {
        description = CSTRING(enableExterra_main_desc);	// Short description, will be formatted as structured text
        sync[] = { "LocationArea_F" };				// Array of synced entities (can contain base classes)

        class LocationArea_F
        {
            /*description[] = { // Multi-line descriptions are supported
                "First line",
                "Second line"
            };*/
            position = 1;	// Position is taken into effect
            direction = 1;	// Direction is taken into effect
            optional = 1;	// Synced entity is optional
            duplicate = 0;	// Multiple entities of this type can be synced
            synced[] = { "AnyBrain" };	// Pre-defined entities like "AnyBrain" can be used (see the table below)
        };
    };
};
