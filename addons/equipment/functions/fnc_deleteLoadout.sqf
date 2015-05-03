/*
 * Author: Thrax
 * Remove the selected loadout from profile
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(deleteLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_selected", "_data"];

_selected = lbCurSel 7561;

if (_selected == -1) exitWith {titleText[(localize "STR_MEU_Equipment_NoProfileSelected"), "PLAIN DOWN"];};

if (GVAR(EnablePersistence)) then {
	_data = profileNameSpace getVariable format["meu_dev_equipment_%1", _selected];
} else {
	_data = missionNamespace getVariable format["meu_dev_equipment_%1", _selected];
};

if (isNil {_data}) exitWith {titleText [(localize "STR_MEU_Equipment_DeleteLoadoutNotPossible"), "PLAIN DOWN"];};

if (GVAR(EnablePersistence)) then
{
	titleText[format["%1:\n%2", localize "STR_MEU_Equipment_LoadoutDeleted", (profileNameSpace getVariable format["meu_dev_equipment_%1", _selected]) select 0], "PLAIN DOWN"];
	profileNameSpace setVariable[format["meu_dev_equipment_%1", _selected], nil];
	saveProfileNamespace;
	[1,true] spawn MEU_fnc_equipmentDialog_saveLoad;
}
else
{
	titleText[format["%1:\n%2", localize "STR_MEU_Equipment_LoadoutDeleted", (missionNamespace getVariable format["meu_dev_equipment_%1", _selected]) select 0], "PLAIN DOWN"];
	missionNamespace setVariable[format["meu_dev_equipment_%1", _selected], nil];
	[1,true] spawn MEU_fnc_equipmentDialog_saveLoad;
};