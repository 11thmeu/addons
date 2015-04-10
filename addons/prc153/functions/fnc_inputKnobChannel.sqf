#include "script_component.hpp"

/*
	Author: Kavinsky

	Description:
		Handles the input knob channel

	Public API:
		false

	Parameter(s):
		-

	Returns:
		-
*/

_ctrl = _this select 0;
_btn  = _this select 1;
_rightClick = (_btn == 1);
_activeRadio = (call TFAR_fnc_activeSwRadio);
_channel = _activeRadio call TFAR_fnc_getSwChannel;



if ((_channel <= 0 && !_rightClick) || (_channel >= (TF_MAX_CHANNELS - 1) && _rightClick)) exitWith {};

[_btn, false] call TFAR_fnc_setChannelViaDialog;

// play the sfx
call MEU_PRC153_fnc_playSoundKnob;

// regenerates the dialog
call MEU_PRC153_fnc_dialogUpdate;