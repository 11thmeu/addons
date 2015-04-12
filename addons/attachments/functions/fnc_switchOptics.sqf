/*
 * Author: Thrax
 * Switch between optic modes for primary weapon
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

private ["_weapon", "_optics", "_opticsSwitch", "_newOptics"];

_weapon = primaryWeapon ACE_Player;
if (_weapon == "") exitWith {}; //No weapon

if ((currentWeapon ACE_Player) != _weapon) exitWith {}; //Current weapon is not primary

_optics = (primaryWeaponItems ACE_Player) select 2;
if (_optics == "") exitWith {}; //No optics

_opticsSwitch = getText (configFile >> "CfgWeapons" >> _optics >> "MRT_SwitchItemNextClass"); //Compatibility with MRT functions
if (_opticsSwitch == "") exitWith {}; //No optics switch
if ((getNumber (configFile >> "CfgWeapons" >> _opticsSwitch >> "ItemInfo" >> "type")) != 201) exitWith {}; //Not an optics

ACE_Player removePrimaryWeaponItem _optics;
ACE_Player addPrimaryWeaponItem _opticsSwitch;

_newOptics = (primaryWeaponItems ACE_Player) select 2;
if (_newOptics == "") then { //Optics switch is not compatible, non-ASDG joint rails compatible weapon, add previous optics
    ACE_Player addPrimaryWeaponItem _optics;
} else { //If the change was succesful, show message
    [localize "STR_MEU_Attachments_Optics", 2] call ACEFUNC(common,displayTextStructured);
};