/*
 * Author: Thrax
 * Update the selected loadout from the load default profiles window
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(getDefaultLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_control", "_selected", "_defaultLoadout", "_loadout", "_loadout_array", "_listItems", "_className", "_info", "_name"];

_control = 7603;
_selected = lbCurSel 7602;

lbClear _control;

if (_selected == -1) exitWith {titleText[(localize "STR_MEU_Equipment_NoProfileSelected"), "PLAIN DOWN"];};

_defaultLoadout = GVAR(DefaultProfiles) select _selected;
_loadout = + _defaultLoadout;
_loadout deleteAt 0;

_loadout_array = [];
{
	switch(typeName _x) do {
		case "STRING": { _loadout_array = _loadout_array + [_x]; };
		case "ARRAY": {	{ _loadout_array = _loadout_array + [_x]; } forEach _x; };
	};
} forEach _loadout;

_listItems = [];
{
	_className = _x;
	_info = [_x,""] call EFUNC(main,getItemDetails);
	if(count _info > 0) then {
		_name = (_info select 0);
		if (_listItems find _name < 1) then {
			lbAdd [_control, format["[%1] %2",({_x == _className} count _loadout_array),_name]];
			lbSetPicture [_control, (lbSize _control)-1, (_info select 1)];
			_listItems = _listItems + [_name];
		};
	};
} forEach _loadout_array;