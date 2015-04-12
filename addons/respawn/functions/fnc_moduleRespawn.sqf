/*
 * Author: Thrax
 * Initializes the respawn module
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
 * [module, [], true] call FUNC(moduleRespawn)
 *
 * Public: [No]
 */
#include "script_component.hpp"

if (!isMultiplayer) exitWith {};

private ["_logic", "_units", "_activated"];
_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {true};

GVAR(Persist) = GETVAR(_logic,Persist,true);
GVAR(DeleteBodies) = GETVAR(_logic,Bodies,true);
GVAR(Spectator) = GETVAR(_logic,Spectator,true);

if (isServer && GVAR(Persist)) then { 
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(save);}];
};

LOG("[MEU]: Respawn Module Initialized");
 
if (!isDedicated) then {
    call FUNC(init);
};

GVAR(module) = true;

true 