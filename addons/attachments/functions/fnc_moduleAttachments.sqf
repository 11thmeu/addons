/*
 * Author: Thrax
 * Initializes the attachments module
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
 * [module, [], true] call FUNC(moduleAttachments)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_logic", "_units", "_activated"];
private ["_action", "_thermal", "_enableBlacklist", "_blacklist", "_enableWhitelist", "_whitelist", "_description", "_tooltips"];

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {true};

//Configurable parameters
_action = GETVAR(_logic,Interaction,localize "STR_MEU_Attachments_ActionDefault");
_description = GETVAR(_logic,Description,true);
_tooltips = GETVAR(_logic,Tooltip,false);
_thermal = GETVAR(_logic,Thermal,true);
_enableBlacklist = GETVAR(_logic,EnableBlacklist,false);
_blacklist = call compile (GETVAR(_logic,Blacklist,'[]'));
_enableWhitelist = GETVAR(_logic,EnableWhitelist,false);
_whitelist = call compile (GETVAR(_logic,Whitelist,'[]'));

if (typeName _blacklist != "ARRAY") then { _blacklist = []; };
if (typeName _whitelist != "ARRAY") then { _whitelist = []; };

{
    if (GETVAR(_x,GVAR(Interaction),true)) then {
        _x addAction [MEU_TEXT_RED(_action), {_this call FUNC(openAttachmentsUI)}, [_thermal, _enableBlacklist, _blacklist, _enableWhitelist, _whitelist, _description, _tooltips]];
        SETVAR(_x,GVAR(Interaction),false);
    };
} forEach _units;

LOG("[MEU]: Attachments Module Initialized");

true 