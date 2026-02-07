class CfgWeapons {
	class ItemCore;
	class InventoryMuzzleItem_Base_F;

	class exterra_vacuumMuzzle: ItemCore
	{
		scope = 2; // Normally is 1, 2 for debugging
		displayName= "DO NOT REMOVE. WILL BREAK GUN SOUNDS.";
		//picture="\A3\weapons_F\Data\UI\gear_acca_snds_h_CA.paa";
        picture="\z\exterra\addons\weapons\sounds\textures\exterra_vacMuzzle_ca.paa";
		model = "";
		class ItemInfo: InventoryMuzzleItem_Base_F
        {
            mass = 0;
			class MagazineCoef
			{
				initSpeed 		= 1;
			};

			class AmmoCoef
			{
				// bullet ballistic modifiers
				hit				= 1;
				typicalSpeed	= 1;
				airFriction		= 0;

				// AI modifiers
				visibleFire		= 0;
				audibleFire		= 0;
				visibleFireTime	= 0;
				audibleFireTime	= 0;
				cost			= 1;
			};

			muzzleEnd 			= ""; // memory point in muzzle supressor's model
			alternativeFire 	= "";  // class in cfgWeapons with model of muzzle flash

			soundTypeIndex		= 1; /// defines the position in sound[] array in the rifle

			class MuzzleCoef
			{
				dispersionCoef			= 1;
				artilleryDispersionCoef	= 1;

				fireLightCoef			= 0;

				recoilCoef				= 1;
				recoilProneCoef			= 1;

				minRangeCoef = 1; minRangeProbabCoef = 1;
				midRangeCoef = 1; midRangeProbabCoef = 1;
				maxRangeCoef = 1; maxRangeProbabCoef = 1;
			};
        };
	};
};
