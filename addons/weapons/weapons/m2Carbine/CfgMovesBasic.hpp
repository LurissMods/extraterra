class CfgMovesBasic
{
	//class DefaultDie;
	class ManActions
	{
		exterra_m2Carbine_reload = "exterra_m2Carbine_reloadStand";
		exterra_m2Carbine_reloadProne = "exterra_m2Carbine_reloadProne";
	};
	class Actions
	{
		class RifleBaseStandActions;
        //class RifleBaseLowStandActions;
		//class RifleAdjustProneBaseActions;
		class NoActions: ManActions
		{
			exterra_m2Carbine_reload[] = {"exterra_m2Carbine_reloadStand","Gesture"};
		};
		class RifleProneActions: RifleBaseStandActions
		{
			exterra_m2Carbine_reload[] = {"exterra_m2Carbine_reloadProne","Gesture"};
		};
	};
};
