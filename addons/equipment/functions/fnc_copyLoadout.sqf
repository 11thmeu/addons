/*
 * Author: Thrax
 * Copy the current loadout to the clipboard
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(copyLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_loadout", "_loadoutStr"];
_loadout = [ACE_Player] call EFUNC(main,getUnitLoadout);
_loadoutStr = str(_loadout);
[_loadoutStr] call EFUNC(main,copyToClipboard);

titleText[(localize "STR_MEU_Equipment_LoadoutCopied"), "PLAIN DOWN"];