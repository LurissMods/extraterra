//class RscListBox;
class exterra_huds_HUD_US
{
    idd = -1;
    //name=QGVAR(HUD_US);
	onLoad = "uiNamespace setVariable ['exterra_huds_HUD_US', _this select 0];";
    onUnload = "uiNamespace setVariable ['exterra_huds_HUD_US', nil];";
    movingEnable=1;
    fadein=0;
    fadeout=0;
	duration = 1e+6;
	class Controls
    {
        class hudMasterControl_US : RscControlsGroupNoScrollbars {
            idc = 10028;
            show = 1;
            colorBackground[] = {1,1,1,1};
            color[] = {1,1,1,1};
            class Controls
            {
                class hudOutline_US : RscPicture {
                    idc = 10029;
                    show = 1;
                    text = QUOTE(z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudBackground_us_ca.paa);
                    colorBackground[] = {1,1,1,1};
                    color[] = {1,1,1,1};
                };
                class hudExtAtm_US : RscStructuredText {
                    idc = 10030;
                    show = 1;
                    text = "";
                    //colorBackground[] = {1,1,1,1};
                    color[] = {1,1,1,1};
                    class Attributes {
                        font = QUOTE(RobotoCondensed);
                        align = QUOTE(center);
                        shadow = 0;
                        size = 1;
                        color = QUOTE(#ffffff);
                    };
                };
            };
        };
    };
	/*class GVAR(systemMessages_US_base)
	{
		idd=-1;
		name="LRSS_gui";
        onLoad="uiNamespace setVariable ['exterra_huds_systemMessages_US', _this select 0];";
		unload="uiNamespace setVariable ['exterra_huds_systemMessages_US', nil];";
		movingEnable=1;
		fadein=0;
		fadeout=0;
		duration=9.9999998e+010;
		class Controls
		{
			class LRSS_SYSTEMMESSAGES_CONTROLGROUP: RscControlsGroup
			{
				idc = 110863;
				x = 0.0101562 * safeZoneW + safeZoneX;
				y = 0.049 * safeZoneH + safeZoneY;
				w = 0.599062 * safeZoneW;
				h = 1.374 * safeZoneH;
				class Controls
				{
					class LRSS_SYSTEMMESSAGES_TEXTFIELD: RscStructuredText
					{
						idc = 10863;
						text = "";

						x = -5.40912e-007 * safeZoneW;
						y = 0 * safeZoneH;
						w = 1 * safeZoneW;
						h = 3 * safeZoneH;
						colorText[] = {0,0,0,1};
						style=0x02;
						colorBackground[] = {0,0,0,0};
						shadow=0;
						class Attributes
						{
							font = "RobotoCondensed";
							SizeEx="0.158 * safeZoneH";
							color = "#000000";
							colorLink = "#D09B43";
							align = "left";
							valign = "bottom";
							shadow = false;
							shadowColor = "#ffffff";
						};
					};
				};
			};
		};
	};*/

