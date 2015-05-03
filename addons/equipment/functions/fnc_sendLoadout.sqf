/*
 * Author: Thrax
 * Send loadout to the selected player
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(sendLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

_selected = lbSelection _ctrl;
_target = call compile (lbData _ctrl); 
_loadout = [ACE_Player] call EFUNC(main,getUnitLoadout);

[[ACE_Player, _loadout, false], QFUNC(receiveLoadout), _target, false, false] call BIS_fnc_MP; 