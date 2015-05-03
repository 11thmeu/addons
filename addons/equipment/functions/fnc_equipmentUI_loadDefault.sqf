/*
 * Author: Thrax
 * Open the equipment default profiles load dialog
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(equipmentUI_loadDefault)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_profile", "_index", "_picture"];

//Hide camera options
if (GVAR(EnableCamera)) then {
	if (!GVAR(EnableNV)) then {
		ctrlShow [7605, false];
		ctrlSetText [7601, ""];
	};
} else {
	ctrlShow [7604, false];
	ctrlSetText [7600, ""];
	ctrlShow [7605, false];
	ctrlSetText [7601, ""];
};

if (!GVAR(EnableDefaultProfiles)) exitWith {titleText[(localize "STR_MEU_Equipment_OptionDisabled"), "PLAIN DOWN"];};

lbClear 7602;

{
	_profile = _x;
	_index = lbAdd [7602, (_profile select 0)];
	_picture = getText (configFile >> "CfgWeapons" >> (_x select 5) >> "picture");
	lbSetPicture [7602, _index, _picture];
} forEach GVAR(DefaultProfiles);