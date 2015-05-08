class MEU_gui_Base;
class MEU_gui_Button;
class MEU_gui_ComboBox;
class MEU_gui_ListBox;
class MEU_gui_Picture;
class RscText;

class RscMEU_Equipment {
    idd = -1;
    movingEnable = 1;
    onLoad = "['onLoad',_this] call meu_equipment_fnc_equipmentUI;";
    onUnload = "['onUnload',''] call meu_equipment_fnc_equipmentUI;";

    class controlsBackground {
        //Common controls
        class Background: MEU_gui_Base {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0;
            y = 0;
            w = 0.9;
            h = 0.9;
        };
        class Background_Tools: MEU_gui_Base {
            colorBackground[] = {0, 0, 0, 0.8};
            idc = -1;
            x = 0;
            y = 0;
            w = 0.9;
            h = 0.055;
        };
        class Image_Equipment: MEU_gui_Picture {
            idc = -1;
            text = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
            x = 0.005;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_Camera: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\camera.paa);
            x = 0.075;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_NV: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\nv.paa);
            x = 0.145;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_Save: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\save.paa);
            x = 0.215;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_Load: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\load.paa);
            x = 0.285;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_LoadDefault: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\loadDefault.paa);
            x = 0.355;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_LoadVR: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\loadVR.paa);
            x = 0.425;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_CopyToClipboard: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\copy.paa);
            x = 0.495;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_PasteFromClipboard: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\paste.paa);
            x = 0.565;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Image_Close: MEU_gui_Picture {
            idc = -1;
            text = PATHTOF(UI\close.paa);
            x = 0.84;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class BlackLeft: RscText {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneXAbs - safezoneX";
            h = "safezoneH";
        };
        class BlackRight: BlackLeft {
            x = "safezoneX + safezoneW";
        };
        class MouseArea: RscText {
            idc = IDC_RSCMEUEQUIPMENT_MOUSEAREA;
            style = 16;
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
        //Dynamic controls
        class List1_Title: MEU_gui_Base {
            idc = IDC_RSCMEUEQUIPMENT_LIST1_TITLE;
            colorBackground[] = {1,0.5,0,0.5};
            text = "";
            sizeEx = 0.04;
            x = 0.04; 
            y = 0.09;
            w = 0.55; 
            h = 0.04;
        };
        class List2_Title: MEU_gui_Base {
            idc = IDC_RSCMEUEQUIPMENT_LIST2_TITLE;
            colorBackground[] = {1,0.5,0,0.5};
            text = "";
            sizeEx = 0.04;
            x = 0.04; 
            y = 0.09;
            w = 0.55; 
            h = 0.04;
        };
        class Label1: MEU_gui_Base {
            idc = IDC_RSCMEUEQUIPMENT_LABEL1;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.65;
            y = 0.3;
            w = 0.10;
            h = 0.04;
        };
        class Label2: MEU_gui_Base {
            idc = IDC_RSCMEUEQUIPMENT_LABEL2;
            colorBackground[] = {0,0,0,0};
            text = "";
            x = 0.65;
            y = 0.4;
            w = 0.10;
            h = 0.04;
        };
    };
    
    class controls {
        //Common controls
        class Button_Equipment: MEU_gui_Button {
            idc = -1;
            text = "";
            toolTip = "TODO";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "['equipmentView',''] call meu_equipment_fnc_equipmentUI;";
            x = 0.005;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_Camera: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTONCAMERA;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_Camera_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "['switchCamera',''] call meu_equipment_fnc_equipmentUI;";
            x = 0.075;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_NV: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTONNV;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_NightVision_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "['switchNV',''] call meu_equipment_fnc_equipmentUI;";
            x = 0.145;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_Save: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTONSAVE;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentSave";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "['saveView',''] call meu_equipment_fnc_equipmentUI;";
            x = 0.215;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };        
        class Button_Load: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTONLOAD;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentLoad";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "['loadView',''] call meu_equipment_fnc_equipmentUI;";
            x = 0.285;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_LoadDefault: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTONLOADDEFAULT;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentLoadDefault";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "['loadDefaultView',''] call meu_equipment_fnc_equipmentUI;";
            x = 0.355;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_LoadVR: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTONLOADVR;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentLoadVR";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "['loadVRView',''] call meu_equipment_fnc_equipmentUI;";
            x = 0.425;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_CopyToClipboard: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTONCLIPBOARDCOPY;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentCopyToClipboard";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call meu_equipment_fnc_copyLoadout;";
            x = 0.495;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_PasteFromClipboard: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTONCLIPBOARDPASTE;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentCopyFromClipboard";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call meu_equipment_fnc_pasteLoadout;";
            x = 0.565;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_Exit: MEU_gui_Button {
            idc = -1;
            text = "";
            toolTip = "TODO";
            action = "closeDialog 0;";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            x = 0.84;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        //Dynamic controls
        class Title: MEU_gui_Base {
            idc = IDC_RSCMEUEQUIPMENT_TITLE;
            colorBackground[] = {1,0.5,0,0.7};
            text = "";
            x = 0;
            y = -0.04;
            w = 0.9;
            h = 0.04;
            moving = 1;
        };
        class Combo1: MEU_gui_ComboBox {
            idc = IDC_RSCMEUEQUIPMENT_COMBO1;
            text = "";
            sizeEx = 0.032;
            colorSelect[] = {1,1,1,1};
            colorSelectBackground[] = {1,0.5,0,0.5};
            x = 0.65;
            y = 0.35;
            w = 0.20;
            h = 0.04;
        };
        class Combo2: MEU_gui_ComboBox {
            idc = IDC_RSCMEUEQUIPMENT_COMBO2;
            text = "";
            sizeEx = 0.032;
            colorSelect[] = {1,1,1,1};
            colorSelectBackground[] = {1,0.5,0,0.5};
            x = 0.65;
            y = 0.45;
            w = 0.20;
            h = 0.04;
        };
        class List1: MEU_gui_ListBox {
            idc = IDC_RSCMEUEQUIPMENT_LIST1;
            rowHeight = 0.08;
            text = "";
            sizeEx = 0.032;
            x = 0.04;
            y = 0.13;
            w = 0.55;
            h = 0.72;
        };
        class List2: MEU_gui_ListBox {
            idc = IDC_RSCMEUEQUIPMENT_LIST2;
            rowHeight = 0.04;
            text = "";
            sizeEx = 0.032;
            x = 0.04;
            y = 0.13;
            w = 0.55;
            h = 0.72;
        };
        class TextBox: MEU_gui_Base {
            idc = IDC_RSCMEUEQUIPMENT_TEXTBOX;
            text = "$STR_MEU_Equipment_EquipmentCustomName";
            x = 0.06;
            y = 0.69;
            w = 0.3766;
            h = 0.04;
            canModify = 1;
            autocomplete = false;
            type = 2;
            style = 0x00 + 0x40;
            shadow = 2;
            colorDisabled[] = {1, 1, 1, 0.25};
            colorSelection[] = {1, 0.5, 0, 1};
        };
        class Button1: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTON1;
            text = "";
            toolTip = "";
            colorBackground[] = {1,0.5,0,0.5};
            x = 0.65;
            y = 0.60;
            w = 0.1562;
            h = 0.04;
        };
        class Button2: MEU_gui_Button {
            idc = IDC_RSCMEUEQUIPMENT_BUTTON2;
            text = "";
            toolTip = "";
            colorBackground[] = {1,0.5,0,0.5};
            x = 0.65;
            y = 0.66;
            w = 0.1562;
            h = 0.04;
        };
    };
};