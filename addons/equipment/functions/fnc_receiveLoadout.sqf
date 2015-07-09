/*
 * Author: Thrax
 * Receive a loadout from another player
 *
 * Arguments:
 * 0: Loadout sender <STRING>
 * 1: Loadout target <OBJECT>
 * 2: Loadout <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * [name _unit, _target, _loadout] call FUNC(receiveLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableSerialization;
private ["_sender", "_target", "_loadout", "_display", "_label"];
_sender = _this select 0;
_target = _this select 1;
_loadout = _this select 2;

if (_target != ACE_Player) exitWith {}; //This loadout is not for the local client

if (!isNil QGVAR(ReceivedLoadout)) exitWith {}; //Another loadout has been received, wait to accept or decline

GVAR(ReceivedLoadout) = _loadout;

createDialog "RscMEU_ReceiveEquipment";
_display = GETUVAR(GVAR(ReceptionDisplay),displayNull);
_label = DCONTROL(IDC_RSCMEURECEIVEEQUIPMENT_LABEL);
_label ctrlSetText format["%1 %2%3", localize "STR_MEU_Equipment_LabelReceived1", _sender, localize "STR_MEU_Equipment_LabelReceived2"];