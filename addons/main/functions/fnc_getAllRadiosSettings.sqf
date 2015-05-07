/*
 * Author: Thrax
 * Return the settings of all TFAR radios the player has
 *
 * Arguments:
 * -
 *
 * Return Value:
 * Radio settings with the structure [activeSWRadio settings, activeLRRadio settings, [ ["inactive sw radio classname", [inactive sw radio settings]], ...]] <ARRAY>
 *
 * Example:
 * _settings = call FUNC(getAllRadiosSettings)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

//If TFAR is disabled, exit function
if !(isClass(configFile >> "CfgPatches" >> "task_force_radio")) exitWith { [[],[],[]] };

private ["_activeSWRadio", "_activeLRRadio", "_radiosList", "_swSettings", "_lrSettings", "_otherSettings", "_radio", "_settings", "_classname"];
_activeSWRadio = call TFAR_fnc_activeSwRadio;
_activeLRRadio = call TFAR_fnc_activeLrRadio;

_swSettings = [];
if (!(isNil "_activeSWRadio")) then { _swSettings = _activeSWRadio call TFAR_fnc_GetSwSettings; };

_lrSettings = [];
if (!(isNil "_activeLRRadio")) then { _lrSettings = _activeLRRadio call TFAR_fnc_GetLrSettings; };

//Find non-active radios and get their configs
_radiosList = ACE_Player call TFAR_fnc_radiosList;
_otherSettings = [];
{
    if (_x != _activeSWRadio) then {
        _radio = _x;
        _settings = _radio call TFAR_fnc_GetSwSettings;
        _classname = [_radio] call FUNC(processItem);
        _otherSettings pushBack [_classname, _settings];
    };
} forEach _radiosList;

[_swSettings, _lrSettings, _otherSettings] 