/*
 * Author: Thrax
 * Initializes the personal data module
 *
 * Arguments:
 * 0: Module to initialize <LOGIC>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * [module, [], true] call FUNC(modulePersonalData)
 *
 * Public: [No]
 */
#include "script_component.hpp"

if (isDedicated || (!isMultiplayer)) exitWith { true };

private ["_logic", "_units", "_activated"];
private "_playerID";

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {true};

_playerID = format["MEU_%1", getPlayerUID ACE_Player];
if (isClass (configFile >> "CfgMEUPlayers" >> _playerID)) then {
	call FUNC(setPersonalData);
	ACE_Player addEventHandler ["Respawn", {call FUNC(setPersonalData)}];
};

LOG("[MEU]: Personal Data Module Initialized");

true 