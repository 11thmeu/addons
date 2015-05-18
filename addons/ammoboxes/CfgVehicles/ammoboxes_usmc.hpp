class Box_MEU_Weapons_USMC: Box_MEU_Weapons {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Weapons_USMC";
};
class Box_MEU_Weapons_USMC_SOC: Box_MEU_Weapons {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Weapons_USMC_SOC";
};
class Box_MEU_Weapons_USMC_SOC_REG: Box_MEU_Weapons {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Weapons_USMC_REG";
};
/* DEPRECATED
class Box_USMC_Weapons_USMC: Box_MEU_Weapons_USMC {//Naming error, left for compatibility
    scope = 1;
};*/
class Box_MEU_Medical_USMC: Box_MEU_Meds {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Meds_USMC";
};
class Box_MEU_Launchers_USMC: Box_MEU_Launchers {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Launchers_USMC";
};
class Box_MEU_Explosives_USMC: Box_MEU_Explosives {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Explosives_USMC";
};
class Box_MEU_Items_USMC: Box_MEU_Items {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Items_USMC";
};
class Box_MEU_Radios_USMC: Box_MEU_Radios {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Radios_USMC";
};
class Box_MEU_Rations_USMC: Box_MEU_Rations {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_Rations_USMC";
};
class Box_MEU_50Cal_USMC: Box_MEU_50Cal {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_50Cal_USMC";
};
class Box_MEU_Mk19_USMC: Box_MEU_Mk19 {
    scope = 2;
    displayName = "$STR_MEU_Ammoboxes_MK19_USMC";
};

class B_CargoNet_01_ammo_F;
class Box_MEU_Supplies_USMC: B_CargoNet_01_ammo_F {
    MEU_AUTHORS;
    scope = 2;
    vehicleClass = "MEU_Vehicles";
    icon = PATHTOF(data\icon_weapons_ca.paa);
    displayName = "$STR_MEU_Ammoboxes_Supplies_USMC";
    transportAmmo = 0;
    maximumLoad = 1000000000;
    transportMaxWeapons = 1000000000;
    transportMaxMagazines = 1000000000;
    transportMaxBackpacks = 1000000000;
};