class Extended_PreInit_EventHandlers
{
	class 11th_main
	{
		init = "[] execVM '\11th_main\XEH_preInit.sqf'";
		init = QUOTE(call COMPILE_FILE(XEH_preInit))
	};
};

class Extended_PostInit_EventHandlers
{
	class 11th_main
	{
		clientInit = "[] execVM '\11th_main\XEH_postClientInit.sqf'";
		clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
	};
};
