/*
 * Author: Thrax
 * Initializes the vehicle spawner module
 *
 * Arguments:
 * 0: Module to initialize <LOGIC>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * [module, [], true] call FUNC(moduleSpawner)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_logic", "_units", "_activated"];
private ["_action", "_type", "_position", "_rotation", "_instructor", "_vehicles", "_scope"];

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {true};

//Configurable parameters
_action = GETVAR(_logic,Action,localize 'STR_MEU_Spawner_Create');
_type = GETVAR(_logic,Type,0);
_position = GETVAR(_logic,Position,'');
_rotation = parseNumber (GETVAR(_logic,Rotation,'0'));
_instructor = GETVAR(_logic,Instructor,false);

if (_position == "") exitWith { ERROR("Error in spawner module, undefined spawn marker"); true };

{
    _x addAction [MEU_TEXT_RED(_action), 
                 {_this call FUNC(openSpawnerUI);}, [_type, _position, _rotation, _instructor], 3, false, true, "", ""];
} forEach _units;

if (!isNil QGVAR(module)) exitWith { true }; //Already initialized
GVAR(Land) = [];
GVAR(Air) = [];
GVAR(Water) = [];
GVAR(Type) = 0;

//Land vehicles
_vehicles = "((configName _x) isKindOf 'Car')" configClasses (configFile >> "CfgVehicles");
{
    _vehicle = configName _x;
    _scope = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "scope");
    if (_scope == 2) then { GVAR(Land) pushBack _vehicle; };
} forEach _vehicles;
_vehicles = "((configName _x) isKindOf 'Motorcycle')" configClasses (configFile >> "CfgVehicles");
{
    _vehicle = configName _x;
    _scope = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "scope");
    if (_scope == 2) then { GVAR(Land) pushBack _vehicle; };
} forEach _vehicles;
_vehicles = "((configName _x) isKindOf 'Tank')" configClasses (configFile >> "CfgVehicles");
{
    _vehicle = configName _x;
    _scope = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "scope");
    if (_scope == 2) then { GVAR(Land) pushBack _vehicle; };
} forEach _vehicles;

//Air vehicles
_vehicles = "((configName _x) isKindOf 'Helicopter_Base_F')" configClasses (configFile >> "CfgVehicles");
{
    _vehicle = configName _x;
    _scope = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "scope");
    if (_scope == 2) then { GVAR(Air) pushBack _vehicle; };
} forEach _vehicles;
_vehicles = "((configName _x) isKindOf 'Plane')" configClasses (configFile >> "CfgVehicles");
{
    _vehicle = configName _x;
    _scope = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "scope");
    if (_scope == 2) then { GVAR(Air) pushBack _vehicle; };
} forEach _vehicles;

//Water vehicles
_vehicles = "((configName _x) isKindOf 'Ship_F')" configClasses (configFile >> "CfgVehicles");
{
    _vehicle = configName _x;
    _scope = getNumber (configFile >> "CfgVehicles" >> _vehicle >> "scope");
    if (_scope == 2) then { GVAR(Water) pushBack _vehicle; };
} forEach _vehicles;

LOG("[MEU]: Vehicle Spawner Module Initialized");

GVAR(module) = true;

true 