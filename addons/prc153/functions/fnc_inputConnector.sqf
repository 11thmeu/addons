#include "script_component.hpp"

/*
	Author: Kavinsky

	Description:
		Handles the input connector

	Public API:
		false

	Parameter(s):
		-

	Returns:
		-
*/


// should be agm info

[call TFAR_fnc_ActiveSWRadio] call TFAR_fnc_setSwSpeakers;

if !((call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwSpeakers) then {
	ctrlSetText [IDC_CONNECTOR, "\x\11th_gear\addons\prc153\data\ui\connector.paa"];
} else {
	ctrlSetText [IDC_CONNECTOR, ""];
};


// play the sfx
call MEU_PRC153_fnc_playSoundConnector;

// regenerates the dialog
call MEU_PRC153_fnc_dialogUpdate;