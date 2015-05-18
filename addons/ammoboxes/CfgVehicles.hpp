class CfgVehicles 
{
	class Box_NATO_AmmoVeh_F;
	class Box_MEU_Crate: Box_NATO_AmmoVeh_F {
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Crate_name";
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
	    displayName = "$STR_MEU_Ammoboxes_Equipment_name";
	    icon = PATHTOF(data\icon_equipment_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_equipment_ca.paa)};
	};

	class Box_MEU_Explosives: Box_MEU_Crate {
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Explosives_name";
	    icon = PATHTOF(data\icon_explosives_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_explosives_ca.paa)};
	};

	class Box_MEU_Items: Box_MEU_Crate {
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Items_name";
	    icon = PATHTOF(data\icon_items_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_items_ca.paa)};
	};

	class Box_MEU_Launchers: Box_MEU_Crate
	{
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Launchers_name";
	    icon = PATHTOF(data\icon_launchers_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_launchers_ca.paa)};
	};
	class Box_MEU_Meds: Box_MEU_Crate
	{
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Medical_name";
	    icon = PATHTOF(data\icon_medical_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_medical_ca.paa)};
	};
	class Box_MEU_Radios: Box_MEU_Crate
	{
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Radios_name";
	    icon = PATHTOF(data\icon_radios_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_radios_ca.paa)};
	};
	class Box_MEU_Weapons: Box_MEU_Crate
	{
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Weapons_name";
	    icon = PATHTOF(data\icon_weapons_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_weapons_ca.paa)};
	};
	class Box_MEU_Ropes: Box_MEU_Crate
	{
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Ropes_name";
	    icon = PATHTOF(data\icon_ropes_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_ropes_ca.paa)};
	};
	class Box_MEU_Rations: Box_MEU_Crate
	{
	    MEU_AUTHORS;
	    scope = 2;
	    displayName = "$STR_MEU_Ammoboxes_Rations_name";
	    icon = PATHTOF(data\icon_rations_ca.paa);
	    hiddenSelectionsTextures[] = {"A3\Weapons_F\Ammoboxes\data\AmmoVeh_CO.paa", PATHTOF(data\ammo_rations_ca.paa)};
	};
	class B_CargoNet_01_ammo_F;
	
	class Box_USMC_Weapons_USMC: Box_MEU_Weapons //Naming error, left for compatibility
	{
		scope = 1;
		displayName = "$STR_MEU_Ammoboxes_Weapons_USMC";
		#include "ammo\weapons_usmc.hpp"
	};
	class Box_MEU_Weapons_USMC: Box_MEU_Weapons
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_Weapons_USMC";
		#include "ammo\weapons_usmc.hpp"
	};
	class Box_MEU_Medical_USMC: Box_MEU_Meds
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_Meds_USMC";
		#include "ammo\meds.hpp"
	};
	class Box_MEU_Launchers_USMC: Box_MEU_Launchers
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_Launchers_USMC";
		#include "ammo\launchers_usmc.hpp"
	};
	class Box_MEU_Explosives_USMC: Box_MEU_Explosives
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_Explosives_USMC";
		#include "ammo\explosives_usmc.hpp"
	};
	class Box_MEU_Items_USMC: Box_MEU_Items
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_Items_USMC";
		#include "ammo\items_usmc.hpp"
	};
	class Box_MEU_Radios_USMC: Box_MEU_Radios
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_Radios_USMC";
		#include "ammo\radios_usmc.hpp"
	};
	/*class Box_MEU_Rations_USMC: Box_MEU_Rations
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_Rations_USMC";
		#include "ammo\rations_usmc.hpp"
	};
	class Box_MEU_50Cal_USMC: Box_MEU_50Cal
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_50Cal_USMC";
		#include "ammo\ammo_50cal.hpp"
	};
	class Box_MEU_Mk19_USMC: Box_MEU_Mk19
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_MK19_USMC";
		#include "ammo\ammo_mk19.hpp"
	};*/
	class Box_MEU_Weapons_RU: Box_MEU_Weapons
	{
		scope = 2;
		displayName = "$STR_MEU_Ammoboxes_Weapons_RU";
		#include "ammo\weapons_ru.hpp"
	};
	class Box_MEU_Supplies_USMC: B_CargoNet_01_ammo_F
	{
		author = "Thrax";
		scope = 2;
		vehicleClass = "MEU_vehicles";
		icon = "\11th_vehicles\data\icon_weapons_ca.paa";
		displayName = "$STR_MEU_Ammoboxes_Supplies_USMC";
		transportAmmo = 0;
		maximumLoad = 1000000000;
		transportMaxWeapons = 1000000000;
		transportMaxMagazines = 1000000000;
		transportMaxBackpacks = 1000000000;
		#include "ammo\supplies_usmc.hpp"
	};
};