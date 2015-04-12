/*
	Author: Thrax

	Description:
	Store the status of a given unit in the server


	Parameter(s):
		0: OBJECT - unit
		1: NUMBER - id
		2: STRING - uid
		3: STRING - name

	Returns:
	-
*/

#include "\x\cba\addons\main\script_macros.hpp"
ISNILS(cse_sys_medical, false);

private ["_unit", "_clientUID", "_name", "_position", "_vehicle", "_loadout", "_variables", "_status"];

_unit = _this select 0;
_clientUID = _this select 2;
_name = _this select 3;

["Medical",format["Saving status for %1", _clientUID]] call MEU_fnc_debug;

//If unit has died dont save status
if (_unit getVariable ["MEU_Respawn_IsDead", false]) exitWith {
	["Medical",format["Saving status for %1 aborted, the unit is dead", _clientUID]] call MEU_fnc_debug;
};

//Save unit information
_position = getPosATL _unit;

_vehicle = [];
if ((vehicle _unit) != _unit) then {
	_vehicle set[0, (vehicle _unit)];
};

//Unit loadout
_loadout = [_unit] call MEU_fnc_getUnitLoadout;

//Object variables in format [["variableName", "variable value", public?]], i.e. [["badGuy", true, true], ["teamName", "Team1", false]];
_variables = [];

//Store status in a global variable
_status = [_unit, _position, _vehicle, _loadout, _variables];
call compile format ["MEU_Respawn_Status_%1 = _status;", _clientUID];

["Medical", format["Unit %1, status saved: %2", _clientUID, _status]] call MEU_fnc_debug;