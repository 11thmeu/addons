/*
 * Author: Thrax
 * Read and load in the equipment variables the classes of the all config types from CfgMEUEquipment
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(readAllConfigs)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_config", "_children", "_name", "_classes", "_uniforms", "_vests", "_backpacks", "_headgear", "_goggles", "_presets"];

_configs = (configFile >> "CfgMEUEquipment") call BIS_fnc_returnchildren;
GVAR(ConfigType) = localize "STR_MEU_Equipment_TypeAll";

//Initialize arrays
GVAR(UniformFactions) = [];
GVAR(Uniforms) = [];
GVAR(VestFactions) = [];
GVAR(Vests) = [];
GVAR(BackpackFactions) = [];
GVAR(Backpacks) = [];
GVAR(HeadgearFactions) = [];
GVAR(Headgear) = [];
GVAR(GoggleFactions) = [];
GVAR(Goggles) = [];
GVAR(PresetFactions) = [];
GVAR(Presets) = [];

{
    _config = _x;

    //Read uniforms from config
    if (isClass (_config >> "Uniforms")) then {
        _uniforms = (_config >> "Uniforms") call BIS_fnc_returnchildren;
        {
            _name = getText (_x >> "displayName");

            if (getNumber (_x >> "common") == 1) then {
                _classes = getArray (configFile >> "CfgMeuCommonEquipment" >> "Uniforms" >> "classes");
            } else {
                _classes = getArray (_x >> "classes");
            };

            if (!(_name in GVAR(UniformFactions))) then {
                GVAR(UniformFactions) pushBack _name;
                GVAR(Uniforms) pushBack _classes;
            };
        } forEach _uniforms;
    };

    //Read vests from config
    if (isClass (_config >> "Vests")) then {
        _vests = (_config >> "Vests") call BIS_fnc_returnchildren;
        {
            _name = getText (_x >> "displayName");

            if (getNumber (_x >> "common") == 1) then {
                _classes = getArray (configFile >> "CfgMeuCommonEquipment" >> "Vests" >> "classes");
            } else {
                _classes = getArray (_x >> "classes");
            };

            if (!(_name in GVAR(VestFactions))) then {
                GVAR(VestFactions) pushBack _name;
                GVAR(Vests) pushBack _classes;
            };
        } forEach _vests;
    };

    //Read backpacks from config
    if (isClass (_config >> "Backpacks")) then {
        _backpacks = (_config >> "Backpacks") call BIS_fnc_returnchildren;
        {
            _name = getText (_x >> "displayName");

            if (getNumber (_x >> "common") == 1) then {
                _classes = getArray (configFile >> "CfgMeuCommonEquipment" >> "Backpacks" >> "classes");
            } else {
                _classes = getArray (_x >> "classes");
            };

            if (!(_name in GVAR(BackpackFactions))) then {
                GVAR(BackpackFactions) pushBack _name;
                GVAR(Backpacks) pushBack _classes;
            };
        } forEach _backpacks;
    };

    //Read headgear from config
    if (isClass (_config >> "Headgear")) then {
        _headgear = (_config >> "Headgear") call BIS_fnc_returnchildren;
        {
            _name = getText (_x >> "displayName");

            if (getNumber (_x >> "common") == 1) then {
                _classes = getArray (configFile >> "CfgMeuCommonEquipment" >> "Headgear" >> "classes");
            } else {
                _classes = getArray (_x >> "classes");
            };

            if (!(_name in GVAR(HeadgearFactions))) then {
                GVAR(HeadgearFactions) pushBack _name;
                GVAR(Headgear) pushBack _classes;
            };
        } forEach _headgear;
    };

    //Read goggles from config
    if (isClass (_config >> "Goggles")) then {
        _goggles = (_config >> "Goggles") call BIS_fnc_returnchildren;
        {
            _name = getText (_x >> "displayName");

            if (getNumber (_x >> "common") == 1) then {
                _classes = getArray (configFile >> "CfgMeuCommonEquipment" >> "Goggles" >> "classes");
            } else {
                _classes = getArray (_x >> "classes");
            };

            if (!(_name in GVAR(GoggleFactions))) then {
                GVAR(GoggleFactions) pushBack _name;
                GVAR(Goggles) pushBack _classes;
            };
        } forEach _goggles;
    };

    //Read presets from config
    if (isClass (_config >> "Presets")) then {
        _presets = (_config >> "Presets") call BIS_fnc_returnchildren;
        {
            _name = getText (_x >> "displayName");
            
            if (!(_name in GVAR(PresetFactions))) then {
                GVAR(PresetFactions) pushBack _name;
                GVAR(Presets) pushBack (getArray (_x >> "presets"));
            };
        } forEach _presets;
    };
} forEach _configs;

//Create the equipment dialog once all configs have been read
["createDialog", ""] call FUNC(equipmentUI);