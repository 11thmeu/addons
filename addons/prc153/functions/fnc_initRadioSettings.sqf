#include "script_component.hpp"

/*
	Author: Kavinsky

	Description:
		Add specific data to this radio

	Public API:
		false

	Parameter(s):
		-

	Returns:
		-
*/

private ["_radio", "_settings", "_channelNames", "_freq"];

_radio = _this select 0;
_settings = _radio call TFAR_fnc_getSwSettings;


// OFSET 9 CHANNEL NAMES
if (isNil "MEU_PRC153_PRESETS") then {
	_channelNames = [];
	for "_x" from 1 to (TF_MAX_CHANNELS + 1) do {
		_channelNames pushBack format ["CHANNEL %1", _x];
	};

	_settings pushBack _channelNames;
} else {

	_channelNames = [];
	_freq = [];

	{
		_freq pushBack (_x select 1);
		_channelNames pushBack (_x select 0);
	} forEach (GVAR(Presets) select [0, 8]);

	_settings pushBack _channelNames;
	_settings set [2, _freq];
};


[_radio, _settings, false] call TFAR_fnc_setSwSettings;