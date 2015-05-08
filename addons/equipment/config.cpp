#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"MEU_ModuleEquipment"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"meu_main"};
        author[] = {"11thMEU Dev Team"};
        authorUrl = "http://11thmeu.es";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMEUEquipment.hpp"
#include "CfgVehicles.hpp"
#include "EquipmentUI.hpp"