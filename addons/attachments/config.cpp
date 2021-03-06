#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"MEU_ModuleAttachments"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main", "extended_eventhandlers", "CBA_UI", "CBA_XEH", "CBA_XEH_A3",
            "ace_common",
            "meu_main",
        };
        author[] = {"11thMEU Dev Team"};
        authorUrl = "http://11thmeu.es";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "AttachmentsUI.hpp"