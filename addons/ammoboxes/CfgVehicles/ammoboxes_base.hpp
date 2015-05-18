class Box_NATO_AmmoVeh_F;
class Box_MEU_Crate: Box_NATO_AmmoVeh_F {
    MEU_AUTHORS;
    scope = 2;
    displayName = "$STR_MEU_Vehicles_Crate_name";
    vehicleClass = "MEU_Vehicles";
    icon = PATHTOF(data\icon_crate_ca.paa);
    hiddenSelections[] = {"Camo", "Camo_Signs"};
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa"};
    class TransportMagazines {};
    class TransportWeapons {};
    class TransportItems {};
    transportAmmo = 0;
    maximumLoad = 1000000000;
    transportMaxWeapons = 1000000000;
    transportMaxMagazines = 1000000000;
    transportMaxBackpacks = 1000000000;
};

class Box_MEU_Equipment: Box_MEU_Crate {
    MEU_AUTHORS;
    scope = 2;
    displayName = "$STR_MEU_Vehicles_Equipment_name";
    icon = PATHTOF(data\icon_equipment_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_equipment_ca.paa)};
};

class Box_MEU_Explosives: Box_MEU_Crate {
    MEU_AUTHORS;
    scope = 2;
    displayName = "$STR_MEU_Vehicles_Explosives_name";
    icon = PATHTOF(data\icon_explosives_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_explosives_ca.paa)};
};

class Box_MEU_Items: Box_MEU_Crate {
    MEU_AUTHORS;
    scope = 2;
    displayName = "$STR_MEU_Vehicles_Items_name";
    icon = PATHTOF(data\icon_items_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_items_ca.paa)};
};

class Box_MEU_Launchers: Box_MEU_Crate
{
    MEU_AUTHORS;
    scope = 2;
    _generalMacro = "Box_MEU_Launchers";
    displayName = "$STR_MEU_Vehicles_Launchers_name";
    icon = PATHTOF(data\icon_launchers_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_launchers_ca.paa)};
};
class Box_MEU_Meds: Box_MEU_Crate
{
    MEU_AUTHORS;
    scope = 2;
    _generalMacro = "Box_MEU_Meds";
    displayName = "$STR_MEU_Vehicles_Medical_name";
    icon = PATHTOF(data\icon_medical_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_medical_ca.paa)};
};
class Box_MEU_Radios: Box_MEU_Crate
{
    MEU_AUTHORS;
    scope = 2;
    _generalMacro = "Box_MEU_Radios";
    displayName = "$STR_MEU_Vehicles_Radios_name";
    icon = PATHTOF(data\icon_radios_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_radios_ca.paa)};
};
class Box_MEU_Weapons: Box_MEU_Crate
{
    MEU_AUTHORS;
    scope = 2;
    _generalMacro = "Box_MEU_Weapons";
    displayName = "$STR_MEU_Vehicles_Weapons_name";
    icon = PATHTOF(data\icon_weapons_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_weapons_ca.paa)};
};
class Box_MEU_Ropes: Box_MEU_Crate
{
    MEU_AUTHORS;
    scope = 2;
    _generalMacro = "Box_MEU_Ropes";
    displayName = "$STR_MEU_Vehicles_Ropes_name";
    icon = PATHTOF(data\icon_ropes_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_ropes_ca.paa)};
};
class Box_MEU_Rations: Box_MEU_Crate
{
    MEU_AUTHORS;
    scope = 2;
    _generalMacro = "Box_MEU_Rations";
    displayName = "$STR_MEU_Vehicles_Rations_name";
    icon = PATHTOF(data\icon_rations_ca.paa);
    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_rations_ca.paa)};
};