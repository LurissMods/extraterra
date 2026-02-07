class Mode_SemiAuto;
//class Mode_Burst;
class Mode_FullAuto;
//class SlotInfo;
class MuzzleSlot;
//class CowsSlot;
//class PointerSlot;
//class UnderBarrelSlot;
class CowsSlot_Rail;
//class CowsSlot_Rail_Pistol;
//class CowsSlot_Pistol;
//class CowsSlot_MSBS65;
//class CowsSlot_Dovetail;
//class CowsSlot_Dovetail_RPG;
//class MuzzleSlot_45ACP;
/*class MuzzleSlot_9mm;
class MuzzleSlot_65;
class MuzzleSlot_65MG;
class MuzzleSlot_556;
class MuzzleSlot_762;
class MuzzleSlot_338;
class MuzzleSlot_93;
class MuzzleSlot_57;
class MuzzleSlot_58;
class MuzzleSlot_545R;
class MuzzleSlot_762R;*/
class UnderBarrelSlot_rail;
class PointerSlot_Rail;
//class PointerSlot_Pistol;
//class PointerSlot_Launcher;

class CfgWeapons
{
	class Rifle;
	class Rifle_Base_F : Rifle
	{
		class WeaponSlotsInfo;
		class GunParticles;
	};

	class exterra_m2Carbine_base : Rifle_Base_F
	{
		author = "Luriss";
		_generalMacro = "exterra_m2Carbine_base";
		//baseWeapon = "exterra_m2Carbine_baseWeapon";
		scope = 0;
		model = "\z\exterra\addons\weapons\weapons\m2Carbine\exterra_m2Carbine.p3d";
		displayName = "exterra_m2Carbine_base";
		descriptionShort = "";
		picture = "\z\exterra\addons\weapons\weapons\m2Carbine\icon_exterra_m2Carbine_ca.paa";
		UIPicture = "\A3\weapons_f\data\UI\icon_mg_CA.paa";
		handAnim[] = { "OFP2_ManSkeleton","\z\exterra\addons\weapons\weapons\m2Carbine\anims\exterra_m2Carbine_handAnim.rtm" };
        //handAnim[] = { "OFP2_ManSkeleton","\z\exterra\addons\weapons\weapons\m2Carbine\anims\exterra_m2Carbine_handAnimTest.rtm" };
		overviewPicture = "";
		hiddenSelections[] = { /*"camo1","camo2","camo3"*/ };
		//hiddenSelectionsTextures[] = { "\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_01_hex_CO.paa","\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_02_hex_CO.paa","\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_03_hex_CO.paa" };
		//hiddenSelectionsMaterials[] = { "\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_01_hex.rvmat","\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_02_hex.rvmat","\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_03_hex.rvmat" };
		magazines[] = { "exterra_weapons_30rnd_5p56x55mmTJ" };
		magazineWell[] = { "exterra_weapons_magwell_stanagUS" };
		reloadAction = "exterra_m2Carbine_reload";
		//reloadAction = "";
		recoil = "recoil_m2carbine";
		//recoil = "";
		discreteDistance[] = {200,600};
		discreteDistanceInitIndex = 0;
		inertia = 0.4;
		aimTransitionSpeed = 0.75;
		magazineReloadSwitchPhase = 0.5;
		cursor = "mg";

        exterra_huds_icon = "z\exterra\addons\huds\data\weaponIcons\US\english\exterra_m2CarbineEng_icon.paa";

		ace_overheating_mrbs = 3000; //Mean Rounds Between Stoppages (this will be scaled based on the barrel temp)
        ace_overheating_slowdownFactor = 1; //Slowdown Factor, reduces the velocity of the projectile (this will be scaled based on the barrel temp)
        ace_overheating_allowSwapBarrel = 1; // 1 to enable barrel swap. 0 to disable. Meant for machine guns where you can easily swap the barrel without dismantling the whole weapon.
        ace_overheating_dispersion = 0.75; //Dispersion Factor, increases the dispersion of the projectile (this will be scaled based on the barrel temp)
		ace_overheating_closedBolt = 1; // Closed bolt, can cook off from barrel heat.
        ace_overheating_barrelMass = 2; // Mass of the area heated by firing, not strictly just the barrel. Higher mass gives slower heat buildup and faster cooling. Default estimation is 55% of weapon weight in kg.

		ACE_barrelTwist = 300.99;// https://www.vcalc.com/wiki/miller-twist-rule
        ACE_barrelLength = 359.5; //Length of the barrel in millimeters
        ACE_arsenal_hide = 0; // 1 = hidden and 0 = shown
        ACE_twistDirection = 1; // Right handed is 1, Left is -1, none is 0
		ACE_railHeightAboveBore = 2.28; // Pretty sure this is in centimetres

