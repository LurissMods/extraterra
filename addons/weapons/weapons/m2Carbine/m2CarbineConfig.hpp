class Rifle;
class Rifle_Base_F : Rifle
{
    class WeaponSlotsInfo;
    class GunParticles;
};

class exterra_weapons_m2Carbine_base : Rifle_Base_F
{
    author = "Luriss";
    _generalMacro = "exterra_weapons_m2Carbine_base";
    //baseWeapon = "exterra_m2Carbine_baseWeapon";
    scope = 0;
    model = "\z\exterra\addons\weapons\weapons\m2Carbine\exterra_weapons_m2Carbine.p3d";
    displayName = "exterra_weapons_m2Carbine_base";
    descriptionShort = "";
    picture = "\z\exterra\addons\weapons\weapons\m2Carbine\icon_exterra_weapons_m2Carbine_ca.paa";
    UIPicture = "\A3\weapons_f\data\UI\icon_mg_CA.paa";
    handAnim[] = { "OFP2_ManSkeleton","\z\exterra\addons\weapons\weapons\m2Carbine\anims\exterra_weapons_m2Carbine_handAnim.rtm" };
    //handAnim[] = { "OFP2_ManSkeleton","\z\exterra\addons\weapons\weapons\m2Carbine\anims\exterra_m2Carbine_handAnimTest.rtm" };
    overviewPicture = "";
    hiddenSelections[] = {"camo"};
    hiddenSelectionsTextures[] = { "\z\exterra\addons\weapons\weapons\m2Carbine\textures\exterra_weapons_m2Carbine_co.paa" };
    hiddenSelectionsMaterials[] = { "\z\exterra\addons\weapons\weapons\m2Carbine\textures\exterra_weapons_m2Carbine.rvmat" };
    magazines[] = { "exterra_weapons_30rnd_5p56x55mm" };
    magazineWell[] = { "exterra_weapons_magwell_stanagUS" };
    reloadAction = "exterra_weapons_m2Carbine_reload";
    //reloadAction = "";
    recoil = "recoil_m2carbine";
    //recoil = "";
    discreteDistance[] = {300};
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
            effectName = "exterra_particle_effects_vaccumGunEffects";
            positionName = "Usti hlavne";
            directionName = "Konec hlavne";
        };
    };


    class WeaponSlotsInfo : WeaponSlotsInfo
    {
        mass = 81.57;
        class MuzzleSlot : MuzzleSlot
        {
            linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
            compatibleItems[] = {"exterra_sounds_vacuumMuzzle","muzzle_snds_338_black"};
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
    drySound[] = { "z\exterra\addons\sounds\data\weaponSounds\m2Carbine\exterra_weaponSounds_m2carbine_dryFire.wss",0.4466836,1,10 };
    reloadMagazineSound[] = { "z\exterra\addons\sounds\data\weaponSounds\m2Carbine\exterra_weaponSounds_m2carbine_reload.wss",1.0,1,10 };
    changeFiremodeSound[] = { "z\exterra\addons\sounds\data\weaponSounds\m2Carbine\exterra_weaponSounds_m2carbine_fireSelect.wss",0.31622776,1,5 };
    modes[] = {"Semi","Auto","close","short","medium","far_optic1","far_optic2"};

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

        minRange = 2;
        minRangeProbab = 0.5;
        midRange = 250;
        midRangeProbab = 0.7;
        maxRange = 500;
        maxRangeProbab = 0.3;
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

        minRange = 0;
        minRangeProbab = 0.9;
        midRange = 15;
        midRangeProbab = 0.7;
        maxRange = 30;
        maxRangeProbab = 0.1;
        aiRateOfFire = 1e-06;
    };
    class fullauto_medium: Auto
    {
        showToPlayer = 0;
        burst = 3;
        aiBurstTerminable = 1;
        minRange = 2;
        minRangeProbab = 0.5;
        midRange = 75;
        midRangeProbab = 0.7;
        maxRange = 150;
        maxRangeProbab = 0.05;
        aiRateOfFire = 2.0;
        aiRateOfFireDistance = 200;
    };
    class semi_medium_optics1: Semi
    {
        requiredOpticType = 1;
        showToPlayer = 0;
        minRange = 2;
        minRangeProbab = 0.2;
        midRange = 750;
        midRangeProbab = 0.7;
        maxRange = 1500;
        maxRangeProbab = 0.2;
        aiRateOfFire = 6;
        aiRateOfFireDistance = 1500;
    };
    class semi_far_optics2: semi_medium_optics1
    {
        requiredOpticType = 2;
        showToPlayer = 0;
        minRange = 100;
        minRangeProbab = 0.1;
        midRange = 1500;
        midRangeProbab = 0.6;
        maxRange = 2500;
        maxRangeProbab = 0.1;
        aiRateOfFire = 8;
        aiRateOfFireDistance = 2500;
    };
    aiDispersionCoefY = 3.0;
    aiDispersionCoefX = 2.0;
};

class exterra_weapons_m2Carbine : exterra_weapons_m2Carbine_base
{
    author = AUTHOR;
    _generalMacro = "exterra_weapons_m2Carbine";
    scope = 2;
    displayName = "M2 Carbine";
};
