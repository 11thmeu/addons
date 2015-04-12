/*
	Author: Thrax

	Description:
	Sets the player as dead


	Parameter(s):
		0: OBJECT - unit that died
		1: BOOL - true if cms revive is enabled and time ran out

	Returns:
	-
*/

private ["_unit", "_ranOut", "_forceRespawn", "_clientID"];

["Medical","Killed function called"] call MEU_fnc_debug;

_unit = _this select 0;
_ranOut = _this select 1;

if (!_ranOut) exitWith {["Medical","Killed function - timer did not run out"] call MEU_fnc_debug;};

//Exit if module is not enabled
if (isNil "MEU_Respawn_Dead") exitWith {["Medical","Killed function - module not enabled"] call MEU_fnc_debug;};

//Exit if unit is not a player
if (!(isPlayer _unit)) exitWith {["Medical","Killed function - unit is not a player"] call MEU_fnc_debug;};

//Exit if unit in not local player
_clientID = getPlayerUID player;
if ((getPlayerUID _unit) != _clientID) exitWith {["Medical","Killed function - unit is not local player"] call MEU_fnc_debug;};

//Exit if local client is already dead
if (MEU_Respawn_Dead) exitWith {["Medical","Killed function - player already dead"] call MEU_fnc_debug;};

MEU_Respawn_Dead = true;

//Set this unit as dead to all clients
_unit setVariable ["MEU_Respawn_IsDead", true, true];

//Delete player information
[[player, true], "MEU_fnc_respawnModule_server", false, false] call BIS_fnc_MP;

["Medical","Killed function finished"] call MEU_fnc_debug;