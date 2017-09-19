#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"MEU_ModuleRespawn", "MEU_ModuleJipTeleport"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"meu_main"};
        author = "11thMEU Dev Team";
        authorUrl = "http://11thmeu.es";
        versionDesc = "11thMEU Addons";
        VERSION_CONFIG;
    };
};

class CfgScriptPaths {
    meu_respawn = PATHTOF(scripts\);
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "RscTitles.hpp"