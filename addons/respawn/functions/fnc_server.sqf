/*
 * Author: Thrax
 * Return or delete the server status of the given player
 *
 * Arguments:
 * 0: player unit <OBJECT>
 * 1: (optional) delete player info <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * [unit] call FUNC(server)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_playerObject", "_clientID", "_clientUID", "_status", "_body"];
_playerObject = _this select 0;
_clientID = owner _playerObject;
_clientUID = getPlayerUID _playerObject;
_status = [];

//Client request for data
if ((count _this) == 1) then {

    call compile format ["if (!isNil 'meu_respawn_Status_%1') then {_status = meu_respawn_Status_%1;};", _clientUID];

    //Send info to client
    [QGVAR(receiveServerData), [ACE_Player], _status] call ACEFUNC(common,targetEvent);
    
    //Delete body if enabled and data exists
    if (GVAR(DeleteBodies) && {(count _status) > 0}) then {
        _body = _status select 0;
        if (!isNull _body) then {
            deleteVehicle _body;
        };
    };
    
    //Delete data
    call compile format ["meu_respawn_Status_%1 = nil;", _clientUID];

    LOG(format["[MEU]: Server status query for player %1", _clientUID]);

//Client request for deletion
} else {
    if (_this select 1) then {
        
        call compile format ["meu_respawn_Status_%1 = nil;", _clientUID];
        
        LOG(format["[MEU]: Server status deletion for player %1", _clientUID]);
    };
};