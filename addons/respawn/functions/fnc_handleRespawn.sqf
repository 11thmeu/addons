/*
 * Author: Thrax
 * Move player out of the map and block any movement/visibility
 *
 * Arguments:
 * 0: Object the event handler is assigned to <OBJECT>
 * 1: Object the event handler was assigned to, aka the corpse/unit player was previously controlling <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [unit, unit] call FUNC(handleRespawn)
 *
 * Public: [No]
 */
#include "script_component.hpp"

//Teleport out of map
ACE_Player setPos [0,0,0];

//Set player status
[ACE_Player, QGVAR(Dead), true] call ACEFUNC(common,setCaptivityStatus);
ACE_Player allowDamage false;
removeAllWeapons ACE_Player;
removeAllItems ACE_Player;
removeVest ACE_Player;
removeBackpack ACE_Player;
removeGoggles ACE_Player;
ACE_Player playMoveNow "DeadState";

//Set this player as dead to all clients
GVAR(Dead) = true;
SETPVAR(ACE_Player,GVAR(Dead),true);

//Delete player information
[QGVAR(ServerData), [ACE_Player], true] call ACEFUNC(common,serverEvent);

//Remove player from group
[ACE_Player] joinsilent grpnull;

//Call server function to hide unit object from all clients
[[ACE_Player], QEFUNC(main,hideObjectServer), 1] call ACEFUNC(common,execRemoteFnc);

//Update radio settings
2 fadeSound 0.3;
if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
	[ACE_Player, true] call TFAR_fnc_forceSpectator;
};
if (isClass (configFile >> "CfgPatches" >> "acre_sys_core")) then {
	[true] call acre_api_fnc_setSpectator;
};

if (GVAR(Spectator)) exitWith {

	private "_corpse";
	_corpse = _this select 1;
	
	//Store death position
	GVAR(DeathPos) = getPosATL _corpse;
	
	//Start spectator camera
	_layer = QGVAR(respawnSpectator) call BIS_fnc_rscLayer;
	_layer cutRsc ["RscMEU_Spectator","plain"];	
	
	titleText [localize "STR_MEU_Respawn_SpectatorOn","PLAIN"];

	//Make sure the player doesn't join the group again
	[{[ACE_Player] joinsilent grpnull}, [], 10, 0.25] call ACEFUNC(common,waitAndExecute);

	LOG("[MEU]: Spectator mode initialized");
};

//Hide screen and show death message
titleText [localize "STR_MEU_Respawn_DeathMessage","BLACK"];

//Show death screen and end mission
[{cutText [localize "STR_MEU_Respawn_DeathMessage","BLACK FADED",2]}, [], 1, 0.25] call ACEFUNC(common,waitAndExecute);
[{["end1", false, true] call BIS_fnc_endMission;}, [], 5, 0.25] call ACEFUNC(common,waitAndExecute);

LOG("[MEU]: Respawn handled");