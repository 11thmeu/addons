/*
 * Author: Thrax
 * Filters the vehicles with the user input
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(filterVehicles)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableSerialization;
private ["_display", "_textBox", "_input", "_vehicles", "_filtered"];

_display = GETUVAR(GVAR(SpawnerDialog),displayNull);
_textBox = _display displayCtrl 7564;

_input = toLower (ctrlText _textBox);

switch (GVAR(Type)) do {
    //Land
    case 0: { _vehicles = GVAR(Land); };
    //Air
    case 1: { _vehicles = GVAR(Air); };
    //Water
    case 2: { _vehicles = GVAR(Water); };
    default { _vehicles = []; };
};

//No text, dont apply filter
if (_input == "") exitWith { [_vehicles] call FUNC(populateList); };

//Apply filter
_filtered = [];
{
    if (((toLower _x) find _input) != -1) then {
        _filtered pushBack _x;
    } else {
        _displayName = getText(configFile >> "CfgVehicles" >> _x >> "displayName");
        if (((toLower _displayName) find _input) != -1) then {
            _filtered pushBack _x;
        };
    };
} forEach _vehicles;

//Add elements to listbox
[_filtered] call FUNC(populateList);