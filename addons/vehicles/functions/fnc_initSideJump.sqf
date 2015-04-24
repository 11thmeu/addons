/*
 * Author: Thrax
 * Initialize side jump system
 *
 * Arguments:
 * 0: Vehicle to add the action to <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [vehicle] call FUNC(initSideJump)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_vehicle", "_priority", "_condition"];
_vehicle = _this select 0;

//If server or side jump disabled, exit
if (!hasInterface || ((getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "MEU_SideJump")) == 0)) exitWith { false };

//If action added before, exit
if (GETVAR(_vehicle,SideJump,false)) exitWith { false };
SETVAR(_vehicle,SideJump,true);

//Get eject action priority
_priority = getNumber(configFile >> "CfgActions" >> "Eject" >> "priority");

//Check if ACE medical is enabled to check consciousness in actions
if (isNil "ACE_medical") then {
    _condition = "(player == _this) && ((assignedVehicleRole player) select 0 in ['cargo', 'Cargo']) && (vehicle _this == _target) && (locked _target < 2)";
} else {
    _condition = "(player == _this) && ((assignedVehicleRole player) select 0 in ['cargo', 'Cargo']) && (vehicle _this == _target) && (locked _target < 2) && !(player getVariable['ACE_isUnconscious',false])";
};

_vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Vehicles_JumpLeft"), {_this call FUNC(sideJump)}, "left", _priority, false, false, "Eject", _condition];
_vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Vehicles_JumpRight"), {_this call FUNC(sideJump)}, "right", _priority, false, false, "Eject", _condition];