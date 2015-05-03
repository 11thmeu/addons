/*
 * Author: Thrax
 * Update the selected loadout from the load virtual profiles window
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * [0] call FUNC(getVRLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_control", "_selected", "_loadout", "_loadout_array", "_listItems", "_className", "_info", "_name", "_virtualInventory"];

_control = 7804;
_selected = lbCurSel 7803;

lbClear _control;

if (_selected == -1) exitWith {titleText[(localize "STR_MEU_Equipment_NoProfileSelected"), "PLAIN DOWN"];};

_virtualInventory = (profilenamespace getvariable ["bis_fnc_saveInventory_data",[]]) select ((2 * _selected) + 1);
_loadout = [_virtualInventory] call FUNC(convertVirtualLoadout);

_loadout_array = [];
{
	switch(typeName _x) do {
		case "STRING": { _loadout_array = _loadout_array + [_x]; };
		
		case "ARRAY": { { _loadout_array = _loadout_array + [_x]; } forEach _x; };
	};
} forEach _loadout;

_listItems = [];
{
	_className = _x;
	_info = [_x, ""] call EFUNC(main,getItemDetails);
	if(count _info > 0) then {
		_name = (_info select 0);
		if (_listItems find _name < 1) then {
			lbAdd [_control, format["[%1] %2",({_x == _className} count _loadout_array),_name]];
			lbSetPicture [_control, (lbSize _control)-1, (_info select 1)];
			_listItems = _listItems + [_name];
		};
	};
} forEach _loadout_array;