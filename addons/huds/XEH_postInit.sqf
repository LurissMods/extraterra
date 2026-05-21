#include "script_component.hpp"

["CBA_settingsInitialized", {

    call FUNC(initHUD_US);
    call FUNC(initPFH_HUD);

    // HUD PP must be adjusted to the correct values after init to avoid issues when switching to units
    GVAR(hudPixelation_PP) ppEffectEnable false;
    GVAR(hudPixelation_PP) ppEffectAdjust [GVAR(CBAset_hudPixelationPower)];
    GVAR(hudPixelation_PP) ppEffectCommit 0;

    GVAR(hudChromAb_PP) ppEffectEnable false;
    GVAR(hudChromAb_PP) ppEffectAdjust [GVAR(CBAset_hudChromAbPower), GVAR(CBAset_hudChromAbPower), true];
    GVAR(hudChromAb_PP) ppEffectCommit 0;

    GVAR(hudRadialBlur_PP) ppEffectEnable false;
    GVAR(hudRadialBlur_PP) ppEffectAdjust [GVAR(CBAset_hudRadialBlurPower), GVAR(CBAset_hudRadialBlurPower), GVAR(CBAset_hudRadialBlurOffset), GVAR(CBAset_hudRadialBlurOffset)];
    GVAR(hudRadialBlur_PP) ppEffectCommit 0;

    GVAR(filmGrain_PP) ppEffectEnable false;
    GVAR(filmGrain_PP) ppEffectAdjust [GVAR(CBAset_filmGrainPower), 1.5, 2.01, 0.75, 1.0, 0];
    GVAR(filmGrain_PP) ppEffectCommit 0;

    /*["CBA_SettingChanged", {
        params ["_name", "_value"];

        if (_name select [0, 13] != "exterra_huds_") exitWith {}; // This is here because the CBA event outputs debug info

        // keeping for now just in case I need it later

    }] call CBA_fnc_addEventHandler;*/
}] call CBA_fnc_addEventHandler;

[QGVAR(hudBootCalled),{
    params ["_bootupText", "_bootUpAnims"];

    GVAR(currentBootText) = _bootupText;
    GVAR(currentBootAnims) = _bootUpAnims;

    GVAR(timeSinceLastLine) = CBA_missionTime;
    GVAR(isFireControlBooting) = true;

    SET_BOOT_ACTIVE(ACE_player,true,false);

}] call CBA_fnc_addEventHandler;
