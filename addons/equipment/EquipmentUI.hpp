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
            idc = 7000;
            style = 16;
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
        //Dynamic controls
        class List1_Title: MEU_gui_Base {
            idc = 800007;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentList";
            sizeEx = 0.04;
            x = 0.04; 
            y = 0.09;
            w = 0.55; 
            h = 0.04;
        };
        class Label1: MEU_gui_Base {
            colorBackground[] = {0,0,0,0};
            text = "$STR_MEU_Equipment_EquipmentType";
            idc = 800006;
            x = 0.65;
            y = 0.3;
            w = 0.10;
            h = 0.04;
        };
        class Label2: MEU_gui_Base {
            colorBackground[] = {0,0,0,0};
            text = "$STR_MEU_Equipment_EquipmentClass";
            idc = 800005;
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
            onButtonClick = "";
            x = 0.005;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
		class Button_Camera: MEU_gui_Button {
            idc = 7570;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_Camera_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = QUOTE(['switchCamera',''] call FUNC(equipmentUI););
            x = 0.075;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_NV: MEU_gui_Button {
            idc = 7571;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_NightVision_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
			onButtonClick = QUOTE(['switchNV',''] call FUNC(equipmentUI););
            x = 0.145;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_Save: MEU_gui_Button {
            idc = 7572;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentSave";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "createDialog 'MEU_Dialog_save';";
            x = 0.215;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };        
        class Button_Load: MEU_gui_Button {
            idc = 7573;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentLoad";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "createDialog 'MEU_Dialog_load';";
            x = 0.285;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_LoadDefault: MEU_gui_Button {
            idc = 7578;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentLoadDefault";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "createDialog 'MEU_Dialog_loadDefault';";
            x = 0.355;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_LoadVR: MEU_gui_Button {
            idc = 7579;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentLoadVR";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "createDialog 'MEU_Dialog_loadVR';";
            x = 0.425;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_CopyToClipboard: MEU_gui_Button {
            idc = 7702;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentCopyToClipboard";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_copyLoadout;";
            x = 0.495;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_PasteFromClipboard: MEU_gui_Button {
            idc = 7703;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentCopyFromClipboard";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_pasteLoadout;";
            x = 0.565;
            y = -0.001;
            w = 0.064;
            h = 0.064;
        };
        class Button_Exit: MEU_gui_Button {
            idc = -1;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentExit";
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
            colorBackground[] = {1,0.5,0,0.7};
            text = "$STR_MEU_Equipment_ModuleEquipment_Action_defaultValue";
            idc = 7557;
            x = 0;
            y = -0.04;
            w = 0.9;
            h = 0.04;
            moving = 1;
        };
        class Combo_Type: MEU_gui_ComboBox {
            idc = 7554;
            text = "";
            sizeEx = 0.032;
            colorSelect[] = {1,1,1,1};
            colorSelectBackground[] = {1,0.5,0,0.5};
            x = 0.65;
            y = 0.35;
            w = 0.20;
            h = 0.04;
        };
        class Combo_Side: MEU_gui_ComboBox {
            idc = 7555;
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
            idc = 7556;
            rowHeight = 0.08;
            text = "";
            sizeEx = 0.032;
            x = 0.04;
            y = 0.13;
            w = 0.55;
            h = 0.72;
        };
        class Button1: MEU_gui_Button {
            idc = 800001;
            text = "$STR_MEU_Equipment_EquipmentAdd";
            toolTip = "$STR_MEU_Equipment_EquipmentAddTT";
            colorBackground[] = {1,0.5,0,0.5};
            x = 0.65;
            y = 0.60;
            w = 0.1562;
            h = 0.04;
        };
        class Button2: MEU_gui_Button {
            idc = 800002;
            text = "$STR_MEU_Equipment_EquipmentReplace";
            toolTip = "$STR_MEU_Equipment_EquipmentReplaceTT";
            colorBackground[] = {1,0.5,0,0.5};
            x = 0.65;
            y = 0.66;
            w = 0.1562;
            h = 0.04;
        };
    };
};
/*
class MEU_Dialog_save 
{
    idd = -1;
    movingEnable = 0;
    onLoad = "[0] spawn MEU_fnc_equipmentDialog_saveLoad";
    
    class controlsBackground 
    {
        class Background: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {0, 0, 0, 0.7};
            x = 0.050;
            y = 0.244;
            w = 0.70;
            h = 0.512;
        };
        class Title: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.7};
            text = "$STR_MEU_Equipment_ModuleEquipment_Action_defaultValue";
            x = 0.050;
            y = 0.15;
            w = 0.70;
            h = 0.04;
        };
        class Label_Profiles: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentProfiles";
            sizeEx = 0.04;
            x = 0.053; 
            y = 0.27;
            w = 0.32; 
            h = 0.04;
        };
        class Label_Content: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentContents";
            style = 1;
            sizeEx = 0.04;
            x = 0.397; 
            y = 0.27;
            w = 0.35; 
            h = 0.04;
        };
        class Background_Tools: MEU_Base
        {
            colorBackground[] = {0, 0, 0, 0.8};
            idc = -1;
            x = 0.050;
            y = 0.19;
            w = 0.7;
            h = 0.055;
        };
        class Image_Camera: MEU_Picture
        {
            idc = 7586;
            text = "\11th_equipment\data\camera.paa";
            x = 0.06;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Image_NV: MEU_Picture
        {
            idc = 7587;
            text = "\11th_equipment\data\nv.paa";
            x = 0.13;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Image_Close: MEU_Picture
        {
            idc = -1;
            text = "\11th_equipment\data\close.paa";
            x = 0.69;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
    };
    
    class controls 
    {    
        class List_Profiles: MEU_ListBox 
        {
            idc = 7558;
            rowHeight = 0.04;
            text = "";
            sizeEx = 0.032;
            onLBSelChanged = "[0] spawn MEU_fnc_getLoadout;";
            x = 0.053;
            y = 0.31;
            w = 0.32;
            h = 0.32;
        };    
        class List_Content: MEU_ListBox 
        {
            idc = 7559;
            rowHeight = 0.03;
            text = "";
            sizeEx = 0.032;
            x = 0.397;
            y = 0.31;
            w = 0.35;
            h = 0.32;
        };
        class Label_Name: MEU_Base
        {
            idc = 7560;
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
        class Button_Camera: MEU_Button
        {
            idc = 7574;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_Camera_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_switchCamera;";
            x = 0.06;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Button_NV: MEU_Button
        {
            idc = 7575;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_NightVision_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_switchNV;";
            x = 0.13;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Button_Save : MEU_Button
        {
            idc = -1;
            text = "$STR_MEU_Equipment_EquipmentSave";
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "[] call MEU_fnc_saveLoadout;";
            x = 0.4376;
            y = 0.69;
            w = 0.1562;
            h = 0.04;
        };
        class Button_Exit : MEU_Button
        {
            idc = -1;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentBack";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "closeDialog 0;";
            x = 0.69;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
    };
};

class MEU_Dialog_load 
{
    idd = -1;
    movingEnable = 0;
    onLoad = "[1] spawn MEU_fnc_equipmentDialog_saveLoad";
    
    class controlsBackground
    {
        class Background: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.050;
            y = 0.244;
            w = 0.70;
            h = 0.512;
        };
        class Title: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.7};
            text = "$STR_MEU_Equipment_ModuleEquipment_Action_defaultValue";
            x = 0.050;
            y = 0.15;
            w = 0.70;
            h = 0.04;
        };
        class Label_Profiles: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentProfiles";
            sizeEx = 0.04;
            x = 0.053; 
            y = 0.27;
            w = 0.32; 
            h = 0.04;
        };
        class Label_Content: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentContents";
            style = 1;
            sizeEx = 0.04;
            x = 0.397; 
            y = 0.27;
            w = 0.35; 
            h = 0.04;
        };
        class Background_Tools: MEU_Base
        {
            colorBackground[] = {0,0,0,0.8};
            idc = -1;
            x = 0.050;
            y = 0.19;
            w = 0.7;
            h = 0.055;
        };
        class Image_Camera: MEU_Picture
        {
            idc = 7588;
            text = "\11th_equipment\data\camera.paa";
            x = 0.06;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Image_NV: MEU_Picture
        {
            idc = 7589;
            text = "\11th_equipment\data\nv.paa";
            x = 0.13;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Image_Close: MEU_Picture
        {
            idc = -1;
            text = "\11th_equipment\data\close.paa";
            x = 0.69;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
    };
    
    class controls 
    {    
        class List_Profiles: MEU_ListBox 
        {
            idc = 7561;
            rowHeight = 0.04;
            text = "";
            sizeEx = 0.032;
            onLBSelChanged = "[1] spawn MEU_fnc_getLoadout;";
            x = 0.053;
            y = 0.31;
            w = 0.32;
            h = 0.32;
        };
        class List_Content: MEU_ListBox 
        {
            idc = 7562;
            rowHeight = 0.03;
            text = "";
            sizeEx = 0.032;
            x = 0.397;
            y = 0.31;
            w = 0.35;
            h = 0.32;
        };
        class Button_Camera: MEU_Button
        {
            idc = 7576;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_Camera_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_switchCamera;";
            x = 0.06;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Button_NV: MEU_Button
        {
            idc = 7577;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_NightVision_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_switchNV;";
            x = 0.13;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Button_Load: MEU_Button
        {
            idc = -1;
            text = "$STR_MEU_Equipment_EquipmentLoad";
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "[] spawn MEU_fnc_loadLoadout;";
            x = 0.40;
            y = 0.69;
            w = 0.1562;
            h = 0.04;
        };
        class Button_Delete: MEU_Button
        {
            idc = -1;
            text = "$STR_MEU_Equipment_EquipmentDelete";
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "[] spawn MEU_fnc_deleteLoadout;";
            x = 0.57;
            y = 0.69;
            w = 0.1562;
            h = 0.04;
        };
        class Button_Exit: MEU_Button
        {
            idc = -1;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentBack";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "closeDialog 0;";
            x = 0.69;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
    };
};

class MEU_Dialog_loadDefault
{
    idd = -1;
    movingEnable = 0;
    onLoad = "[] spawn MEU_fnc_equipmentDialog_loadDefault";
    
    class controlsBackground
    {
        class Background: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.050;
            y = 0.244;
            w = 0.70;
            h = 0.512;
        };
        class Title: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.7};
            text = "$STR_MEU_Equipment_ModuleEquipment_Action_defaultValue";
            x = 0.050;
            y = 0.15;
            w = 0.70;
            h = 0.04;
        };
        class Label_Profiles: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentProfiles";
            sizeEx = 0.04;
            x = 0.053; 
            y = 0.27;
            w = 0.32; 
            h = 0.04;
        };
        class Label_Content: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentContents";
            style = 1;
            sizeEx = 0.04;
            x = 0.397; 
            y = 0.27;
            w = 0.35; 
            h = 0.04;
        };
        class Background_Tools: MEU_Base
        {
            colorBackground[] = {0,0,0,0.8};
            idc = -1;
            x = 0.050;
            y = 0.19;
            w = 0.7;
            h = 0.055;
        };
        class Image_Camera: MEU_Picture
        {
            idc = 7600;
            text = "\11th_equipment\data\camera.paa";
            x = 0.06;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Image_NV: MEU_Picture
        {
            idc = 7601;
            text = "\11th_equipment\data\nv.paa";
            x = 0.13;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Image_Close: MEU_Picture
        {
            idc = -1;
            text = "\11th_equipment\data\close.paa";
            x = 0.69;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
    };
    
    class controls 
    {    
        class List_Profiles: MEU_ListBox 
        {
            idc = 7602;
            rowHeight = 0.04;
            text = "";
            sizeEx = 0.032;
            onLBSelChanged = "[] spawn MEU_fnc_getDefaultLoadout;";
            x = 0.053;
            y = 0.31;
            w = 0.32;
            h = 0.32;
        };
        class List_Content: MEU_ListBox 
        {
            idc = 7603;
            rowHeight = 0.03;
            text = "";
            sizeEx = 0.032;
            x = 0.397;
            y = 0.31;
            w = 0.35;
            h = 0.32;
        };
        class Button_Camera: MEU_Button
        {
            idc = 7604;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_Camera_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_switchCamera;";
            x = 0.06;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Button_NV: MEU_Button
        {
            idc = 7605;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_NightVision_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_switchNV;";
            x = 0.13;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Button_Load: MEU_Button
        {
            idc = -1;
            text = "$STR_MEU_Equipment_EquipmentLoad";
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "[] spawn MEU_fnc_loadDefaultLoadout;";
            x = 0.40;
            y = 0.69;
            w = 0.1562;
            h = 0.04;
        };
        class Button_Exit: MEU_Button
        {
            idc = -1;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentBack";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "closeDialog 0;";
            x = 0.69;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
    };
};

class MEU_Dialog_loadVR
{
    idd = -1;
    movingEnable = 0;
    onLoad = "[] spawn MEU_fnc_equipmentDialog_loadVR";
    
    class controlsBackground
    {
        class Background: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {0,0,0,0.7};
            x = 0.050;
            y = 0.244;
            w = 0.70;
            h = 0.512;
        };
        class Title: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.7};
            text = "$STR_MEU_Equipment_ModuleEquipment_Action_defaultValue";
            x = 0.050;
            y = 0.15;
            w = 0.70;
            h = 0.04;
        };
        class Label_Profiles: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentProfiles";
            sizeEx = 0.04;
            x = 0.053; 
            y = 0.27;
            w = 0.32; 
            h = 0.04;
        };
        class Label_Content: MEU_Base 
        {
            idc = -1;
            colorBackground[] = {1,0.5,0,0.5};
            text = "$STR_MEU_Equipment_EquipmentContents";
            style = 1;
            sizeEx = 0.04;
            x = 0.397; 
            y = 0.27;
            w = 0.35; 
            h = 0.04;
        };
        class Background_Tools: MEU_Base
        {
            colorBackground[] = {0,0,0,0.8};
            idc = -1;
            x = 0.050;
            y = 0.19;
            w = 0.7;
            h = 0.055;
        };
        class Image_Camera: MEU_Picture
        {
            idc = 7800;
            text = "\11th_equipment\data\camera.paa";
            x = 0.06;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Image_NV: MEU_Picture
        {
            idc = 7801;
            text = "\11th_equipment\data\nv.paa";
            x = 0.13;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Image_Close: MEU_Picture
        {
            idc = -1;
            text = "\11th_equipment\data\close.paa";
            x = 0.69;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
    };
    
    class controls 
    {    
        class List_Profiles: MEU_ListBox 
        {
            idc = 7803;
            rowHeight = 0.04;
            text = "";
            sizeEx = 0.032;
            onLBSelChanged = "[] spawn MEU_fnc_getVRLoadout;";
            x = 0.053;
            y = 0.31;
            w = 0.32;
            h = 0.32;
        };
        class List_Content: MEU_ListBox 
        {
            idc = 7804;
            rowHeight = 0.03;
            text = "";
            sizeEx = 0.032;
            x = 0.397;
            y = 0.31;
            w = 0.35;
            h = 0.32;
        };
        class Button_Camera: MEU_Button
        {
            idc = 7805;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_Camera_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_switchCamera;";
            x = 0.06;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Button_NV: MEU_Button
        {
            idc = 7806;
            text = "";
            toolTip = "$STR_MEU_Equipment_ModuleEquipment_NightVision_name";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "call MEU_fnc_switchNV;";
            x = 0.13;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
        class Button_Load: MEU_Button
        {
            idc = -1;
            text = "$STR_MEU_Equipment_EquipmentLoad";
            colorBackground[] = {1,0.5,0,0.5};
            onButtonClick = "[] spawn MEU_fnc_loadVRLoadout;";
            x = 0.40;
            y = 0.69;
            w = 0.1562;
            h = 0.04;
        };
        class Button_Exit: MEU_Button
        {
            idc = -1;
            text = "";
            toolTip = "$STR_MEU_Equipment_EquipmentBack";
            colorBackground[] = {0,0,0,0};
            colorBackground2[] = {0,0,0,0};
            colorBackgroundFocused[] = {0,0,0,0};
            onButtonClick = "closeDialog 0;";
            x = 0.69;
            y = 0.185;
            w = 0.064;
            h = 0.064;
        };
    };
};*/