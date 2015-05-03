/*
 * Author: Thrax
 * Load the selected loadout from virtual loadouts
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(loadVRLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_selected", "_loadout", "_playerLoadout"];

if (!isNil {GVAR(Loading)}) exitWith {};

_selected = lbCurSel 7803;

if (_selected == -1) exitWith {titleText[(localize "STR_MEU_Equipment_NoProfileSelected"), "PLAIN DOWN"];};

_virtualInventory = (profilenamespace getvariable ["bis_fnc_saveInventory_data",[]]) select ((2 * _selected) + 1);
_loadout = [_virtualInventory] call EFUNC(main,convertVirtualLoadout);

GVAR(Loading) = true;

_loadout call EFUNC(main,setPlayerLoadout);

if (GVAR(SetPersonalData)) then {
	call FUNC(setPersonalData);
};

GVAR(Loading) = nil;