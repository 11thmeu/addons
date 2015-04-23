/*
 * Author: Thrax
 * Open the vehicle spawner dialog with the configured parameters
 *
 * Arguments:
 * 0: -
 * 1: -
 * 2: -
 * 3: Action parameters <ARRAY>
 *        0: Vehicle type <NUMBER>
 *        1: Spawn position marker <STRING>
 *        2: Spawn rotation <NUMBER>
 *        3: Training mode <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["", "", "", [0,"marker",180,false]] call FUNC(openSpawnerUI)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_type", "_vehicleList", "_vehicleType", "_position", "_rotation", "_instructor"];

createdialog "RscMEU_Spawner";
_type = (_this select 3) select 0;
_position = (_this select 3) select 1;
_rotation = (_this select 3) select 2;
_instructor = (_this select 3) select 3;

GVAR(Type) = _type;
switch (_type) do {
    //Land
    case 0: { _vehicleList = GVAR(Land); _vehicleType = "LandVehicle"; };
    //Air
    case 1: { _vehicleList = GVAR(Air); _vehicleType = "Air"; };
    //Water
    case 2: { _vehicleList = GVAR(Water); _vehicleType = "Ship"; };

    default {
        ERROR("Error in spawner module, undefined vehicle type");
        _vehicleList = [];
        _vehicleType = "Unknown";
    };
};

[_vehicleList] call FUNC(populateList);

GVAR(Settings) = [_vehicleType, _position, _rotation, _instructor];