class CfgWeapons {
	class ItemCore;
	class MEU_Foretrex401: ItemCore {
		scope = 2;
		displayName = "Garmin Fortrex 401";
		description = "GPS Receiver";
		simulation = "ItemGPS";
		descriptionShort = "Handheld GPS Receiver"; // TODO localize
		picture = PATHTOF(UI\foretrex401_ca.paa);

		MEU_GPS_Display = QUOTE(GVAR(RscDisplay));
		MEU_GPS_DisplayUpdateInterval = 8;
		MEU_GPS_DisplayUpdate = QUOTE(FUNC(updateDisplay));

		class ItemInfo {
			mass = 1;
		};
	};
};