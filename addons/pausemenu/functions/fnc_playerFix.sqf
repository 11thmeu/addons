#include "script_component.hpp"

ISNILS(ace_medical, false);

if (ace_medical) then {
	[ACE_Player, ACE_Player] call ace_medical_fnc_treatmentAdvanced_fullHealLocal;
} else {
	ACE_Player setDamage 0;
};

[-1, {_this switchMove "";}, ACE_Player] call CBA_fnc_globalExecute;

