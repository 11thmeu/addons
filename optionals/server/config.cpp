#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"meu_main"};
        author[] = {"11thMEU Dev Team"};
        authorUrl = "http://11thmeu.es";
        VERSION_CONFIG;
    };
};

class MEU_ServerSettings {
    #include "\userconfig\meu\server.hpp"
};