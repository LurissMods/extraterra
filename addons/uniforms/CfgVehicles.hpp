class CfgVehicles
{
	class B_Soldier_F;
	//class B_diver_F;
	class exterra_uniforms_base: B_Soldier_F
	{
		scope = 1;
		picture = "";
		camouflage = 0;
		displayName = "Extraterra Uniform Base (You shouldn't be reading this)";
		scopeArsenal = 1;
		author = AUTHOR;
		model = "";
		_generalMacro = QGVAR(base); // has to be on parr with the Base Class so others inherit this
		uniforMClass = QGVAR(base); //class will be the same as the name in line 24
		identityTypes[] =
		{
			QUOTE(G_NATO_diver)
		};
		hiddenSelections[] =
		{};
		hiddenSelectionsTextures[] =
		{};
	};
	class exterra_uniforms_usUndersuit: exterra_uniforms_base
	{
		displayName = "";
        model = QPATHTOF(data\uniforms\us\undersuit\exterra_uniforms_usUndersuit.p3d);
		_generalMacro = QGVAR(usUndersuit); // has to be on parr with the Base Class so others inherit this
		uniforMClass = QGVAR(usUndersuit); //class will be the same as the name in line 24
        picture = "";
        scope=1;
        scopeArsenal=1;
	};
    class exterra_uniforms_usBDU0: exterra_uniforms_base
	{
		displayName = "";
        model = QPATHTOF(data\uniforms\us\bdu0\exterra_uniforms_usBDU0.p3d);
		_generalMacro = QGVAR(usBDU0); // has to be on parr with the Base Class so others inherit this
		uniforMClass = QGVAR(usBDU0); //class will be the same as the name in line 24
        picture = "";
        scope=1;
        scopeArsenal=1;
	};
};