	/*class GVAR(bootUp_US_base)
	{
		idd=-1;
		name=QGVAR(bootUp_US_base);
		onLoad="uiNamespace setVariable ['exterra_huds_bootUp_US_base', _this select 0];";
		unload="uiNamespace setVariable ['exterra_huds_bootUp_US_base', nil];";
		movingEnable=1;
		fadein=0;
		fadeout=0;
		duration=9.9999998e+010;
		class Controls
		{
			class GVAR(bootUp_US_text): RscStructuredText
			{
				idc = 10263;
				text = "";

				x = "0.368516 * safeZoneW + safeZoneX";
				y = "0.3735 * safeZoneH + safeZoneY";
				w = "0.306797 * safeZoneW";
				h = "0.1925 * safeZoneH";
				colorText[] = {1,1,1,1};
				style=0x02;
				colorBackground[] = {0,0,0,0};
				shadow=0;
				class Attributes
				{
					font = "RobotoCondensed";
					SizeEx = "0.03 * safeZoneH";
					color = "#000000";
					colorLink = "#D09B43";
					align = "left";
					valign = "bottom";
					shadow = "false";
					shadowColor = "#000000";
				};
			};
			class GVAR(bootUp_US_headline): RscStructuredText
			{
				idc = 10264;
				text = "";

				x = "0.368516 * safeZoneW + safeZoneX";
				y = "0.3735 * safeZoneH + safeZoneY";
				w = "0.306797 * safeZoneW";
				h = "0.1925 * safeZoneH";
				colorText[] = {1,1,1,1};
				style=0x02;
				colorBackground[] = {0,0,0,0};
				shadow=0;
				class Attributes
				{
					//font = "NotoSansCJKLight";
					font = "RobotoCondensed";
					SizeEx = "0.03 * safeZoneH";
					color = "#000000";
					colorLink = "#D09B43";
					align = "left";
					valign = "bottom";
					shadow = "false";
					shadowColor = "#000000";
				};
			};
		};
	};

    class GVAR(overlay_US_base) {
		idd = -1;
		movingEnable = 0;
        onload="uiNamespace setVariable [""exterra_huds_overlay_US_base"", _this select 0];";
		duration=9.9999998e+010;
		fadein = 0;
		fadeout = 0;
		name = QGVAR(overlay_US_base);
	};
	class GVAR(rangefinder_US_base) {
		//idd = 90003;
		idd = -1;
        onload = "uiNamespace setVariable [""exterra_huds_rangefinder_US_base"", _this select 0];";
		duration = 9.9999998e+010;
		fadein = 0;
		fadeout = 0;
		class Controls
		{};
	};
	class GVAR(info_US_base) {
		//idd = 90003;
		idd = -1;
		onload = "uiNamespace setVariable [""exterra_huds_info_US_base"", _this select 0];";
		duration = 9.9999998e+010;
		fadein = 0;
		fadeout = 0;
		class Controls
		{};
	};
    class GVAR(weaponInfo_US_base)
	{
		idd=-1;
		name= QGVAR(weaponInfo_US_base);
        onLoad="uiNamespace setVariable ['exterra_huds_weaponInfo_US_base', _this select 0];";
		unload="uiNamespace setVariable ['exterra_huds_weaponInfo_US_base', nil];";
		movingEnable=1;
		fadein=0;
		fadeout=0;
		duration=100000;
	};
	class GVAR(squad_US_base) {
		//idd = 90003;
		idd = -1;
		onload = "uiNamespace setVariable [""exterra_huds_squad_US_base"", _this select 0];";
		duration = 9.9999998e+010;
		fadein = 0;
		fadeout = 0;
		class Controls
		{};
	};
    class GVAR(airBar_US_base)
	{
		idd=10003;
		//onload="uiNamespace setVariable [""LRSS_AIR_BAR_BASE"", _this select 0];";
        onload="uiNamespace setVariable [""exterra_huds_airBar_US_base"", _this select 0];";
		duration=9.9999998e+010;
		fadein = 0;
		fadeout = 0;
		class Controls
		{
			class Progress: RscProgress
			{
				color[]={0.5,0.09999998,0.09999998,0.80000001};
				colorFrame[]={0,0,0,0};
				colorBar[]={0.5,0.89999998,0.89999998,0.80000001};
				colorBackground[]={0,1,0,1};
				idc=1245;
				shadow = 1;
                texture = "z\exterra\addons\huds\data\hudUI_US\exterra_huds_airBar_US.paa";
				x="0.396875 * safeZoneW + safeZoneX";
				y="0.055897 * safeZoneH + safeZoneY";
				w="0.20625 * safeZoneW";
				h="0.057079 * safeZoneH";
			};
		};
	};
    class GVAR(battBar_US_base)
	{
		idd=10089;
		//onload="uiNamespace setVariable [""LRSS_BATT_BAR_BASE"", _this select 0];";
        onload="uiNamespace setVariable [""exterra_huds_battBar_US_base"", _this select 0];";
		duration=9.9999998e+010;
		fadein = 0;
		fadeout = 0;
		class Controls
		{
			class Progress: RscProgress
			{
				color[]={0.5,0.09999998,0.09999998,0.80000001};
				colorFrame[]={0,0,0,0};
				colorBar[]={0.5,0.89999998,0.89999998,0.80000001};
				colorBackground[]={0,1,0,1};
				idc=1246;
				shadow = 1;
                texture = "z\exterra\addons\huds\data\hudUI_US\exterra_huds_battBar_US.paa";
				x="0.396875 * safeZoneW + safeZoneX";
				y="0.055897 * safeZoneH + safeZoneY";
				w="0.20625 * safeZoneW";
				h="0.057079 * safeZoneH";
			};
		};
	};*/
};
