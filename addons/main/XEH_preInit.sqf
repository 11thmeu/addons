#include "script_component.hpp"

//Initialize debug status to false
if (isNil QUOTE(GVARMAIN(DebugModule)) then { GVARMAIN(DebugModule) = false; };

if (!isServer) exitWith {};
//Send server version to clients
GVAR(ServerVersion) = getText (configFile >> "CfgPatches" >> ADDON >> "versionStr");
publicVariable QGVAR(ServerVersion);