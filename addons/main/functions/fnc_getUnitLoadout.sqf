/*
 * Author: Thrax
 * Get an array with all the equipment a unit has.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * ARRAY with all the data <ARRAY>
 *
 * Example:
 * [unit] call FUNC(getUnitLoadout)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

private ["_unit", "_primaryWeapon", "_secondaryWeapon", "_handgunWeapon", "_magazines", "_uniform", "_vest", "_backpack", "_goggles", "_headgear", "_items", "_primaryWeaponItems", "_secondaryWeaponItems", "_handgunItems", "_uniformItems", "_vestItems", "_backpackItems", "_binocular", "_insignia", "_result"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
if (isNull _unit) exitWith {[]};

_primaryWeapon = primaryWeapon _unit;
_secondaryWeapon = secondaryWeapon _unit;
_handgunWeapon = handgunWeapon _unit;
_magazines = [];
_uniform = uniform _unit;
_vest = vest _unit;
_backpack = backpack _unit;
_goggles = goggles _unit;
_headgear = headgear _unit;
_items = assignedItems _unit;
_primaryWeaponItems = primaryWeaponItems _unit;
_secondaryWeaponItems = secondaryWeaponItems _unit;
_handgunItems = handGunItems _unit;

//Weapons magazines
{ _primaryWeaponItems pushBack _x; } foreach (primaryWeaponMagazine _unit);
{ _secondaryWeaponItems pushBack _x; } foreach (secondaryWeaponMagazine _unit);
{ _handgunItems pushBack _x; } foreach (handgunMagazine _unit);

//Containers items
_uniformItems = if (_uniform != "") then { uniformItems _unit } else { [] };
_vestItems = if (_vest != "") then { vestItems _unit } else { [] };
_backpackItems = if (_backpack != "") then { backPackItems _unit } else { [] };

//Check for laser batteries
_binocular = binocular _unit;
if (count (getArray (configFile >> "CfgWeapons" >> _binocular >> "magazines")) != 0) then {
    {
        if ((_x select 0) == _binocular) then {
            if (IS_ARRAY(_x select 4)) then {
                _magazines pushBack ((_x select 4) select 0);
            };
        };
    } forEach weaponsItems _unit;
};

//Check for ACE earplugs
if (GETVAR(_unit,ACE_hasEarPlugsIn,false)) then {
    switch true do {
        case (_unit canAddItemToUniform "ACE_EarPlugs"): { _unit addItemToUniform "ACE_EarPlugs"; };
        case (_unit canAddItemToVest "ACE_EarPlugs"): { _unit addItemToVest "ACE_EarPlugs"; };
        case (_unit canAddItemToBackpack "ACE_EarPlugs"): { _unit addItemToBackpack "ACE_EarPlugs"; };
        default {};
    };
};

_insignia = [_unit] call BIS_fnc_getUnitInsignia; 

_result = [_primaryWeapon, _secondaryWeapon, _handgunWeapon, _magazines, _uniform, _vest, _backpack, _goggles, _headgear, _items, _primaryWeaponItems, _secondaryWeaponItems, _handgunItems, _uniformItems, _vestItems, _backpackItems, _insignia];

LOG(format["[MEU]: Get unit loadout : %1", _result]);

_result 