/*
	Author: Thrax

	Description:
	Return the server status of the given player


	Parameter(s):
		0: OBJECT - player object
		1: BOOL (optional) - true to delete player info

	Returns:
	-
*/

private ["_playerObject", "_clientID", "_clientUID", "_status", "_body"];
_playerObject = _this select 0;
_clientID = owner _playerObject;
_clientUID = getPlayerUID _playerObject;
_status = [];

//Client request for data
if ((count _this) == 1) then {

	call compile format ["if (!isNil 'MEU_Respawn_Status_%1') then {_status = MEU_Respawn_Status_%1;};", _clientUID];

	//Send info to client
	MEU_Respawn_Status = _status;
	_clientID publicVariableClient "MEU_Respawn_Status";
	
	//Delete body if enabled and data exists
	if (MEU_Medical_DeleteBodies && {(count _status) > 0}) then {
		_body = _status select 0;
		if (!isNull _body) then {
			deleteVehicle _body;
		};
	};

	["Medical",format["Server status query for player %1", _clientUID]] call MEU_fnc_debug;

//Client request for deletion
} else {
	if (_this select 1) then {
		
		call compile format ["MEU_Respawn_Status_%1 = nil;", _clientUID];
		
		["Medical",format["Server status deletion for player %1", _clientUID]] call MEU_fnc_debug;
	};
};