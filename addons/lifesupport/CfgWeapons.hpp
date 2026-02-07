class CfgWeapons
{
	class Rifle;
	class Rifle_Base_F : Rifle
	{
		class WeaponSlotsInfo;
		class GunParticles;
	};

	class exterra_lifesupport_compatAirTanksUS : Rifle_Base_F
	{
		author = "Luriss";
		_generalMacro = "exterra_lifesupport_compatAirTanksUS";
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
    class exterra_lifesupport_compatBatteriesUS : exterra_lifesupport_compatAirTanksUS
	{
		_generalMacro = "exterra_lifesupport_compatBatteriesUS";
		displayName = "US battery compat. If you're reading this something broke.";
		magazineWell[] = { "exterra_lifesupport_magwell_usBatteries" };
    };
};
