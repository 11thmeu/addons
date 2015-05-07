/*
 * Author: Thrax
 * Set the given TFAR radios settings for the player
 *
 * Arguments:
 * 0: activeSWRadio settings <ARRAY>
 * 1: activeLRRadio settings <ARRAY>
 * 2: inactive SW radio settings [ ["inactive sw radio classname", [inactive sw radio settings]], ...] <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * [_activeSWRadioSettings, _activeLRRadioSettings, [ ["classname", [_settings]], ...]] call FUNC(setAllRadiosSettings)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

//If TFAR is disabled, exit function
if !(isClass(configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

private ["_swSettings", "_lrSettings", "_otherSettings", "_activeSWRadio", "_processedRadios", "_playerItems", "_radio", "_settings", "_item"];
_swSettings = _this select 0;
_lrSettings = _this select 1;
_otherSettings = _this select 2;

//Set SW radio settings
_activeSWRadio = call TFAR_fnc_activeSwRadio;
if (!(isNil "_activeSWRadio") && ((count _swSettings) > 0)) then {
    [_activeSWRadio, _swSettings] call TFAR_fnc_SetSwSettings;
};

//Set LR radio settings
if (call TFAR_fnc_haveLRRadio) then {
    call TFAR_fnc_activeLrRadio;
    if (!(isNil "TF_lr_active_radio") && ((count _lrSettings) > 0)) then {
        [TF_lr_active_radio select 0, TF_lr_active_radio select 1, _lrSettings] call TFAR_fnc_SetLrSettings;
    };
};

//Set inactive SW radio settings
if ((count _otherSettings) > 0) then {
    _processedRadios = [];
    _playerItems = items ACE_Player;
    for "_s" from 0 to ((count _otherSettings) - 1) do {
        _radio = (_otherSettings select _s) select 0;
        _settings = (_otherSettings select _s) select 1;
        {
            _item = _x call FUNC(processItem);
            if ((_item == _radio) && !(_x in _processedRadios)) exitWith {
                [_x, _settings] call TFAR_fnc_SetSwSettings;
                _processedRadios pushBack _x;
            };
        } forEach _playerItems;
    };
};