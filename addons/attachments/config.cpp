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
            "asdg_jointrails"
        };
        author[] = {"11thMEU Dev Team"};
        authorUrl = "http://11thmeu.es";
        VERSION_CONFIG;
    };
};

class asdg_SlotInfo;
class asdg_FrontSideRail: asdg_SlotInfo
{
    class compatibleItems {
        acc_pointer_IR_FlashLight = 1;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "AttachmentsUI.hpp"