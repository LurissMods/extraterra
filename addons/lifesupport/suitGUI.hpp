class RscText;
class RscButton;
class RscPicture;
class RscListbox;
class RscListNBox;
class RscCombo;
class RscActivePicture;
class RscButtonMenu;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscCheckbox;

class exterra_suit_menu: RscControlsGroupNoScrollbars
{
	idd = 2300;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(call FUNC(onMenuOpen));
    onUnload = QUOTE(call FUNC(onMenuClose));
    x = QUOTE(POS_X(-2.5));
    y = QUOTE(POS_Y(0));
    w = QUOTE(POS_W(45));
    h = QUOTE(POS_H(26));
    class controlsBackground {
        class exterra_suit_menu_titleBar: RscText
		{
			idc = 1200;
            text = "Title here";//CSTRING(MedicalMenu);
            x = QUOTE(POS_W(0.5));
			y = QUOTE(POS_H(0.5));
			w = QUOTE(POS_W(44));
			h = QUOTE(POS_H(1));
            colorBackground[] = {1,0.2,0.2,1};//GUI_BCG_COLOR;
			//colorText[] = {1,0.2,0.2,1};
            moving = 1;
		};
		class exterra_suit_menu_background: RscText
		{
			idc = 1201;
			//text = "#(argb,8,8,3)color(1,1,1,1)";
            x = QUOTE(POS_W(0.5));
			y = QUOTE(POS_H(1.5));
			w = QUOTE(POS_W(44));
			h = QUOTE(POS_H(24));
            colorBackground[] = {0, 0, 0, 0.7};
			//colorText[] = {0,0,0,0.7};
		};
    };
	class Controls
	{
		class exterra_suit_menu_battPicture: RscPicture
		{
			idc = 1203;
			text = "#(argb,8,8,3)color(1,1,1,1)";
            x = QUOTE(POS_W(16));
			y = QUOTE(POS_H(14));
			w = QUOTE(POS_W(9));
			h = QUOTE(POS_H(3.5));
		};
		class exterra_suit_menu_suitPicture: RscPicture
		{
			idc = 1204;
			text = "#(argb,8,8,3)color(1,1,1,1)";
            x = QUOTE(POS_W(1));
			y = QUOTE(POS_H(2));
			w = QUOTE(POS_W(13));
			h = QUOTE(POS_H(11.5));
		};
		class exterra_suit_menu_suitListbox: RscListbox
		{
			idc = 1500;
            x = QUOTE(POS_W(1));
			y = QUOTE(POS_H(14));
			w = QUOTE(POS_W(13));
			h = QUOTE(POS_H(11));
		};
		class exterra_suit_menu_battListbox: RscListbox
		{
			idc = 1501;
            x = QUOTE(POS_W(16));
			y = QUOTE(POS_H(18));
			w = QUOTE(POS_W(9));
			h = QUOTE(POS_H(7));
		};
		class exterra_suit_menu_airPicture: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,1,1,1)";
            x = QUOTE(POS_W(16));
			y = QUOTE(POS_H(2));
			w = QUOTE(POS_W(9));
			h = QUOTE(POS_H(3.5));
		};
		class exterra_suit_menu_airListbox: RscListbox
		{
			idc = 1502;
            x = QUOTE(POS_W(16));
			y = QUOTE(POS_H(6));
			w = QUOTE(POS_W(9));
			h = QUOTE(POS_H(7));
		};
		class exterra_suit_menu_airListboxSelection: RscListNBox
		{
            idc = 1503;
            x = QUOTE(POS_W(25.5));
			y = QUOTE(POS_H(2));
			w = QUOTE(POS_W(18));
			h = QUOTE(POS_H(11));
		};
		class exterra_suit_menu_battListboxSelection: RscListNBox
		{
			idc = 1504;
            x = QUOTE(POS_W(25.5));
			y = QUOTE(POS_H(14));
			w = QUOTE(POS_W(18));
			h = QUOTE(POS_H(11));
		};
	};
};
