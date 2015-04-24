/*
 * Author: Thrax
 * Switch between laser pointer and weapon flashlight for the current weapon
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(switchPointer)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_currentWeapon", "_primaryWeapon", "_secondaryWeapon", "_handgunWeapon", "_pointer", "_pointerSwitch", "_newPointer"];

_currentWeapon = currentWeapon ACE_Player;

if (_currentWeapon == "") exitWith {}; //No weapon

_primaryWeapon = primaryWeapon ACE_Player;
_secondaryWeapon = secondaryWeapon ACE_Player;
_handgunWeapon = handgunWeapon ACE_Player;

_pointer = (ACE_Player weaponAccessories _currentWeapon) select 1;
if (_pointer == "") exitWith {}; //No pointer

//Detect ArmA 3 IR pointer manually to avoid inheritance problems
if (_pointer == "acc_pointer_IR") then {
    _pointerSwitch = "acc_pointer_IR_FlashLight";
} else {
    _pointerSwitch = getText (configFile >> "CfgWeapons" >> _pointer >> "MEU_PointerSwitch");
};
if (_pointerSwitch == "") then { _pointerSwitch = getText (configFile >> "CfgWeapons" >> _pointer >> "MRT_SwitchItemNextClass"); }; //Compatibility with MRT functions
if (_pointerSwitch == "") exitWith {}; //No pointer switch
if ((getNumber (configFile >> "CfgWeapons" >> _pointerSwitch >> "ItemInfo" >> "type")) != 301) exitWith {}; //Not a pointer

switch (_currentWeapon) do {
    case _primaryWeapon: {
        ACE_Player removePrimaryWeaponItem _pointer;
        ACE_Player addPrimaryWeaponItem _pointerSwitch;
        _newPointer = (primaryWeaponItems ACE_Player) select 1;
        if (_newPointer == "") then { //Pointer switch is not compatible, non-ASDG joint rails compatible weapon, add previous pointer
            ACE_Player addPrimaryWeaponItem _pointer;
        } else { //If the change was succesful, show message
            //New pointer is a flashlight
            if (isArray (configFile >> "CfgWeapons" >> _newPointer >> "ItemInfo" >> "FlashLight" >> "color")) then {
                [localize "STR_MEU_Attachments_Flashlight", 2] call ACEFUNC(common,displayTextStructured);
            //New pointer is a laser
            } else {
                [localize "STR_MEU_Attachments_IRLaser", 2] call ACEFUNC(common,displayTextStructured);
            };    
        };
    };
    
    case _secondaryWeapon: {
        ACE_Player removeSecondaryWeaponItem _pointer;
        ACE_Player addSecondaryWeaponItem _pointerSwitch;
        _newPointer = (secondaryWeaponItems ACE_Player) select 1;
        if (_newPointer == "") then { //Pointer switch is not compatible, non-ASDG joint rails compatible weapon, add previous pointer
            ACE_Player addSecondaryWeaponItem _pointer;
        } else { //If the change was succesful, show message
            //New pointer is a flashlight
            if (isArray (configFile >> "CfgWeapons" >> _newPointer >> "ItemInfo" >> "FlashLight" >> "color")) then {
                [localize "STR_MEU_Attachments_Flashlight", 2] call ACEFUNC(common,displayTextStructured);
            //New pointer is a laser
            } else {
                [localize "STR_MEU_Attachments_IRLaser", 2] call ACEFUNC(common,displayTextStructured);
            };    
        };
    };
    
    case _handgunWeapon: {
        ACE_Player removeHandgunItem _pointer;
        ACE_Player addHandgunItem _pointerSwitch;
        _newPointer = (handgunItems ACE_Player) select 1;
        if (_newPointer == "") then { //Pointer switch is not compatible, non-ASDG joint rails compatible weapon, add previous pointer
            ACE_Player addHandgunItem _pointer;
        } else { //If the change was succesful, show message
            //New pointer is a flashlight
            if (isArray (configFile >> "CfgWeapons" >> _newPointer >> "ItemInfo" >> "FlashLight" >> "color")) then {
                [localize "STR_MEU_Attachments_Flashlight", 2] call ACEFUNC(common,displayTextStructured);
            //New pointer is a laser
            } else {
                [localize "STR_MEU_Attachments_IRLaser", 2] call ACEFUNC(common,displayTextStructured);
            };    
        };
    };
};