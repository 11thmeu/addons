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

private ["_weapon", "_type", "_collection", "_filteredCollection", "_info", "_index", "_tooltip", "_display", "_list", "_switch1", "_switch2"];
_weapon = lbCurSel 7551;
_type = lbCurSel 7552;
_collection = [];
_filteredCollection = [];

if(_type == -1) then {
    _type = 0;
};

_display = GETUVAR(GVAR(AttachmentsDialog),displayNull);
_list = _display displayCtrl 7553; 

lbClear _list;

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

//Add elements to listbox
{
    _info = [_x,"CfgWeapons"] call EFUNC(main,getItemDetails);
    _index = _list lbAdd (_info select 0);
    _list lbSetData [_index, _x];
    _list lbSetPicture [_index, (_info select 1)];
    
    //If item has pointer/optics switch change color
    _switch1 = getText (configFile >> "CfgWeapons" >> _x >> "MEU_PointerSwitch");
    _switch2 = getText (configFile >> "CfgWeapons" >> _x >> "MRT_SwitchItemNextClass");
    if ((_switch1 != "") || (_switch2 != "")) then {
        _list lbSetColor [_index, [0.5,1,0.5,1]];
    };
    
    //If thermals are enabled and optics is thermal change color
    if (GVAR(EnableThermal)) then {
        if ([_x] call EFUNC(main,isThermalAttachment)) then {
            _list lbSetColor [_index, [1,0.5,0.5,1]];
        };
    };
    
    //If DLC item change color
    if ((getText (configFile >> "CfgWeapons" >> _x  >> "DLC")) != "") then {
        _list lbSetColor [_index, [1,1,0,1]];
    };
    
    _tooltip = "";
    if (GVAR(Description)) then {
        _tooltip = _info select 2;
        _tooltip = [_tooltip, "<br />", ", "] call EFUNC(main,replace);
        _tooltip = [_tooltip, "<br>/", ", "] call EFUNC(main,replace);
    };
    
    if (GVAR(Tooltips)) then { 
        _tooltip = _tooltip + format[" [%1]", _x];
    };
    
    if (_tooltip != "") then { _list lbSetTooltip [_index, _tooltip]; };
    
    lbSort [_list, "ASC"];
} forEach _filteredCollection;

call FUNC(updateAttachmentsSlots);