#include "script_component.hpp"

(ACE_Hearing_enableCombatDeafness && (ACE_Player getVariable ['MEU_hasEarProtectorsIn', false]) && {[ACE_Player] call FUNC(hasProtector)});