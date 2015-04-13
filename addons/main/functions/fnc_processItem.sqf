/*
 * Author: Thrax
 * If the given item is a TFAR/ACRE2 radio return the parent radio, otherwise return the given item
 *
 * Arguments:
 * 0: item classname <STRING>
 *
 * Return Value:
 * Either the parent radio or the given item <STRING>
 *
 * Example:
 * ["classname"] call FUNC(processItem)
 *
 * Public: [YES]
 */
#include "script_component.hpp"

private ["_item", "_return", "_radio"];

_item = [_this, 0, "", [""]] call BIS_fnc_param;
_return = _item;

if (isClass(configFile >> "CfgPatches" >> "task_force_radio_items")) then {
	_radio = getText (configFile >> "CfgWeapons" >> _item >> "tf_parent");
	if (typeName _radio == "STRING" && _radio != "") then {
		_return = _radio;
	};
};

if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {
	_radio = getText (configFile >> "CfgWeapons" >> _item >> "acre_baseClass");
	if (typeName _radio == "STRING" && _radio != "") then {
		_return = _radio;
	};
};

_return 