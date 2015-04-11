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
    
    class MEU_ModuleAttachments: Module_F {
        author = "$STR_MEU_Main_MEUTeam";
        _generalMacro = "MEU_ModuleAttachments";
        scope = 2;
        displayName = "$STR_MEU_Attachments_Name";
        icon = PATHTOF(UI\Icon_Module_Attachments_ca.paa);
        category = "MEU_modules";
        function = QFUNC(moduleAttachments);
        functionPriority = 0;    
        isGlobal = 1; 
        isTriggerActivated = 0;
        isDisposable = 0;    

        class Arguments {
            class Interaction {
                displayName = "$STR_MEU_Attachments_ActionName";
                description = "$STR_MEU_Attachments_ActionDesc";
                defaultValue = "$STR_MEU_Attachments_ActionDefault";
            };
            
            class Description {
                displayName = "$STR_MEU_Attachments_DescriptionName";
                description = "$STR_MEU_Attachments_DescriptionDesc";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_MEU_Main_Yes"; value = 1; default = 1; };
                    class No { name = "$STR_MEU_Main_No"; value = 0; };
                };
            };
            
            class Tooltip {
                displayName = "$STR_MEU_Attachments_TooltipName";
                description = "$STR_MEU_Attachments_TooltipDesc";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_MEU_Main_Yes"; value = 1; };
                    class No { name = "$STR_MEU_Main_No"; value = 0; default = 1; };
                };
            };
            
            class Thermal {
                displayName = "$STR_MEU_Attachments_ThermalName";
                description = "$STR_MEU_Attachments_ThermalDesc";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_MEU_Main_Yes"; value = 1; default = 1; };
                    class No { name = "$STR_MEU_Main_No"; value = 0; };
                };
            };
            
            class EnableBlacklist {
                displayName = "$STR_MEU_Attachments_EnableBlacklistName";
                description = "$STR_MEU_Attachments_EnableBlacklistDesc";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_MEU_Main_Yes"; value = 1; };
                    class No { name = "$STR_MEU_Main_No"; value = 0; default = 1; };
                };
            };
            
            class Blacklist {
                displayName = "$STR_MEU_Attachments_BlacklistName";
                description = "$STR_MEU_Attachments_BlacklistDesc";
                defaultValue = "[]";
            };
            
            class EnableWhitelist {
                displayName = "$STR_MEU_Attachments_EnableWhitelistName";
                description = "$STR_MEU_Attachments_EnableWhitelistDesc";
                typeName = "BOOL";
                class values {
                    class Yes { name = "$STR_MEU_Main_Yes"; value = 1; };
                    class No { name = "$STR_MEU_Main_No"; value = 0; default = 1; };
                };
            };
            
            class Whitelist {
                displayName = "$STR_MEU_Attachments_WhitelistName";
                description = "$STR_MEU_Attachments_WhitelistDesc";
                defaultValue = "[]";
            };
        };

        class ModuleDescription: ModuleDescription {
            description = "$STR_MEU_Attachments_Description";
            sync[] = {"ReammoBox_F"};
     
            class ReammoBox_F {
                description[] = {"$STR_MEU_Attachments_Sync1", "$STR_MEU_Attachments_Sync2"};
                position = 0;
                direction = 0;
                optional = 0;
                duplicate = 1;
                synced[] = {};
            };
        };    
    };
};