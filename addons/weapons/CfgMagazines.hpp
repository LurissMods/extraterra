class CfgMagazines
{

	class Default;
	class CA_Magazine : Default {};

	//10x19mm
	class exterra_weapons_8rnd_10x19mmTJ : CA_Magazine
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
		author = "Luriss";
		scope = 2;
		displayName = "10x19mm TJ 8 Rnd";
		ammo = "exterra_weapons_10x19mmTeflon";
		count = 8;
		initSpeed = 380;
		tracersEvery = 1;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};
	class exterra_weapons_8rnd_10x19mmTJ_tracer : exterra_weapons_8rnd_10x19mmTJ
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
		author = "Luriss";
		scope = 2;
		displayName = "10x19mm TJ-T 8 Rnd";
		ammo = "exterra_weapons_10x19mmTeflonTracer";
		count = 8;
		initSpeed = 380;
		tracersEvery = 1;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};

	//9x19mm
	class exterra_weapons_17rnd_9x19mmTJ : CA_Magazine
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
		author = "Luriss";
		scope = 2;
		displayName = "9x19mm TJ 17 Rnd";
		ammo = "exterra_weapons_9x19mmTeflon";
		count = 17;
		initSpeed = 385;
		tracersEvery = 1;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};
	class exterra_weapons_17rnd_9x19mmTJ_tracer : exterra_weapons_17rnd_9x19mmTJ
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
		author = "Luriss";
		scope = 2;
		displayName = "9x19mm TJ-T 17 Rnd";
		ammo = "exterra_weapons_9x19mmTeflonTracer";
		count = 17;
		initSpeed = 385;
		tracersEvery = 1;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};
	class exterra_weapons_17rnd_twoWorldWars : exterra_weapons_17rnd_9x19mmTJ
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
		author = "Luriss";
		scope = 2;
		displayName = "TWO WORLD WARS";
		ammo = "exterra_weapons_twoWorldWars";
		count = 17;
		initSpeed = 385;
		tracersEvery = 1;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};

	//5.56x55mm
	class exterra_weapons_30rnd_5p56x55mmTJ : CA_Magazine
	{
		picture = "\z\exterra\addons\weapons\magazines\5p56Mag0\icon_exterra_weapons_5p56Mag0_ca.paa";
		author = "Luriss";
		scope = 2;
		displayName = "5.56x55mm TJ 30 Rnd";
		modelSpecial = "z\exterra\addons\weapons\magazines\5p56Mag0\exterra_weapons_5p56Mag0.p3d";
		modelSpecialIsProxy = 1;
		ammo = "exterra_weapons_5p56x55mmTeflon";
		count = 30;
		mass = 12.3;
		initSpeed = 1348;
		tracersEvery = 1;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};
	class exterra_weapons_30rnd_5p56x55mmTJ_tracer : exterra_weapons_30rnd_5p56x55mmTJ
	{
		displayName = "5.56x55mm TJ-T 30 Rnd";
		ammo = "exterra_weapons_5p56x55mmTeflonTracer";
		count = 30;
		mass = 12.3;
		initSpeed = 1348;
		tracersEvery = 1;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};

	//6.8x51mm
	class exterra_weapons_50rnd_6p8x51mmTJ_TE4 : CA_Magazine
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
		author = "Luriss";
		scope = 2;
		displayName = "6.8x51mm TJ 50 Rnd Pouch (TE4)";
		ammo = "exterra_weapons_6p8x51mmTeflonTracer";
		count = 50;
		initSpeed = 980;
		tracersEvery = 4;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};
	class exterra_weapons_50rnd_6p8x51mmTJ_TE1 : exterra_weapons_50rnd_6p8x51mmTJ_TE4
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
		author = "Luriss";
		scope = 2;
		displayName = "6.8x51mm TJ 50 Rnd Pouch (TE1)";
		ammo = "exterra_weapons_6p8x51mmTeflonTracer";
		count = 50;
		initSpeed = 980;
		tracersEvery = 1;
		lastRoundsTracer = 0;
		descriptionShort = "";
	};
};
