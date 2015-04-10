class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class GVAR(Activate) {
					displayName = "$STR_MEU_HearingProtectors_Activate";
					condition 	= QUOTE(_this call FUNC(canTurnOn));
					statement   = QUOTE(_this call FUNC(activate));
					showDisabled = 0;
					exceptions[] = {"isNotDragging"};
					priority = 5;
					icon = PATHTOF(UI\asp_ca.paa);
				};

				class GVAR(Deactivate) {
					displayName = "$STR_MEU_HearingProtectors_Deactivate";
					condition 	= QUOTE(_this call FUNC(canTurnOff));
					statement   = QUOTE(_this call FUNC(deactivate));
					showDisabled = 0;
					exceptions[] = {"isNotDragging"};
					priority = 5;
					icon = PATHTOF(UI\asp_ca.paa);
				};

				class ACE_RemoveEarplugs {
                    condition 	= QUOTE(_this call FUNC(canRemoveEarplugs));
                };
			};				
		};
	};
};