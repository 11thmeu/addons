#include "script_component.hpp"

/*
	Author: Kavinsky

	Description:
		Handles the input button action 1

	Public API:
		false

	Parameter(s):
		-

	Returns:
		-
*/

// play the sfx
call MEU_PRC153_fnc_playSoundButton;

_goTomenu = [1, ""] call MEU_PRC153_fnc_getActMenu;

if (_goToMenu == "") exitWith {};

uiNamespace setVariable ["MEU_PRC153_Menu", _goTomenu];

// regenerates the dialog
call MEU_PRC153_fnc_dialogUpdate;