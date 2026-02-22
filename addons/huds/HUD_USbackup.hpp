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
    class controlsBackground
    {
        class hudOutline_US : RscPicture {
            idc = HUD_OUTLINE_US_IDC;
            show = 1;
            text = QUOTE(z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudBackground_us_ca.paa);
            colorBackground[] = {1,1,1,1};
            color[] = {1,1,1,1};
        };
        class hudAirBar_US : RscProgress {
            idc = HUD_AIR_PROGRESS_US_IDC;
            texture = QUOTE(z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudProgressBar_US_ca.paa);
            color[] = {1,1,1,1};
            colorFrame[]={0,0,0,0};
            shadow = 0;
        };
        class hudBattBar_US : RscProgress {
            idc = HUD_BATT_PROGRESS_US_IDC;
            texture = QUOTE(z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudProgressBar_US_ca.paa);
            color[] = {1,1,1,1};
            colorFrame[]={0,0,0,0};
            shadow = 0;
        };
        class hudMasterControl_US : RscControlsGroupNoScrollbars {
            idc = MASTER_CONTROL_US_IDC;
            show = 1;
            colorBackground[] = {1,1,1,1};
            color[] = {1,1,1,1};
            class Controls
            {
                class hudLines_US : RscPicture {
                    idc = HUD_OUTLINE_LINES_US_IDC;
                    show = 1;
                    text = QUOTE(z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudLines_us_ca.paa);
                    colorBackground[] = {1,1,1,1};
                    color[] = {1,1,1,1};
                };
                class hudText_US : RscPicture {
                    idc = HUD_OUTLINE_TEXT_US_IDC;
                    show = 1;
                    text = QUOTE(z\exterra\addons\huds\data\hudUI_US\exterra_huds_hudText_us_english_ca.paa);
                    colorBackground[] = {1,1,1,1};
                    color[] = {1,1,1,1};
                };

                class hudWeaponPrimary_US : RscPicture {
                    idc = HUD_WEAPON_PRIMARY_US_IDC;
                    show = 1;
                    text = QUOTE(z\exterra\addons\huds\data\weaponIcons\US\english\exterra_m2CarbineEng_icon.paa);
                    colorBackground[] = {1,1,1,1};
                    color[] = {1,1,1,1};
                };
                class hudWeaponSecondary_US : RscPicture {
                    idc = HUD_WEAPON_SECONDARY_US_IDC;
                    show = 1;
                    text = QUOTE(z\exterra\addons\huds\data\weaponIcons\Unknown\unknownWeapon_icon.paa);
                    colorBackground[] = {1,1,1,1};
                    color[] = {1,1,1,1};
                };
                class hudWeaponLauncher_US : RscPicture {
                    idc = HUD_WEAPON_LAUNCHER_US_IDC;
                    show = 1;
                    text = QUOTE(z\exterra\addons\huds\data\weaponIcons\Unknown\unknownWeapon_icon.paa);
                    colorBackground[] = {1,1,1,1};
                    color[] = {1,1,1,1};
                };
                class hudWeaponGrenade_US : RscPicture {
                    idc = HUD_WEAPON_GRENADE_US_IDC;
                    show = 1;
                    text = QUOTE(z\exterra\addons\huds\data\weaponIcons\Unknown\unknownGrenade_icon.paa);
                    colorBackground[] = {1,1,1,1};
                    color[] = {1,1,1,1};
                };

                class hudExtAtm_US : exterra_huds_structuredText {
                    idc = HUD_EXT_ATM_US_IDC;
                    text = "";
                };
                class hudEnvironRad_US : exterra_huds_structuredText {
                    idc = HUD_ENVIRON_RAD_US_IDC;
                    text = "";
                };
                class hudRadTotal_US : exterra_huds_structuredText {
                    idc = HUD_RAD_TOTAL_US_IDC;
                    text = "";
                };
                class hudTempInt_US : exterra_huds_structuredText {
                    idc = HUD_TEMP_INT_US_IDC;
                    text = "";
                };
                class hudTempExt_US : exterra_huds_structuredText {
                    idc = HUD_TEMP_EXT_US_IDC;
                    text = "";
                };
                class hudTmeDangTemp_US : exterra_huds_structuredText {
                    idc = HUD_TME_DANG_TEMP_US_IDC;
                    text = "";
                };
                class hudTempWatt_US : exterra_huds_structuredText {
                    idc = HUD_TEMP_WATT_US_IDC;
                    text = "";
                };
                class hudBearing_US : exterra_huds_structuredText {
                    idc = HUD_BEARING_US_IDC;
                    text = "";
                };
                class hudGrid_US : exterra_huds_structuredText {
                    idc = HUD_GRID_US_IDC;
                    text = "";
                };
                class hudRange_US : exterra_huds_structuredText {
                    idc = HUD_RANGE_US_IDC;
                    text = "";
                };
                class hudAirEstTime_US : exterra_huds_structuredText {
                    idc = HUD_AIR_EST_TIME_US_IDC;
                    text = "";
                };
                class hudBattEstTime_US : exterra_huds_structuredText {
                    idc = HUD_BATT_EST_TIME_US_IDC;
                    text = "";
                };

                class hudMagCount_US : exterra_huds_structuredText {
                    idc = HUD_MAG_COUNT_US_IDC;
                    text = "";
                };
                class hudFireMode_US : exterra_huds_structuredText {
                    idc = HUD_FIRE_MODE_US_IDC;
                    text = "";
                };
                class hudWeaponZero_US : exterra_huds_structuredText {
                    idc = HUD_WEAPON_ZERO_US_IDC;
                    text = "";
                };
                class hudGrenadeCount_US : exterra_huds_structuredText {
                    idc = HUD_GRENADE_COUNT_US_IDC;
                    text = "";
                };

                class hudSquad_name0_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME0_US_IDC;
                    text = "";
                };
                class hudSquad_hr0_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR0_US_IDC;
                    text = "";
                };
                class hudSquad_bp0_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP0_US_IDC;
                    text = "";
                };
                class hudSquad_datalink0_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK0_US_IDC;
                    text = "";
                };

                class hudSquad_name1_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME1_US_IDC;
                    text = "";
                };
                class hudSquad_hr1_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR1_US_IDC;
                    text = "";
                };
                class hudSquad_bp1_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP1_US_IDC;
                    text = "";
                };
                class hudSquad_datalink1_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK1_US_IDC;
                    text = "";
                };

                class hudSquad_name2_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME2_US_IDC;
                    text = "";
                };
                class hudSquad_hr2_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR2_US_IDC;
                    text = "";
                };
                class hudSquad_bp2_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP2_US_IDC;
                    text = "";
                };
                class hudSquad_datalink2_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK2_US_IDC;
                    text = "";
                };

                class hudSquad_name3_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME3_US_IDC;
                    text = "";
                };
                class hudSquad_hr3_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR3_US_IDC;
                    text = "";
                };
                class hudSquad_bp3_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP3_US_IDC;
                    text = "";
                };
                class hudSquad_datalink3_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK3_US_IDC;
                    text = "";
                };

                class hudSquad_name4_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME4_US_IDC;
                    text = "";
                };
                class hudSquad_hr4_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR4_US_IDC;
                    text = "";
                };
                class hudSquad_bp4_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP4_US_IDC;
                    text = "";
                };
                class hudSquad_datalink4_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK4_US_IDC;
                    text = "";
                };

                class hudSquad_name5_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME5_US_IDC;
                    text = "";
                };
                class hudSquad_hr5_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR5_US_IDC;
                    text = "";
                };
                class hudSquad_bp5_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP5_US_IDC;
                    text = "";
                };
                class hudSquad_datalink5_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK5_US_IDC;
                    text = "";
                };

                class hudSquad_name6_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME6_US_IDC;
                    text = "";
                };
                class hudSquad_hr6_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR6_US_IDC;
                    text = "";
                };
                class hudSquad_bp6_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP6_US_IDC;
                    text = "";
                };
                class hudSquad_datalink6_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK6_US_IDC;
                    text = "";
                };

                class hudSquad_name7_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME7_US_IDC;
                    text = "";
                };
                class hudSquad_hr7_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR7_US_IDC;
                    text = "";
                };
                class hudSquad_bp7_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP7_US_IDC;
                    text = "";
                };
                class hudSquad_datalink7_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK7_US_IDC;
                    text = "";
                };

                class hudSquad_name8_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME8_US_IDC;
                    text = "";
                };
                class hudSquad_hr8_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR8_US_IDC;
                    text = "";
                };
                class hudSquad_bp8_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP8_US_IDC;
                    text = "";
                };
                class hudSquad_datalink8_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK8_US_IDC;
                    text = "";
                };

                class hudSquad_name9_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_NAME9_US_IDC;
                    text = "";
                };
                class hudSquad_hr9_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_HR9_US_IDC;
                    text = "";
                };
                class hudSquad_bp9_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_BP9_US_IDC;
                    text = "";
                };
                class hudSquad_datalink9_US : exterra_huds_structuredText {
                    idc = HUD_SQUAD_DATALINK9_US_IDC;
                    text = "";
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
