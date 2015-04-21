class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class Medical {
                class MEU_OpenIFAK {
                    displayName = "$STR_MEU_Medical_IFAK_open";
                    condition = QUOTE('MEU_IFAK' in (items _player));
                    statement = QUOTE([true] call FUNC(ifak));
                    priority = 0.5;
                    showDisabled = 0;
                    distance = 2.0;
                    runOnHover = 0;
                    icon = QUOTE(PATHTOF(UI\ifak_ca.paa));
                    hotkey = "F";
                };
                class MEU_CloseIFAK {
                    displayName = "$STR_MEU_Medical_IFAK_close";
                    condition = QUOTE('MEU_IFAK_Empty' in (items _player));
                    statement = QUOTE([false] call FUNC(ifak));
                    priority = 0.4;
                    showDisabled = 0;
                    distance = 2.0;
                    runOnHover = 0;
                    icon = QUOTE(PATHTOF(UI\ifak_ca.paa));
                    hotkey = "F";
                };
            };
        };
    };
};