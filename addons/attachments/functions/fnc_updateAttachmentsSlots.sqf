/*
 * Author: Thrax
 * Update the attachments dialog slots with the current attachments
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(updateAttachmentsSlots)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableSerialization;

private ["_display", "_control_WeaponSelection", "_control_MuzzleImage", "_control_PointerImage", "_control_SightsImage", "_control_BipodImage", "_weaponType", "_attachments", "_muzzle", "_pointer", "_sights", "_config"];

_display = GETUVAR(GVAR(AttachmentsDialog),displayNull);
_control_WeaponSelection = _display displayCtrl 7551;
_control_MuzzleImage = _display displayCtrl 7554;
_control_PointerImage = _display displayCtrl 7555;
_control_SightsImage = _display displayCtrl 7556;
_control_BipodImage = _display displayCtrl 7557;

_weaponType = lbCurSel _control_WeaponSelection;

switch (_weaponType) do 
{
    case 0:
    {
        _attachments = primaryWeaponItems ACE_Player;
    };
    
    case 1:
    {
        _attachments = secondaryWeaponItems ACE_Player;
    };
    
    case 2:
    {
        _attachments = handgunItems ACE_Player;
    };
    
    default 
    {
        _attachments = primaryWeaponItems ACE_Player;
    };
};

//No weapons
if ((count _attachments) == 0) then {
    _attachments = ["","",""];
}; 

_muzzle = _attachments select 0;
_pointer = _attachments select 1;
_sights = _attachments select 2;
_bipod = _attachments select 3;

if (_muzzle != "") then {
    _config = configFile >> "CfgWeapons" >> _muzzle;
    _control_MuzzleImage ctrlSetText (getText (_config >> "picture"));
    _control_MuzzleImage ctrlSetTooltip (getText (_config >> "displayName"));
} else {
    _control_MuzzleImage ctrlSetText "a3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
    _control_MuzzleImage ctrlSetTooltip "";
};

if (_pointer != "") then {
    _config = configFile >> "CfgWeapons" >> _pointer;
    _control_PointerImage ctrlSetText (getText (_config >> "picture"));
    _control_PointerImage ctrlSetTooltip (getText (_config >> "displayName"));
} else {
    _control_PointerImage ctrlSetText "a3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
    _control_PointerImage ctrlSetTooltip "";
};

if (_sights != "") then {
    _config = configFile >> "CfgWeapons" >> _sights;
    _control_SightsImage ctrlSetText (getText (_config >> "picture"));
    _control_SightsImage ctrlSetTooltip (getText (_config >> "displayName"));
} else {
    _control_SightsImage ctrlSetText "a3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
    _control_SightsImage ctrlSetTooltip "";
};

if (_bipod != "") then {
    _config = configFile >> "CfgWeapons" >> _bipod;
    _control_BipodImage ctrlSetText (getText (_config >> "picture"));
    _control_BipodImage ctrlSetTooltip (getText (_config >> "displayName"));
} else {
    _control_BipodImage ctrlSetText "a3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
    _control_BipodImage ctrlSetTooltip "";
};