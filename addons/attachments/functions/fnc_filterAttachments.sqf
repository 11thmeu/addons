/*
 * Author: Thrax
 * Filters the attachments with the user input
 *
 * Arguments:
 * 0: Parameters <ARRAY>
 * 1: PFH id <NUMBER>
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(filterAttachments)
 *
 * Public: [No]
 */
#include "script_component.hpp"

//If dialog is closed, remove event handler
if (!GVAR(DialogOpen)) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
};

disableSerialization;

private ["_display", "_textBox", "_list", "_input", "_filtered", "_displayName", "_index", "_switch1", "_switch2", "_tooltip"];

_display = GETUVAR(GVAR(AttachmentsDialog),displayNull);
_textBox = _display displayCtrl 7558;
_list = _display displayCtrl 7553;

if (GVAR(ResetFilter)) then {
    //Reset filter
    GVAR(ResetFilter) = false;
    _textBox ctrlSetText "";
    GVAR(AttachmentsFilter) = "";

} else {
    if (GVAR(AttachmentsFilter) != (ctrlText _textBox)) then {
        GVAR(AttachmentsFilter) = (ctrlText _textBox);

        //No text, dont apply filter
        if (GVAR(AttachmentsFilter) == "") exitWith {call FUNC(updateAttachmentsUI)};

        //Apply filter
        _input = toLower GVAR(AttachmentsFilter);
        _filtered = [];
        {
            _displayName = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
            if (((toLower _x) find _input) != -1) then {
                _filtered pushBack _x;
            } else {
                if (((toLower _displayName) find _input) != -1) then {
                    _filtered pushBack _x;
                };
            };    
        } forEach GVAR(AttachmentsList);

        //Add elements to listbox
        [_filtered] call FUNC(populateList);
    };
};