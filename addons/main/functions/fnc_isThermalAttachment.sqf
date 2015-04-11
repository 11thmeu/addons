/*
 * Author: Thrax
 * Check if the given weapon optic has thermal sights
 *
 * Arguments:
 * 0: attachment classname <STRING>
 *
 * Return Value:
 * True if the given attachment has thermal sights, false otherwise <BOOL>
 *
 * Example:
 * _bool = ["classname"] call EFUNC(main,isThermalAttachment)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

private ["_attachment", "_thermalModes", "_thermal"];

_attachment = _this select 0;
_thermal = false;

_thermalModes = "isArray (_x >> 'thermalmode')" configClasses (configFile >> "CfgWeapons" >> _attachment >> "ItemInfo" >> "OpticsModes");
if ((count _thermalModes) > 0) then {
    _thermal = true;
};

_thermal 