class Extended_PreInit_EventHandlers
{
	class 11th_main
	{
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
	};
};

class Extended_PostInit_EventHandlers
{
	class 11th_main
	{
		clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
	};
};
