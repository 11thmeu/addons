/*
 * Author: Thrax
 * Load a given loadout from clipboard
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(pasteLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_loadoutStr", "_loadout"];
_loadoutStr = call EFUNC(main,copyFromClipboard);
_loadout = call compile _loadoutStr;

//If no parse errors, set loadout
if ((typeName _loadout) == "ARRAY") then {
	_loadout call EFUNC(main,setPlayerLoadout);
	titleText[(localize "STR_MEU_Equipment_LoadoutPasted"), "PLAIN DOWN"];
} else {
	titleText[(localize "STR_MEU_Equipment_LoadoutPasteError"), "PLAIN DOWN"];
};