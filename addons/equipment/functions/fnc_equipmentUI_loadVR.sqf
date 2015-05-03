/*
 * Author: Thrax
 * Open the equipment virtual profiles load dialog
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(equipmentUI_loadVR)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_profile", "_index", "_picture", "_profiles", "_loadoutName"];

//Hide camera options
if (GVAR(EnableCamera)) then {
	if (!GVAR(EnableNV)) then {
		ctrlShow [7806, false];
		ctrlSetText [7801, ""];
	};
} else {
	ctrlShow [7805, false];
	ctrlSetText [7800, ""];
	ctrlShow [7806, false];
	ctrlSetText [7801, ""];
};

if (!GVAR(AllowVirtualLoad)) exitWith {titleText[(localize "STR_MEU_Equipment_OptionDisabled"), "PLAIN DOWN"];};

lbClear 7803;

_profiles = profilenamespace getvariable ["bis_fnc_saveInventory_data",[]];

for "_i" from 0 to (count _profiles - 1) step 2 do {
	_loadoutName = _profiles select _i;
	_index = lbAdd [7803, _loadoutName];
};