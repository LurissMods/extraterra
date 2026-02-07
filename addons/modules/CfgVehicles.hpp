class CfgVehicles
{
	class Logic;
	class Module_F : Logic
	{
		class AttributesBase
		{
			//class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class Combo;				// Default combo box (i.e. drop-down menu)
			//class Checkbox;				// Default checkbox (returned value is Boolean)
			//class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			//class Units;				// Selection of units on which the module is applied
		};

		// Description base classes (for more information see below):
		class ModuleDescription
		{
			//class AnyBrain;
		};
	};

    class exterra_modules_base : Module_F {
        displayName = "Undefined! You probably forgot to overwite base class.";
        category = "";
        function = "";
        //icon = "";                        // Map icon. Delete this entry to use the default icon.
        scope = 1;
        scopeCurator = 2;                   // 2 = show to zeus, 1 = hide from zeus.
        functionPriority = 1;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 0;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 0;				// 1 for module waiting until all synced triggers are activated
		isDisposable = 0;					// 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation will not work)
		is3DEN = 0;							// 1 to run init function in Eden Editor as well
		curatorCanAttach = 0;				// 1 to allow Zeus to attach the module to an entity
		curatorInfoType = "";               // Menu displayed when the module is placed or double-clicked on by Zeus

        canSetArea = 0;						// Allows for setting the area values in the Attributes menu in 3DEN
		canSetAreaShape = 0;				// Allows for setting "Rectangle" or "Ellipse" in Attributes menu in 3DEN
		canSetAreaHeight = 0;				// Allows for setting height or Z value in Attributes menu in 3DEN
		class AttributeValues
		{
			// This section allows you to set the default values for the attributes menu in 3DEN
			size3[] = { 0, 0, 0 };		// 3D size (x-axis radius, y-axis radius, z-axis radius)
			isRectangle = 0;				// Sets if the default shape should be a rectangle or ellipse
		};

        class Attributes : AttributesBase {};
        class ModuleDescription : ModuleDescription {};

    };

    class exterra_extraterra_modules_lifeSupportMainLoop : exterra_modules_base
	{
		displayName = CSTRING(lifeSupportMainLoop_main_displayName);				// Name displayed in the menu
		//icon = "";	// Map icon. Delete this entry to use the default icon.
		category = QGVAR(lifeSupportCategory);
		function = QFUNC(lifeSupportMainLoop);	// Name of function triggered once conditions are met
        scope = 2;
        scopeCurator = 1;

		// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
		class Attributes : AttributesBase
		{
			// Module-specific arguments:
			class checkTime : Edit
			{
				property = QUOTE(exterra_extraterra_modules_lifeSupportMainLoop_checkTime);				// Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
				displayName = CSTRING(lifeSupportMainLoop_checkTime_displayName);			// Argument label
				tooltip = CSTRING(lifeSupportMainLoop_checkTime_tooltip);	// Tooltip description
				typeName = QUOTE(NUMBER);							// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = QUOTE(0.5);							// Default attribute value. Warning: this is an expression, and its returned value will be used (50 in this case).

			};

			class ModuleDescription : ModuleDescription {}; // Module description should be shown last
		};

		// Module description (must inherit from base class, otherwise pre-defined entities won't be available)
		class ModuleDescription : ModuleDescription
		{
			description = CSTRING(lifeSupportMainLoop_main_desc);	// Short description, will be formatted as structured text
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

	class exterra_extraterra_modules_pressurizedAndRadShieldArea : exterra_modules_base
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

	class exterra_extraterra_modules_noSolarStorm : exterra_modules_base
	{
		displayName = CSTRING(noSolarStorm_main_displayName);
		//icon = "";
		category = QGVAR(lifeSupportCategory);
		function = QFUNC(noSolarStorm);
        scope = 2;
        scopeCurator = 1;
		functionPriority = 5;
        isTriggerActivated = 1;
		isDisposable = 1;


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

    class exterra_extraterra_modules_lightSolarStorm : exterra_extraterra_modules_noSolarStorm
	{
		displayName = CSTRING(lightSolarStorm_main_displayName);
		//icon = "";
		category = QGVAR(lifeSupportCategory);
		function = QFUNC(lightSolarStorm);

		class ModuleDescription : ModuleDescription
		{
            description = CSTRING(lightSolarStorm_main_desc);
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

    class exterra_extraterra_modules_moderateSolarStorm : exterra_extraterra_modules_noSolarStorm
	{
		displayName = CSTRING(moderateSolarStorm_main_displayName);
		//icon = "";
		category = QGVAR(lifeSupportCategory);
		function = QFUNC(moderateSolarStorm);

		class ModuleDescription : ModuleDescription
		{
            description = CSTRING(moderateSolarStorm_main_desc);
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

    class exterra_extraterra_modules_heavySolarStorm : exterra_extraterra_modules_noSolarStorm
	{
		displayName = CSTRING(heavySolarStorm_main_displayName);
		//icon = "";
		category = QGVAR(lifeSupportCategory);
		function = QFUNC(heavySolarStorm);

		class ModuleDescription : ModuleDescription
		{
            description = CSTRING(heavySolarStorm_main_desc);
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
};
