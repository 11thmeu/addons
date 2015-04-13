/*
 * Author: Thrax
 * Store the status of a given unit in the server
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: id <NUMBER>
 * 2: uid <STRING>
 * 3: name <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * [unit, [0,0,0], vehicle, loadout, variables] call FUNC(load)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_unit", "_clientUID", "_name", "_position", "_vehicle", "_loadout", "_variables", "_status"];

_unit = _this select 0;
_clientUID = _this select 2;
_name = _this select 3;

//If unit has died dont save status
if (GETVAR(_unit,GVAR(Dead),false)) exitWith {
	LOG(format["[MEU]: Saving status for %1 aborted, the unit is dead", _clientUID]);
};

//Save unit information
_position = getPosATL _unit;

_vehicle = [];
if ((vehicle _unit) != _unit) then {
	_vehicle set[0, (vehicle _unit)];
};

//Unit loadout
_loadout = [_unit] call EFUNC(main,getUnitLoadout);

//Object variables in format [["variableName", "variable value", public?]], i.e. [["badGuy", true, true], ["teamName", "Team1", false]];
_variables = [];

//Store status in a global variable
_status = [_unit, _position, _vehicle, _loadout, _variables];
call compile format ["meu_respawn_Status_%1 = _status;", _clientUID];

LOG(format["[MEU]: Unit %1, status saved", _clientUID]);