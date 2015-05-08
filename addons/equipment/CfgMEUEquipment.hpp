class CfgMEUEquipment {
	class blufor {
		displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_blufor";
		
		class Uniforms {
			class blufor {
				displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_blufor";
				classes[] = {
					"U_B_CombatUniform_mcam",
					"U_B_CombatUniform_mcam_tshirt",
					"U_B_CombatUniform_mcam_vest",
					"U_B_CombatUniform_mcam_worn",
					"U_B_GhillieSuit",
					"U_B_FullGhillie_ard",
					"U_B_FullGhillie_lsh",
					"U_B_FullGhillie_sard",
					"U_B_HeliPilotCoveralls",
					"U_B_PilotCoveralls",
					"U_B_SpecopsUniform_sgg",
					"U_B_Wetsuit"
				};
			};
		};
		
		class Vests {
			class generic {
				displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_generic";
				classes[] = {};
			};
		};
		
		class Backpacks {
			class generic {
				displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_generic";
				classes[] = {};
			};
		};
		
		class Headgear {
			class generic {
				displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_generic";
				classes[] = {};
			};
			
			class blufor {
				displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_blufor";
				classes[] = {
					"H_CrewHelmetHeli_B",
					"H_HelmetCrew_B",
					"H_PilotHelmetFighter_B",
					"H_PilotHelmetHeli_B"
				};
			};
			
		};
		
		class Goggles {
			class military {
				displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_military";
				classes[] = {};
			};
			
			class civil {
				displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_civil";
				classes[] = {};
			};
		};
		
		class Presets {};
		
		defaultProfiles[] = {};
	};
};