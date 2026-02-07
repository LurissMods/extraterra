class CfgAmmo
{

	class BulletBase;
    //class ShotgunBase;
	/*class BulletBase {
		supersonicCrackNear[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\scrack_close",0,0,0};
		supersonicCrackFar[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\scrack_middle",0,0,0};
		class SuperSonicCrack
		{
			superSonicCrack[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_meadow1",0,0,0};
			class SCrackForest
			{
				range[] = {0,500};
				sound1[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_forest1",0,0,0};
				sound2[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_forest2",0,0,0};
				sound3[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_forest3",0,0,0};
				sounds[] = {"sound1",0.333,"sound2",0.333,"sound3",0.333};
				frequency = "((speed factor [330, 930]) * 0.1) + 1.05";
				trigger = "forest";
			};
			class SCrackTrees
			{
				range[] = {0,500};
				sound1[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_trees1",0,0,0};
				sound2[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_trees2",0,0,0};
				sound3[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_trees3",0,0,0};
				sounds[] = {"sound1",0.333,"sound2",0.333,"sound3",0.333};
				frequency = "((speed factor [330, 930]) * 0.1) + 1.05";
				trigger = "trees";
			};
			class SCrackMeadow
			{
				range[] = {0,500};
				sound1[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_meadow1",0,0,0};
				sound2[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_meadow2",0,0,0};
				sound3[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_meadow3",0,0,0};
				sounds[] = {"sound1",0.333,"sound2",0.333,"sound3",0.333};
				frequency = "((speed factor [330, 930]) * 0.1) + 1.05";
				trigger = "meadow max sea";
			};
			class SCrackHouses
			{
				range[] = {0,500};
				sound1[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_houses1",0,0,0};
				sound2[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_houses2",0,0,0};
				sound3[] = {"A3\sounds_f\arsenal\sfx\supersonic_crack\sc_houses3",0,0,0};
				sounds[] = {"sound1",0.333,"sound2",0.333,"sound3",0.333};
				frequency = "((speed factor [330, 930]) * 0.1) + 1.05";
				trigger = "houses max interior";
			};
		};
	};*/
	/*class ShotDeployBase;
	class B_762x51_Ball;
	class B_93x64_Ball;
	class B_9x21_Ball;
	class B_127x99_Ball;
	class B_338_Ball;
	class B_556x45_Ball;
	class B_20mm;
	class B_30mm_HE;
	class B_30mm_MP;
	class B_30mm_APFSDS;
	class B_35mm_AA;
	class B_35mm_AA_Tracer_Red;
	class B_40mm_GPR;
	class B_40mm_APFSDS;
	class B_40mm_APFSDS_Tracer_Green;
	class B_coil_20g_spike;
	class GrenadeHand;
	class SmokeShell;
	class B_IRStrobe;
	class R_PG32V_F;
	class R_TBG32V_F;
	class R_230mm_HE;
	class M_Scalpel_AT;
	class M_70mm_SAAMI;
	class M_Air_AA;
	class M_Zephyr;
	class M_PG_AT;
	class M_AT;
	class M_Titan_AT;
	class M_Titan_AT_static;
	class M_Titan_AA;
	class M_NLAW_AT_F;
	class Sh_105mm_HEAT_MP;
	class Sh_105mm_APFSDS_T_Green;
	class Sh_105mm_HEAT_MP_T_Green;
	class Sh_120mm_HE;
	class Sh_120mm_HE_Tracer_Yellow;
	class Sh_120mm_APFSDS;
	class Sh_125mm_APFSDS;
	class Sh_125mm_HE;
	class Sh_125mm_HEAT;
	class Sh_155mm_AMOS;
	class Sh_155mm_AMOS_guided;
	class Sh_155mm_AMOS_LG;
	class Cannon_30mm_HE_Plane_CAS_02_F;
	class Bo_Mk82;
	class Bo_GBU12_LGB;
	class BombCluster_02_Ammo_F;
	class Cluster_155mm_AMOS;
	class Mine_155mm_AMOS_Range;
	class F_20mm_White;
	class B_12Gauge_Pellets;
	class B_12Gauge_Pellets_Submunition;
	class B_12Gauge_Slug_NoCartridge;
	class B_12Gauge_Slug;
	class B_570x28_Ball;
	class G_40mm_HE;
	class G_40mm_Smoke;
	class G_40mm_HEDP;
	class G_40mm_SmokeRed;
	class G_40mm_SmokeGreen;
	class G_40mm_SmokeYellow;
	class G_40mm_SmokePurple;
	class G_40mm_SmokeBlue;
	class G_40mm_SmokeOrange;
	class B_12Gauge_Pellets_Submunition_Deploy;
	class SubmunitionBase;*/

    class exterra_weapons_bulletBase : BulletBase
    {
        // This disables bullet crack sounds. Unfortunately it isn't possible to get it to change dynamically depending on atmo so I've just turned it off.
        soundSetSonicCrack[] = {};
		supersonicCrackNear[] = {"",1,1,50};
		supersonicCrackFar[] = {"",1,1,50};

        hit = 0;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = ""; // Effect defined in the bullets folder
		cost = 1; // Cost for AI
		typicalSpeed = 1;
		airFriction = 0;
		waterFriction = -0.3;
		coefGravity = 0.1651; // Lunar gravity, 1 = Earth Gravity
		caliber = 0.869565; // Penetration multiplier
		deflecting = 15; // Deflecting angle
		model = "\A3\Weapons_f\Data\bullettracer\tracer_white"; // Tracer model
		airLock = 1; // If ammo can lock onto air targets (e.g. will AI use this to shoot at a helicopter)
		tracerScale = 1; // Scale of tracer model, value for 5.56
		tracerStartTime = 0.05; // Tracer visiblity start (sec)
		tracerEndTime = 2.55; // Tracer visiblity end (sec)
		nvgOnly = 1; // What it says on the tin
		audibleFire = 35; // AI hearing detection power
		visibleFire = 3; // AI visibility detection power
		aiAmmoUsageFlags = 64; // Tells the AI how to use this ammo. Table for each value here: https://community.bistudio.com/wiki/CfgAmmo_Config_Reference
		dangerRadiusBulletClose = 8; // What it says on tin, for AI
		dangerRadiusHit = 12; // What it says on tin, for AI
		suppressionRadiusBulletClose = 6; // What it says on tin, for AI
		suppressionRadiusHit = 8; // What it says on tin, for AI
        /*
        // Bullet diameter in mm (diameter is a little different from caliber)
        ACE_caliber = 5.69;
        ACE_bulletLength = 23.012;  // Bullet Length in mm
        ACE_bulletMass = 4.0176;  // Mass in grams (example is roughly 62 grains)
        // Standard deviation of the muzzle velocity variation in percent
        // Example: With a muzzle velocity of 850 m/s and a standard deviation of 0.35%, 68% of the shots will be between 847 m/s and 853 m/s
        ACE_muzzleVelocityVariationSD = 0.35;
        // Array of muzzle velocity shifts in m/s with 11 data points from -15 °C to 35 °C
        // Example: At 0°C the shift will be -21.0
        ACE_ammoTempMuzzleVelocityShifts[] = {-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
        // Array of ballistic coefficients (contains one element more than the velocity boundary array)
        ACE_ballisticCoefficients[] = {0.151};
        ACE_velocityBoundaries[] = {};  // Array of velocity boundaries
        ACE_standardAtmosphere = "ASM";  // "ASM" or "ICAO"
        ACE_dragModel = 7;  // Number that specifies the drag model [1, 2, 5, 6, 7, 8]
        // Array of muzzle velocities (same size as barrel length array)
        ACE_muzzleVelocities[] = {723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
        // Array of barrel lengths (same size as muzzle velocity array)
        // Example, when shooting with the M4 barrel (`368.3`mm).
        // The length is between the 5th and 6th barrelLengths (`360.68, 391.16`).
        // So the muzzle velocity will be between 5th and 6th muzzleVelocities (`866, 878`).
        ACE_barrelLengths[] = {210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
        */

        class CamShakeExplode {};
		class CamShakeHit {};
        class HitEffects {};
    };

	// 10x19mm
	class exterra_weapons_10x19mmTeflon : exterra_weapons_bulletBase
	{
		hit = 5.1;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "exterra_bullets_FxCartridge_10x19mm";
		cost = 100;
		typicalSpeed = 380;
		airFriction = 0;
		coefGravity = 0.1651;
		caliber = 1.25;
		deflecting = 25;
		model = "\A3\Weapons_f\Data\bullettracer\tracer_white";
		airLock = 1;
		tracerScale = 0.5;
		tracerStartTime = 0.05;
		tracerEndTime = 1;
		nvgOnly = 1;
		audibleFire = 0;
		visibleFire = 0;
		aiAmmoUsageFlags = 64;
		dangerRadiusBulletClose = 4;
		dangerRadiusHit = 8;
		suppressionRadiusBulletClose = 2;
		suppressionRadiusHit = 4;
	};
	class exterra_weapons_10x19mmTeflonTracer : exterra_weapons_10x19mmTeflon
	{
		model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		nvgOnly = 0;
	};

	// 9x19mm
	class exterra_weapons_9x19mmTeflon : BulletBase
	{
		hit = 5;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "exterra_bullets_FxCartridge_10x19mm";
		cost = 100;
		typicalSpeed = 380;
		airFriction = 0;
		coefGravity = 0.1651;
		caliber = 1.2;
		deflecting = 25;
		model = "\A3\Weapons_f\Data\bullettracer\tracer_white";
		airLock = 1;
		tracerScale = 0.5;
		tracerStartTime = 0.05;
		tracerEndTime = 1;
		nvgOnly = 1;
		audibleFire = 0;
		visibleFire = 0;
		aiAmmoUsageFlags = 64;
		dangerRadiusBulletClose = 4;
		dangerRadiusHit = 8;
		suppressionRadiusBulletClose = 2;
		suppressionRadiusHit = 4;
	};
	class exterra_weapons_9x19mmTeflonTracer : exterra_weapons_9x19mmTeflon
	{
		model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		nvgOnly = 0;
	};
	class exterra_weapons_twoWorldWars : exterra_weapons_9x19mmTeflon
	{
		model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		hit = 1000000;
		caliber = 175500;
		nvgOnly = 0;
	};

	// 5.56x55mm
	class exterra_weapons_5p56x55mmTeflon : exterra_weapons_bulletBase
	{


		hit = 9;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "exterra_bullets_FxCartridge_5p56x55mm";
		cost = 1;
		typicalSpeed = 1348;
		airFriction = -0.0012;
		waterFriction = -0.3;
		coefGravity = 0.1651;
		caliber = 0.869565;
		deflecting = 15;
		model = "\A3\Weapons_f\Data\bullettracer\tracer_white";
		airLock = 1;
		tracerScale = 1;
		tracerStartTime = 0.05;
		tracerEndTime = 2.55;
		nvgOnly = 1;
		audibleFire = 35;
		visibleFire = 3;
		aiAmmoUsageFlags = 64; //note: AI values need to be tweaked, still same as 9mm
		dangerRadiusBulletClose = 8;
		dangerRadiusHit = 12;
		suppressionRadiusBulletClose = 6;
		suppressionRadiusHit = 8;

        class CamShakeExplode
		{
			power = 2.23607;
			duration = 0.4;
			frequency = 20;
			distance = 6.7082;
		};
		class CamShakeHit
		{
			power = 5;
			duration = 0.2;
			frequency = 20;
			distance = 1;
		};
        class HitEffects
        {
            hitGroundSoft = "exterra_bullets_impactRegolith1";
			//hitGroundRed = "ImpactEffectsRed";
			//hitGroundHard = "ImpactEffectsHardGround";
        };
	};
	class exterra_weapons_5p56x55mmTeflonTracer : exterra_weapons_5p56x55mmTeflon
	{
		model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		nvgOnly = 0;
	};

	// 6.8x51mm
	class exterra_weapons_6p8x51mmTeflon : exterra_weapons_bulletBase
	{
		hit = 12;
		indirectHit = 0;
		indirectHitRange = 0;
		cartridge = "exterra_bullets_FxCartridge_6p8x51mm";
		cost = 100;
		typicalSpeed = 980;
		airFriction = 0;
		coefGravity = 0.1651;
		caliber = 1.3;
		deflecting = 15;
		model = "\A3\Weapons_f\Data\bullettracer\tracer_white";
		airLock = 1;
		tracerScale = 0.5;
		tracerStartTime = 0.05;
		tracerEndTime = 2.55;
		nvgOnly = 1;
		audibleFire = 0;
		visibleFire = 0;
		aiAmmoUsageFlags = 64; //note: AI values need to be tweaked, still same as 9mm
		dangerRadiusBulletClose = 6;
		dangerRadiusHit = 10;
		suppressionRadiusBulletClose = 8;
		suppressionRadiusHit = 10;
	};
	class exterra_weapons_6p8x51mmTeflonTracer : exterra_weapons_6p8x51mmTeflon
	{
		model = "\A3\Weapons_f\Data\bullettracer\tracer_red";
		nvgOnly = 0;
	};
};
