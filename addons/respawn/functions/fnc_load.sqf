/*
	Author: Thrax

	Description:
	Restore the player status


	Parameter(s):
		0: OBJECT - Old body
		1: ARRAY - ATL Position [x,y,z] 
		2: ARRAY - Player vehicle [Vehicle]
		3: ARRAY - Player loadout
		4: ARRAY - Player object variables

	Returns:
	-
*/

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
_loadout call MEU_fnc_setPlayerLoadout;

//Set player variables
{
	player setVariable [_x select 0, _x select 1, _x select 2];
} forEach _variables;

//Undefine player status variable
MEU_Respawn_Status = nil;