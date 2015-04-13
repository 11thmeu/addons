/*
 * Author: Thrax
 * Initialize respawn system clientside
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(init)
 *
 * Public: [No]
 */
#include "script_component.hpp"

//Init respawn markers
private "_respawn";
{
	_respawn = getMarkerPos _x;
	if (((_respawn select 0) == 0) && ((_respawn select 1) == 0)) then
	{
		createMarkerLocal [_x, [0,0,0]];
	};
}foreach ["respawn_west", "respawn_east", "respawn_guerrila", "respawn_civilian"];

//Init player
GVAR(Dead) = false;

if (GVAR(Persist)) then {
        
    //Get status from server
    GVAR(ReceiveServerDataHandlerID) = [QGVAR(ReceiveServerData), FUNC(load)] call ACEFUNC(common,addEventHandler);
    [QGVAR(ServerData), [ACE_Player]] call ACEFUNC(common,serverEvent);

    LOG("[MEU]: Respawn module status loaded");
};

//Add respawn event handler
player addEventHandler ["Respawn", {_this spawn FUNC(handleRespawn);}];