#include "script_component.hpp"

/*
	Author: Kavinsky

	Description:
		Cleans the LCD

	Public API:
		false

	Parameter(s):
		0: STRING

	Returns:
		-
*/

_mode = [_this, 0, "all"] call BIS_fnc_param;

switch _mode do {
	case "all": {
		ctrlSetText [IDC_LCD_TIME, ""];
		ctrlSetText [IDC_LCD_LINE1, ""];
		ctrlSetText [IDC_LCD_LINE2, ""];
		ctrlSetText [IDC_LCD_LINE3, ""];
		ctrlSetText [IDC_LCD_ACT1, ""];
		ctrlSetText [IDC_LCD_ACT2, ""];
		ctrlSetText [IDC_LCD_ACT3, ""];
	};

	case "lines": {
		ctrlSetText [IDC_LCD_LINE1, ""];
		ctrlSetText [IDC_LCD_LINE2, ""];
		ctrlSetText [IDC_LCD_LINE3, ""];
	};

	case "util": {
		ctrlSetText [IDC_LCD_LINE1, ""];
		ctrlSetText [IDC_LCD_LINE2, ""];
		ctrlSetText [IDC_LCD_LINE3, ""];
		ctrlSetText [IDC_LCD_ACT1, ""];
		ctrlSetText [IDC_LCD_ACT2, ""];
		ctrlSetText [IDC_LCD_ACT3, ""];
	};

	case "act": {
		ctrlSetText [IDC_LCD_ACT1, ""];
		ctrlSetText [IDC_LCD_ACT2, ""];
		ctrlSetText [IDC_LCD_ACT3, ""];
	};

	default {

	};
};