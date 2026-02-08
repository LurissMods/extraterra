#include "..\script_component.hpp"
/*
* Author: Luriss
* Checks if player is in direct sunlight. Returns thermal heating in watts.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_mainLoop
*
* Public: No
*/

private _bootStartMissionTime = CBA_missionTime;

_hudElementsBoot = [
    (GVAR(hudOutline_US)#0),
    (GVAR(info_background_US)#0),
    (GVAR(info_background_text_US)#0),
    (GVAR(weapon_background_US)#0),
    (GVAR(info_airRemain_text_US)#0),
    (GVAR(info_battRemain_text_US)#0),
    (GVAR(info_internalTemp_text_US)#0),
    (GVAR(info_externalTemp_text_US)#0),
    (GVAR(info_thermalPowerBalance_text_US)#0),
    (GVAR(info_timeUntilDang_text_US)#0),
    (GVAR(info_externalAtmo_text_US)#0),
    (GVAR(info_radPerHour_text_US)#0),
    (GVAR(info_lifetimeRad_text_US)#0),
    (GVAR(squad_member0_text_US)#0),
    (GVAR(squad_member1_text_US)#0),
    (GVAR(squad_member2_text_US)#0),
    (GVAR(squad_member3_text_US)#0),
    (GVAR(squad_member4_text_US)#0),
    (GVAR(squad_member5_text_US)#0),
    (GVAR(squad_member6_text_US)#0),
    (GVAR(squad_member7_text_US)#0),
    (GVAR(squad_member8_text_US)#0),
    (GVAR(squad_member9_text_US)#0),
    (GVAR(squad_member10_text_US)#0),
    (GVAR(squad_member11_text_US)#0),
    (GVAR(squad_member12_text_US)#0),
    (GVAR(squad_member13_text_US)#0),
    (GVAR(squad_member14_text_US)#0),
    (GVAR(squad_member15_text_US)#0),
    (GVAR(squad_member16_text_US)#0),
    (GVAR(squad_member17_text_US)#0),
    (GVAR(squad_member0_heart_US)#0),
    (GVAR(squad_member1_heart_US)#0),
    (GVAR(squad_member2_heart_US)#0),
    (GVAR(squad_member3_heart_US)#0),
    (GVAR(squad_member4_heart_US)#0),
    (GVAR(squad_member5_heart_US)#0),
    (GVAR(squad_member6_heart_US)#0),
    (GVAR(squad_member7_heart_US)#0),
    (GVAR(squad_member8_heart_US)#0),
    (GVAR(squad_member9_heart_US)#0),
    (GVAR(squad_member10_heart_US)#0),
    (GVAR(squad_member11_heart_US)#0),
    (GVAR(squad_member12_heart_US)#0),
    (GVAR(squad_member13_heart_US)#0),
    (GVAR(squad_member14_heart_US)#0),
    (GVAR(squad_member15_heart_US)#0),
    (GVAR(squad_member16_heart_US)#0),
    (GVAR(squad_member17_heart_US)#0),
    (GVAR(airBar_US)#0),
    (GVAR(battBar_US)#0),
    (GVAR(rangefinder_background_US)#0),
    (GVAR(weapon_currentWeapon_US)#0),
    (GVAR(weapon_secondWeapon_US)#0),
    (GVAR(weapon_launcher_US)#0),
    (GVAR(weapon_grenade_US)#0),
    (GVAR(rangefinder_grid_US)#0),
    (GVAR(rangefinder_bearing_US)#0),
    (GVAR(rangefinder_range_US)#0),
    (GVAR(weapon_weaponMagazines_text_US)#0),
    (GVAR(weapon_fireMode_text_US)#0),
    (GVAR(weapon_grenade_text_US)#0),
    (GVAR(weapon_grenadeAmount_text_US)#0),
    (GVAR(weapon_weaponZero_text_US)#0)
];
{_x ctrlSetFade 1; _x ctrlCommit 0} forEach _hudElementsBoot;
(GVAR(helmetOutline_US)#0) ctrlSetFade 0;
(GVAR(helmetOutline_US)#0) ctrlCommit 0;

ACE_player setVariable [QEGVAR(lifesupport,suitActivated), true, true];

if (GVAR(toggleHUDppEffects)) then {
    GVAR(hudPixelation_PP) ppEffectEnable true;
    GVAR(hudPixelation_PP) ppEffectAdjust [GVAR(hudPixelation_power)];
    GVAR(hudPixelation_PP) ppEffectCommit 0;

    GVAR(hudChromAb_PP) ppEffectEnable true;
    GVAR(hudChromAb_PP) ppEffectAdjust [GVAR(hudChromAb_power), GVAR(hudChromAb_power), true];
    GVAR(hudChromAb_PP) ppEffectCommit 0;

    GVAR(hudRadialBlur_PP) ppEffectEnable true;
    GVAR(hudRadialBlur_PP) ppEffectAdjust [GVAR(hudRadialBlur_power), GVAR(hudRadialBlur_power), GVAR(hudRadialBlur_offset), GVAR(hudRadialBlur_offset)];
    GVAR(hudRadialBlur_PP) ppEffectCommit 0;

    GVAR(filmGrain_PP) ppEffectEnable true;
    GVAR(filmGrain_PP) ppEffectAdjust [GVAR(filmGrain_power), 1.5, 2.01, 0.75, 1.0, 0];
    GVAR(filmGrain_PP) ppEffectCommit 0;
};


// Checks if quickbooting is disabled in CBA settings
if (GVAR(toggleBootUp)) then {
    private _input = "";
    private _bootupText = [];

    /*
    To input an empty line, put "&#160;" in the string.
    < =	&lt;
    > = &gt;
    https://stackoverflow.com/questions/5068951/what-do-lt-and-gt-stand-for
    */
    _bootupText = [
        ["&#160;",0], //0
        ["0 0 0 1        SArCD.os   / /",3], //1
        ["                   T E X A S    I N S T R U M E N T S   ( c ) ,   2 0 8 9 - 2 0 9 8",0.07], //2
        ["                   V E R.    4 . 5 1 . c",0.05], //3
        ["&#160;",0.05], //4
        ["S Y S B O O T \ &gt; :      I N I T",0.05], //5
        ["0 0 0 2        R O M    C H E C K . . . ",2], //6
        ["0 0 0 3	       R O M    O K",0.5], //7
        ["&#160;",0.02], // 0.05 = time before next line, 8
        ["|  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :   |",0.05], //9
        ["&#160;",0.05], //10
        ["0 0 0 4        P O W E R    B O O T \  &gt; :",0.05], //11
        ["0 0 0 5        P O W E R    B I S T . . . ",0.05], //12
        ["0 0 0 6	       P O W E R    O K",1], //13
        ["0 0 0 7        U I    B O O T \  &gt; :",0.02], //14
        ["&#160;",0.05], //15
        ["0 0 0 8        L I F E    S U P P O R T    B O O T \  &gt; :",0.05], //16
        ["0 0 0 9        B I O - M O N I T O R    B I S T . . . ",0.05], //17
        ["0 0 1 0	       B I O - M O N I T O R    O K",1], //18
        ["0 0 1 1        L C V G    B I S T . . . ",0.02], //19
        ["0 0 1 2	       L C V G    O K",0.75], //20
        ["0 0 1 3        A I R    B I S T . . . ",0.02], //21
        ["0 0 1 4	       A I R    O K",1.5], //22
        ["0 0 1 5        E X T    A T M O S P H E R E    S E N O R S    B I S T . . . ",0.02], //23
        ["0 0 1 6	       E X T    A T M O S P H E R E    S E N O R S    O K",0.5], //24
        ["0 0 1 7        I N T    T H E R M A L    M O N I T O R    B I S T . . . ",0.02], //25
        ["0 0 1 8	       I N T    T H E R M A L    M O N I T O R    O K",0.25], //26
        ["0 0 1 9        E X T    T H E R M A L    M O N I T O R    B I S T . . . ",0.02], //27
        ["0 0 2 0	       E X T    T H E R M A L    M O N I T O R    O K",4], //28
        ["0 0 2 1        R A D I A T I O N    M O N I T O R    B I S T . . . ",0.02], //29
        ["0 0 2 2	       R A D I A T I O N    M O N I T O R    O K",1], //30
        ["0 0 2 3        A U D I O   B O O T \  &gt; :",0.01], //31
        ["0 0 2 4        A U D I O    B I S T . . . ",0.05], //32
        ["0 0 2 5	       A U D I O    O K",2.9], //33
        ["0 0 2 6        D I S P L A Y    B O O T \  &gt; :",0.02], //34
        ["0 0 2 7        S Y S T E M    C A M E R A S    B I S T . . . ",0.05], //35
        ["0 0 2 8	       S Y S T E M    C A M E R A S    O K",1], //36
        ["0 0 2 9        D I S P L A Y    C A M E R A S    B I S T . . . ",0.02], //37
        ["0 0 3 0	       D I S P L A Y    C A M E R A S    O K",3], //38
        ["0 0 3 1        F I R E    C O N T R O L    S Y S T E M    B O O T \  &gt; :",0.02], //39
        ["0 0 3 2        D A T A L I N K    I N I T . . . ",0.05], //40
        ["0 0 3 3        D A T A L I N K    C O N N E C T I N G . . . ",0.5], //41
        ["0 0 3 4        D A T A L I N K    C O N N E C T E D !",2], //42
        ["0 0 3 5        F I R E    C O N T R O L    B I S T . . . ",0.02], //43
        ["0 0 3 6	       F I R E    C O N T R O L    O K",5], //44
        ["0 0 3 7        R A N G E F I N D E R    B I S T . . . ",0.02], //45
        ["0 0 3 8	       R A N G E F I N D E R    O K",0.5], //46
        ["0 0 3 9        W E A P O N    I N F O    D I S P L A Y    B O O T \  &gt; :",0.02], //47
        ["0 0 4 0        E Q U I P M E N T    S M A R T - M O N I T O R  (TM)    B I S T . . . ",0.05], //48
        ["0 0 4 1	       E Q U I P M E N T    S M A R T - M O N I T O R  (TM)    O K",3], //49
        ["|  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :  :   |",0.02], //50
        ["- - - - -    B O O T    C O M P L E T E !    - - - - -",0.05], //51
        ["&#160;",0.05], //52
        ["&#160;",3] //52

    ];

    _bootUpAnims = [
        [
            "
            private _hudElements = [
                (exterra_huds_hudOutline_US#0),
                (exterra_huds_info_background_text_US#0),
                (exterra_huds_info_background_US#0),
                (exterra_huds_weapon_background_US#0),
                (exterra_huds_rangefinder_background_US#0),
                (exterra_huds_battBar_US#0),
                (exterra_huds_info_battRemain_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 14
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_airBar_US#0),
                (exterra_huds_info_airRemain_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 22
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_info_externalAtmo_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 24
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_info_internalTemp_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 26
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_info_externalTemp_text_US#0),
                (exterra_huds_info_thermalPowerBalance_text_US#0),
                (exterra_huds_info_timeUntilDang_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 28
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_info_radPerHour_text_US#0),
                (exterra_huds_info_lifetimeRad_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 30
        ],
        [
            "playSound 'exterra_huds_hudTestTone_US';", 32
        ],
        [
            "
            player setVariable ['LRSS_MJOLNIR_outlineHidden',true];
            private _hudElements = [
                (exterra_huds_helmetOutline_US#0)
            ];
            {_x ctrlSetFade 1; _x ctrlCommit 0;} forEach _hudElements;

            private _hudElements = [
                (exterra_huds_bootup_bistGrid_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 37
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_bootup_bistGrid_US#0)
            ];
            {_x ctrlSetFade 1; _x ctrlCommit 0;} forEach _hudElements;
            ", 38
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_squad_member0_text_US#0),
                (exterra_huds_squad_member1_text_US#0),
                (exterra_huds_squad_member2_text_US#0),
                (exterra_huds_squad_member3_text_US#0),
                (exterra_huds_squad_member4_text_US#0),
                (exterra_huds_squad_member5_text_US#0),
                (exterra_huds_squad_member6_text_US#0),
                (exterra_huds_squad_member7_text_US#0),
                (exterra_huds_squad_member8_text_US#0),
                (exterra_huds_squad_member9_text_US#0),
                (exterra_huds_squad_member10_text_US#0),
                (exterra_huds_squad_member11_text_US#0),
                (exterra_huds_squad_member12_text_US#0),
                (exterra_huds_squad_member13_text_US#0),
                (exterra_huds_squad_member14_text_US#0),
                (exterra_huds_squad_member15_text_US#0),
                (exterra_huds_squad_member16_text_US#0),
                (exterra_huds_squad_member17_text_US#0),
                (exterra_huds_squad_member0_heart_US#0),
                (exterra_huds_squad_member1_heart_US#0),
                (exterra_huds_squad_member2_heart_US#0),
                (exterra_huds_squad_member3_heart_US#0),
                (exterra_huds_squad_member4_heart_US#0),
                (exterra_huds_squad_member5_heart_US#0),
                (exterra_huds_squad_member6_heart_US#0),
                (exterra_huds_squad_member7_heart_US#0),
                (exterra_huds_squad_member8_heart_US#0),
                (exterra_huds_squad_member9_heart_US#0),
                (exterra_huds_squad_member10_heart_US#0),
                (exterra_huds_squad_member11_heart_US#0),
                (exterra_huds_squad_member12_heart_US#0),
                (exterra_huds_squad_member13_heart_US#0),
                (exterra_huds_squad_member14_heart_US#0),
                (exterra_huds_squad_member15_heart_US#0),
                (exterra_huds_squad_member16_heart_US#0),
                (exterra_huds_squad_member17_heart_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 42
        ],
        [
            "
            player setvariable ['exterra_huds_fireControlEnabled', true];
            call exterra_huds_fnc_initIFFHandler;
            call exterra_huds_fnc_initFireControlHandler;
            ", 44
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_rangefinder_grid_US#0),
                (exterra_huds_rangefinder_bearing_US#0),
                (exterra_huds_rangefinder_range_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 46
        ],
        [
            "
            private _hudElements = [
               (exterra_huds_weapon_currentWeapon_US#0),
                (exterra_huds_weapon_secondWeapon_US#0),
                (exterra_huds_weapon_launcher_US#0),
                (exterra_huds_weapon_grenade_US#0),
                (exterra_huds_weapon_weaponMagazines_text_US#0),
                (exterra_huds_weapon_fireMode_text_US#0),
                (exterra_huds_weapon_grenade_text_US#0),
                (exterra_huds_weapon_grenadeAmount_text_US#0),
                (exterra_huds_weapon_weaponZero_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 49
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_bootup_logo_US#0),
                (exterra_huds_bootup_text_US#0)
            ];
            {_x ctrlSetFade 1; _x ctrlCommit 0;} forEach _hudElements;

            //player setvariable ['LRSS_MJOLNIR_HUD_ALLOWED', true];
            ['exterra_huds_suitActivated', ACE_player] call CBA_fnc_localEvent;
            ", 53
        ]
    ];

    private _bootUpLines = [];
    private _textField = (GVAR(bootup_text_US)#0);
    _textField ctrlSetTextColor GVAR(bootTextColor);
    _textField ctrlSetFade 0;
    _textField ctrlCommit 0;

    private _textHeadline = (GVAR(bootup_headline_text_US)#0);
    private _bootLogo = (GVAR(bootup_logo_US)#0);
    private _bootBistGrid = (GVAR(bootup_bistGrid_US)#0);
    private _textToShow = "";
    //LRSS_BOOT_OFFSET = 0.022;
    private _textScale = safeZoneH / 3.5;
    private _structuredTextProperties = "<t align='left'" + format [" size='%1'>",_textScale] + "%1</t>";

    playSound QGVAR(hudBootSound_US);
    _bootLogo ctrlSetPosition BOOTUP_LOGO_US_POS;
    _bootLogo ctrlSetFade 0;
    _bootLogo ctrlCommit 0;

    private _delay = 0;
    private _currentHudAnim = 0;
} else {
    playSound QGVAR(hudBootSound_US);

    {_x ctrlSetFade 0; _x ctrlCommit 0.5} forEach _hudElementsBoot;
    (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
    (GVAR(helmetOutline_US)#0) ctrlCommit 0;
};
