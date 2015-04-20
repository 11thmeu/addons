/*
 * Author: Thrax
 * Removes the clicked attachment of the player
 *
 * Arguments:
 * 0: Attachment type <NUMBER>
 *
 * Return Value:
 * -
 *
 * Example:
 * [0] call FUNC(removeAttachment)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_type", "_weapon", "_primaryAttachments", "_secondaryAttachments", "_handgunAttachments", "_currentSights", "_currentPointer", "_currentMuzzle", "_currentBipod"];

_type = _this select 0;

_weapon = lbCurSel (GETUVAR(GVAR(AttachmentsDialog),displayNull) displayCtrl 7551);

_primaryAttachments = primaryWeaponItems ACE_Player;
_secondaryAttachments = secondaryWeaponItems ACE_Player;
_handgunAttachments = handgunItems ACE_Player;

switch(_weapon) do {
    //Primary
    case 0: {
        switch(_type) do {
            //Sights
            case 0: {
                _currentSights = _primaryAttachments select 2;
                if(_currentSights != "") then {
                    ACE_Player removeprimaryWeaponItem _currentSights;
                };
            };
            
            //Pointers
            case 1: {
                _currentPointer = _primaryAttachments select 1;
                if(_currentPointer != "") then {
                    ACE_Player removeprimaryWeaponItem _currentPointer;
                };
            };
            
            //Muzzles
            case 2: {
                _currentMuzzle = _primaryAttachments select 0;
                if(_currentMuzzle != "") then {
                    ACE_Player removeprimaryWeaponItem _currentMuzzle;
                };
            };
            
            //Bipods
            case 3: {
                _currentBipod = _primaryAttachments select 3;
                if(_currentBipod != "") then {
                    ACE_Player removeprimaryWeaponItem _currentBipod;
                };
            };

            default {
                ERROR("Error in remove attachment function [1]");
            };
        };
    };
    
    //Secondary
    case 1: {
        switch(_type) do {
            //Sights
            case 0: {
                _currentSights = _secondaryAttachments select 2;
                if(_currentSights != "") then {
                    ACE_Player removeSecondaryWeaponItem _currentSights;
                };
            };
            
            //Pointers
            case 1: {
                _currentPointer = _secondaryAttachments select 1;
                if(_currentPointer != "") then {
                    ACE_Player removeSecondaryWeaponItem _currentPointer;
                };
            };
            
            //Muzzles
            case 2: {
                _currentMuzzle = _secondaryAttachments select 0;
                if(_currentMuzzle != "") then {
                    ACE_Player removeSecondaryWeaponItem _currentMuzzle;
                };
            };
            
            //Bipods
            case 3: {
                _currentBipod = _secondaryAttachments select 3;
                if(_currentBipod != "") then {
                    ACE_Player removeSecondaryWeaponItem _currentBipod;
                };
            };

            default {
                ERROR("Error in remove attachment function [1]");
            };
        };
    };
    
    //Handgun
    case 2: {
        switch(_type) do {
            //Sights
            case 0: {
                _currentSights = _handgunAttachments select 2;
                if(_currentSights != "") then {
                    ACE_Player removeHandgunItem _currentSights;
                };
            };
            
            //Pointers
            case 1: {
                _currentPointer = _handgunAttachments select 1;
                if(_currentPointer != "") then {
                    ACE_Player removeHandgunItem _currentPointer;
                };
            };
            
            //Muzzles
            case 2: {
                _currentMuzzle = _handgunAttachments select 0;
                if(_currentMuzzle != "") then {
                    ACE_Player removeHandgunItem _currentMuzzle;
                };
            };
            
            //Bipods
            case 3: {
                _currentBipod = _handgunAttachments select 3;
                if(_currentBipod != "") then {
                    ACE_Player removeHandgunItem _currentBipod;
                };
            };

            default {
                ERROR("Error in remove attachment function [1]");
            };
        };
    };
    
    default {
        ERROR("Error in remove attachment function [2]");
    };
};

call FUNC(updateAttachmentsSlots);

true 