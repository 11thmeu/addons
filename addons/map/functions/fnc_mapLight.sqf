#include "script_component.hpp"

/*
	Author: Thrax

	Description:
	Turn on/off map light


	Parameter(s):
		0: BOOL - turn light on or off

	Returns:
	-
*/

private ["_switch", "_light", "_height", "_position"];
_switch = _this select 0;

if (_switch) then {
	//Turn on light
	if(!GVAR(MapLight)) then {
		//If light is not on already, create it

		if (vehicle ACE_Player == ACE_Player) then {
			//Outside vehicle - flashlight
			_light = QGVAR(MapLight) createVehicle (getPos ACE_Player);
			ACE_Player setVariable [QGVAR(MapLight), _light, false];

			//Adjust light position
			_height = (ACE_Player selectionPosition "Neck" select 2);
			if (_height > 0.6) then {
				_light attachTo [ACE_Player,[0,0,_height]];
			} else {
				_light attachTo [ACE_Player,[0,0.6,_height]];
			};
			_light setVectorDirAndUp [[0, 1, -1.5],[0, 0, 1]];
		} else {
			//Inside vehicle - dashlight	DISABLED, network problems
			//[[ACE_Player, true], QUOTE(FUNC(dashLight)), true, false, false] call BIS_fnc_MP;
		};
	};

	QGVAR(MapLight) = true;
} else {
	//Turn off light

	if (vehicle ACE_Player == ACE_Player) then {
		_light = ACE_Player getVariable [QGVAR(MapLight), objNull];

		if (!isNull _light) then {
			deleteVehicle _light;
			ACE_Player setVariable [QGVAR(MapLight), objNull, false];
		};
	} else {
		//DISABLED, network problems
		//[[ACE_Player, false], QUOTE(FUNC(dashLight)), true, false, false] call BIS_fnc_MP;
	};

	QGVAR(MapLight) = false;
};