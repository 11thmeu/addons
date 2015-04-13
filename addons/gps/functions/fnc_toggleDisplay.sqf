#include "script_component.hpp"

player sideChat "PRESS";

if (!GVAR(DisplayVisible)) then {

	_gps = [ACE_Player] call FUNC(unitGPS);
	_isInVehicle = false;
	// todo: check if vehicle has GPS and use it in case player is in usable positions.

	if (_gps == "") exitWith {};

	// gps parameters
	_gpsDisplayClass = getText (configFile >> "CfgWeapons" >> _gps >> "MEU_GPS_Display");
	_gpsUpdateInterval = getNumber (configFile >> "CfgWeapons" >> _gps >> "MEU_GPS_DisplayUpdateInterval");
	_gpsUpdateFunction = getText(configFile >> "CfgWeapons" >> _gps >> "MEU_GPS_DisplayUpdate");

	// dont have a custom display so exiting to vanilla
	if (_gpsDisplayClass == "") then {
		_gpsUpdateInterval = 4;
		_gpsUpdateFunction = QUOTE(FUNC(vanillaGPSUpdate));
	};

	if (_gpsUpdateInterval == 0 || {_gpsUpdateInterval < 3}) then {
		_gpsUpdateInterval = 3;
	};

	if (_gpsUpdateFunction == "") exitWith {
		player sideChat "ERROR NO UPDATE FUNC";
		ERROR(format ["There is no update function for GPS: %1", _gpsDisplayClass]);
	};

	// its happening!
	GVAR(DisplayVisible) = true;
	player sideChat "GPSHOWING";

	// PFH Handler
	GVAR(DisplayPFH) = [{
		_params = _this select 0;
		// auto remove PFH
		if (!GVAR(DisplayVisible) || {!alive ACE_Player}) exitWith {
			[GVAR(DisplayPFH)] call CBA_fnc_removePerFrameHandler;
			// HIDE GPS Display
			GVAR(DisplayVisible) = false;
		};

		_updateFunc = _params select 0;

		[] call (call compile _updateFunc);

	}, _gpsUpdateInterval, [_gpsUpdateFunction, _gpsDisplayInterval, _gpsDisplayClass]] call CBA_fnc_addPerFrameHandler;

	[QGVAR(displayShown), []] call ACEFUNC(common,localEvent);


} else {
	GVAR(DisplayVisible) = false;
	[QGVAR(displayHidden), []] call ACEFUNC(common,localEvent);
};