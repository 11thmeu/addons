#include "script_component.hpp"
/*
	Author: Kavinsky

	Description:
		Updates the actual PRC153 dialog

	Public API:
		false

	Parameter(s):
		-

	Returns:
		-
*/

disableSerialization;

if (!PRC153_SHOWING) exitWith {};

private ["_settings", "_channelId", "_channelNames"];

_settings = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwSettings;
_channelId = _settings select 0; // ACTIVE_CHANNEL_OFFSET
_channelNames = _settings select PRC153_OFFSET_CHANNELNAMES;

// update time
ctrlSetText [IDC_LCD_TIME, [] call EFUNC(main,formatTime12)];

switch GVAR(RadioMode) do {
	case "main":
	{
		// reset lcd
		["util"] call FUNC(dialogResetLCD);


		ctrlSetText [IDC_LCD_LINE1, "ZONE 1"];

		// SET CHANNEL NAME
		ctrlSetText [IDC_LCD_LINE2, _channelNames select _channelId];
		ctrlSetText [IDC_LCD_LINE3, ""];

		[1, "prog", "PROG"] call FUNC(setActMenu);
		[2, "menu", "MENU"] call FUNC(setActMenu);
		[3, "scan", "SCAN"] call FUNC(setActMenu);

	};

	case "volume":
	{
		// reset lcd
		["lines"] call FUNC(dialogResetLCD);
		ctrlSetText [IDC_LCD_LINE1, "VOLUME"];

		_volume = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume;
		_txtVolume = "||";
		for "_x"  from 1 to _volume do {
			_txtVolume = format ["%1||", _txtVolume];
		};

		ctrlSetText [IDC_LCD_LINE2, _txtVolume];

		// mode reset for volume
		if ((PRC153_VOLUME_CHANGED_AT + 2) < time) then {
			uiNamespace setVariable ["MEU_PRC153_Menu", PRC153_PREVMENU];
		};
	};

	case "menu": {

		[1, "", ""] call FUNC(setActMenu);
		[2, "", ""] call FUNC(setActMenu);
		[3, "main", "BACK"] call FUNC(setActMenu);

		ctrlSetText [IDC_LCD_LINE1, "NOT"];
		ctrlSetText [IDC_LCD_LINE2, "IMPLEMENTED"];
		ctrlSetText [IDC_LCD_LINE3, ""];
	};

	case "prog": {
		[1, "main", "BACK"] call FUNC(setActMenu);
		[2, "", ""] call FUNC(setActMenu);
		[3, "", ""] call FUNC(setActMenu);


	};

	case "prog_save": {


		// save data
		uiNamespace setVariable ["MEU_PRC153_Menu", "main"];
	};

	case "scan": {

		[1, "", ""] call FUNC(setActMenu);
		[2, "", ""] call FUNC(setActMenu);
		[3, "main", "BACK"] call FUNC(setActMenu);

		ctrlSetText [IDC_LCD_LINE1, "NOT"];
		ctrlSetText [IDC_LCD_LINE2, "IMPLEMENTED"];
		ctrlSetText [IDC_LCD_LINE3, ""];

	};

	case "off": {
		["all"] call FUNC(dialogResetLCD);
	};

	case "booting": {
		[] call FUNC(dialogModeBoot);
	};

	default { hint "ERROR MODE INCORRECT!";};
};