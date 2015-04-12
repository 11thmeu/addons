/*
    Author: Thrax

    Description:
    Initialize respawn system


    Parameter(s):
    -

    Returns:
    -
*/

["Medical","Respawn module initialization started"] call MEU_fnc_debug;

if (player != player) then {
    waitUntil {player == player};
};

//Init player
GVAR(Dead) = false;

if (MEU_Medical_SaveStatus) then {
    [] spawn {
        
        //Already loaded, exit
        if (!isNil "MEU_Respawn_Status") exitWith {};
        
        //Get status from server
        [[player], "MEU_fnc_respawnModule_server", false, false] call BIS_fnc_MP;
        
        //Wait until information arrives from server, if it exists, load the player
        waitUntil {!isNil "MEU_Respawn_Status"};
        if ((count MEU_Respawn_Status) > 0) then {
            MEU_Respawn_Status call MEU_fnc_respawnModule_load;
            
            //Delete player information from server
            [[player, true], "MEU_fnc_respawnModule_server", false, false] call BIS_fnc_MP;
        };
        
        ["Medical", "Respawn module status loaded"] call MEU_fnc_debug;
    };
};

//Add respawn event handler
player addEventHandler ["Respawn", {_this spawn MEU_fnc_respawnModule_respawned;} ];

["Medical","Respawn module initialization finished"] call MEU_fnc_debug;