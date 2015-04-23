/*
 * Author: Thrax
 * Add instructor actions to an spawned vehicle
 *
 * Arguments:
 * 0: Vehicle to add the actions to <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [vehicle] call FUNC(addActions)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_vehicle"];
_vehicle = _this select 0;

if (!hasInterface) exitWith {};

//If vehicle is destroyed don't add the actions
if (isNull _vehicle || {!alive _vehicle}) exitWith {};

_vehicle addAction [MEU_TEXT_RED(localize "STR_MEU_Spawner_Delete"), 
                   {_this call FUNC(instructor);}, [8], 3, false, true, "", "{alive _x} count crew _target == 0"];
_vehicle addAction [MEU_TEXT_YELLOW(localize "STR_MEU_Spawner_RepairRearmRefuel"), 
                   {_this call FUNC(instructor);}, [9], 3, false, true, "", "(driver _target) == player || gunner _target == player"];

if(_vehicle isKindOf "Air") then {
    _vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_EnableInstructor"), 
                       {_this call FUNC(instructor);}, [0], 3, false, true, "", "((player in _target) && ((driver _target) != player))"];
};