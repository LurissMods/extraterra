class CfgGesturesMale
{
	class ManActions{};
	//class Actions;
	//class RifleReloadProneBase;
	class Default;

    class BlendAnims
    {
        class MaskStart0
        {
            weight=0.85;
        };
        exterra_reloadMask[]=
        {
            "head",
            0,
            "neck1",
            0,
            "neck",
            0,
            "weapon",
            1,
            "launcher",
            1,
            "LeftShoulder",
            1,
            "LeftArm",
            1,
            "LeftArmRoll",
            1,
            "LeftForeArm",
            1,
            "LeftForeArmRoll",
            1,
            "LeftHand",
            1,
            "LeftHandRing",
            1,
            "LeftHandPinky1",
            1,
            "LeftHandPinky2",
            1,
            "LeftHandPinky3",
            1,
            "LeftHandRing1",
            1,
            "LeftHandRing2",
            1,
            "LeftHandRing3",
            1,
            "LeftHandMiddle1",
            1,
            "LeftHandMiddle2",
            1,
            "LeftHandMiddle3",
            1,
            "LeftHandIndex1",
            1,
            "LeftHandIndex2",
            1,
            "LeftHandIndex3",
            1,
            "LeftHandThumb1",
            1,
            "LeftHandThumb2",
            1,
            "LeftHandThumb3",
            1,
            "RightShoulder",
            1,
            "RightArm",
            1,
            "RightArmRoll",
            1,
            "RightForeArm",
            1,
            "RightForeArmRoll",
            1,
            "RightHand",
            1,
            "RightHandRing",
            1,
            "RightHandPinky1",
            1,
            "RightHandPinky2",
            1,
            "RightHandPinky3",
            1,
            "RightHandRing1",
            1,
            "RightHandRing2",
            1,
            "RightHandRing3",
            1,
            "RightHandMiddle1",
            1,
            "RightHandMiddle2",
            1,
            "RightHandMiddle3",
            1,
            "RightHandIndex1",
            1,
            "RightHandIndex2",
            1,
            "RightHandIndex3",
            1,
            "RightHandThumb1",
            1,
            "RightHandThumb2",
            1,
            "RightHandThumb3",
            1,
            "Spine",
            0.3,
            "Spine1",
            0.4,
            "Spine2",
            0.5,
            "Spine3",
            0.6,
            "pelvis",
            0
            //"MaskStart0"
        };
    };

	class States
	{
		class exterra_m2Carbine_reloadStand : Default
		{
			file = "z\exterra\addons\weapons\weapons\m2Carbine\anims\exterra_m2Carbine_reloadStand.rtm";
			looped = 0;
			speed = 0.25;
			//mask = "ReloadMask";
            mask = "handsWeapon";
            //mask = "exterra_reloadMask";
			enableOptics = 1;
			weaponIK = 1;
			headBobStrength = 0.5;
			headBobMode = 2;

			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			//leftHandIKCurve[] = {0.012,1,0.041,0,0.941,0,0.982,1};
            //leftHandIKCurve[] = {0,1, 0.05,0, 0.85,0, 1,1};
            leftHandIKCurve[] = {0,1,0.08,0,0.92,0,1,1};
            //rightHandIKCurve[] = {0,1, 0.05,0, 0.95,0, 1,1};
            //InterpolationRestart = 0;
            //ConnectTo[] = {"AmovPercMstpSrasWrflDnon",0.1};
		};
		class exterra_m2Carbine_reloadProne : Default
		{
			file = "z\exterra\addons\weapons\weapons\m2Carbine\anims\exterra_m2Carbine_reloadProne.rtm";
			looped = 0;
			speed = 0.25;
			mask = "handsWeapon";
			enableOptics = 1;
			weaponIK = 1;
			headBobStrength = 0.2;
			headBobMode = 2;
			rightHandIKBeg = 1;
			rightHandIKEnd = 1;
			leftHandIKCurve[] = {0,1,0.08,0,0.92,0,1,1};
		};
	};
};