		class GunParticles : GunParticles
		{
			class FirstEffect
			{
				effectName = "exterra_bullets_vaccumGunEffects";
				positionName = "Usti hlavne";
				directionName = "Konec hlavne";
			};
		};


		class WeaponSlotsInfo : WeaponSlotsInfo
		{
			mass = 55.5;
			class MuzzleSlot : MuzzleSlot
			{
				linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
				compatibleItems[] = {"exterra_vacuumMuzzle"};
				iconPosition[] = { 0.06,0.4 };
				iconScale = 0.15;
			};
			class CowsSlot : CowsSlot_Rail
			{
				iconPosition[] = { 0.57,0.28 };
				iconScale = 0.15;
			};
			class PointerSlot : PointerSlot_Rail
			{
				iconPosition[] = { 0.38,0.42 };
				iconScale = 0.2;
			};
			class UnderBarrelSlot : UnderBarrelSlot_rail
			{
				iconPosition[] = { 0.35,0.85 };
				iconScale = 0.3;
			};
		};
		class LinkedItems
		{
			/*class LinkedItemsUnder
			{
				slot = "UnderBarrelSlot";
				item = "bipod_02_F_hex";
			};*/
		};

		bullet1[] = { "A3\sounds_f\weapons\shells\5_56\metal_556_01",0.5011872,1,15 };
		bullet2[] = { "A3\sounds_f\weapons\shells\5_56\metal_556_02",0.5011872,1,15 };
		bullet3[] = { "A3\sounds_f\weapons\shells\5_56\metal_556_03",0.5011872,1,15 };
		bullet4[] = { "A3\sounds_f\weapons\shells\5_56\metal_556_04",0.5011872,1,15 };
		bullet5[] = { "A3\sounds_f\weapons\shells\5_56\dirt_556_01",0.39810717,1,15 };
		bullet6[] = { "A3\sounds_f\weapons\shells\5_56\dirt_556_02",0.39810717,1,15 };
		bullet7[] = { "A3\sounds_f\weapons\shells\5_56\dirt_556_03",0.39810717,1,15 };
		bullet8[] = { "A3\sounds_f\weapons\shells\5_56\dirt_556_04",0.39810717,1,15 };
		bullet9[] = { "A3\sounds_f\weapons\shells\5_56\grass_556_01",0.25118864,1,15 };
		bullet10[] = { "A3\sounds_f\weapons\shells\5_56\grass_556_02",0.25118864,1,15 };
		bullet11[] = { "A3\sounds_f\weapons\shells\5_56\grass_556_03",0.25118864,1,15 };
		bullet12[] = { "A3\sounds_f\weapons\shells\5_56\grass_556_04",0.25118864,1,15 };
		soundBullet[] = { "bullet1",0.083,"bullet2",0.083,"bullet3",0.083,"bullet4",0.083,"bullet5",0.083,"bullet6",0.083,"bullet7",0.083,"bullet8",0.083,"bullet9",0.083,"bullet10",0.083,"bullet11",0.083,"bullet12",0.083 };
		drySound[] = { "z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_dryFire.wss",0.4466836,1,10 };
		reloadMagazineSound[] = { "z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_reload.wss",1.0,1,10 };
		changeFiremodeSound[] = { "z\exterra\addons\weapons\sounds\m2Carbine\exterra_weaponSounds_m2carbine_fireSelect.wss",0.31622776,1,5 };
		modes[] = { "Semi","Auto","close","short","medium","far_optic1","far_optic2" };

		class Semi : Mode_SemiAuto
		{
			soundContinuous = 0;
			soundBurst = 0;
			sounds[] = {"StandardSound","SilencedSound"};
			class BaseSoundModeType;
			class StandardSound: BaseSoundModeType
			{
				soundSetShot[] = {"exterra_weaponSounds_m2Carbine_Shot_SoundSet","exterra_weaponSounds_m2Carbine_Tail_SoundSet","exterra_weaponSounds_m2Carbine_InteriorTail_SoundSet"};
			};
			class SilencedSound: BaseSoundModeType
			{
				soundSetShot[] = {"exterra_weaponSounds_m2Carbine_silencerShot_SoundSet","exterra_weaponSounds_m2Carbine_silencerTail_SoundSet","exterra_weaponSounds_m2Carbine_silencerInteriorTail_SoundSet"};
			};
			reloadTime = 0.075;
			dispersion = 0.000812; // Multiply MOA by 0.00029
			recoil = "recoil_single_m2carbine";
			recoilProne = "recoil_single_prone_m2carbine";
		};
		class Auto : Mode_FullAuto
		{
			soundContinuous = 0;
			soundBurst = 0;
			sounds[] = {"StandardSound","SilencedSound"};
			class BaseSoundModeType;
			class StandardSound: BaseSoundModeType
			{
				soundSetShot[] = {"exterra_weaponSounds_m2Carbine_Shot_SoundSet","exterra_weaponSounds_m2Carbine_Tail_SoundSet","exterra_weaponSounds_m2Carbine_InteriorTail_SoundSet"};
			};
			class SilencedSound: BaseSoundModeType
			{
				soundSetShot[] = {"exterra_weaponSounds_m2Carbine_silencerShot_SoundSet","exterra_weaponSounds_m2Carbine_silencerTail_SoundSet","exterra_weaponSounds_m2Carbine_silencerInteriorTail_SoundSet"};
			};
			reloadTime = 0.075;
			dispersion = 0.000812;
			recoil = "recoil_auto_m2carbine";
			recoilProne = "recoil_auto_prone_m2carbine";
		};

