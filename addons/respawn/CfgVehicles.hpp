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
    
    class MEU_ModuleRespawn: Module_F {
        author = "$STR_MEU_Main_MEUTeam";
        _generalMacro = "MEU_ModuleRespawn";
        scope = 2;
        displayName = "$STR_MEU_Respawn_Name";
        icon = PATHTOF(UI\Icon_Module_Respawn_ca.paa);
        category = "MEU_Modules";
        function = QFUNC(moduleRespawn);
        functionPriority = 0;    
        isGlobal = 1; 
        isTriggerActivated = 0;
        isDisposable = 0;    

        class Arguments {
            class Persist {
                displayName = "$STR_MEU_Respawn_PersistName";
                description = "$STR_MEU_Respawn_PersistDesc";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes"; 
                        value = 1;
                        default = 1;
                    };
                    class No
                    {
                        name = "$STR_MEU_Main_No"; 
                        value = 0;
                    };
                };
            };
            
            class DeleteBodies {
                displayName = "$STR_MEU_Respawn_BodiesName";
                description = "$STR_MEU_Respawn_BodiesDesc";
                typeName = "BOOL";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes"; 
                        value = 1;
                        default = 1;
                    };
                    class No
                    {
                        name = "$STR_MEU_Main_No"; 
                        value = 0;
                    };
                };
            };
            
            class Spectator {
                displayName = "$STR_MEU_Respawn_SpectatorName";
                description = "$STR_MEU_Respawn_SpectatorDesc";
                class values {
                    class Yes {
                        name = "$STR_MEU_Main_Yes"; 
                        value = 1;
                        default = 1;
                    };
                    class No
                    {
                        name = "$STR_MEU_Main_No"; 
                        value = 0;
                    };
                };
            };
        };

        class ModuleDescription: ModuleDescription {
            description = "$STR_MEU_Respawn_Description";
            sync[] = {};
        };
    };

    class MEU_ModuleJipTeleport: Module_F {
        author = "$STR_MEU_Main_MEUTeam";
        _generalMacro = "MEU_ModuleJipTeleport";
        scope = 2;
        displayName = "$STR_MEU_Respawn_JIP_Name";
        icon = PATHTOF(UI\Icon_Module_JipTeleport_ca.paa);
        category = "MEU_modules";
        function = QFUNC(moduleJipTeleport);
        functionPriority = 0;
        isGlobal = 1;
        isTriggerActivated = 0;
        isDisposable = 0;

        class Arguments {};

        class ModuleDescription: ModuleDescription {
            description = "$STR_MEU_Respawn_JIP_Desc";
            sync[] = {};
        };    
    };
};