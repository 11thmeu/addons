#define COMPONENT PRC153
#include "\z\meu\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL

#ifdef DEBUG_ENABLED_PRC153
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PRC153
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PRC153
#endif

#define PRC153_DIALOG (uiNamespace getVariable["MEU_PRC153_IDD", displayNull])
#define PRC153_SHOWING (uiNamespace getVariable ["MEU_PRC153_Showing", false])
#define PRC153_MODE (uiNamespace getVariable ["MEU_PRC153_Menu", "main"])
#define PRC153_PREVMENU (uiNamespace getVariable ["MEU_PRC153_PrevMenu", "main"])
#define PRC153_VOLUME_CHANGED_AT (uiNamespace getVariable ["MEU_PRC153_VolumeChangedAt", 0])
#define PRC153_BOOTED_AT  (uiNamespace getVariable ["MEU_PRC153_BootedAt", -10])

#define PRC153_OFFSET_CHANNELNAMES 9


#define BOOT_TIME 3

// IDC
#define IDC_LCD_TIME 1405
#define IDC_LCD_LINE1 1400
#define IDC_LCD_LINE2 1401
#define IDC_LCD_LINE3 1406
#define IDC_LCD_ACT1 1402
#define IDC_LCD_ACT2 1403
#define IDC_LCD_ACT3 1404

#define IDC_CONNECTOR 1201

#include "\z\meu\addons\main\script_macros.hpp"