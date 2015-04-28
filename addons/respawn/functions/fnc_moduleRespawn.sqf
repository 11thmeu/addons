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

if (!isMultiplayer) exitWith {true};

private ["_logic", "_units", "_activated", "_respawn"];
_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {true};

//Check if respawn is configured to 3/BASE
_respawn = ["Respawn"] call BIS_fnc_getCfgData;
if (IS_NUMBER(_respawn)) then {
    if (_respawn != 3) exitWith {
        ERROR("[MEU]: Error in respawn module, respawn is not 3 or BASE");
    };
} else {
    if (_respawn != "BASE") exitWith {
        ERROR("[MEU]: Error in respawn module, respawn is not 3 or BASE");
    };
};

GVAR(Persist) = GETVAR(_logic,Persist,true);
GVAR(DeleteBodies) = GETVAR(_logic,Bodies,true);
GVAR(Spectator) = GETVAR(_logic,Spectator,true);

if (isServer) then { 
    if (GVAR(Persist)) then {
        //Add disconnect event handler to save player status
        addMissionEventHandler ["HandleDisconnect", {_this call FUNC(save);}];

        //Add data request event handler to manage player status
        [QGVAR(ServerData), FUNC(server)] call ACEFUNC(common,addEventHandler);
    };
};
 
if (!isDedicated) then {
    call FUNC(init);
};

LOG("[MEU]: Respawn Module Initialized");

GVAR(Module) = true;

true 