		class close : Auto
		{
			burst = 10;
			aiRateOfFire = 0.5;
			aiRateOfFireDistance = 25;
			minRange = 0;
			minRangeProbab = 0.05;
			midRange = 25;
			midRangeProbab = 0.7;
			maxRange = 50;
			maxRangeProbab = 0.04;
			showToPlayer = 0;
		};
		class short : close
		{
			burst = 4;
			aiRateOfFire = 1;
			aiRateOfFireDistance = 300;
			minRange = 50;
			minRangeProbab = 0.05;
			midRange = 300;
			midRangeProbab = 0.7;
			maxRange = 600;
			maxRangeProbab = 0.04;
		};
		class medium : Semi
		{
			burst = 2;
			aiRateOfFire = 2;
			aiRateOfFireDistance = 800;
			aiRateOfFireDispersion = 1;
			minRange = 600;
			minRangeProbab = 0.05;
			midRange = 800;
			midRangeProbab = 0.6;
			maxRange = 1000;
			maxRangeProbab = 0.1;
			showToPlayer = 0;
		};
		class far_optic1 : medium
		{
			requiredOpticType = 1;
			burst = 1;
			aiRateOfFire = 3;
			aiRateOfFireDistance = 1500;
			aiRateOfFireDispersion = 1;
			minRange = 1000;
			minRangeProbab = 0.04;
			midRange = 1500;
			midRangeProbab = 0.5;
			maxRange = 2000;
			maxRangeProbab = 0.01;
		};
		class far_optic2 : far_optic1
		{
			requiredOpticType = 2;
			autoFire = 0;
			burst = 1;
			aiRateOfFire = 4;
			aiRateOfFireDistance = 2500;
			aiRateOfFireDispersion = 2;
			minRange = 2000;
			minRangeProbab = 0.05;
			midRange = 2500;
			midRangeProbab = 0.5;
			maxRange = 3000;
			maxRangeProbab = 0.01;
		};
		//aiDispersionCoefY = 25;
		//aiDispersionCoefX = 20;
        aiDispersionCoefY = 0;
		aiDispersionCoefX = 0;
	};

	class exterra_m2Carbine : exterra_m2Carbine_base
	{
		author = "Luriss";
		_generalMacro = "exterra_m2Carbine";
		scope = 2;
		displayName = "M2 Carbine";
	};
	/*class MMG_01_tan_F : MMG_01_hex_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "MMG_01_tan_F";
		baseWeapon = "MMG_01_tan_F";
		displayName = "$STR_A3_CfgWeapons_MMG_01_tan_F0";
		picture = "\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\UI\gear_MMG_01_tan_X_co.paa";
		UIPicture = "\A3\weapons_f\data\UI\icon_mg_CA.paa";
		hiddenSelectionsTextures[] = { "\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_01_sand_CO.paa","\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_02_sand_CO.paa","\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_03_sand_CO.paa" };
		hiddenSelectionsMaterials[] = { "\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_01_sand.rvmat","\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_02_sand.rvmat","\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\MMG_01_03_sand.rvmat" };
		class LinkedItems
		{
			class LinkedItemsUnder
			{
				slot = "UnderBarrelSlot";
				item = "bipod_02_F_tan";
			};
		};
	};
	class MMG_01_hex_ARCO_LP_F : MMG_01_hex_F
	{
		author = "$STR_A3_Bohemia_Interactive";
		_generalMacro = "MMG_01_hex_ARCO_LP_F";
		class LinkedItems
		{
			class LinkedItemsOptic
			{
				slot = "CowsSlot";
				item = "optic_ARCO";
			};
			class LinkedItemsAcc
			{
				slot = "PointerSlot";
				item = "acc_pointer_IR";
			};
			class LinkedItemsUnder
			{
				slot = "UnderBarrelSlot";
				item = "bipod_02_F_hex";
			};
		};
	};*/
};
