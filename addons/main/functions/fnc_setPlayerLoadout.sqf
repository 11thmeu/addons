/*
 * Author: Thrax
 * Set the player equipment with the given loadout
 *
 * Arguments:
 * 0: primaryWeapon <STRING>
 * 1: secondaryWeapon <STRING>
 * 2: handgunWeapon <STRING>
 * 3: magazines <ARRAY>
 * 4: uniform <STRING>
 * 5: vest <STRING>
 * 6: backpack <STRING>
 * 7: goggles <STRING>
 * 8: headgear <STRING>
 * 9: items <ARRAY>
 * 10: primaryWeaponItems <ARRAY>
 * 11: secondaryWeaponItems <ARRAY>
 * 12: handgunWeaponItems <ARRAY>
 * 13: uniformItems <ARRAY>
 * 14: vestItems <ARRAY>
 * 15: backpackItems <ARRAY>
 * 16: insignia classname <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["", "", "", [], "", "", "", "", "", [], [], [], [], [], [], [], ""] call FUNC(setPlayerLoadout)
 *
 * Public: [YES]
 */
#include "script_component.hpp"

private ["_primaryWeapon", "_secondaryWeapon", "_handgunWeapon", "_magazines", "_uniform", "_vest", "_backpack", "_goggles", "_headgear", "_items", "_primaryWeaponItems", "_secondaryWeaponItems", "_handgunItems", "_uniformItems", "_vestItems", "_backpackItems", "_currentWeapon", "_container", "_insignia"];

_primaryWeapon = [_this, 0, "", [""]] call BIS_fnc_param;
_secondaryWeapon = [_this, 1, "", [""]] call BIS_fnc_param;
_handgunWeapon = [_this, 2, "", [""]] call BIS_fnc_param;
_magazines = [_this, 3, [], [[]]] call BIS_fnc_param;
_uniform = [_this, 4, "", [""]] call BIS_fnc_param;
_vest = [_this, 5, "", [""]] call BIS_fnc_param;
_backpack = [_this, 6, "", [""]] call BIS_fnc_param;
_goggles = [_this, 7, "", [""]] call BIS_fnc_param;
_headgear = [_this, 8, "", [""]] call BIS_fnc_param;
_items = [_this, 9, [], [[]]] call BIS_fnc_param;
_primaryWeaponItems = [_this, 10, [], [[]]] call BIS_fnc_param;
_secondaryWeaponItems = [_this, 11, [], [[]]] call BIS_fnc_param;
_handgunWeaponItems = [_this, 12, [], [[]]] call BIS_fnc_param;
_uniformItems = [_this, 13, [], [[]]] call BIS_fnc_param;
_vestItems = [_this, 14, [], [[]]] call BIS_fnc_param;
_backpackItems = [_this, 15, [], [[]]] call BIS_fnc_param;
_insignia = [_this, 16, "", [""]] call BIS_fnc_param;

//Remove current equipment
removeAllWeapons ACE_Player;
{ ACE_Player removeMagazine _x; } foreach (magazines ACE_Player);
{
    ACE_Player unassignItem _x;
    ACE_Player removeItem _x;
} foreach (assignedItems ACE_Player);
removeUniform ACE_Player;
removeVest ACE_Player;
removeBackpack ACE_Player;
removeGoggles ACE_Player;
removeHeadGear ACE_Player;

//Add new equipment
if (_uniform != "") then { 
    ACE_Player forceAddUniform _uniform; 
    _container = uniformContainer ACE_Player;
    clearWeaponCargo _container;
    clearMagazineCargo _container;
    clearItemCargo _container;
};
if (_vest != "") then { 
    ACE_Player addVest _vest; 
    _container = vestContainer ACE_Player;
    clearWeaponCargo _container;
    clearMagazineCargo _container;
    clearItemCargo _container;
};
if (_backpack != "") then {
    ACE_Player addBackpack _backpack; 
    _container = backpackContainer ACE_Player;
    clearWeaponCargo _container;
    clearMagazineCargo _container;
    clearItemCargo _container;
};

if (_goggles != "") then { ACE_Player addGoggles _goggles; };
if (_headgear != "") then { ACE_Player addHeadgear _headgear; };

{ ACE_Player addMagazine _x; } forEach _magazines;

{
    if ("Binocular" in ([(configFile >> "CfgWeapons" >> _x), true] call BIS_fnc_returnParents)) then {
        ACE_Player addWeapon _x;
    } else {
        ACE_Player linkItem ([_x] call FUNC(processItem)); 
    };
} forEach _items;

if (_primaryWeapon != "") then { ACE_Player addWeapon _primaryWeapon; };
if (_secondaryWeapon != "") then { ACE_Player addWeapon _secondaryWeapon; };
if (_handgunWeapon != "") then { ACE_Player addWeapon _handgunWeapon; };

{
    if (_x != "") then { ACE_Player addPrimaryWeaponItem _x; };
} forEach _primaryWeaponItems;
{ 
    if (_x != "") then { ACE_Player addSecondaryWeaponItem _x; };
} forEach _secondaryWeaponItems;
{ 
    if (_x != "") then { ACE_Player addHandgunItem _x; };
} forEach _handgunWeaponItems;

{
    if (_x != "") then { ACE_Player addItemToUniform ([_x] call FUNC(processItem)); };
} forEach _uniformItems;
{
    if (_x != "") then { ACE_Player addItemToVest ([_x] call FUNC(processItem)); };
} forEach _vestItems;
{
    if (_x != "") then { ACE_Player addItemToBackpack ([_x] call FUNC(processItem)); };
} forEach _backpackItems;

if (primaryWeapon ACE_Player != "") then { ACE_Player selectWeapon (primaryWeapon ACE_Player); };

if (_insignia != "") then { [ACE_Player, _insignia] call BIS_fnc_setUnitInsignia; };

LOG("[MEU]: Set player loadout");