class CfgWeapons
{
    //class ItemCore;
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    //class InventoryItem_Base_F;
	class Rifle;
	class Rifle_Base_F : Rifle
	{
		//class WeaponSlotsInfo;
		//class GunParticles;
	};

    class GVAR(consumeable_dummyBase): ACE_ItemCore {
        scope = 1;
        author = AUTHOR;
        model = "";
        picture = "";
        displayName = "Error: consumeable_dummyBase wrong scope";
        descriptionShort = "";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
    class GVAR(airTankUS_patrol0_dummy): GVAR(consumeable_dummyBase) {
        model = QPATHTOF(items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d);
        picture = "";
        displayName = CSTRING(airTankUS_patrol0_dummy);
        descriptionShort = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 302.0333;
        };
    };
    class GVAR(airTankUS_combat0_dummy): GVAR(consumeable_dummyBase) {
        model = QPATHTOF(items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d);
        picture = "";
        displayName = CSTRING(airTankUS_combat0_dummy);
        descriptionShort = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 85.9803;
        };
    };

    class GVAR(batteryUS_dummy): ACE_ItemCore {
        scope = 1;
        author = AUTHOR;
        model = QPATHTOF(items\us\airTanks\placeholder\exterra_lifesupport_airTankUS.p3d);
        picture = "";
        displayName = CSTRING(batteryUS_dummy);
        descriptionShort = "";
        descriptionUse = "";
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 154.324;
        };
    };

	class GVAR(airTankDummyWeapon_US) : Rifle_Base_F
	{
		author = "Luriss";
		_generalMacro = QGVAR(airTankDummyWeapon_US);
		scope = 1;
		model = "";
		displayName = "US Air Tank compat. If you're reading this something broke.";
		descriptionShort = "";
		picture = "";
		UIPicture = "";
		handAnim[] = { "OFP2_ManSkeleton","" };
		overviewPicture = "";
		magazines[] = { "" };
		magazineWell[] = { "exterra_lifesupport_magwell_usAirTanks" };
		reloadAction = "";
		recoil = "";
		inertia = 1;
		aimTransitionSpeed = 1;
		magazineReloadSwitchPhase = 1;
		cursor = "mg";
    };
    class GVAR(batteryDummyWeapon_US) : GVAR(airTankDummyWeapon_US)
	{
		_generalMacro = QGVAR(batteryDummyWeapon_US);
		displayName = "US battery compat. If you're reading this something broke.";
		magazineWell[] = { "exterra_lifesupport_magwell_usBatteries" };
    };
};
