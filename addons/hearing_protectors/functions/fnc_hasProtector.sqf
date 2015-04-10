#include "script_component.hpp"

/*
 * Author: Kavinsky
 *
 * Check if the player has a soundtrap
 *
 * Arguments:
 * 0: unit to check the sound protection level
 *
 * Return Value:
 * Boolean
 */

private["_unit", "_ret", "_item"];

PARAMS_1(_unit);

_item = headgear _unit;
if(_item == "") then {
	_item = goggles _unit;
};

_ret = _item in GVAR(itemList);

if (!_ret) then {

};

_ret;