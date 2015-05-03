/*
 * Author: Thrax
 * Save the current loadout in the selected slot
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(saveLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_title", "_selected", "_loadout"];

_title = ctrlText 7560;
_selected = lbCurSel 7558;

if (_selected == -1) exitWith { titleText[localize("STR_MEU_Equipment_NoProfileSelected"), "PLAIN DOWN"]; };

_loadout = [ACE_Player] call EFUNC(main,getUnitLoadout);
_loadout = [_loadout, [_title], 0] call BIS_fnc_arrayInsert;
_loadout pushBack (call EFUNC(main,getAllRadiosSettings));

if (GVAR(EnablePersistence)) then {
	profileNameSpace setVariable[format["meu_dev_equipment_%1", _selected], _loadout];
	saveProfileNamespace;
} else {
	missionNamespace setVariable[format["meu_dev_equipment_%1", _selected], _loadout];
};

//TODO ACE VARIABLES

[0,true] spawn FUNC(equipmentUI_saveload);