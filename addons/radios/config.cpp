#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main", "extended_eventhandlers", "CBA_UI", "CBA_XEH", "CBA_XEH_A3",
            "ace_common",
            "task_force_radio", "task_force_radio_items",
            "meu_main"
        };
        author[] = {"11thMEU Dev Team"};
        authorUrl = "http://11thmeu.es";
        VERSION_CONFIG;
    };
};

#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"