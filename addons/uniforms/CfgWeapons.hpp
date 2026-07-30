class CfgWeapons
{
	class ItemCore;
    class HeadgearItem;
	class UniformItem;
	class Uniform_Base;
    class Binocular;
    class NVGoggles: Binocular {};

    class Vest_Camo_Base : ItemCore
	{
		class ItemInfo;
	};

    class exterra_uniforms_integrated_NVG_TI_0: NVGoggles
	{
		scope = 1;
		visionMode[] = {"Normal","NVG","TI"};
		thermalMode[] = {0};
		modelOptics = "";
        ace_nightvision_colorPreset[] = {0.0, {0.0, 0.0, 0.0, 0.0}, {1.1, 0.8, 1.9, 0.9}, {1, 1, 6, 0.0}}; // White Phosphor Preset. Note: Doesn't work
        ace_nightvision_generation = 6;
	};

	class exterra_uniforms_usUndersuit: Uniform_Base
	{
		scope=2;
        scopeArsenal=2;
        author = AUTHOR;
		displayName = CSTRING(usUndersuit_displayName);
        descriptionShort = CSTRING(usUndersuit_descShort);
        picture = QPATHTOF(data\uniforms\us\undersuit\icon_exterra_uniforms_usUndersuit_ca.paa);
		model = QUOTE(\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver); // Always use a suitpack for this portion correct model is inherited below.

        exterra_uniforms_suitMobility = 0.8;
        exterra_uniforms_blackBodyEmmissive = 0.75;
        exterra_uniforms_solarAbsorptance = 0.2;
        exterra_uniforms_suitThickness = 0.003; // In metres

		class ItemInfo: UniformItem
		{
			uniformModel = "-"; // we inherit this from CfgVehicles
			uniforMClass = QGVAR(usUndersuit); // this will be the class in line 24
			containerClass = QUOTE(Supply100); // how much can you store in your uniform
			mass = 5; //how much will the uniform weigh
			uniformType = QUOTE(Neopren); // always use this uniform type
		};
	};

    class exterra_uniforms_usBDU0: Uniform_Base
	{
		scope = 2;
        scopeArsenal = 2;
        author = AUTHOR;
        displayName = CSTRING(usBDU0_displayName);
        descriptionShort = CSTRING(usBDU0_descShort);
        picture = QPATHTOF(data\uniforms\us\bdu0\icon_exterra_uniforms_usBDU0_ca.paa);
		model = QUOTE(\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver); // Always use a suitpack for this portion correct model is inherited below.

        exterra_uniforms_suitMobility = 0.8;
        exterra_uniforms_blackBodyEmmissive = 0.85;
        exterra_uniforms_solarAbsorptance = 0.6;
        exterra_uniforms_suitThickness = 0.008; // In metres

		class ItemInfo: UniformItem
		{
			uniformModel = "-";// we inherit this from CfgVehicles
			uniforMClass = QGVAR(usBDU0); // this will be the class in line 24
			containerClass = QUOTE(Supply100); // how much can you store in your uniform
			mass = 5; //how much will the uniform weigh
			uniformType = QUOTE(Neopren); // always use this uniform type
		};
	};

    class exterra_uniforms_usHelmet0: ItemCore
	{
		author = AUTHOR;
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = CSTRING(usHelmet0_displayName);
        descriptionShort = CSTRING(usHelmet0_descShort);
        picture = QPATHTOF(data\uniforms\us\helmet0\icon_exterra_uniforms_usHelmet0_grey_ca.paa);
        model = QPATHTOF(data\uniforms\us\helmet0\exterra_uniforms_usHelmet0.p3d);
		hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { "z\exterra\addons\uniforms\data\uniforms\us\helmet0\textures\exterra_uniforms_usHelmet0_main_co.paa" };
        //hiddenSelectionsMaterials[] = { "z\exterra\addons\uniforms\data\uniforms\us\helmet0\textures\exterra_uniforms_usHelmet0_main.rvmat" }; // Note: This caused a bug for some reason. Check if you ever use this in future
        subItems[] = {"exterra_uniforms_integrated_NVG_TI_0"};

        ace_hearing_protection = 1;
        ace_hearing_lowerVolume = 0.05;
        ace_hearing_hasEHP = 1;
        exterra_uniforms_passiveAirReserve = 400; // Note: Not currently used. Will remove

        exterra_uniforms_vomitVariants[] = { QGVAR(usHelmet0_vomit_l),QGVAR(usHelmet0_vomit_m),QGVAR(usHelmet0_vomit_s) };

		class ItemInfo : HeadgearItem
		{
			mass = 38.36;
            uniformModel = QPATHTOF(data\uniforms\us\helmet0\exterra_uniforms_usHelmet0.p3d);
			modelSides[] = { 0, 3 };
			hiddenSelections[] = { "camo" };

			// if defined, this headgear item gains functionality (visual modes) of given NVG item and will occupy its slot as well.
			// Currently works only for Headgear + NVG + Radio item combinations.

			class HitpointsProtectionInfo // more info at: https://community.bistudio.com/wiki/Arma_3:_Soldier_Protection
			{
				class Head
				{
					hitPointName = QUOTE(HitHead);
					armor = 6;
					passThrough = 0.5;
				};
                class Face
				{
					hitpointName = QUOTE(HitFace);
					armor = 7;
					passThrough = 0.5;
				};
			};
        };
	};
    class exterra_uniforms_usHelmet0_vomit_l: exterra_uniforms_usHelmet0 {
        scope = 1;
        exterra_uniforms_vomitSeverity = 1;
        exterra_uniforms_baseVariant = QGVAR(usHelmet0);
    };
    class exterra_uniforms_usHelmet0_vomit_m: exterra_uniforms_usHelmet0_vomit_l {
        exterra_uniforms_vomitSeverity = 2;
    };
    class exterra_uniforms_usHelmet0_vomit_s: exterra_uniforms_usHelmet0_vomit_l {
        exterra_uniforms_vomitSeverity = 3;
    };
    class exterra_uniforms_usHelmet0_camo: exterra_uniforms_usHelmet0 {
        displayName = CSTRING(usHelmet0_camo_displayName);
        picture = QPATHTOF(data\uniforms\us\helmet0\icon_exterra_uniforms_usHelmet0_lcp_ca.paa);
        hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { "z\exterra\addons\uniforms\data\uniforms\us\helmet0\textures\exterra_uniforms_usHelmet0_camo_main_co.paa" };

        exterra_uniforms_vomitVariants[] = { QGVAR(usHelmet0_camo_vomit_l),QGVAR(usHelmet0_camo_vomit_m),QGVAR(usHelmet0_camo_vomit_s) };
    };
    class exterra_uniforms_usHelmet0_camo_vomit_l: exterra_uniforms_usHelmet0_camo {
        scope = 1;
        exterra_uniforms_vomitSeverity = 1;
        exterra_uniforms_baseVariant = QGVAR(usHelmet0_camo);
    };
    class exterra_uniforms_usHelmet0_camo_vomit_m: exterra_uniforms_usHelmet0_camo_vomit_l {
        exterra_uniforms_vomitSeverity = 2;
    };
    class exterra_uniforms_usHelmet0_camo_vomit_s: exterra_uniforms_usHelmet0_camo_vomit_l {
        exterra_uniforms_vomitSeverity = 3;
    };

    // change this to proper base class
    class GVAR(usVestClean): Vest_Camo_Base
	{
		author = AUTHOR;
		scope = 2;
        displayName = "test vest";
        picture = QPATHTOF(data\uniforms\us\vest0\icon_exterra_uniforms_usVestClean_ca.paa);
		model = QPATHTOF(data\uniforms\us\vest0\exterra_uniforms_usVestClean.p3d);
		hiddenSelections[] = { "camo" };
        hiddenSelectionsTextures[] = { "z\exterra\addons\uniforms\data\uniforms\us\vest0\textures\exterra_uniforms_usVestClean_co.paa" };
		class ItemInfo : ItemInfo
		{
			uniformModel = QPATHTOF(data\uniforms\us\vest0\exterra_uniforms_usVestClean.p3d);
			containerClass = "Supply0";
			mass = 10;

			class HitpointsProtectionInfo // more info at: https://community.bistudio.com/wiki/Arma_3:_Soldier_Protection
			{
				class Chest
				{
                    hitPointName = "HitChest";
                    armor = 22; // Note: Vanilla blufor carrier rig has an armour value of 20
                    passThrough = 0.2;
				};
                class Diaphragm
				{
					HitpointName = "HitDiaphragm";
					armor = 22;
					PassThrough = 0.2;
				};
                class Abdomen
				{
					hitpointName = "HitAbdomen";
					armor = 22;
					passThrough = 0.2;
				};
                class Body
				{
                    hitPointName = "HitBody";
                    passThrough = 0.2;
				};
			};
		};
	};
};
