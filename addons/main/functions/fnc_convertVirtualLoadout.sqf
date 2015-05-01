/*
 * Author: Thrax
 * Convert a loadout saved in virtual arsenal to the 11th MEU addons standard
 *
 * Arguments:
 * 0: Virtual Loadout <ARRAY>
 *
 * Return Value:
 * ARRAY with all the converted loadout <ARRAY>
 *
 * Example:
 * [_loadout] call FUNC(convertVirtualLoadout)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

private ["_inputData", "_binocular", "_primaryWeapon", "_secondaryWeapon", "_handgunWeapon", "_items", "_magazines", "_primaryMagazine", "_secondaryMagazine", "_handgunMagazine"];
private ["_uniform", "_vest", "_backpack", "_goggles", "_headgear", "_items", "_primaryWeaponItems", "_secondaryWeaponItems", "_handgunItems", "_uniformItems", "_vestItems", "_backpackItems"];
private ["_insignia", "_result"];
_inputData = _this select 0;

_magazines = [];

_items = _inputData select 9;
_binocular = _inputData select 5;
if (_binocular != "") then {
    _items pushBack _binocular;
    
    //If binocular is a laser designator add the batteries too
    if (count (getArray (configFile >> "CfgWeapons" >> _binocular >> "magazines")) != 0) then {
        _magazines pushBack ((getArray (configFile >> "CfgWeapons" >> _binocular >> "magazines")) select 0);
    };
};
_primaryWeapon = (_inputData select 6) select 0;
_secondaryWeapon = (_inputData select 7) select 0;
_handgunWeapon = (_inputData select 8) select 0;

_primaryMagazine = (_inputData select 6) select 2;
if (_primaryMagazine != "") then {
    _magazines pushBack _primaryMagazine;
};
_secondaryMagazine = (_inputData select 7) select 2;
if (_secondaryMagazine != "") then {
    _magazines pushBack _secondaryMagazine;
};
_handgunMagazine = (_inputData select 8) select 2;
if (_handgunMagazine != "") then {
    _magazines pushBack _handgunMagazine;
};

_uniform = (_inputData select 0) select 0;
_vest = (_inputData select 1) select 0;
_backpack = (_inputData select 2) select 0;

_goggles = _inputData select 4;
_headgear = _inputData select 3;

_primaryWeaponItems = (_inputData select 6) select 1;
_secondaryWeaponItems = (_inputData select 7) select 1;
_handgunItems = (_inputData select 8) select 1;

_uniformItems = (_inputData select 0) select 1;
_vestItems = (_inputData select 1) select 1;
_backpackItems = (_inputData select 2) select 1;

_insignia = "";

_result = [_primaryWeapon, _secondaryWeapon, _handgunWeapon, _magazines, _uniform, _vest, _backpack, _goggles, _headgear, _items, _primaryWeaponItems, _secondaryWeaponItems, _handgunItems, _uniformItems, _vestItems, _backpackItems, _insignia];

_result 