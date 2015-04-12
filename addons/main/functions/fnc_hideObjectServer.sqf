/*
 * Author: Thrax
 * Hide the given object from all clients. (Function to be executed using BIS_fnc_mp in server only)
 *
 * Arguments:
 * 0: Object to hide <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [cursorTarget] call EFUNC(main,hideObjectGlobal)
 *
 * Public: [Yes]
 */
 
private ["_vehicle"];
_vehicle = _this select 0;
hideObjectGlobal _vehicle;