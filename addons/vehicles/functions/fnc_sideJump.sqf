/*
 * Author: Thrax
 * Jump out of current vehicle
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit exiting <OBJECT>
 * 2: Action id <NUMBER>
 * 3: Action ('right' or 'left') <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * [vehicle, player, 0, 'right'] call FUNC(sideJump)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_vehicle", "_unit", "_action", "_engine", "_direction", "_exitDirection", "_position", "_exitPosition"];

_vehicle = _this select 0;
_unit = _this select 1;
_action = _this select 3;

//If unit is not local player or is not in the vehicle, exit
if ((_unit != ACE_Player) || (_vehicle != (vehicle ACE_Player))) exitWith {};

_engine = isEngineOn _vehicle;

moveOut ACE_Player;

if (_engine && (!isEngineOn _vehicle)) then {
    _vehicle action ["EngineOn", _vehicle];
};

if (((getPosATL ACE_Player) select 2) < 10) then {
    _direction = getDir _vehicle;
    if (_action == "left") then {
        _exitDirection = _direction - 90;
    } else {
        _exitDirection = _direction + 90;
    };
    
    _position = getPosATL _vehicle;
    _exitPosition = [(_position select 0) + ((sin _exitDirection) * 3), (_position select 1) + ((cos _exitDirection * 3)), _position select 2];
    ACE_Player setPos _exitPosition;
    ACE_Player setDir _exitDirection;
};