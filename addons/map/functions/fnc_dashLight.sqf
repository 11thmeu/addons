#include "script_component.hpp"

/*
	Author: Thrax

	Description:
	Create or delete a dashlight


	Parameter(s):
		0: OBJECT - unit that turned the light
		1: BOOL - turn on/off

	Returns:
	-
*/

private ["_unit", "_vehicle", "_position", "_action"];
_unit = _this select 0;
_action = _this select 1;

_vehicle = vehicle _unit;

if (_action) then {
	_light = '#lightpoint' createVehicleLocal [0,0,0];
	_position = _vehicle worldToModel (_unit modelToWorld (_unit selectionPosition "pelvis"));
	_position set[2, (_position select 2) + 0.15];
	_light attachTo [_vehicle, _position];
	_light setLightColor [1,0,0];
	_light setLightAttenuation [0.3,0,0,500];
	_light setLightIntensity 35;

	_unit setVariable [QGVAR(DashLight), _light, false];
} else {
	_light = _unit getVariable [QGVAR(DashLight), objNull];

	if (!isNull _light) then {
		deleteVehicle _light;
		_vehicle setVariable [QGVAR(DashLight), objNull, false];
	};
};