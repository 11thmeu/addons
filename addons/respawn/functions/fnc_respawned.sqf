/*
	Author: Thrax

	Description:
	Move player out of the map and block any movement/visibility


	Parameter(s):
		0: OBJECT - Object the event handler is assigned to 
		1: OBJECT - Object the event handler was assigned to, aka the corpse/unit player was previously controlling 

	Returns:
	-
*/

["Medical","Respawn function called"] call MEU_fnc_debug;

if (player != player) then {
	waitUntil {player == player};
};

//Teleport out of map
player setPos [0,0,0];

//Set player status
[player, "MEU_Respawn_Dead", true] call AGM_Interaction_fnc_setCaptivityStatus;
player allowDamage false;
removeAllWeapons player;
removeAllItems player;
removeVest player;
removeBackpack player;
removeGoggles player;
player playMoveNow "DeadState";

//Set this player as dead to all clients
player setVariable ["MEU_Respawn_IsDead", true, true];

//Delete player information
[[player, true], "MEU_fnc_respawnModule_server", false, false] call BIS_fnc_MP;

//Remove player from group
[player] joinsilent grpnull;

//Call server function to hide unit object from all clients
[[player], QEFUNC(main,hideObjectServer), false, false, false] call BIS_fnc_MP;

//Update radio settings
2 fadeSound 0.3;
if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
	[player, true] call TFAR_fnc_forceSpectator;
};
if (isClass (configFile >> "CfgPatches" >> "acre_sys_core")) then {
	[true] call acre_api_fnc_setSpectator;
};

if (MEU_Medical_Spectator) exitWith {

	private "_corpse";
	_corpse = _this select 1;
	
	//Store death position
	MEU_Medical_DeathPos = getPosATL _corpse;
	
	//Start spectator camera
	_layer = "BIS_fnc_respawnSpectator" call BIS_fnc_rscLayer;
	_layer cutrsc ["RscSpectator","plain"];	
	
	titleText [localize "STR_MEU_Medical_EnablingSpectator","PLAIN"];

	//Make sure the player doesn't join the group again
	[] spawn {
		sleep 10;
		[player] joinsilent grpnull;
	};

	["Medical","Respawn function finished with spectator mode"] call MEU_fnc_debug;
};

//Hide screen and show message
titleText [localize "STR_MEU_Medical_Respawn_deathMessage","BLACK"];
sleep 1;

//Death screen
[] spawn {
	cutText [localize "STR_MEU_Medical_Respawn_deathMessage","BLACK FADED",2];
	sleep 5;
	["end1", false, true] call BIS_fnc_endMission;
};

["Medical","Respawn function finished"] call MEU_fnc_debug;