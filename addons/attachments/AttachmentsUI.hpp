class MEU_gui_Base;
class MEU_gui_Button;
class MEU_gui_ComboBox;
class MEU_gui_ListBox;
class MEU_gui_Picture;

class RscMEU_Attachments {
    idd = -1;
    movingEnable = 1;
    onLoad = QUOTE(SETUVAR(QGVAR(AttachmentsDialog),_this select 0););

    class controlsBackground {
        class Background: MEU_gui_Base {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0;
            y = 0.1;
            w = 0.80;
            h = 0.7;
            moving = 1;
        };    
        class Title: MEU_gui_Base {
            colorBackground[] = {1,0.5,0,0.7};
            text = "$STR_MEU_Attachments_Title";
            idc = -1;
            x = 0;
            y = 0.056;
            w = 0.80;
            h = 0.04;
            moving = 1;
        };
        class Title_List: MEU_gui_Base {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Attachments_List";
            sizeEx = 0.04;
            x = 0.02; 
            y = 0.13;
            w = 0.50; 
            h = 0.04;
        };
        class Label_Weapon: MEU_gui_Base {
            colorBackground[] = {0,0,0,0};
            text = "$STR_MEU_Attachments_Weapon";
            idc = -1;
            x = 0.6;
            y = 0.2;
            w = 0.10;
            h = 0.04;
        };
        class Label_Type: MEU_gui_Base {
            colorBackground[] = {0,0,0,0};
            text = "$STR_MEU_Attachments_Type";
            idc = -1;
            x = 0.62;
            y = 0.34;
            w = 0.10;
            h = 0.04;
        };
        class Background_Muzzle: MEU_gui_Base {
            colorBackground[] = {0.5,0.5,0.5,0.25};
            text = "";
            idc = -1;
            x = 0.525;
            y = 0.515;
            w = 0.06;
            h = 0.06;
        };
        class Background_Pointer: MEU_gui_Base {
            colorBackground[] = {0.5,0.5,0.5,0.25};
            text = "";
            idc = -1;
            x = 0.595;
            y = 0.515;
            w = 0.06;
            h = 0.06;
        };
        class Background_Sights: MEU_gui_Base {
            colorBackground[] = {0.5,0.5,0.5,0.25};
            text = "";
            idc = -1;
            x = 0.665;
            y = 0.515;
            w = 0.06;
            h = 0.06;
        };
        class Background_Bipod: MEU_gui_Base {
            colorBackground[] = {0.5,0.5,0.5,0.25};
            text = "";
            idc = -1;
            x = 0.735;
            y = 0.515;
            w = 0.06;
            h = 0.06;
        };
    };
    
    class controls {
        class Combo_WeaponSelection: MEU_gui_ComboBox {
            idc = 7551;
            text = "";
            sizeEx = 0.032;
            colorSelect[] = {1,1,1,1};
            colorSelectBackground[] = {1,0.5,0,0.5};
            x = 0.55;
            y = 0.25;
            w = 0.23;
            h = 0.04;
            onLBSelChanged = QUOTE(call FUNC(updateAttachmentsUI););
        };
        class Combo_TypeSelection: MEU_gui_ComboBox {
            idc = 7552;
            text = "";
            sizeEx = 0.032;
            colorSelect[] = {1,1,1,1};
            colorSelectBackground[] = {1,0.5,0,0.5};
            x = 0.55;
            y = 0.39;
            w = 0.23;
            h = 0.04;
            onLBSelChanged = QUOTE(call FUNC(updateAttachmentsUI););
        };
        class List_Attachments: MEU_gui_ListBox {
            idc = 7553;
            rowHeight = 0.08;
            text = "";
            sizeEx = 0.032;
            onLBSelChanged = "";
            onLBDblClick = "";
            x = 0.02;
            y = 0.17;
            w = 0.50;
            h = 0.60;
        };    
        class Image_Muzzle: MEU_gui_Picture {
            idc = 7554;
            text = "a3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
            x = 0.525;
            y = 0.515;
            w = 0.06;
            h = 0.06;
        };
        class Image_Pointer: MEU_gui_Picture {
            idc = 7555;
            text = "a3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_side_gs.paa";
            x = 0.595;
            y = 0.515;
            w = 0.06;
            h = 0.06;
        };
        class Image_Sights: MEU_gui_Picture {
            idc = 7556;
            text = "a3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
            x = 0.665;
            y = 0.515;
            w = 0.06;
            h = 0.06;
        };
        class Image_Bipod: MEU_gui_Picture {
            idc = 7557;
            text = "a3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
            x = 0.735;
            y = 0.515;
            w = 0.06;
            h = 0.06;
        };
        class Button_Add: MEU_gui_Button {
            idc = -1;
            text = "$STR_MEU_Attachments_Add";
            action = "";
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = QUOTE(call FUNC(addAttachment););
            style = "0x02 + 0xC0";
            x = 0.58;
            y = 0.65;
            w = 0.16;
            h = 0.04;
        };
        class Button_Exit: MEU_gui_Button {
            idc = -1;
            text = "$STR_MEU_Attachments_Exit";
            action = "closeDialog 0;";
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "";
            style = "0x02 + 0xC0";
            x = 0.58;
            y = 0.71;
            w = 0.16;
            h = 0.04;
        };
    };
};