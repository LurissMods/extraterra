class RscPicture;
class RscControlsGroupNoScrollbars;

class RscTitles
{
    class exterra_injuries_vomit_UI {
        idd = -1;
        onLoad = "uiNamespace setVariable ['exterra_injuries_vomit_UI', _this select 0];";
        onUnload = "uiNamespace setVariable ['exterra_injuries_vomit_UI', nil];";
        movingEnable=1;
        fadein=0;
        fadeout=0;
        duration = 1e+6;
        class controlsBackground
        {
            class exterra_injuries_vomitMild: RscPicture {
                idc = IDC_VOMIT_MILD;
                text = QPATHTOF(data\ui\exterra_injuries_vomitMild_ca.paa);
                color[] = {1,1,1,1};
            };
        };
    };
};


/*class GVAR(vomitImage): RscControlsGroupNoScrollbars {
    idc = IDC_VOMIT;
    x = QUOTE(POS_X(0.5));
    y = QUOTE(POS_Y(0.5));
    w = QUOTE(POS_W(39));
    h = QUOTE(POS_H(24));
    class controls {
        class Vomit_Mild: RscPicture {
            idc = IDC_VOMIT_MILD;
            text = QPATHTOF(data\ui\exterra_injuries_vomit_ca.paa);
            colorText[] = {1, 1, 1, 1};
            //show = 0;
            x = 0;
            y = 0;
            w = QUOTE(POS_W(12.33));
            h = QUOTE(POS_H(12.33));
        };
    };
};*/
