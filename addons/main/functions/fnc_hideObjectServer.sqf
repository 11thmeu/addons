/*
 * Author: Thrax
 * Hide the given object from all clients. (Function to be executed using ACEFUNC(common,execRemoteFnc) in server only)
 *
 * Arguments:
 * 0: Object to hide <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [[cursorTarget], QFUNC(hideObjectServer), 1] call ACEFUNC(common,execRemoteFnc);
 *
 * Public: [Yes]
 */
#include "script_component.hpp"
 
private ["_vehicle"];
_vehicle = _this select 0;
hideObjectGlobal _vehicle;