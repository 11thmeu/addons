/*
 * Author: Thrax
 * Update the attachments dialog
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(updateAttachmentsUI)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableSerialization;
private ["_display", "_weapon", "_type", "_collection", "_filteredCollection"];

_display = GETUVAR(GVAR(AttachmentsDialog),displayNull);

_weapon = lbCurSel (_display displayCtrl 7551);
_type = lbCurSel (_display displayCtrl 7552);
_collection = [];
_filteredCollection = [];

if(_type == -1) then {
    _type = 0;
};

switch(_weapon) do {
    //Primary
    case 0: {
        switch(_type) do {
            //Sights
            case 0: {
                _collection = [primaryWeapon ACE_Player] call FUNC(compatibleAttachments) select 2;
            };
            
            //Pointers
            case 1: {
                _collection = [primaryWeapon ACE_Player] call FUNC(compatibleAttachments) select 1;
            };
            
            //Muzzles
            case 2: {
                _collection = [primaryWeapon ACE_Player] call FUNC(compatibleAttachments) select 0;
            };
            
            //Bipods
            case 3: {
                _collection = [primaryWeapon ACE_Player] call FUNC(compatibleAttachments) select 3;
            };

            default {
                ERROR("Error in attachments update function [1]");
            };
        };
    };
    
    //Secondary
    case 1: {
        switch(_type) do {
            //Sights
            case 0: {
                _collection = [secondaryWeapon ACE_Player] call FUNC(compatibleAttachments) select 2;
            };
            
            //Pointers
            case 1: {
                _collection = [secondaryWeapon ACE_Player] call FUNC(compatibleAttachments) select 1;
            };
            
            //Muzzles
            case 2: {
                _collection = [secondaryWeapon ACE_Player] call FUNC(compatibleAttachments) select 0;
            };
            
            //Bipods
            case 3: {
                _collection = [secondaryWeapon ACE_Player] call FUNC(compatibleAttachments) select 3;
            };

            default {
                ERROR("Error in attachments update function [1]");
            };
        };
    };
    
    //Handgun
    case 2: {
        switch(_type) do {
            //Sights
            case 0: {
                _collection = [handgunWeapon ACE_Player] call FUNC(compatibleAttachments) select 2;
            };
            
            //Pointers
            case 1: {
                _collection = [handgunWeapon ACE_Player] call FUNC(compatibleAttachments) select 1;
            };
            
            //Muzzles
            case 2: {
                _collection = [handgunWeapon ACE_Player] call FUNC(compatibleAttachments) select 0;
            };
            
            //Bipods
            case 3: {
                _collection = [handgunWeapon ACE_Player] call FUNC(compatibleAttachments) select 3;
            };

            default {
                ERROR("Error in attachments update function [1]");
            };
        };
    };
    
    default {
        ERROR("Error in attachments update function [2]");
    };
};

//Check allowed items
if (GVAR(EnableWhitelist)) then {
    {
        if (_x in GVAR(Whitelist)) then {
            _filteredCollection pushBack _x;
        };
    } forEach _collection;
} else {
    if (GVAR(EnableBlacklist)) then {
        {
            if (!(_x in GVAR(Blacklist))) then {
                _filteredCollection pushBack _x;
            };
        } forEach _collection;
    } else {
        _filteredCollection = _collection;
    };
};

//Check thermal sights
_collection = [];
if (!GVAR(EnableThermal)) then {
    {    
        if (!([_x] call EFUNC(main,isThermalAttachment))) then {
            _collection pushBack _x;
        };
        
    } forEach _filteredCollection;
    _filteredCollection = _collection;
};

//Store current listed attachments
GVAR(AttachmentsList) = _filteredCollection;

//Add elements to listbox
[_filteredCollection] call FUNC(populateList);

call FUNC(updateAttachmentsSlots);