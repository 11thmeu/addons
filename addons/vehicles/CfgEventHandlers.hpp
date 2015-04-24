class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    class Air {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(initSideJump););
        };
    };
    class LandVehicle {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(initSideJump););
        };
    };
};

class Extended_GetIn_EventHandlers {
    class Air {
        class ADDON {
            clientGetIn = QUOTE(if (_this select 2 == ACE_Player) then { _this call FUNC(initSideJump); };);
        };
    };
    class LandVehicle {
        class ADDON {
            clientGetIn = QUOTE(if (_this select 2 == ACE_Player) then { _this call FUNC(initSideJump); };);
        };
    };
};