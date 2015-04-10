#include "script_component.hpp"

/*
	Author: Kavinsky

	Description:
		Handles the input knob volume

	Public API:
		false

	Parameter(s):
		-

	Returns:
		-
*/
disableSerialization;

// params
_ctrl =  _this select 0;
_btn  =  _this select 1;

// variables
_rightClick = (_btn == 1);

_changeVolume = true;
_volume = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume;

// GO TO ON MODE
if (_volume <= 0 && _rightClick && PRC153_MODE == "off") then {
	uiNamespace setVariable ["MEU_PRC153_Menu", "booting"];
	uiNamespace setVariable ["MEU_PRC153_BootedAt", time];
	_changeVolume = false;

	// play the sfx
	call MEU_PRC153_fnc_playSoundKnob;
};

// GO TO OFF MODE
if (_volume <= 0 && !_rightClick) then {
	uiNamespace setVariable ["MEU_PRC153_Menu", "off"];

	// set off
	_changeVolume = false;

	// play the sfx
	call MEU_PRC153_fnc_playSoundKnob;
};

// just change the volume on right times
if (_volume >= 9 && _rightClick) exitWith {};

if(_changeVolume && PRC153_MODE != "booting") then {
	uiNamespace setVariable ["MEU_PRC153_PrevMenu", PRC153_MODE];
	uiNamespace setVariable ["MEU_PRC153_Menu", "volume"];
	uiNamespace setVariable ["MEU_PRC153_VolumeChangedAt", time];

	[_btn, false] call TFAR_fnc_setVolumeViaDialog;
	// play the sfx
	call MEU_PRC153_fnc_playSoundKnob;
};

// regenerates the dialog
call MEU_PRC153_fnc_dialogUpdate;