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

    class GVAR(base) : Module_F {
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

    #include "mod_enableExterra.hpp"
    #include "mod_pressurizedAndRadShieldArea.hpp"
    #include "mod_solarStorm.hpp"
    //#include "backgroundRadiation.hpp"
};
