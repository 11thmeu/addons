#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"meu_main", "meu_ammunition",
            "asdg_jointrails", "FHQ_Accessories", 
            "c1987_mp7_c",
            "RHARD_MK18_Mod1", 
            "RH_m4_cfg", 
            "mas_weapons_m4", "mas_weapons_ak", "mas_weapons_nw", 
            "hlcweapons_ar15", "hlcweapons_aks", "hlcweapons_falpocalypse", "hlcweapons_g3", "hlcweapons_m60e4", "hlcweapons_m14", "hlcweapons_mp5",
        };
        author[] = {"11thMEU Dev Team"};
        authorUrl = "http://11thmeu.es";
        versionDesc = "11thMEU Addons";
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"