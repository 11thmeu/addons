/*
 * Author: Thrax
 * Initialize join in progress teleport module
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
 * [module, [], true] call FUNC(moduleJipTeleport)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_logic", "_units", "_activated"];
_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {true};

if !(hasInterface) exitWith {};

GVAR(JIPTeleport) = false;
[{
    if(time > 300 || time < (-300)) then {
        GVAR(JIPTeleport) = true;
        [68, [false, false, false], {call FUNC(teleportJIP);}, "keydown", QGVAR(JIPTeleport)] call CBA_fnc_addKeyHandler;
        titleText [localize "STR_MEU_Respawn_TeleportInProgress", "PLAIN"];
        [{
            if (GVAR(JIPTeleport)) then {
                [QGVAR(JIPTeleport), "keydown"] call CBA_fnc_removeKeyHandler;
                GVAR(JIPTeleport) = false;
            };
        }, [], 600, 10] call CBA_fnc_waitAndExecute;
    };
}, [], 30, 3] call CBA_fnc_waitAndExecute;

GVAR(JIPTeleportModule) = true;

true 