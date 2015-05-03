/*
 * Author: Thrax
 * Update the selected loadout from the save or load window
 *
 * Arguments:
 * 0: Type of dialog (0 = save, 1 = load) <NUMBER>
 *
 * Return Value:
 * -
 *
 * Example:
 * [0] call FUNC(getLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_type", "_selected", "_loadout", "_loadout_array", "_listItems", "_className", "_info", "_name"];

_type = _this select 0;
_control = 0;
_selected = 0;

if (_type == 0) then {
	_control = 7559;	//Save
	_selected = lbCurSel 7558;
} else {
	_control = 7562;	//Load
	_selected = lbCurSel 7561;
};

lbClear _control;

if (_selected == -1) exitWith {titleText[(localize "STR_MEU_Equipment_NoProfileSelected"), "PLAIN DOWN"];};

if (GVAR(EnablePersistence)) then {
	_loadout = profileNamespace getVariable format["meu_dev_equipment_%1",_selected];
} else {
	_loadout = missionNamespace getVariable format["meu_dev_equipment_%1",_selected];
};

if (isNil {_loadout}) exitWith { ctrlSetText [7560, (localize "STR_MEU_Equipment_DefaultLoadoutName")]; };

if (_type == 0) then {
	ctrlSetText [7560, _loadout select 0];
};

_loadout_array = [];
{
	switch(typeName _x) do {
		case "STRING": { _loadout_array = _loadout_array + [_x]; };
		
		case "ARRAY": {
			//Only process array items if its not a radio configuration
			if ((typeName (_x select 0)) != "ARRAY") then {
				{ _loadout_array = _loadout_array + [_x]; } forEach _x;
			};
		};
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
	} else {
		//Unit insignia
		if (isClass (configFile >> "CfgUnitInsignia" >> _x)) then {
			lbAdd [_control, getText(configFile >> "CfgUnitInsignia" >> _x >> "displayName")];
			lbSetPicture [_control, (lbSize _control)-1, getText(configFile >> "CfgUnitInsignia" >> _x >> "texture")];
		};
	};
} forEach _loadout_array;