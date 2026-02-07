class RscPicture;
class RscControlsGroupNoScrollbars;

class GVAR(vomitImage): RscControlsGroupNoScrollbars {
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
};
