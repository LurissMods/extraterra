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

	class exterra_lifesupport_airTankUS : CA_Magazine
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
        model = "z\exterra\addons\lifesupport\items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d";
		author = "Luriss";
		scope = 2;
		displayname = "placeholder air tank";
		ammo = "";
		count = 800000; // in mL. 240 cu in, 900 psi, 22 C.  REMEMBER! It's stored at 900 psi but breathed at 0.3 atm. Enter the 0.3 atm value here, not the 900 psi one.
        // https://www.lpi.usra.edu/lunar/artemis/NASA-EMU-Data-Book-JSC-E-DAA-TN55224.pdf      Page 166
		initSpeed = 0;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "";
        //ACE_asItem = 1;
        ACE_isUnique = 1;

        exterra_airTank = US_SUIT_FACTION + FACTION_OFFSET;
	};
    class exterra_lifesupport_batteryUS : CA_Magazine
	{
		picture = "\a3\Weapons_F\MagazineProxies\data\UI\icon_30Rnd_556x45_Stanag_CA.paa";
        model = "z\exterra\addons\lifesupport\items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d";
		author = "Luriss";
		scope = 2;
		displayname = "placeholder battery";
		ammo = "";
		count = 144000;
		initSpeed = 0;
		tracersEvery = 0;
		lastRoundsTracer = 0;
		descriptionShort = "";
        //ACE_asItem = 1;
        ACE_isUnique = 1;

        exterra_battery = US_SUIT_FACTION + FACTION_OFFSET;
	};
};
