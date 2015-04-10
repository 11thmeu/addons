#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3_weapons_f",
            "a3_weapons_f_beta",
            "a3_weapons_f_epa",            
        	"cba_main", "extended_eventhandlers", "CBA_UI", "CBA_XEH", "CBA_XEH_A3"
        };
        author[] = {"11thMEU Dev Team"};
        authorUrl = "http://11thmeu.es";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"