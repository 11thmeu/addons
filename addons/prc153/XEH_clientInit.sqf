#include "script_component.hpp"

if (!hasInterface) exitWith {};

// DUMMY
GVAR(Presets) = [
	["8210 NET", 		80.5],
	["8210 HQ INT", 	310],
	["8210 ET1 INT",	310.2],
	["8210 ET2 INT",	310.2],
	["SABRE INT", 		319.8],
	["ACE INT", 		319.8],
	["AUX 1", 			350.7],
	["AUX 2", 			360.5]
];

/*MEU_PRC153_MENU_OPTIONS = [
	["STEREO", ["LR", "L", "R"], "LR", "CODEHERE"],
	["TXPWR", ["10", "20", "30", "40", "50", "60", "70", "80" "90", "100"], "50", "CODEHERE"],
	["MODUL", ["A", "B"], "A", "CODEHERE"],
	["ERASE", ["N", "Y"], "Y", "CODEHERE"]
];*/

// Setting  TFAR EventHandler
[QGVAR(OnRadiosReceived), "OnRadiosReceived", {
	{
		if (["MEU_RADIO_PRC153", _x] call BIS_fnc_inString) then {
			[_x] call MEU_PRC153_fnc_initRadioSettings;
		};
	} forEach (_this select 1);

}, player] call TFAR_fnc_addEventHandler;

