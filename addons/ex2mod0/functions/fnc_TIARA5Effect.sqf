/*
 * Author: Kavinsky
 *
 * Generates TIARA5 Effect to a projectile
 *
 * Arguments:
 *  - 0: Object (The hand grenade to attach the effect)
 *  - 1: String (Classname of the magazine)
 *
 * Return Value:
 * (Nothing)
 */

private ["_projectile", "_magazine", "_light", "_lightBrightness"];

_projectile = _this select 0;
_magazine = _this select 1;

if(!alive _projectile) exitWith {};

#define TIARA5_MAX_BRIGHTNESS 0.9

_light = "#lightpoint" createVehicleLocal (position _projectile);
_light lightAttachObject [_projectile, [0, 0, 0]];
_light setLightColor [0,0,0];
_light setLightIntensity 0;
_light setLightDayLight true;

switch (_magazine) do {
	case "11th_EX2MOD0_Red": {
		_light setLightAmbient [1,0.05,0.2];
	};

	case "11th_EX2MOD0_Green": {
		_light setLightAmbient [0,0.7,0.1];
	};

	case "11th_EX2MOD0_Yellow": {
		_light setLightAmbient [1,0.95,0.3];
	};

	default {
		_light setLightAmbient [0,0.7,0.2];
	};
};

_lightBrightness = 0;
while {_lightBrightness < TIARA5_MAX_BRIGHTNESS} do {
	sleep 0.2;
	_lightBrightness = _lightBrightness + 0.02;

	if (_lightBrightness > 1) then { _lightBrightness = 1; };

	_light setLightBrightness _lightBrightness;
};

waitUntil {!alive _projectile};

while {_lightBrightness > 0} do {
	sleep 0.1;
	_lightBrightness = _lightBrightness - 0.01;

	if (_lightBrightness < 0) then { _lightBrightness = 0; };

	_light setLightBrightness _lightBrightness;
};



deleteVehicle _light;