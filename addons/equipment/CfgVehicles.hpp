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
        MEU_AUTHORS;
        _generalMacro = "MEU_ModuleEquipment";
        scope = 2;
        displayName = "$STR_MEU_Equipment_Name";
        icon = PATHTOF(UI\Icon_Module_Equipment_ca.paa);
        category = "MEU_Modules";
        function = QFUNC(moduleEquipment);
        functionPriority = 0;
        isGlobal = 1; 
        isTriggerActivated = 0;
        isDisposable = 0;

        class Arguments {
            class Action {
                displayName = "$STR_MEU_Equipment_ActionName";
                description = "$STR_MEU_Equipment_ActionDesc";
                defaultValue = "$STR_MEU_Equipment_ActionDefault";
            };

            class HideObject {
                displayName = "$STR_MEU_Equipment_HideObjectName";
                description = "$STR_MEU_Equipment_HideObjectDesc";
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
                        default = 0;
                    };
                };
            };

            class Type {
                displayName = "$STR_MEU_Equipment_TypeName";
                description = "$STR_MEU_Equipment_TypeDesc";
                typeName = "STRING";
                class values {
                    class all {
                        name = "$STR_MEU_Equipment_TypeAll";
                        value = "all";
                        default = 1;
                    };
                    class blufor {
                        name = "$STR_MEU_Equipment_TypeBlufor";
                        value = "blufor";
                        default = 0;
                    };
                    class opfor { 
                        name = "$STR_MEU_Equipment_TypeOpfor";
                        value = "opfor";
                        default = 0;
                    };
                    class indfor {
                        name = "$STR_MEU_Equipment_TypeIndfor";
                        value = "indfor";
                        default = 0;
                    };
                    class civil {
                        name = "$STR_MEU_Equipment_TypeCivillian";
                        value = "civil";
                        default = 0;
                    };
                };
            };

            class Users {
                displayName = "$STR_MEU_Equipment_UsersName";
                description = "$STR_MEU_Equipment_UsersDesc";
                defaultValue = "[]";
            };

            class Camera
            {
                displayName = "$STR_MEU_Equipment_CameraName";
                description = "$STR_MEU_Equipment_CameraDesc";
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
                        default = 0;
                    };
                };
            };

            class NV {
                displayName = "$STR_MEU_Equipment_NVName";
                description = "$STR_MEU_Equipment_NVDesc";
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
                        default = 0;
                    };
                };
            };

            class Info {
                displayName = "$STR_MEU_Equipment_InfoName";
                description = "$STR_MEU_Equipment_InfoDesc";
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
                        default = 0;
                    };
                };
            };

            class Classnames {
                displayName = "$STR_MEU_Equipment_ClassnamesName";
                description = "$STR_MEU_Equipment_ClassnamesDesc";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 0;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                        default = 1;
                    };
                };
            };

            class Presets {
                displayName = "$STR_MEU_Equipment_PresetsName";
                description = "$STR_MEU_Equipment_PresetsDesc";
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
                        default = 0;
                    };
                };
            };

            class PresetsOnly {
                displayName = "$STR_MEU_Equipment_PresetsOnlyName";
                description = "$STR_MEU_Equipment_PresetsOnlyDesc";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes";
                        value = 1;
                        default = 0;
                    };
                    class No {
                        name = "$STR_MEU_Main_No";
                        value = 0;
                        default = 1;
                    };
                };
            };

            class PresetsArray {
                displayName = "$STR_MEU_Equipment_PresetsArrayName";
                description = "$STR_MEU_Equipment_PresetsArrayDesc";
                defaultValue = "[]";
            };

            class SaveLoad {
                displayName = "$STR_MEU_Equipment_SaveLoadName";
                description = "$STR_MEU_Equipment_SaveLoadDesc";
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
                        default = 0;
                    };
                };
            };

            class Persistent {
                displayName = "$STR_MEU_Equipment_PersistenceName";
                description = "$STR_MEU_Equipment_PersistenceDesc";
                typeName = "BOOL";
                class values {
                    class yes {
                        name = "$STR_MEU_Equipment_PersistenceYes";
                        value = 1;
                        default = 1;
                    };
                    class no {
                        name = "$STR_MEU_Equipment_PersistenceNo";
                        value = 0;
                        default = 0;
                    };
                };
            };

            class LoadVR {
                displayName = "$STR_MEU_Equipment_LoadVRName";
                description = "$STR_MEU_Equipment_LoadVRDesc";
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
                        default = 0;
                    };
                };
            };

            class DefaultProfiles {
                displayName = "$STR_MEU_Equipment_DefaultProfilesName";
                description = "$STR_MEU_Equipment_DefaultProfilesDesc";
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
                        default = 0;
                    };
                };
            };

            class Insignias {
                displayName = "$STR_MEU_Equipment_InsigniasName";
                description = "$STR_MEU_Equipment_InsigniasDesc";
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
                        default = 0;
                    };
                };
            };
        };

        class ModuleDescription: ModuleDescription {
            description = "$STR_MEU_Equipment_Description";
            sync[] = {"ReammoBox_F"};

            class ReammoBox_F {
                description[] = {"$STR_MEU_Equipment_Sync1", "$STR_MEU_Equipment_Sync2"};
                position = 0;
                direction = 0;
                optional = 0;
                duplicate = 1;
                synced[] = {};
            };
        };
    };
};