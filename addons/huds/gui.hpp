class RscControlsGroupNoScrollbars;
class RscProgress;
class RscStructuredText;
class RscPicture;

class exterra_huds_structuredText : RscStructuredText {
    show = 1;
    text = "";
    color[] = {1,1,1,1};
    class Attributes {
        font = QUOTE(RobotoCondensed);
        align = QUOTE(center);
        shadow = 0;
        size = 1;
    };
};

class RscTitles
{
    #include "HUD_US.hpp"
};
