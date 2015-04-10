#include "script_component.hpp"

/*
 * Author: Kavinsky
 *
 * Turns on soundtrap for unit
 *
 * Arguments:
 * 0: unit
 *
 * Return Value:
 * -
 */

private ["_player"];

PARAMS_1(_player);

if ([_player] call ACE_hearing_fnc_hasEarPlugsIn) then {
	_player addItem "ACE_EarPlugs";
};

_player setVariable ["ACE_hasEarPlugsin", true, true];
_player setVariable ["MEU_hasEarProtectorsIn", true, true];
playSound ["MEU_HP_Activate", true];

[localize "STR_MEU_HearingProtectors_Activated"] call ACE_common_fnc_displayTextStructured;
