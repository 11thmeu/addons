/*
 * Author: Thrax
 * Returns all weapon attachments compatible with the given weapon
 *
 * Arguments:
 * 0: Weapon classname <STRING>
 *
 * Return Value:
 * ARRAY with 4 arrays with the attachment classnames in the form [muzzles, pointers, sights, bipods] <ARRAY>
 *
 * Example:
 * _array = ["classname"] call FUNC(compatibleAttachments)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_weapon", "_muzzles", "_pointers", "_sights", "_bipods", "_item", "_type"];

_weapon = _this select 0;
_attachments = [_weapon] call BIS_fnc_compatibleItems;
_muzzles = [];
_pointers = [];
_sights = [];
_bipods = [];

{
    _item = configName (configFile >> "CfgWeapons" >> _x);
    _type = _item call BIS_fnc_itemType;
    switch (_type select 1) do {
        case "AccessoryMuzzle": {
            if(!(_item in _muzzles)) then 
            {
                _muzzles pushBack _item;
            };
        };
        
        case "AccessoryPointer": {
            if(!(_item in _pointers)) then {
                if ((getNumber (configFile >> "CfgWeapons" >> _item >> "MEU_HideItem")) == 0) then {
                    _pointers pushBack _item;
                };
            };
        };
        
        case "AccessorySights": {
            if(!(_item in _sights)) then {
                _sights pushBack _item;
            };
        };
        
        case "AccessoryBipod": {
            if(!(_item in _bipods)) then {
                _bipods pushBack _item;
            };
        };
        
        default {};
    };
} foreach _attachments;

[_muzzles, _pointers, _sights, _bipods]