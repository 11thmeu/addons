class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_Fired_EventHandlers {
	class CAManBase {
		class ADDON {
			clientFired = QUOTE( _this call COMPILE_FILE(XEH_Fired) );
		};
	};
};
