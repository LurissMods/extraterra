#include "..\script_component.hpp"
/*
* Author: Luriss
* Boot up sequence for the US HUD. Called by the suitActivated CBA local event (see (huds, CfgVehicles) and (lifesupport_statemachine, startSuitBootUp)).
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_lifeSupport_fnc_bootHUD_US
*
* Public: No
*/

/*{_x ctrlSetFade 1; _x ctrlCommit 0} forEach GVAR(hudElementsArray_US);
(GVAR(helmetOutline_US)#0) ctrlSetFade 0;
(GVAR(helmetOutline_US)#0) ctrlCommit 0;*/

ACE_player setVariable [QEGVAR(lifesupport,suitActivated), true, true];

if (GVAR(toggleHUDppEffects_cbaSetting)) then {
    GVAR(hudPixelation_PP) ppEffectEnable true;
    GVAR(hudPixelation_PP) ppEffectAdjust [GVAR(hudPixelation_power_cbaSetting)];
    GVAR(hudPixelation_PP) ppEffectCommit 0;

    GVAR(hudChromAb_PP) ppEffectEnable true;
    GVAR(hudChromAb_PP) ppEffectAdjust [GVAR(hudChromAb_power_cbaSetting), GVAR(hudChromAb_power_cbaSetting), true];
    GVAR(hudChromAb_PP) ppEffectCommit 0;

    GVAR(hudRadialBlur_PP) ppEffectEnable true;
    GVAR(hudRadialBlur_PP) ppEffectAdjust [GVAR(hudRadialBlur_power_cbaSetting), GVAR(hudRadialBlur_power_cbaSetting), GVAR(hudRadialBlur_offset_cbaSetting), GVAR(hudRadialBlur_offset_cbaSetting)];
    GVAR(hudRadialBlur_PP) ppEffectCommit 0;

    GVAR(filmGrain_PP) ppEffectEnable true;
    GVAR(filmGrain_PP) ppEffectAdjust [GVAR(filmGrain_power_cbaSetting), 1.5, 2.01, 0.75, 1.0, 0];
    GVAR(filmGrain_PP) ppEffectCommit 0;
};

