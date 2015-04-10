#include "script_component.hpp"

/*
 * Author: Kavinsky
 *
 * Turns off soundtrap for unit
 *
 * Arguments:
 * 0: unit
 *
 * Return Value:
 * -
 */

private ["_player"];

PARAMS_1(_player);

_player setVariable ["ACE_hasEarPlugsin", false, true];
_player setVariable ["MEU_hasEarProtectorsIn", false, true];
playSound ["MEU_HP_Deactivate", true];

[localize "STR_MEU_HearingProtectors_Deactivated"] call ACE_common_fnc_displayTextStructured;
