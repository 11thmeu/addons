/*
 * Author: Thrax
 * Adds the selected attachment to the player
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Selected item index <NUMBER>
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(addAttachment)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableSerialization;
private ["_weapon", "_type", "_selected", "_primaryAttachments", "_secondaryAttachments", "_handgunAttachments"];
private ["_currentSights", "_currentPointer", "_currentMuzzle", "_currentBipod", "_newSights", "_newPointer", "_newMuzzle", "_newBipod"];
private ["_control", "_selected"];

_control = _this select 0;
_selected = _this select 1;

_display = GETUVAR(GVAR(AttachmentsDialog),displayNull);
_weapon = lbCurSel (_display displayCtrl 7551);
_type = lbCurSel (_display displayCtrl 7552);

_primaryAttachments = primaryWeaponItems ACE_Player;
_secondaryAttachments = secondaryWeaponItems ACE_Player;
_handgunAttachments = handgunItems ACE_Player;

if(_selected != -1) then {
    switch(_weapon) do {
        //Primary
        case 0: {
            switch(_type) do {
                //Sights
                case 0: {
                    _currentSights = _primaryAttachments select 2;
                    _newSights = _control lbData _selected;

                    if(_currentSights == "") then {
                        ACE_Player addprimaryWeaponItem _newSights;
                    } else {                    
                        //Change attachment
                        ACE_Player removeprimaryWeaponItem _currentSights;
                        ACE_Player addprimaryWeaponItem _newSights;
                    };
                };
                
                //Pointers
                case 1: {
                    _currentPointer = _primaryAttachments select 1;
                    _newPointer = _control lbData _selected;

                    if(_currentPointer == "") then {
                        ACE_Player addprimaryWeaponItem _newPointer;
                    } else {
                        //Change attachment
                        ACE_Player removeprimaryWeaponItem _currentPointer;
                        ACE_Player addprimaryWeaponItem _newPointer;
                    };
                };
                
                //Muzzles
                case 2: {
                    _currentMuzzle = _primaryAttachments select 0;
                    _newMuzzle = _control lbData _selected;

                    if(_currentMuzzle == "") then {
                        ACE_Player addprimaryWeaponItem _newMuzzle;
                    } else {
                        //Change attachment
                        ACE_Player removeprimaryWeaponItem _currentMuzzle;
                        ACE_Player addprimaryWeaponItem _newMuzzle;
                    };
                };
                
                //Bipods
                case 3: {
                    _currentBipod = _primaryAttachments select 3;
                    _newBipod = _control lbData _selected;

                    if(_currentBipod == "") then {
                        ACE_Player addprimaryWeaponItem _newBipod;
                    } else {
                        //Change attachment
                        ACE_Player removeprimaryWeaponItem _currentBipod;
                        ACE_Player addprimaryWeaponItem _newBipod;
                    };
                };

                default {
                    ERROR("Error in add attachment function [1]");
                };
            };
        };
        
        //Secondary
        case 1: {
            switch(_type) do {
                //Sights
                case 0: {
                    _currentSights = _secondaryAttachments select 2;
                    _newSights = _control lbData _selected;
                    
                    if(_currentSights == "") then {
                        ACE_Player addsecondaryWeaponItem _newSights;
                    } else {                    
                        //Change attachment
                        ACE_Player removeSecondaryWeaponItem _currentSights;
                        ACE_Player addsecondaryWeaponItem _newSights;
                    };
                };
                
                //Pointers
                case 1: {
                    _currentPointer = _secondaryAttachments select 1;
                    _newPointer = _control lbData _selected;
                    
                    if(_currentPointer == "") then {
                        ACE_Player addsecondaryWeaponItem _newPointer;
                    } else {
                        //Change attachment
                        ACE_Player removeSecondaryWeaponItem _currentPointer;
                        ACE_Player addsecondaryWeaponItem _newPointer;
                    };
                };
                
                //Muzzles
                case 2: {
                    _currentMuzzle = _secondaryAttachments select 0;
                    _newMuzzle = _control lbData _selected;
                    
                    if(_currentMuzzle == "") then {
                        ACE_Player addsecondaryWeaponItem _newMuzzle;
                    } else {
                        //Change attachment
                        ACE_Player removeSecondaryWeaponItem _currentMuzzle;
                        ACE_Player addsecondaryWeaponItem _newMuzzle;
                    };
                };
                
                //Bipods
                case 3: {
                    _currentBipod = _secondaryAttachments select 3;
                    _newBipod = _control lbData _selected;

                    if(_currentBipod == "") then {
                        ACE_Player addsecondaryWeaponItem _newBipod;
                    } else {
                        //Change attachment
                        ACE_Player removeSecondaryWeaponItem _currentBipod;
                        ACE_Player addsecondaryWeaponItem _newBipod;
                    };
                };

                default {
                    ERROR("Error in add attachment function [1]");
                };
            };
        };
        
        //Handgun
        case 2: {
            switch(_type) do {
                //Sights
                case 0: {
                    _currentSights = _handgunAttachments select 2;
                    _newSights = _control lbData _selected;

                    if(_currentSights == "") then {
                        ACE_Player addHandgunItem _newSights;
                    } else {
                        //Change attachment
                        ACE_Player removeHandgunItem _currentSights;
                        ACE_Player addHandgunItem _newSights;
                    };
                };
                
                //Pointers
                case 1: {
                    _currentPointer = _handgunAttachments select 1;
                    _newPointer = _control lbData _selected;

                    if(_currentPointer == "") then {
                        ACE_Player addHandgunItem _newPointer;
                    } else {
                        //Change attachment
                        ACE_Player removeHandgunItem _currentPointer;
                        ACE_Player addHandgunItem _newPointer;
                    };
                };
                
                //Muzzles
                case 2: {
                    _currentMuzzle = _handgunAttachments select 0;
                    _newMuzzle = _control lbData _selected;

                    if(_currentMuzzle == "") then {
                        ACE_Player addHandgunItem _newMuzzle;
                    } else {
                        //Change attachment
                        ACE_Player removeHandgunItem _currentMuzzle;
                        ACE_Player addHandgunItem _newMuzzle;
                    };
                };
                
                //Bipods
                case 3: {
                    _currentBipod = _handgunAttachments select 3;
                    _newBipod = _control lbData _selected;

                    if(_currentBipod == "") then {
                        ACE_Player addHandgunItem _newBipod;
                    } else {
                        //Change attachment
                        ACE_Player removeHandgunItem _currentBipod;
                        ACE_Player addHandgunItem _newBipod;
                    };
                };

                default {
                    ERROR("Error in add attachment function [1]");
                };
            };
        };
        
        default {
            ERROR("Error in add attachment function [2]");
        };
    };    
};

call FUNC(updateAttachmentsSlots);