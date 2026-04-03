#include "..\script_component.hpp"
/*
* Author: Luriss
* Initalizes CBA eventhandlers for the ACE medical API.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call exterra_injuries_fnc_addEventHandlers
*
* Public: No
*/

[
    "ace_medical_gui_updateInjuryListGeneral",
    {
        //if (GVAR(KAMLoaded)) exitWith {};
        params ["_ctrl", "_target", "_selectionN", "_entries"];

        private _nonissueColor = [1, 1, 1, 0.33];
        private _mildissueColor = [1, 1, 0, 1];
        private _moderateissueColor = [1, 0.5, 0, 1];
        private _severeissueColor = [1, 0, 0, 1];

        private _currentPlayerCoreTempState = GETVAR(_target,GVAR(unitCurrentCoreTempFlag),nil);

        switch _currentPlayerCoreTempState do {
            case HYPERTHERMIA_STAGE_MILD: {
                _entries pushBack ["Heat Rash", _mildissueColor];
            };
            case HYPERTHERMIA_STAGE_MODERATE: {
                _entries pushBack ["hypertherm mod", _moderateissueColor];
            };
            case HYPERTHERMIA_STAGE_SEVERE: {
                _entries pushBack ["hypertherm severe", _severeissueColor];
            };
        };
    }
] call CBA_fnc_addEventHandler;

[
    "ace_medical_gui_updateInjuryListPart",
    {
        //if (GVAR(KAMLoaded)) exitWith {};
        params ["_ctrl", "_target", "_selectionN", "_entries", "_bodyPartName"];

        private _nonissueColor = [1, 1, 1, 0.33];

        if (_selectionN == 0) then {
            _entries pushBack ["test head issue", [1,0,0,1]];
        };

    }
] call CBA_fnc_addEventHandler;

[
    "ace_medical_gui_updateBodyImage",
    {
        //if (GVAR(KAMLoaded)) exitWith {};
        params ["_ctrlGroup", "_target", "_selectionN"];

        private _currentPlayerCoreTempState = GETVAR(_target,GVAR(unitCurrentCoreTempFlag),nil);
        GET_SUIT_BOOLS(_target) params ["_inFullSuit","_helmetBool","_suitBool","_packBool"];

        if (!_suitBool) then {
            switch _currentPlayerCoreTempState do {
                case HYPERTHERMIA_STAGE_MILD: {
                    private _ctrlHeatRash = _ctrlGroup controlsGroupCtrl 25247;
                    _ctrlHeatRash ctrlShow true;
                };
                case HYPERTHERMIA_STAGE_MODERATE: {

                };
                case HYPERTHERMIA_STAGE_SEVERE: {

                };
            };
        };
    }
] call CBA_fnc_addEventHandler;
