class MEU_gui_Base;
class MEU_gui_Button;
class MEU_gui_ListNBox;

class RscMEU_Spawner {
    idd = -1;
    movingEnable = 1;
    onLoad = QUOTE(SETUVAR(QGVAR(SpawnerDialog),_this select 0););
    
    class controlsBackground {
        class Title: MEU_gui_Base {
            colorBackground[] = {1,0.5,0,0.7};
            text = "$STR_MEU_Spawner_Name";
            idc = -1;
            x = 0;
            y = 0.2;
            w = 1.20;
            h = 0.04;
            moving = 1;
        };
        class TitleBackground: MEU_gui_Base {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0;
            y = 0.244;
            w = 1.20;
            h = 0.57;
            moving = 1;
        };
        class ListTitle: MEU_gui_Base {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Spawner_List";
            sizeEx = 0.04;
            x = 0.02;
            y = 0.27;
            w = 0.95;
            h = 0.04;
        };
    };
    
    class controls {
        class VehicleList: MEU_gui_ListNBox {
            idc = 7563;
            sizeEx = 0.032;
            onLBSelChanged = "";
            onLBDblClick = "";
            x = 0.02;
            y = 0.31;
            w = 0.95;
            h = 0.4;
            columns[] = {0, 0.33, 0.66};
            rowHeight = 0.03;
            color[] = {0.9,0.9,0.9, 1};
            colorText[] = {0.9,0.9,0.9, 1};
            colorScrollbar[] = {0.9,0.9,0.9, 1};
            colorSelect[] = {0.9,0.9,0.9, 1};
            colorSelect2[] = {0.9,0.9,0.9, 1};
            colorSelectBackground[] = {0.2,0.2,0.2, 1};
            colorSelectBackground2[] = {0.2,0.2,0.2, 1};
            colorBackground[] = {0.1, 0.1, 0.1, 0.8};
        };
        class Text_Filter: MEU_gui_Base {
            idc = 7564;
            text = "";
            x = 0.02;
            y = 0.75;
            w = 0.95;
            h = 0.04;
            canModify = 1;
            autocomplete = false;
            type = 2;
            style = 0x00 + 0x40;
            shadow = 2;
            colorDisabled[] = {1, 1, 1, 0.25};
            colorSelection[] = {1, 0.5, 0, 1};
        };
        class FilterButton: MEU_gui_Button {
            idc = -1;
            text = "$STR_MEU_Spawner_Filter";
            action = QUOTE(call FUNC(filterVehicles););
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "";
            x = 1;
            y = 0.75;
            w = 0.1562;
            h = 0.04;
        };
        class SpawnButton: MEU_gui_Button {
            idc = -1;
            text = "$STR_MEU_Spawner_Spawn";
            action = QUOTE(call FUNC(spawn););
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "";
            x = 1;
            y = 0.40;
            w = 0.1562;
            h = 0.04;
        };
        class ExitButton: MEU_gui_Button {
            idc = -1;
            text = "$STR_MEU_Spawner_Close";
            action = "closeDialog 0;";
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "";
            x = 1;
            y = 0.60;
            w = 0.1562;
            h = 0.04;
        };
    };
};