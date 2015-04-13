/*
 * Author: Thrax
 * Restore the player status
 *
 * Arguments:
 * 0: Old body <OBJECT>
 * 1: ATL Position <ARRAY>
 * 2: Player vehicle <OBJECT>
 * 3: Player loadout <ARRAY>
 * 4: Player object variables <ARRAY>
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

//Remove event handler
[QGVAR(ReceiveServerData), GVAR(ReceiveServerDataHandlerID)] call ACEFUNC(common,removeEventHandler);

private ["_position", "_vehicle", "_loadout", "_variables", "_assigned"];

_position = _this select 1;
_vehicle = _this select 2;
_loadout = _this select 3;
_variables = _this select 4;

//Set player position / vehicle
if ((count _vehicle) > 0) then  {
	player moveInAny (_vehicle select 0);
} else {
	player setPosATL _position;
};

//Set player loadout
_loadout call EFUNC(main,setPlayerLoadout);

//Set player variables
{
	player setVariable [_x select 0, _x select 1, _x select 2];
} forEach _variables;