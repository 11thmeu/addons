/*
 * Author: Thrax
 * Receive a loadout from another player
 *
 * Arguments:
 * 0: Loadout sender <OBJECT>
 * 1: Loadout <ARRAY>
 * 2: Loadout accepted <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * [_unit, _loadout, false] call FUNC(receiveLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_sender", "_loadout", "_accepted"];
_sender = _this select 0;
_loadout = _this select 1;
_accepted = _this select 2;

if (!_accepted) then {
    //Show accept loadout dialog
    GVAR(RemoteSender) = _sender;
    GVAR(RemoteLoadout) = _loadout;
} else {
    //Set the loadout
    //[MEU_Equipment_RemoteSender, MEU_Equipment_RemoteLoadout, true] call MEU_fnc_receiveLoadout;
    _loadout call EFUNC(main,setPlayerLoadout);
    GVAR(RemoteSender) = nil;
    GVAR(RemoteLoadout) = nil;
    //TODO show message
};