/*
 * Author: Kavinsky
 * Full heal the local player and broadcast a message of the action
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(playerFix)
 *
 * Public: [No]
 */
#include "script_component.hpp"

ISNILS(ace_medical, false);

if (ace_medical) then {
    [ACE_Player, ACE_Player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
} else {
    ACE_Player setDamage 0;
};

[-1, {_this switchMove "";}, ACE_Player] call CBA_fnc_globalExecute;

 //Broadcast message
[[ACE_Player,  "Ha usado player fix."], "globalChat", true, false, false] call BIS_fnc_MP;
