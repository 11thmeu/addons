#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"meu_main", "ACE_Medical", "ACE_Grenades", "ACE_Explosives"};
        author[] = {"11thMEU Dev Team"};
        authorUrl = "http://11thmeu.es";
        versionDesc = "11thMEU Addons";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
