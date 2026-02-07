class CfgVehicles
{
	class B_Soldier_F;
	//class B_diver_F;
	class exterra_uniforms_base: B_Soldier_F
	{
		scope=1;
		picture="";
		camouflage=0;
		displayName="Extraterra Uniform Base (You shouldn't be reading this)";
		scopeArsenal=1;
		//faction="isky_unis";
		author="Luriss";
		model="";
		_generalMacro="exterra_uniforms_base"; // has to be on parr with the Base Class so others inherit this
		uniforMClass="exterra_uniforms_base"; //class will be the same as the name in line 24
		identityTypes[]=
		{
			"G_NATO_diver"
		};
		hiddenSelections[]= // selections in the model
		{
			/*
			"camo",
			"camo1",
			"camo2",
			"camo3",
			"leftknee",
			"rightknee"
			*/
		};
		hiddenSelectionsTextures[]= // paths to retexture the selections
		{
			/*
			"example_uniform\data\Pants_blk.paa",
			"example_uniform\data\Shirt_blk.paa",
			"example_uniform\data\cuffs_blk_co.paa",
			"example_uniform\data\salomon.paa",
			"example_uniform\data\Pants_blk.paa",
			"example_uniform\data\Pants_blk.paa"
			*/
		};
	};
	class exterra_uniforms_usUndersuit: exterra_uniforms_base
	{
		displayName="Lunar Combat Suit (LCS)";
		model="z\exterra\addons\uniforms\data\uniforms\us\undersuit\exterra_uniforms_usUndersuit.p3d";
		_generalMacro="exterra_uniforms_usUndersuit"; // has to be on parr with the Base Class so others inherit this
		uniforMClass="exterra_uniforms_usUndersuit"; //class will be the same as the name in line 24
        picture = "";
        scope=1;
        scopeArsenal=1;
	};
    class exterra_uniforms_usBDU0: exterra_uniforms_base
	{
		displayName="Lunar Combat Uniform (LCU)";
		model="z\exterra\addons\uniforms\data\uniforms\us\bdu0\exterra_uniforms_usBDU0.p3d";
		_generalMacro="exterra_uniforms_usBDU0"; // has to be on parr with the Base Class so others inherit this
		uniforMClass="exterra_uniforms_usBDU0"; //class will be the same as the name in line 24
        picture = "";
        scope=1;
        scopeArsenal=1;
	};
};
