class Rifle_Shot_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_Closure_SoundShader","exterra_weaponSounds_m2Carbine_closeShot_SoundShader","exterra_weaponSounds_m2Carbine_midShot_SoundShader","exterra_weaponSounds_m2Carbine_distShot_SoundShader","exterra_weaponSounds_m2Carbine_tailInterior_SoundShader"};
	volumeFactor = 1.6;
	volumeCurve = "InverseSquare2Curve";
	sound3DProcessingType = "WeaponMediumShot3DProcessingType";
	distanceFilter = "weaponShotDistanceFreqAttenuationFilter";
	occlusionFactor = 0.5;
	obstructionFactor = 0.3;
	spatial = 1;
	doppler = 0;
	loop = 0;
};
class Rifle_Tail_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_tailTrees_SoundShader","exterra_weaponSounds_m2Carbine_tailForest_SoundShader","exterra_weaponSounds_m2Carbine_tailMeadows_SoundShader","exterra_weaponSounds_m2Carbine_tailHouses_SoundShader"};
	volumeFactor = 1;
	volumeCurve = "InverseSquare2Curve";
	frequencyRandomizer = 1;
	sound3DProcessingType = "WeaponMediumShotTail3DProcessingType";
	distanceFilter = "weaponShotTailDistanceFreqAttenuationFilter";
	occlusionFactor = 0.3;
	obstructionFactor = 0;
	spatial = 1;
	doppler = 0;
	loop = 0;
	soundShadersLimit = 2;
};
class Rifle_InteriorTail_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_tailInterior_SoundShader"};
	volumeFactor = 1;
	volumeCurve = "InverseSquare2Curve";
	frequencyRandomizer = 0;
	sound3DProcessingType = "WeaponInteriorShotTail3DProcessingType";
	distanceFilter = "weaponShotTailDistanceFreqAttenuationFilter";
	occlusionFactor = 0.3;
	obstructionFactor = 0;
	spatial = 1;
	doppler = 0;
	loop = 0;
};
class Rifle_silencerShot_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_Closure_SoundShader","exterra_weaponSounds_m2Carbine_silencerShot_SoundShader"};
	volumeFactor = 1.6;
	volumeCurve = "InverseSquare2Curve";
	occlusionFactor = 0.5;
	obstructionFactor = 0.3;
	spatial = 1;
	doppler = 0;
	loop = 0;
	sound3DProcessingType = "WeaponMediumShot3DProcessingType";
};
class Rifle_silencerTail_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_silencerTailTrees_SoundShader","exterra_weaponSounds_m2Carbine_silencerTailForest_SoundShader","exterra_weaponSounds_m2Carbine_silencerTailMeadows_SoundShader","exterra_weaponSounds_m2Carbine_tailHouses_SoundShader"};
	volumeFactor = 0.7;
	volumeCurve = "InverseSquare2Curve";
	frequencyRandomizer = 1;
	occlusionFactor = 0.3;
	obstructionFactor = 0;
	spatial = 1;
	doppler = 0;
	loop = 0;
	soundShadersLimit = 2;
	sound3DProcessingType = "WeaponMediumShotTail3DProcessingType";
};
class Rifle_silencerInteriorTail_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_silencerTailInterior_SoundShader"};
	volumeFactor = 0.7;
	volumeCurve = "InverseSquare2Curve";
	occlusionFactor = 0.3;
	obstructionFactor = 0;
	frequencyRandomizer = 1;
	spatial = 1;
	doppler = 0;
	loop = 0;
	sound3DProcessingType = "WeaponInteriorShotTail3DProcessingType";
};
class exterra_weaponSounds_m2Carbine_Shot_SoundSet: Rifle_Shot_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_Closure_SoundShader","exterra_weaponSounds_m2Carbine_closeShot_SoundShader","exterra_weaponSounds_m2Carbine_midShot_SoundShader","exterra_weaponSounds_m2Carbine_distShot_SoundShader"};
};
class exterra_weaponSounds_m2Carbine_Tail_SoundSet: Rifle_Tail_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_tailTrees_SoundShader","exterra_weaponSounds_m2Carbine_tailForest_SoundShader","exterra_weaponSounds_m2Carbine_tailMeadows_SoundShader","exterra_weaponSounds_m2Carbine_tailHouses_SoundShader"};
};
class exterra_weaponSounds_m2Carbine_InteriorTail_SoundSet: Rifle_InteriorTail_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_tailInterior_SoundShader"};
};
class exterra_weaponSounds_m2Carbine_silencerShot_SoundSet: Rifle_silencerShot_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_Closure_SoundShader","exterra_weaponSounds_m2Carbine_silencerShot_SoundShader"};
};
class exterra_weaponSounds_m2Carbine_silencerTail_SoundSet: Rifle_silencerTail_Base_SoundSet
{
	soundShaders[] = {"MX_silencerTailTrees_SoundShader","MX_silencerTailForest_SoundShader","MX_silencerTailMeadows_SoundShader","MX_silencerTailHouses_SoundShader"};
};
class exterra_weaponSounds_m2Carbine_silencerInteriorTail_SoundSet: Rifle_silencerInteriorTail_Base_SoundSet
{
	soundShaders[] = {"exterra_weaponSounds_m2Carbine_silencerTailInterior_SoundShader"};
};
