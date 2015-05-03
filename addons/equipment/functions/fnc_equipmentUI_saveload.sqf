/*
 * Author: Thrax
 * Open the equipment save or load dialog
 *
 * Arguments:
 * 0: Type of dialog (0=save, 1=load) <NUMBER>
 * 1: (optional) update loadout <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(equipmentUI_saveLoad)
 *
 * Public: [No]
 */
#include "script_component.hpp"

#define EQUIPMENT_LOADOUTS 20

private ["_type", "_show", "_control"];

_type = _this select 0;

if (_type == 0) then {
	_control = 7558;	//Save
	
	//Hide camera options
	if (GVAR(EnableCamera)) then {
		if (!GVAR(EnableNV)) then {
			ctrlShow [7575, false];
			ctrlSetText [7587, ""];
		};
	} else {
		ctrlShow [7574, false];
		ctrlSetText [7586, ""];
		ctrlShow [7575, false];
		ctrlSetText [7587, ""];
	};

} else {
	_control = 7561;	//Load
	
	//Hide camera options
	if (GVAR(EnableCamera)) then {
		if (!GVAR(EnableNV)) then {
			ctrlShow [7577, false];
			ctrlSetText [7589, ""];
		};
	} else {
		ctrlShow [7576, false];
		ctrlSetText [7588, ""];
		ctrlShow [7577, false];
		ctrlSetText [7589, ""];
	};
};

if (isNil {_this select 1}) then {
	_show = false;
} else {
	_show = true;
};

if (!GVAR(EnableSaveLoad)) exitWith {titleText[(localize "STR_MEU_Equipment_OptionDisabled"), "PLAIN DOWN"];};

lbClear _control;

if (GVAR(EnablePersistence)) then {
	for "_i" from 0 to (EQUIPMENT_LOADOUTS-1) do {
		if(!isNil {profileNamespace getVariable format["meu_dev_equipment_%1",_i]}) then {
			lbAdd [_control,format["%1",(profileNamespace getVariable format["meu_dev_equipment_%1",_i]) select 0]];
		} else {
			lbAdd [_control,format["%1 %2",(localize "STR_MEU_Equipment_DefaultLoadoutTitle"), _i+1]];
		};
	};
} else {
	for "_i" from 0 to (EQUIPMENT_LOADOUTS-1) do {
		if(!isNil {missionNamespace getVariable format["meu_dev_equipment_%1",_i]}) then {
			lbAdd [_control,format["%1",(missionNamespace getVariable format["meu_dev_equipment_%1",_i]) select 0]];
		} else {
			lbAdd [_control,format["%1 %2",(localize "STR_MEU_Equipment_DefaultLoadoutTitle"), _i+1]];
		};
	};
};

if(_show) then {
	[_type] call FUNC(getLoadout);
};