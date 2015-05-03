/*
 * Author: Thrax
 * Load the selected loadout from the profile
 *
 * Arguments:
 * 0: (optional) Profile selected <NUMBER>
 *
 * Return Value:
 * -
 *
 * Example:
 * [0] call FUNC(loadLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_selected", "_loadout", "_playerLoadout", "_radioSettings"];

if (!isNil {GVAR(Loading)}) exitWith {titleText[(localize "STR_MEU_Equipment_LoadNotFinished"), "PLAIN DOWN"];};

_selected = 0;
if (isNil {_this select 0}) then {
	_selected = lbCurSel 7561;
} else {
	_selected = _this select 0;
};

if (_selected == -1) exitWith {titleText[(localize "STR_MEU_Equipment_NoProfileSelected"), "PLAIN DOWN"];};

if(GVAR(EnablePersistence)) then
{
	_loadout = profileNamespace getVariable format["meu_dev_equipment_%1", _selected];
}
else
{
	_loadout = missionNamespace getVariable format["meu_dev_equipment_%1", _selected];
};

//TODO ACE VARIABLES

if (isNil {_loadout}) exitWith {titleText[(localize "STR_MEU_Equipment_ProfileDoesntExist"), "PLAIN DOWN"];};

GVAR(Loading) = true;

_playerLoadout = + _loadout;
_playerLoadout deleteAt 0;
_playerLoadout call EFUNC(main,setPlayerLoadout);

//If radio settings exist, load them before finishing player load
if ((count _playerLoadout) == 18) then {
	_radioSettings = (_playerLoadout select 17);
	
	if ((count (_radioSettings select 0) > 0) || (count (_radioSettings select 1) > 0) || (count (_radioSettings select 2) > 0)) then {
		_radioSettings spawn {
			titleText[(localize "STR_MEU_Equipment_LoadRadio"), "PLAIN DOWN"];
			sleep 5;
			waitUntil {sleep 1; (count (false call TFAR_fnc_radioToRequestCount) == 0)};
			_this call EFUNC(main,setAllRadiosSettings);
			titleText[(localize "STR_MEU_Equipment_RadiosLoaded"), "PLAIN DOWN"];
			GVAR(Loading) = nil;
		};
	} else {
		GVAR(Loading) = nil;
	};
} else {
	GVAR(Loading) = nil;
};

//If set player data enabled, set it
if (GVAR(SetPersonalData)) then {
	call FUNC(setPersonalData);
};