class RscText;
class RscButton;
class RscPicture;
class RscListbox;
class RscListNbox;
class RscCombo;
class RscActivePicture;
class RscButtonMenu;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;

class exterra_suit_menu: RscControlsGroupNoScrollbars
{
	idd = 2300;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(call FUNC(onMenuOpen));
    onUnload = QUOTE(call FUNC(onMenuClose));
    //onUnload = QUOTE(call FUNC(onMenuClose));
	x = "0.0354348 * safezoneW + safezoneX";
	y = "0.214 * safezoneH + safezoneY";
	w = "0.258092 * safezoneW";
	h = "0.572 * safezoneH";
    class controlsBackground {
        class exterra_suit_menu_titleBar: RscText
		{
			idc = 1200;
			text = "Title here";//CSTRING(MedicalMenu);
			x = "0.00516156 * safezoneW";
			y = "0.011 * safezoneH";
			w = "0.247768 * safezoneW";
			h = "0.022 * safezoneH";
			//colorText[] = {1,1,1,1};
            colorBackground[] = {1,0.2,0.2,1};//GUI_BCG_COLOR;
            moving = 1;
		};
		class exterra_suit_menu_background: RscText
		{
			idc = 1201;
			x = "0.00516173 * safezoneW";
			y = "0.033 * safezoneH";
			w = "0.247768 * safezoneW";
			h = "0.528 * safezoneH";
            colorBackground[] = {0, 0, 0, 0.7};
		};
    };
	class Controls
	{
		class RscStructuredText_1100: RscText
		{
			idc = 1100;
			x = "0.148661 * safezoneW";
			y = "0.055 * safezoneH";
			w = "0.001 * safezoneW";
			h = "0.495 * safezoneH";
		};
		class exterra_suit_menu_airCombo: RscCombo
		{
			idc = 2100;
			x = "0.154855 * safezoneW";
			y = "0.264 * safezoneH";
			w = "0.0929131 * safezoneW";
			h = "0.022 * safezoneH";
		};
		class exterra_suit_menu_battCombo: RscCombo
		{
			idc = 2101;
			x = "0.154855 * safezoneW";
			y = "0.528 * safezoneH";
			w = "0.0929131 * safezoneW";
			h = "0.022 * safezoneH";
		};
		class RscStructuredText_1101: RscText
		{
			idc = 1101;
			x = "0.149693 * safezoneW";
			y = "0.297 * safezoneH";
			w = "0.0980749 * safezoneW";
			h = "0.002 * safezoneH";
		};
		class exterra_suit_menu_battPicture: RscPicture
		{
			idc = 1203;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "0.154855 * safezoneW";
			y = "0.308 * safezoneH";
			w = "0.0929131 * safezoneW";
			h = "0.077 * safezoneH";
		};
		class exterra_suit_menu_suitPicture: RscPicture
		{
			idc = 1204;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "0.0103236 * safezoneW";
			y = "0.044 * safezoneH";
			w = "0.134208 * safezoneW";
			h = "0.253 * safezoneH";
		};
		class exterra_suit_menu_suitListbox: RscListbox
		{
			idc = 1500;
			x = "0.0103237 * safezoneW";
			y = "0.308 * safezoneH";
			w = "0.134208 * safezoneW";
			h = "0.242 * safezoneH";
		};
		class exterra_suit_menu_battListbox: RscListbox
		{
			idc = 1501;
			x = "0.154855 * safezoneW";
			y = "0.396 * safezoneH";
			w = "0.0929131 * safezoneW";
			h = "0.121 * safezoneH";
		};
		class exterra_suit_menu_airPicture: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = "0.154855 * safezoneW";
			y = "0.044 * safezoneH";
			w = "0.0929131 * safezoneW";
			h = "0.077 * safezoneH";
		};
		class exterra_suit_menu_airListbox: RscListbox
		{
			idc = 1502;
			x = "0.154855 * safezoneW";
			y = "0.132 * safezoneH";
			w = "0.0929131 * safezoneW";
			h = "0.121 * safezoneH";
		};
	};
};

/*class exterra_suit_menu: RscControlsGroupNoScrollbars {
    //["0.0302729 * safezoneW + safezoneX","0.214 * safezoneH + safezoneY","0.258092 * safezoneW","0.572 * safezoneH"]
    idd = 2300;
    movingEnable = 1;
    enableSimulation = 1;
    //onLoad = QUOTE(call FUNC(onMenuOpen));
    //onUnload = QUOTE(call FUNC(onMenuClose));
    //onKeyDown = QUOTE([ARR_3('onKeyDown',_this,QQGVAR(display))] call FUNC(onKeyDown));

    x = QUOTE(POS_X(0.092215));
    y = QUOTE(POS_Y(0.214));
    w = QUOTE(POS_W(0.19615));
    h = QUOTE(POS_H(0.572));

    class controlsBackground {
        class Title: RscText {
            idc = 4492;//IDC_TITLE;
            text = "Title here";//CSTRING(MedicalMenu);
            x = QUOTE(POS_W(0.00516151));
            y = QUOTE(POS_H(0.011));
            w = QUOTE(POS_W(0.185826 ));
            h = QUOTE(POS_H(0.022));
            //["0.00516156 * safezoneW","0.011 * safezoneH","0.247768 * safezoneW","0.022 * safezoneH"]
            colorBackground[] = {1,0.2,0.2,1};//GUI_BCG_COLOR;
            moving = 1;
        };
        class Center: RscText {
            idc = -1;
            x = QUOTE(POS_W(0.0051614));
            y = QUOTE(POS_H(0.044));
            w = QUOTE(POS_W(0.185826));
            h = QUOTE(POS_H(0.5234));
            //["0.00516188 * safezoneW","0.033 * safezoneH","0.247768 * safezoneW","0.528 * safezoneH"]
            colorBackground[] = {0, 0, 0, 0.7};
        };
    class controls {
        class HeaderLine: RscText {
            idc = -1;
            x = QUOTE(POS_W(1.5));
            y = QUOTE(POS_H(2.6));
            w = QUOTE(POS_W(37));
            h = QUOTE(POS_H(0.03));
            //["0.00516188 * safezoneW","0.033 * safezoneH","0.247768 * safezoneW","0.528 * safezoneH"] vert
            //["0.149693 * safezoneW","0.297 * safezoneH","0.0980749 * safezoneW","0.002 * safezoneH"] horiz
            colorBackground[] = {1, 1, 1, 0.5};
        };
        //["0.154855 * safezoneW","0.264 * safezoneH","0.0929131 * safezoneW","0.022 * safezoneH"] combo air
        //["0.154855 * safezoneW","0.528 * safezoneH","0.0929131 * safezoneW","0.022 * safezoneH"] combo batt
        //["0.154855 * safezoneW","0.044 * safezoneH","0.0929131 * safezoneW","0.077 * safezoneH"] air tank pic
        //["0.154855 * safezoneW","0.308 * safezoneH","0.0929131 * safezoneW","0.077 * safezoneH"] batt pic
        //["0.0103236 * safezoneW","0.044 * safezoneH","0.134208 * safezoneW","0.253 * safezoneH"] suit pic
        //["0.0103237 * safezoneW","0.308 * safezoneH","0.134208 * safezoneW","0.242 * safezoneH"] suit list box
        //["0.154855 * safezoneW","0.396 * safezoneH","0.0929131 * safezoneW","0.121 * safezoneH"] batt list box
        //["0.154855 * safezoneW","0.132 * safezoneH","0.0929131 * safezoneW","0.121 * safezoneH"] air list box
    };
};*/
