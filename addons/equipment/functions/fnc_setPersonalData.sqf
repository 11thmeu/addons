/*
 * Author: Thrax
 * Set player data from CfgMEUPlayers
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * FUNC(setPersonalData)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_playerID", "_config", "_username", "_rank", "_insignia", "_team", "_bloodtype", "_allergies"];

_playerID = format["MEU_%1", getPlayerUID ACE_Player];
if (!(isClass (configFile >> "CfgMEUPlayers" >> _playerID))) exitWith {};

_config = configFile >> "CfgMEUPlayers" >> _playerID;

_username = getText (_config >> "username");
_rank = getText (_config >> "rank");
_insignia = getText (_config >> "insignia");
_team = getText (_config >> "team");
_bloodtype = getText (_config >> "bloodtype");
_allergies = getText (_config >> "allergies");

ACE_Player setRank _rank;

if (_insignia != "") then {
    if (([ACE_Player] call BIS_fnc_getUnitInsignia) == "") then {
        [ACE_Player, _insignia] call BIS_fnc_setUnitInsignia; 
    }; 
};