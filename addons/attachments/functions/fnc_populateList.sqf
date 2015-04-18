/*
 * Author: Thrax
 * Update the attachments list with the given array
 *
 * Arguments:
 * 0: Attachments <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * [attachments] call FUNC(filterAttachments)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableSerialization;
private ["_attachments", "_display", "_list", "_info", "_index", "_switch1", "_switch2", "_tooltip"];

_attachments = _this select 0;
_display = GETUVAR(GVAR(AttachmentsDialog),displayNull);
_list = _display displayCtrl 7553; 

lbClear _list;
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
        _tooltip = [_tooltip, "<br/>", ", "] call EFUNC(main,replace);
    };
    
    if (GVAR(Tooltips)) then { 
        _tooltip = _tooltip + format[" [%1]", _x];
    };
    
    if (_tooltip != "") then { _list lbSetTooltip [_index, _tooltip]; };
} forEach _attachments;

lbSort [_list, "ASC"];