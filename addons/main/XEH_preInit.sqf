#include "script_component.hpp"

ADDON = false;

PREP(formatTime12);
PREP(formatTime24);
PREP(getItemDetails);
PREP(getUnitLoadout);
PREP(hideObjectServer);
PREP(isThermalAttachment);
PREP(processItem);
PREP(replace);
PREP(setPlayerLoadout);

if (!isServer) exitWith {ADDON = true;};

//Send server version to clients
GVAR(ServerVersion) = getText (configFile >> "CfgPatches" >> QUOTE(ADDON) >> "versionStr");
publicVariable QGVAR(ServerVersion);

ADDON = true;