// Checks if quickbooting is disabled in CBA settings
if (GVAR(toggleBootUp_cbaSetting)) then {

    ACE_player setVariable [QEGVAR(lifesupport,unitBootActive),true];

    /*
    To input an empty line, put "&#160;" in the string.
    < =	&lt;
    > = &gt;
    https://stackoverflow.com/questions/5068951/what-do-lt-and-gt-stand-for
    */
    private _bootupText = [
        ["&#160;",0], //0
        ["0 0 0 1        SArCD.os   / /",3], //1
        ["                   T E X A S    I N S T R U M E N T S   ( c ) ,   2 0 8 9 - 2 0 9 8",0.07], //2
        ["                   V E R S I O N    4 . 5 1 . c",0.05], //3
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
        ["&#160;",3] //53

    ];

    private _bootUpAnims = [
        [
            "
            private _hudElements = [
                (exterra_huds_hudOutline_US#0),
                (exterra_huds_hudLines_US#0),
                (exterra_huds_hudText_US#0),
                (exterra_huds_hudBattProgress_US#0),
                (exterra_huds_hudBattEstTime_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;

            call exterra_huds_fnc_initPFH_HudGeneral;
            ", 14
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudAirProgress_US#0),
                (exterra_huds_hudAirEstTime_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 22
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudExtAtm_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 24
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudTempInt_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 26
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudTempExt_text_US#0),
                (exterra_huds_hudTempWatt_text_US#0),
                (exterra_huds_hudTmeDangTemp_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 28
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudEnvironRad_text_US#0),
                (exterra_huds_hudRadTotal_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 30
        ],
        [
            "playSound 'exterra_huds_hudTestTone_US';", 32
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_helmetOutline_US#0)
            ];
            {_x ctrlSetFade 1; _x ctrlCommit 0;} forEach _hudElements;

            private _hudElements = [
                (exterra_huds_hudBootBist_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 37
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudBootBist_US#0)
            ];
            {_x ctrlSetFade 1; _x ctrlCommit 0;} forEach _hudElements;
            ", 38
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudSquad_name0_text_US#0),
                (exterra_huds_hudSquad_hr0_text_US#0),
                (exterra_huds_hudSquad_bp0_text_US#0),
                (exterra_huds_hudSquad_datalink0_text_US#0),
                (exterra_huds_hudSquad_name1_text_US#0),
                (exterra_huds_hudSquad_hr1_text_US#0),
                (exterra_huds_hudSquad_bp1_text_US#0),
                (exterra_huds_hudSquad_datalink1_text_US#0),
                (exterra_huds_hudSquad_name2_text_US#0),
                (exterra_huds_hudSquad_hr2_text_US#0),
                (exterra_huds_hudSquad_bp2_text_US#0),
                (exterra_huds_hudSquad_datalink2_text_US#0),
                (exterra_huds_hudSquad_name3_text_US#0),
                (exterra_huds_hudSquad_hr3_text_US#0),
                (exterra_huds_hudSquad_bp3_text_US#0),
                (exterra_huds_hudSquad_datalink3_text_US#0),
                (exterra_huds_hudSquad_name4_text_US#0),
                (exterra_huds_hudSquad_hr4_text_US#0),
                (exterra_huds_hudSquad_bp4_text_US#0),
                (exterra_huds_hudSquad_datalink4_text_US#0),
                (exterra_huds_hudSquad_name5_text_US#0),
                (exterra_huds_hudSquad_hr5_text_US#0),
                (exterra_huds_hudSquad_bp5_text_US#0),
                (exterra_huds_hudSquad_datalink5_text_US#0),
                (exterra_huds_hudSquad_name6_text_US#0),
                (exterra_huds_hudSquad_hr6_text_US#0),
                (exterra_huds_hudSquad_bp6_text_US#0),
                (exterra_huds_hudSquad_datalink6_text_US#0),
                (exterra_huds_hudSquad_name7_text_US#0),
                (exterra_huds_hudSquad_hr7_text_US#0),
                (exterra_huds_hudSquad_bp7_text_US#0),
                (exterra_huds_hudSquad_datalink7_text_US#0),
                (exterra_huds_hudSquad_name8_text_US#0),
                (exterra_huds_hudSquad_hr8_text_US#0),
                (exterra_huds_hudSquad_bp8_text_US#0),
                (exterra_huds_hudSquad_datalink8_text_US#0),
                (exterra_huds_hudSquad_name9_text_US#0),
                (exterra_huds_hudSquad_hr9_text_US#0),
                (exterra_huds_hudSquad_bp9_text_US#0),
                (exterra_huds_hudSquad_datalink9_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 42
        ],
        [
            "
            call exterra_huds_fnc_initPFH_FireControl;
            ", 44
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudGrid_text_US#0),
                (exterra_huds_hudBearing_text_US#0),
                (exterra_huds_hudRange_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 46
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudWeaponPrimary_US#0),
                (exterra_huds_hudWeaponSecondary_US#0),
                (exterra_huds_hudWeaponLauncher_US#0),
                (exterra_huds_hudWeaponGrenade_US#0),
                (exterra_huds_hudMagCount_text_US#0),
                (exterra_huds_hudFireMode_text_US#0),
                (exterra_huds_hudWeaponZero_text_US#0),
                (exterra_huds_hudGrenadeCount_text_US#0)
            ];
            {_x ctrlSetFade 0; _x ctrlCommit 0;} forEach _hudElements;
            ", 49
        ],
        [
            "
            private _hudElements = [
                (exterra_huds_hudBootLogo_US#0),
                (exterra_huds_hudBootText_US#0)
            ];
            {_x ctrlSetFade 1; _x ctrlCommit 0;} forEach _hudElements;

            ", 53
        ]
    ];

    (GVAR(hudBootText_US)#0) ctrlSetTextColor GVAR(bootTextColor_cbaSetting);
    (GVAR(hudBootText_US)#0) ctrlSetFade 0;
    (GVAR(hudBootText_US)#0) ctrlCommit 0;

    (GVAR(hudBootLogo_US)#0) ctrlSetFade 0;
    (GVAR(hudBootLogo_US)#0) ctrlCommit 0;

    playSound QGVAR(hudBootSound_US);

    [_bootupText,_bootUpAnims] call FUNC(initPFH_HudBoot);

} else {
    playSound QGVAR(hudBootSound_US);

    call FUNC(initPFH_FireControl);
    call FUNC(initPFH_HudGeneral);

    {_x ctrlSetFade 0; _x ctrlCommit 0.5} forEach GVAR(hudElementsArray_US);
    (GVAR(helmetOutline_US)#0) ctrlSetFade 1;
    (GVAR(helmetOutline_US)#0) ctrlCommit 0;
};
