#include "script_component.hpp"

_unit = _this select 0;

_gps = "";
{
	_simu = getText(configFile >> "CfgWeapons" >> _x >> "simulation");

	if (_simu == "ItemGPS") exitWith {
		_x;
	};

} forEach (assignedItems _unit);

_gps;