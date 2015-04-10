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

disableSerialization;

SETUVAR(GVAR(DialogId), _this select 0);
SETUVAR(GVAR(DialogShowing), true);

0 spawn {

	if !((call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwSpeakers) then {
		ctrlSetText [IDC_CONNECTOR, QUOTE(PATHTOF(data\ui\connector.paa))];
	} else {
		ctrlSetText [IDC_CONNECTOR, ""];
	};


	while {GETUVAR(GVAR(DialogShowing), false); && dialog} do {
		call FUNC(dialogUpdate);
		sleep 0.3;
	};

};