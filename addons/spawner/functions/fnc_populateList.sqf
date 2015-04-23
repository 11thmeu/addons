/*
 * Author: Thrax
 * Update the vehicle spawner list with the given array
 *
 * Arguments:
 * 0: Vehicles <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * [vehiclesArray] call FUNC(populateList)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableSerialization;
private ["_vehicles", "_display", "_list", "_vconfig", "_vehicleFaction", "_vehicleClass", "_vehicleName", "_vehiclePicture", "_index"];

_vehicles = _this select 0;
_display = GETUVAR(GVAR(SpawnerDialog),displayNull);
_list = _display displayCtrl 7563; 

lnbClear _list;

//Title row
_list lnbAddRow [localize "STR_MEU_Spawner_Vehicle", localize "STR_MEU_Spawner_Class", localize "STR_MEU_Spawner_Faction"];
_list lnbSetColor [[0,0],[0.7,0.7,0.95,1]];
_list lnbSetColor [[0,1],[0.7,0.7,0.95,1]];
_list lnbSetColor [[0,2],[0.7,0.7,0.95,1]];
_list lnbSetColor [[0,3],[0.7,0.7,0.95,1]];

{
    _vconfig = configFile >> "CfgVehicles" >> _x;
    _vehicleFaction = getText (configFile >> "CfgFactionClasses" >> (getText (_vconfig >> "faction")) >> "displayName");
    _vehicleClass = getText (configFile >> "CfgVehicleClasses" >> (getText (_vconfig >> "vehicleClass")) >> "displayName");
    _vehicleName = getText(_vconfig >> "displayName");
    _vehiclePicture = getText(_vconfig >> "picture");    

    _index = _list lnbAddRow [_vehicleName, _vehicleClass, _vehicleFaction];
    _list lnbSetPicture [[_index, 0], _vehiclePicture];
    _list lnbSetData [[_index,0], _x];
    _list lbSetToolTip [_index, _x];
} foreach _vehicles;