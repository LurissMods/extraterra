class CfgWeapons
{
	class ItemCore;
    class HeadgearItem;
	class UniformItem;
	class Uniform_Base;
    class Binocular;
    class NVGoggles: Binocular {};

    class exterra_uniforms_integrated_NVG_TI_0: NVGoggles
	{
		scope = 1;
		visionMode[] = {"Normal","NVG","TI"};
		thermalMode[] = {0};
		modelOptics = "";
        ace_nightvision_colorPreset[] = {0.0, {0.0, 0.0, 0.0, 0.0}, {1.1, 0.8, 1.9, 0.9}, {1, 1, 6, 0.0}}; // White Phosphor Preset
        ace_nightvision_generation = 6;
	};

	class exterra_uniforms_usUndersuit: Uniform_Base
	{
		scope=2;// explaned in CfgVehicles Above
		picture = "\z\exterra\addons\uniforms\data\uniforms\us\undersuit\icon_exterra_uniforms_usUndersuit_ca.paa";
		scopeArsenal=2;
		author="Luriss";// explaned in CfgVehicles Above
		displayName="Lunar Combat Suit"; // self explanatory
		model="\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver"; // Always use a suitpack for this portion correct model is inherited below.

        exterra_uniforms_suitMobility = 0.7;
        exterra_uniforms_blackBodyEmmissive = 0.75;
        exterra_uniforms_solarAbsorptance = 0.2;
        exterra_uniforms_suitThickness = 0.003; // In metres

		class ItemInfo: UniformItem
		{
			uniformModel="-";// we inherit this from CfgVehicles
			uniforMClass="exterra_uniforms_usUndersuit";// this will be the class in line 24
			containerClass="Supply100"; // how much can you store in ur uniform
			mass=5;//how much will the uniform weigh
			uniformType="Neopren"; // always use this uniform type
		};
	};

    class exterra_uniforms_usBDU0: Uniform_Base
	{
		scope=2;// explaned in CfgVehicles Above
		picture = "\z\exterra\addons\uniforms\data\uniforms\us\bdu0\icon_exterra_uniforms_usBDU0_ca.paa";
		scopeArsenal=2;
		author="Luriss";// explaned in CfgVehicles Above
		displayName="Lunar Combat Uniform"; // self explanatory
		model="\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver"; // Always use a suitpack for this portion correct model is inherited below.

        exterra_uniforms_suitMobility = 0.7;
        exterra_uniforms_blackBodyEmmissive = 0.85;
        exterra_uniforms_solarAbsorptance = 0.6;
        exterra_uniforms_suitThickness = 0.008; // In metres

		class ItemInfo: UniformItem
		{
			uniformModel="-";// we inherit this from CfgVehicles
			uniforMClass="exterra_uniforms_usBDU0";// this will be the class in line 24
			containerClass="Supply100"; // how much can you store in ur uniform
			mass=5;//how much will the uniform weigh
			uniformType="Neopren"; // always use this uniform type
		};
	};

    class exterra_uniforms_usHelmet0: ItemCore
	{
		author = "Luriss";
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "Space Combat Helmet (Grey)";
		picture = "\z\exterra\addons\uniforms\data\uniforms\us\helmet0\icon_exterra_uniforms_usHelmet0_grey_ca.paa";
		model="z\exterra\addons\uniforms\data\uniforms\us\helmet0\exterra_uniforms_usHelmet0.p3d";
		hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { "z\exterra\addons\uniforms\data\uniforms\us\helmet0\textures\exterra_uniforms_usHelmet0_main_co.paa" };
        subItems[] = {"exterra_uniforms_integrated_NVG_TI_0"};

        ace_hearing_protection = 1;
        ace_hearing_lowerVolume = 0.05;
        ace_hearing_hasEHP = 1;
        exterra_uniforms_passiveAirReserve = 1000;

		class ItemInfo : HeadgearItem
		{
			mass = 38.36;
			uniformModel = "z\exterra\addons\uniforms\data\uniforms\us\helmet0\exterra_uniforms_usHelmet0.p3d";
			modelSides[] = { 0, 3 };
			hiddenSelections[] = { "camo" };

			// if defined, this headgear item gains functionality (visual modes) of given NVG item and will occupy its slot as well.
			// Currently works only for Headgear + NVG + Radio item combinations.

			class HitpointsProtectionInfo // more info at: https://community.bistudio.com/wiki/Arma_3:_Soldier_Protection
			{
				class Head
				{
					hitPointName = "HitHead";
					armor = 6;
					passThrough = 0.5;
				};
                class Face
				{
					hitpointName = "HitFace";
					armor = 7;
					passThrough = 0.5;
				};
			};
        };
	};
    class exterra_uniforms_usHelmet0_camo: exterra_uniforms_usHelmet0 {
        displayName = "Space Combat Helmet (LCP)";
        picture = "\z\exterra\addons\uniforms\data\uniforms\us\helmet0\icon_exterra_uniforms_usHelmet0_lcp_ca.paa";
        hiddenSelections[] = { "camo" };
		hiddenSelectionsTextures[] = { "z\exterra\addons\uniforms\data\uniforms\us\helmet0\textures\exterra_uniforms_usHelmet0_camo_main_co.paa" };
    };
};
