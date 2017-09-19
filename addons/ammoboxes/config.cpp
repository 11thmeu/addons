#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"Box_MEU_Crate", "Box_MEU_Equipment", "Box_MEU_Explosives", "Box_MEU_Items", "Box_MEU_Launchers", "Box_MEU_Meds", "Box_MEU_Radios", "Box_MEU_Weapons", "Box_MEU_Ropes", "Box_MEU_Rations",
                   "Box_MEU_Weapons_USMC", "Box_MEU_Medical_USMC", "Box_MEU_Launchers_USMC", "Box_MEU_Explosives_USMC", "Box_MEU_Items_USMC", "Box_MEU_Radios_USMC", "Box_MEU_Weapons_RU", "Box_MEU_Supplies_USMC"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"meu_main", "ACE_Medical", "ACE_Grenades", "ACE_Explosives", "ACE_Parachute"};
        author = "11thMEU Dev Team";
        authorUrl = "http://11thmeu.es";
        versionDesc = "11thMEU Addons";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
