#include "script_component.hpp"

/*
	Author: Kavinsky

	Description:
		Starts the PRC153 dialog

	Public API:
		false

	Parameter(s):
		0: Dialog

	Returns:
		-
*/

private ["_btnId", "_menu", "_text"];

disableSerialization;
_btnId = _this select 0;
_menu = _this select 1;
_text = _this select 2;


uiNamespace setVariable [(format ["MEU_PRC153_MenuAct_%1", _btnId]), _menu];

if (_btnId == 1) then {
	ctrlSetText [IDC_LCD_ACT1, _text];
};

if (_btnId == 2) then {
	ctrlSetText [IDC_LCD_ACT2, _text];
};

if (_btnId == 3) then {
	ctrlSetText [IDC_LCD_ACT3, _text];
};