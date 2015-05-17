/*
 * Author: Thrax
 * Read and load in the equipment variables the classes of the given config type from CfgMEUEquipment
 *
 * Arguments:
 * 0: Config type to load, must match a class inside CfgMEUEquipment <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * ['blufor'] call FUNC(readConfig)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_class", "_config", "_uniforms", "_vests", "_backpacks", "_headgear", "_goggles", "_presets"];

_class = _this select 0;

//If class is 'all' read all equipment configs
if (_class == "all") exitWith { call FUNC(readAllConfigs); };

if (!isClass (configFile >> "CfgMEUEquipment" >> _class)) exitWith { ERROR("Error in equipment readConfig function"); };

_config = configFile >> "CfgMEUEquipment" >> _class;
GVAR(ConfigType) = getText (_config >> "displayName");

//Read uniforms from config
GVAR(UniformFactions) = [];
GVAR(Uniforms) = [];
if (isClass (_config >> "Uniforms")) then {
    _uniforms = (_config >> "Uniforms") call BIS_fnc_returnchildren;
    {
        GVAR(UniformFactions) pushBack (getText (_x >> "displayName"));
        if (getNumber (_x >> "common") == 1) then {
            GVAR(Uniforms) pushBack (getArray (configFile >> "CfgMeuCommonEquipment" >> "Uniforms" >> "classes"));
        } else {
            GVAR(Uniforms) pushBack (getArray (_x >> "classes"));
        };
    } forEach _uniforms;
};

//Read vests from config
GVAR(VestFactions) = [];
GVAR(Vests) = [];
if (isClass (_config >> "Vests")) then {
    _vests = (_config >> "Vests") call BIS_fnc_returnchildren;
    {
        GVAR(VestFactions) pushBack (getText (_x >> "displayName"));
        if (getNumber (_x >> "common") == 1) then {
            GVAR(Vests) pushBack (getArray (configFile >> "CfgMeuCommonEquipment" >> "Vests" >> "classes"));
        } else {
            GVAR(Vests) pushBack (getArray (_x >> "classes"));
        };
    } forEach _vests;
};

//Read backpacks from config
GVAR(BackpackFactions) = [];
GVAR(Backpacks) = [];
if (isClass (_config >> "Backpacks")) then {
    _backpacks = (_config >> "Backpacks") call BIS_fnc_returnchildren;
    {
        GVAR(BackpackFactions) pushBack (getText (_x >> "displayName"));
        if (getNumber (_x >> "common") == 1) then {
            GVAR(Backpacks) pushBack (getArray (configFile >> "CfgMeuCommonEquipment" >> "Backpacks" >> "classes"));
        } else {
            GVAR(Backpacks) pushBack (getArray (_x >> "classes"));
        };
    } forEach _backpacks;
};

//Read headgear from config
GVAR(HeadgearFactions) = [];
GVAR(Headgear) = [];
if (isClass (_config >> "Headgear")) then {
    _headgear = (_config >> "Headgear") call BIS_fnc_returnchildren;
    {
        GVAR(HeadgearFactions) pushBack (getText (_x >> "displayName"));
        if (getNumber (_x >> "common") == 1) then {
            GVAR(Headgear) pushBack (getArray (configFile >> "CfgMeuCommonEquipment" >> "Headgear" >> "classes"));
        } else {
            GVAR(Headgear) pushBack (getArray (_x >> "classes"));
        };
    } forEach _headgear;
};

//Read goggles from config
GVAR(GoggleFactions) = [];
GVAR(Goggles) = [];
if (isClass (_config >> "Goggles")) then {
    _goggles = (_config >> "Goggles") call BIS_fnc_returnchildren;
    {
        GVAR(GoggleFactions) pushBack (getText (_x >> "displayName"));
        if (getNumber (_x >> "common") == 1) then {
            GVAR(Goggles) pushBack (getArray (configFile >> "CfgMeuCommonEquipment" >> "Goggles" >> "classes"));
        } else {
            GVAR(Goggles) pushBack (getArray (_x >> "classes"));
        };
    } forEach _goggles;
};

//Read presets from config
GVAR(PresetFactions) = [];
GVAR(Presets) = [];
if (isClass (_config >> "Presets")) then {
    _presets = (_config >> "Presets") call BIS_fnc_returnchildren;
    {
        GVAR(PresetFactions) pushBack (getText (_x >> "displayName"));
        GVAR(Presets) pushBack (getArray (_x >> "presets"));
    } forEach _presets;
};

//Read default profiles from config
GVAR(DefaultProfiles) = [];
if (isArray (_config >> "defaultProfiles")) then {
    GVAR(DefaultProfiles) = getArray (_config >> "defaultProfiles");
};

//Create the equipment dialog once all configs have been read
["createDialog", ""] call FUNC(equipmentUI);