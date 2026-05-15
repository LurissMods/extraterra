class GVAR(pressurizedAndRadShieldArea) : GVAR(base)
{
    displayName = CSTRING(pressurizedAndRadShieldArea_main_displayName);
    //icon = "";
    category = QGVAR(lifeSupportCategory);
    function = QFUNC(pressureAndRadShield);
    scope = 2;
    scopeCurator = 1;
    functionPriority = 10;

    canSetArea = 1;
    canSetAreaShape = 1;
    canSetAreaHeight = 1;
    class AttributeValues
    {
        size3[] = { 10, 10, 10 };
        isRectangle = 1;
    };

    class Attributes : AttributesBase
    {
        class atmoComp : Combo
        {
            property = QUOTE(exterra_extraterra_modules_pressurizedAndRadShieldArea_atmoComp);
            displayName = CSTRING(pressurizedAndRadShieldArea_atmoComp_displayName);
            tooltip = CSTRING(pressurizedAndRadShieldArea_atmoComp_tooltip);
            typeName = QUOTE(NUMBER);
            defaultValue = QUOTE(1);

            // Listbox items
            class Values
            {
                class vacuum	{ name = CSTRING(pressurizedAndRadShieldArea_atmoComp_option0);	value = 0; };
                class 1Atm	{ name = CSTRING(pressurizedAndRadShieldArea_atmoComp_option1);	value = 1; };
                class 0p3Atm	{ name = CSTRING(pressurizedAndRadShieldArea_atmoComp_option2); value = 2; };
            };
        };

        class shieldingValue : Combo
        {
            property = QUOTE(exterra_extraterra_modules_pressurizedAndRadShieldArea_shieldingValue);
            displayName = CSTRING(pressurizedAndRadShieldArea_shieldingValue_displayName);
            tooltip = CSTRING(pressurizedAndRadShieldArea_shieldingValue_tooltip);
            typeName = QUOTE(NUMBER);
            defaultValue = QUOTE(1);

            // Listbox items
            class Values
            {
                class noShield	{ name = CSTRING(pressurizedAndRadShieldArea_shieldingValue_option0);	value = 0; };
                class lightShield	{ name = CSTRING(pressurizedAndRadShieldArea_shieldingValue_option1);	value = 1; };
                class ModerateShield	{ name = CSTRING(pressurizedAndRadShieldArea_shieldingValue_option2);	value = 2; };
                class heavyShield	{ name = CSTRING(pressurizedAndRadShieldArea_shieldingValue_option3); value = 3; };
                class undergroundLightShield	{ name = CSTRING(pressurizedAndRadShieldArea_shieldingValue_option4); value = 4; };
                class undergroundheavyShield	{ name = CSTRING(pressurizedAndRadShieldArea_shieldingValue_option5); value = 5; };
            };
        };

        class checkTime : Edit
        {
            property = QUOTE(exterra_extraterra_modules_pressurizedAndRadShieldArea_checkTime);
            displayName = CSTRING(pressurizedAndRadShieldArea_checkTime_displayName);
            tooltip = CSTRING(pressurizedAndRadShieldArea_checkTime_tooltip);
            typeName = QUOTE(NUMBER);
            defaultValue = QUOTE(0.5);

        };

        class ModuleDescription : ModuleDescription {}; //
    };

    class ModuleDescription : ModuleDescription
    {
        description = CSTRING(pressurizedAndRadShieldArea_main_desc);
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
