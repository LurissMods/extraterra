class CfgWeapons {
	class ItemCore;
	class InventoryMuzzleItem_Base_F;

	class exterra_sounds_vacuumMuzzle : ItemCore
	{

		author = AUTHOR;
        _generalMacro = QGVAR(vacuumMuzzle);
        displayName = CSTRING(vacuumMuzzle_displayName);
        picture = QPATHTOF(data\data\textures\exterra_sounds_vacuumMuzzle_ca.paa);
        model = "";

        scope = 2; // Normally is 1, 2 for debugging
        inertia = 0.0; // Note: not yet tested at 0

        htMin = 1;
		htMax = 600;
		afMax = 0;
		mfMax = 0;
		mFact = 1;
		tBody = 100;

		class ItemInfo: InventoryMuzzleItem_Base_F
        {
            mass = 0;
            soundTypeIndex = 1; // defines the position in sound[] array in the rifle
            muzzleEnd = "zaslehPoint"; // memory point in muzzle supressor's model
			alternativeFire = "Zasleh2"; // class in cfgWeapons with model of muzzle flash

			class MagazineCoef
			{
				initSpeed = 1;
			};

			class AmmoCoef
			{
				// Bullet ballistic modifiers
				hit	= 1;
				typicalSpeed = 1;
				airFriction	= 0;

				// AI modifiers
				visibleFire	= 0.001;
				audibleFire	= 0.001; // NEVER EVER TOUCH THIS! If set to 0 it'll cause a desync bug between players
				visibleFireTime	= 1;
				audibleFireTime	= 1;
				cost = 1;
			};

			class MuzzleCoef
			{
                dispersionCoef = "1.0f";
				artilleryDispersionCoef = "1.0f";
				fireLightCoef = "0.0f";
				recoilCoef = "1.0f";
				recoilProneCoef = "1.0f";
				minRangeCoef = "1.0f";
				minRangeProbabCoef = "1.0f";
				midRangeCoef = "1.0f";
				midRangeProbabCoef = "1.0f";
				maxRangeCoef = "1.0f";
				maxRangeProbabCoef = "1.0f";
			};
        };
	};
};
