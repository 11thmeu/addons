/*
 * Author: Thrax
 * Spawn selected vehicle
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(spawn)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableSerialization;
private ["_display", "_list", "_selection", "_class", "_type", "_position", "_nearobj", "_type", "_rotation"];

_display = GETUVAR(GVAR(SpawnerDialog),displayNull);
_list = _display displayCtrl 7563;
_selection = lnbCurSelRow _list;

if (_selection == 0 || _selection == -1) exitWith {};

_class = _list lnbData [_selection,0];
_type = GVAR(Settings) select 0;
_position = getMarkerPos (GVAR(Settings) select 1);
_rotation = GVAR(Settings) select 2;
_instructor = GVAR(Settings) select 3;

_nearobj = nearestObjects [_position, [_type], 15]; 
if(count _nearobj >= 1) then {
    deleteVehicle (_nearobj select 0);
};

[{
    EXPLODE_4_PVT(_this,_class,_position,_rotation,_instructor);
    _vehicle = _class createVehicle (_position);
    _vehicle setDir _rotation;
    _vehicle setDamage 0;
    _vehicle lock 0;

    //Fix for autonomous vehicles
    if ((getText(configFile >> "CfgVehicles" >> _class >> "vehicleClass")) == "Autonomous") then {
        createVehicleCrew _vehicle;
    };

    if (_instructor) then {
        [[_vehicle], QFUNC(addActions), 2] call ACEFUNC(common,execRemoteFnc);
    };
}, [_class, _position, _rotation, _instructor], 1, 0] call CBA_fnc_waitAndExecute;