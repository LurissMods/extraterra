#include "..\script_component.hpp"
/*
* Author: Luriss
* Main calculation loop for life support. Done to ensure that 1) life support is only enabled and run when desired (I chose this instead of a CBA option), and 2) ensure that life support area calculations are done only on the server.
*
* Arguments:
* Passed from module. Check CfgVehicles.hpp for attribute classes.
*
* Return Value:
* None
*
* Example:
* Called via module in CfgVehicles.hpp.
*
* Public: No
*/

private _logic = _this param [0,objnull,[objnull]];
private _checkTime = _logic getVariable ["checkTime", 0.5];

[
	{
		/*_unitsInArea = [];
		_allUnits = (allUnits - entities "HeadlessClient_F");
        //_allUnits = call CBA_fnc_players;
		{
			_unitsInArea append ((allUnits - entities "HeadlessClient_F") inAreaArray _x);
		} forEach GVAR(allLifeSupportAreas);

        {
			if (GETVAR(_x,EGVAR(lifesupport,unitInAtmo),ATMO_STATE_ERROR) != ATMO_STATE_VACUUM) then {
                SETPVAR(_x,EGVAR(lifesupport,unitInAtmo),ATMO_STATE_VACUUM);
				_x addPrimaryWeaponItem  QUOTE(exterra_vacuumMuzzle);
				_x addSecondaryWeaponItem  QUOTE(exterra_vacuumMuzzle);
			};
		} forEach (_allUnits - _unitsInArea);

        {
			if (GETVAR(_x,EGVAR(lifesupport,unitInRadShield),RAD_SHIELD_ERROR) != 0) then {
				SETPVAR(_x,EGVAR(lifesupport,unitInRadShield),0);
			};
		} forEach (_allUnits - _unitsInArea);*/

		/*{
			if (GETMVAR(LRSS_AI_LIFESUPPORT,objNull) && {!isPlayer _x && {alive _x}}) then {
				SETVAR(_x,LRSS_hasSuit,uniform _x in LRSS_spaceSuits OR (getNumber (configFile >> 'CfgWeapons' >> (uniform _x) >> 'MJOLNIR_isArmor')) == 1);
                SETVAR(_x,LRSS_hasHelmet,headgear _x in LRSS_spaceHelmets OR (getNumber (configFile >> 'CfgWeapons' >> (headgear _x) >> 'MJOLNIR_isHelmet')) == 1);

				if ((GETVAR(_x,lrss_unitInAtmo,-1) == 0) && {!(GETVAR(_x,LRSS_hasHelmet,false) && GETVAR(_x,LRSS_hasSuit,false))}) then {
					[_x, _this,"params" select 1,nil] call lrss_fnc_vacExposure_AI;
				} else {
					SETVAR(_x,lrss_vacExposeInit,false)
				};
			} else {
				if (
					(isPlayer _x)
					&& {!GETVAR(_x,lrss_vacExposeInit,false)
					&& {(GETVAR(_x,lrss_unitInAtmo,-1) == 0)
					&& {alive _x
					&& {!(GETVAR(_x,LRSS_hasHelmet,false) && GETVAR(_x,LRSS_hasSuit,false))
					}}}}) then {
						SETVAR(_x,lrss_vacExposeInit,true);
						_exposeInitCheck = GETVAR(_x,lrss_vacExposeInit,false);
						(owner _x) publicVariableClient "_exposeInitCheck";
						[_x, _this, "params" select 1,nil] remoteExec ["lrss_fnc_vacExposure_client", (owner _x)];
				} else {
					if (
						(isPlayer _x)
						&& {GETVAR(_x,lrss_vacExposeInit,false) && {(GETVAR(_x,lrss_unitInAtmo,-1) != 0) && {!(GETVAR(_x,LRSS_hasHelmet,false) && GETVAR(_x,LRSS_hasSuit,false))}}}
						|| ((lifeState _x) == "DEAD")
						) then {
							SETVAR(_x,lrss_vacExposeInit,false);
							_exposeInitCheck = GETVAR(_x,lrss_vacExposeInit,false);
							(owner _x) publicVariableClient "_exposeInitCheck";
							[_x, _this, "params" select 1,nil] remoteExec ["lrss_fnc_vacExposureEnd_client", (owner _x)];
						};
				};
			};
		} forEach _allUnits;*/
	},
	(0),
	[_logic, _checkTime],
	{GVAR(mainLoopInitalized) = true},
	{GVAR(mainLoopInitalized) = false},
	{true},
	{isNull (_this getVariable "params" select 0)}

] call CBA_fnc_createPerFrameHandlerObject;
