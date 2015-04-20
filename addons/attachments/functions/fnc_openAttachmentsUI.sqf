/*
 * Author: Thrax
 * Open the attachments dialog with the configured parameters
 *
 * Arguments:
 * 0: -
 * 1: -
 * 2: -
 * 3: Action parameters <ARRAY>
 *        0: Enable thermal sights <BOOL>
 *        1: Enable blacklist <BOOL>
 *        2: List of non-allowed attachments <ARRAY>
 *        3: Enable whitelist <BOOL>
 *        4: List of allowed attachments <ARRAY>
 *        5: Show attachment descriptions <BOOL>
 *        6: Show classnames <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["", "", "", [true, true, ["attachment1", "attachment2"], false, [], true, true]] call FUNC(openAttachmentsUI)
 *
 * Public: [No]
 */
#include "script_component.hpp"

//Module parameters
GVAR(EnableThermal) = (_this select 3) select 0;
GVAR(EnableBlacklist) = (_this select 3) select 1;
GVAR(Blacklist) = (_this select 3) select 2;
GVAR(EnableWhitelist) = (_this select 3) select 3;
GVAR(Whitelist) = (_this select 3) select 4;
GVAR(Description) = (_this select 3) select 5;
GVAR(Tooltips) = (_this select 3) select 6;

//-------------------------------------------------

createDialog "RscMEU_Attachments";

disableSerialization;
private ["_display", "_comboWeapons", "_comboTypes"];

_display = GETUVAR(GVAR(AttachmentsDialog),displayNull);
_comboWeapons = _display displayCtrl 7551;
_comboTypes = _display displayCtrl 7552;

(_display displayCtrl 7555) ctrlSetEventHandler ["MouseButtonClick", "hint 'EXECThis'; true"];

//Add weapon types
{
    _comboWeapons lbAdd _x;
} forEach [(localize "STR_MEU_Attachments_Primary"), (localize "STR_MEU_Attachments_Secondary"), (localize "STR_MEU_Attachments_Handgun")];
_comboWeapons lbSetCurSel 0;

//Add attachment types
{
    _comboTypes lbAdd _x;
} forEach [(localize "STR_MEU_Attachments_Sights"), (localize "STR_MEU_Attachments_Pointer"), (localize "STR_MEU_Attachments_Muzzle"), (localize "STR_MEU_Attachments_Bipod")];
_comboTypes lbSetCurSel 0;

call FUNC(updateAttachmentsSlots);

//Initialize module variables
GVAR(AttachmentsList) = [];
GVAR(AttachmentsFilter) = "*";
GVAR(ResetFilter) = false;
GVAR(DialogOpen) = true;

//Initialize filter
[FUNC(filterAttachments), 0.5, []] call CBA_fnc_addPerFrameHandler;