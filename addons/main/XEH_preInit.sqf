#include "script_component.hpp"

ADDON = false;

//Initialize debug status to false
if (isNil QUOTE(GVARMAIN(DebugModule))) then { GVARMAIN(DebugModule) = false; };

PREP(getItemDetails);
PREP(isThermalAttachment);
PREP(replace);

if (!isServer) exitWith {ADDON = true;};

//Send server version to clients
GVAR(ServerVersion) = getText (configFile >> "CfgPatches" >> QUOTE(ADDON) >> "versionStr");
publicVariable QGVAR(ServerVersion);

ADDON = true;