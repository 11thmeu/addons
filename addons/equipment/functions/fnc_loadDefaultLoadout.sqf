/*
 * Author: Thrax
 * Load the selected loadout from default loadouts
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(loadDefaultLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_selected", "_loadout", "_playerLoadout"];

if (!isNil {GVAR(Loading)}) exitWith {};

_selected = lbCurSel 7602;

if (_selected == -1) exitWith { titleText[(localize "STR_MEU_Equipment_NoProfileSelected"), "PLAIN DOWN"]; };

_loadout = GVAR(DefaultProfiles) select _selected;

GVAR(Loading) = true;

_playerLoadout = + _loadout;
_playerLoadout deleteAt 0;
_playerLoadout call EFUNC(main,setPlayerLoadout);

if (GVAR(SetPersonalData)) then {
	call FUNC(setPersonalData);
};

GVAR(Loading) = nil;