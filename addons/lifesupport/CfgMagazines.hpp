class CfgMagazines
{
    /*class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class exterra_lifesupport_airTankUS: ACE_ItemCore
    {
        author = "Luriss";
        displayname = "placeholder air tank";
        descriptionShort = "air tank for testing";
        picture = "";
        model = "z\exterra\addons\lifesupport\items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d";
        scope = 2;
        //hiddenSelections[] = {"camo"};
        //hiddenSelectionsTextures[] = {QPATHTOF(data\spraycanBlack_co.paa)};
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };*/
    class Default;
	class CA_Magazine : Default {};

    class exterra_lifesupport_consumeableBase : CA_Magazine
    {
        picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
        model = "z\exterra\addons\lifesupport\items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d";
        descriptionShort = "";
        ammo = "";
		author = AUTHOR;
		scope = 1;
		displayname = "Error: consumeableBase wrong scope";

		count = 1; // in L
		initSpeed = 0;
		tracersEvery = 0;
		lastRoundsTracer = 0;
        ACE_isUnique = 1;
        mass = 10;

        exterra_airTank = NO_SUIT_FACTION;
        exterra_airTank_maxCapacity = 1; // magazinesAmmo function only returns current ammo. This stores the max capcity as a constant.
        exterra_equipedDummy = "";
    };

	class exterra_lifesupport_airTankUS_patrol0 : exterra_lifesupport_consumeableBase
	{

        // https://www.carbondive.com/en/single-cylinders/?&obid=675C3655000C00EF000966EE00000000
        // 10L carbon fibre tank. 630 Bar

		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
        model = "z\exterra\addons\lifesupport\items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d";
        descriptionShort = "";
		scope = 2;
		displayname = CSTRING(airTankUS_patrol0);
        mass = 302.0333;

        // To calculate capacity - Find the mol of oxygen in a pressurized tank. Then use that mol to find the volume of that mol at 1 atmosphere pressure. 21 celcius. (Ideal gas law).
        // https://www.lpi.usra.edu/lunar/artemis/NASA-EMU-Data-Book-JSC-E-DAA-TN55224.pdf      Page 166
		count = 6218*REBREATHER_EFFICIENCY_US; // in L

        exterra_airTank = US_SUIT_FACTION;
        exterra_airTank_maxCapacity = 6218*REBREATHER_EFFICIENCY_US; // magazinesAmmo function only returns current ammo. This stores the max capcity as a constant.
        exterra_equipedDummy = QGVAR(airTankUS_patrol0_dummy);
	};
    class exterra_lifesupport_airTankUS_combat0 : exterra_lifesupport_consumeableBase
	{

        // https://www.carbondive.com/en/single-cylinders/?&obid=5315EB1B000EE944000043D500000000
        // 3L carbon fibre tank. 630 Bar. 2.76 kg empty. 3.9 kg half full

		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
        model = "z\exterra\addons\lifesupport\items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d";
        descriptionShort = "";
		scope = 2;
		displayname = CSTRING(airTankUS_combat0);
        mass = 85.9803;

		count = 1865*REBREATHER_EFFICIENCY_US; // in L

        exterra_airTank = US_SUIT_FACTION;
        exterra_airTank_maxCapacity = 1865*REBREATHER_EFFICIENCY_US; // magazinesAmmo function only returns current ammo. This stores the max capcity as a constant.
        exterra_equipedDummy = QGVAR(airTankUS_combat0_dummy);
	};

    class exterra_lifesupport_batteryUS : CA_Magazine
	{
        /*
        * Note: I'm fudging this number for now. Basically the EMU used a 7kg 26.6 amp hour battery.
        *       Given the EMU is from the early 80s I'm guessing that was a lead acid battery or similar.
        *       Modern lithium batteries of a similar weight range between 30 - 50 amp hours depending on power output
        *       (https://www.austars-model.com/okcell-14s-518v-30ah-30000mah-7kg-drone-battery-for-industrial-and-agriculture-drone_g25993.html)
        *       (https://itechworld.com.au/products/itech054-12v-54ah-lithium-ion-battery-lifepo4-deep-cycle-recycle-camping-rv-solar-slim-line)
        *       For now I'll just pull a number out of my arse an assume a ~33% increase in battery capacity by 2100. So 40 Ah * 1.33 = About 55 Ah
        */
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
        model = "z\exterra\addons\lifesupport\items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d";
		author = "Luriss";
		scope = 2;
		displayname = CSTRING(batteryUS);
		ammo = "";
		count = 198000; // in Amp seconds (amp hours * 3600).
		initSpeed = 0;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "";
        //ACE_asItem = 1;
        ACE_isUnique = 1;
        mass = 154.324;

        exterra_battery = US_SUIT_FACTION;
        exterra_battery_maxCapacity = 198000; // magazinesAmmo function only returns current ammo. This stores the max capcity as a constant.
        exterra_equipedDummy = QGVAR(batteryUS_dummy);
	};
};
