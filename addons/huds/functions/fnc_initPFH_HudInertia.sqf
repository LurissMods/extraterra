#include "..\script_component.hpp"
/*
* Author: Akaviri13, Luriss
* Initalizes the HUD inertia PFH for each player client. Called in the postInit because I want it to run even when suits are off.
* One of the last functions still mostly untouched from Akaviri13's original code!
*
* Arguments:
* [_unit] [<UNIT>]
* ACE_player is fed to this argument via the postInit. Done to ensure the PFH is only fired once per player.
*
* Return Value:
* None
*
* Example:
* [] call exterra_huds_fnc_initPFH_HudInertia
*
* Public: No
*/

params ["_unit"];

if (!isPlayer _unit) exitWith {systemChat format ["(hudInertia) Unit not a player: %1",_unit]};
if (!hasInterface) exitWith {systemChat format ["(hudInertia) Unit client has no interface: %1",_unit]};
if (GETVAR(_unit,GVAR(initPFH_hudInertia_Activated),false)) exitWith {systemChat format ["initHudInertia called twice! Unit: %1",_unit]};

systemChat format ["hudInertia ran for unit! %1",_unit];
_unit setVariable [QGVAR(initPFH_hudInertia_Activated), true, true];

disableSerialization;

GVAR(hudPFH_hudInertia) = [{

    // -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // Hud inertia calculations ----------------------------------------------------------------------------------------------------------------------------------------------------
    // -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    private _cameraview = getCameraViewDirection ACE_player;

    private _newViewAngleX = ([0,0,0] getDir _cameraview); // Gets bearing in degrees

    private _newViewAngleY = (_cameraview select 2) * 1000; // Gets vertical angle, -1000 <= x <= 1000. 0 = horizon.

    private _viewAngleDifferenceY = abs(GVAR(oldViewAngleY) - _newViewAngleY);
    if (_viewAngleDifferenceY > 0.1) then {
        private _angleChangeY = _newViewAngleY - GVAR(oldViewAngleY);
        _angleChangeY = -_angleChangeY;
        if (_angleChangeY > 0) then {
        if (GVAR(hudAngleY) - _angleChangeY >= -400) then {
            GVAR(hudAngleY) = GVAR(hudAngleY) - _angleChangeY;
        };
        } else {
            if (GVAR(hudAngleY) - _angleChangeY <= 400) then {
                GVAR(hudAngleY) = GVAR(hudAngleY) - _angleChangeY;
            };
        };
    } else {
        if (GVAR(hudAngleY) != 0) then {
            private _angleChangeY = GVAR(hudAngleY);

            if (abs(_angleChangeY) < 0.0001) then {
                GVAR(hudAngleY) = 0;
            } else {
                GVAR(hudAngleY) = GVAR(hudAngleY) - (5 * _angleChangeY * diag_deltaTime);
            };
        };
    };

    private _viewAngleDifferenceX = abs(GVAR(oldViewAngleX) - _newViewAngleX);
    if (_viewAngleDifferenceX > 0.02) then {
        private _angleDeltaX = _newViewAngleX - GVAR(oldViewAngleX);
        if (_angleDeltaX > 180) then {_angleDeltaX = _angleDeltaX - 360};
        if (_angleDeltaX < -180) then {_angleDeltaX = _angleDeltaX + 360};

        private _angleChangeX = _angleDeltaX / 1;

        if (_angleChangeX > 0) then {
        if (GVAR(hudAngleX) - _angleChangeX >= -120) then {
            GVAR(hudAngleX) = GVAR(hudAngleX) - _angleChangeX;
        };
        } else {
            if (GVAR(hudAngleX) - _angleChangeX <= 120) then {
                GVAR(hudAngleX) = GVAR(hudAngleX) - _angleChangeX;
            };
        };
    } else {
        if (GVAR(hudAngleX) != 0) then {
            private _angleChangeX = GVAR(hudAngleX) / 1;

            if (abs(_angleChangeX) < 0.0001) then {
                GVAR(hudAngleX) = 0;
            } else {
                GVAR(hudAngleX) = GVAR(hudAngleX) - (3 * _angleChangeX * diag_deltaTime);
            };
        };
    };

    GVAR(oldViewAngleX) = _newViewAngleX;
    GVAR(oldViewAngleY) = _newViewAngleY;

    private _positionAdjustX = abs(safeZoneX) * GVAR(hudAngleX) / 2500;
    private _positionAdjuxtY = abs(safeZoneX) * GVAR(hudAngleY) / 16000;

    [_positionAdjustX, _positionAdjuxtY] call FUNC(positionsHUD_US);
    [_positionAdjustX, _positionAdjuxtY] call EFUNC(injuries,positionsInjuries);

    /*switch (GETVAR(ACE_player,EGVAR(lifesupport,unitSuitFaction),NO_SUIT_FACTION)) do {
        case NO_SUIT_FACTION: {
            systemChat "Error! No suit faction in FUNC(huds,hudInertia)";
        };
        case US_SUIT_FACTION: {
            [_positionAdjustX, _positionAdjuxtY] call FUNC(hudPositions_US)
        };
    };*/

    }, 0, []
] call CBA_fnc_addPerFrameHandler;
