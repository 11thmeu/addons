#define COMPONENT gps
#include "\z\meu\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_GPS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_GPS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_BLANK
#endif

#define GPS_MAP_X_ORIGIN (missionNamespace getVariable "MEU_GPS_MapOriginX")
#define GPS_MAP_Y_ORIGIN (missionNamespace getVariable "MEU_GPS_MapOriginY")
#define GPS_MAP_Y_INVERTED (missionNamespace getVariable "MEU_GPS_MapOriginYInverted")

#include "\z\meu\addons\main\script_macros.hpp"