class Mode_SemiAuto;
class CfgWeapons {
	class ItemCore;
    class muzzle_snds_H;
	class InventoryMuzzleItem_Base_F;

	class exterra_sounds_vacuumMuzzle : muzzle_snds_H
	{
		scope = 2; // Normally is 1, 2 for debugging
		displayName= "DO NOT REMOVE. WILL BREAK GUN VACUUM SOUNDS.";
		//picture="\A3\weapons_F\Data\UI\gear_acca_snds_h_CA.paa";
        picture="\z\exterra\addons\sounds\data\data\textures\exterra_sounds_vacuumMuzzle_ca.paa";
		//model = "\z\exterra\addons\sounds\data\data\exterra_sounds_vacuumMuzzle.p3d";
		model = "\A3\weapons_f\acc\acca_snds_h_F";
        inertia = 1;

		class ItemInfo: InventoryMuzzleItem_Base_F
        {
            mass = 1;
            soundTypeIndex = 1; /// defines the position in sound[] array in the rifle

			class MagazineCoef
			{
				initSpeed 		= 1;
			};

			class AmmoCoef
			{
				// bullet ballistic modifiers
				hit	= 1;
				typicalSpeed = 1;
				airFriction	= 1;

				// AI modifiers
				visibleFire	= 1;
				audibleFire	= 1;
				visibleFireTime	= 1;
				audibleFireTime	= 1;
				cost = 1;
			};

            muzzleEnd = "zaslehPoint"; // memory point in muzzle supressor's model
			alternativeFire = "Zasleh2"; // class in cfgWeapons with model of muzzle flash

			class MuzzleCoef
			{
				dispersionCoef = 1;
				artilleryDispersionCoef	= 1;

				fireLightCoef = 1;

				recoilCoef = 1;
				recoilProneCoef = 1;

				minRangeCoef = 1;
                minRangeProbabCoef = 1;
				midRangeCoef = 1;
                midRangeProbabCoef = 1;
				maxRangeCoef = 1;
                maxRangeProbabCoef = 1;
			};
        };
	};
};
