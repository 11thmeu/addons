/*
 * Author: Thrax
 * Get item display name, picture and short description
 *
 * Arguments:
 * 0: Item classname <STRING>
 * 1: (optional) Config type (i.e. "CfgWeapons") <STRING>
 *
 * Return Value:
 * ARRAY with the item info in the form [display name, picture, short description], empty array if item is not found <ARRAY>
 *
 * Example:
 * _array = ["classname"] call EFUNC(main,getItemDetails)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

private ["_classname", "_configType", "_config", "_displayName", "_picture", "_description", "_information"];

_classname = [_this,0,"",[""]] call BIS_fnc_param;
_configType = [_this,1,"",[""]] call BIS_fnc_param;

if(_classname == "") exitWith {[]};

_configType = if (_configType == "") then
{
    switch (true) do
    {
        case (isClass (configFile >> "CfgMagazines" >> _classname)) : {"CfgMagazines";};
        case (isClass (configFile >> "CfgWeapons" >> _classname)) : {"CfgWeapons";};
        case (isClass (configFile >> "CfgVehicles" >> _classname)) : {"CfgVehicles";};
        case (isClass (configFile >> "CfgGlasses" >> _classname)) : {"CfgGlasses";};
        default {"";};
    };
} else {
    _configType;
};

if(typeName _configType != "STRING") exitWith {[]};
if(!isClass (configFile >> _configType >> _classname)) exitWith {[]};
if(_configType == "") exitWith {[]};

_config = configFile >> _configType >> _classname;
_displayName = getText(_config >> "displayName");
_picture = getText(_config >> "picture");
_description = getText(_config >> "descriptionShort");

_information = [_displayName, _picture, _description];
_information 