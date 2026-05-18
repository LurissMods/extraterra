class RscPicture;
class RscControlsGroupNoScrollbars;

class RscTitles
{
    class GVAR(vomit_UI) {
        idd = -1;
        onLoad = "uiNamespace setVariable ['exterra_injuries_vomit_UI', _this select 0];";
        onUnload = "uiNamespace setVariable ['exterra_injuries_vomit_UI', nil];";
        movingEnable=1;
        fadein=0;
        fadeout=0;
        duration = 1e+6;
        class controlsBackground
        {
            class exterra_injuries_vomitMild_screen: RscPicture {
                idc = IDC_VOMIT_MILD_SCREEN;
                text = QPATHTOF(data\ui\exterra_injuries_vomitMild_screen_ca.paa);
                color[] = {1,1,1,1};
            };
            class exterra_injuries_vomitModerate_screen: RscPicture {
                idc = IDC_VOMIT_MODERATE_SCREEN;
                text = QPATHTOF(data\ui\exterra_injuries_vomitModerate_screen_ca.paa);
                color[] = {1,1,1,1};
            };
            class exterra_injuries_vomitSevere_screen: RscPicture {
                idc = IDC_VOMIT_SEVERE_SCREEN;
                text = QPATHTOF(data\ui\exterra_injuries_vomitSevere_screen_ca.paa);
                color[] = {1,1,1,1};
            };
        };
    };
};


class ace_medical_gui_BodyImage: RscControlsGroupNoScrollbars {
    class controls {
        class Background;
        //class LegRight;
        class heatRash: Background {
            idc = 25247;
            show = 0;
            text = QPATHTOF(data\body_image\heatRash.paa);
        };
        class cyanosis: Background {
            idc = 25248;
            show = 0;
            text = QPATHTOF(data\body_image\exterra_injuries_cyanosis_ca.paa);
        };
    };
};
