#include "script_component.hpp"

if (!GVAR(DisplayVisible)) then {
	_gps = [ACE_Player] call FUNC(unitGPS);
	if (_gps == "") exitWith {};

	// gps parameters
	_gpsDisplay = getText (configFile >> "CfgWeapons" >> _gps >> "MEU_GPS_Display");
	_gpsUpdateInterval = getNumber (configFile >> "CfgWeapons" >> _gps >> "MEU_GPS_DisplayUpdateInterval");
	_gpsUpdateFunction = getText(configFile >> "CfgWeapons" >> _gps >> "MEU_GPS_DisplayUpdate");

	// dont have a custom display so exiting to vanilla
	if (_gpsDisplay == "") exitWith {
		_gpsUpdateInterval = 4;
		_gpsUpdateFunction = QUOTE(FUNC(vanillaGPSUpdate));
	};

	if (_gpsUpdateInterval == 0 || {_gpsUpdateInterval < 3}) then {
		_gpsUpdateInterval = 3;
	};

	if (_gpsUpdateFunction == "") then {
		ERROR(format ["There is no update function for GPS: %1", _gpsDisplay]);
	};

	// its happening!
	GVAR(DisplayVisible) = true;

	// PFH Handler
	GVAR(DisplayPFH) = [{
		// auto remove PFH
		if (!GVAR(DisplayVisible) || {!alive ACE_Player}) then {
			[GVAR(DisplayPFH)] call CBA_fc_removePerFrameHandler;
			// HIDE GPS Display
			GVAR(DisplayVisible) = false;
		};

		_gpsUpdateFunction = _this select 0;

		[_display] call (call compile _gpsUpdateFunction);

	}, _gpsUpdateInterval, [_gpsUpdateFunction]] call CBA_addPerFrameHandler;


} else {
	GVAR(DisplayVisible) = false;
};