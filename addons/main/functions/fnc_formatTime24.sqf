#include "script_component.hpp"

/*
	Author: Kavinsky

	Description:
		Formats hour and minutes to 24 hours format

	Parameter(s):
		0: NUMBER - OPTIONAl - Hours to format, if omitted it will use current Date
		1: NUMBER - OPTIONAl - Minutes to format, if omitted it will use current Date

	Returns:
		STRING
*/
private ["_hour", "_minutes"];

_hour = [_this, 0, (Date select 3)] call BIS_fnc_param;
_minutes = [_this, 1, (Date select 4)] call BIS_fnc_param;

if (_hour < 10) then {
	_hour = format ["0%1", _hour];
};

if (_minutes < 10) then {
	_minutes = format ["0%1", _minutes];
};

(format ["%1:%2", _hour, _minutes]);