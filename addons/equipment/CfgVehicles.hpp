class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
            class Units;
        };
        class ModuleDescription {
            class AnyBrain;
        };
    };

    class MEU_ModuleEquipment: Module_F {
        author = "$STR_MEU_Main_MEUTeam";
        _generalMacro = "MEU_ModuleEquipment";
        scope = 2;
        displayName = "$STR_MEU_Equipment_ModuleEquipment_name";
        icon = PATHTOF(UI\Icon_Module_Equipment_ca.paa);
        category = "MEU_Modules";
        function = QFUNC(moduleEquipment);
        functionPriority = 0;
        isGlobal = 1; 
        isTriggerActivated = 0;
        isDisposable = 0;

        class Arguments {
            class Action {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Action_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Action_description";
                defaultValue = "$STR_MEU_Equipment_ModuleEquipment_Action_defaultValue";
            };

            class Type {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Type_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Type_description";
                typeName = "STRING";
                class values {
                    class all {
                        name = "$STR_MEU_Equipment_ModuleEquipment_Type_all";
                        value = "all";
                        default = 1;
                    };
                    class blufor {
                        name = "$STR_MEU_Equipment_ModuleEquipment_Type_blufor";
                        value = "blufor";
                    };
                    class opfor { 
                        name = "$STR_MEU_Equipment_ModuleEquipment_Type_opfor";
                        value = "opfor";
                    };
                    class indfor {
                        name = "$STR_MEU_Equipment_ModuleEquipment_Type_indfor";
                        value = "indfor";
                    };
                    class civil {
                        name = "$STR_MEU_Equipment_ModuleEquipment_Type_civil";
                        value = "civil";
                    };
                };
            };

            class Users {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Users_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Users_description";
                defaultValue = "[]";
            };

            class Info {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Info_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Info_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No"; 
                        value = 0;
                    };
                };
            };

            class Classnames {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Classnames_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Classnames_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                        default = 1;
                    };
                };
            };

            class Presets {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Presets_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Presets_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                    };
                };
            };

            class PresetsOnly {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_OnlyPresets_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_OnlyPresets_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                        default = 1;
                    };
                };
            };

            class PresetsArray {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_AdditionalPresets_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_AdditionalPresets_description";
                defaultValue = "[]";
            };

            class LoadVR {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Virtual_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Virtual_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                    };
                };
            };

            class Insignias {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_AllowInsignias_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_AllowInsignias_desc";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                    };
                };
            };

            class Camera
            {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Camera_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Camera_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                    };
                };
            };

            class NV {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_NightVision_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_NightVision_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                    };
                };
            };

            class SaveLoad {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Saving_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Saving_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 1;
                    };
                    class No { 
                        name = "$STR_MEU_Main_No";
                        value = 0;
                    };
                };
            };

            class DefaultProfiles {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_DefaultProfiles_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_DefaultProfiles_description";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 1;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                    };
                };
            };

            class Persistent {
                displayName = "$STR_MEU_Equipment_ModuleEquipment_Persistence_name";
                description = "$STR_MEU_Equipment_ModuleEquipment_Persistence_description";
                typeName = "BOOL";
                class values {
                    class yes {
                        name = "$STR_MEU_Equipment_ModuleEquipment_Persistence_yes";
                        value = 1;
                        default = 1;
                    };
                    class no {
                        name = "$STR_MEU_Equipment_ModuleEquipment_Persistence_no";
                        value = 0;
                    };
                };
            };
        };

        class ModuleDescription: ModuleDescription {
            description = "$STR_MEU_Equipment_ModuleEquipment_desc";
            sync[] = {"ReammoBox_F"};

            class ReammoBox_F {
                description[] = {"$STR_MEU_Equipment_ModuleEquipment_sync1", "$STR_MEU_Equipment_ModuleEquipment_sync2"};
                position = 0;
                direction = 0;
                optional = 0;
                duplicate = 1;
                synced[] = {};
            };
        };
    };
};