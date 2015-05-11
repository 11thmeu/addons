class RscMapControl;
class RscPicture;
class RscControlsGroup;
class RscText;
class RscStructuredText;

class MEU_gui_SpectatorKeyText {
    type = 0;
    style = 0;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0.77,0.51,0.08,1};
    font = "PuristaBold";
    sizeEx = 0.04;
    h = 0.04;
    w = 0.12;
    x = safeZoneX + safeZoneW - 0.4;
};

class MEU_gui_SpectatorKeyDescription {
    type = 0;
    style = 0;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "PuristaLight";
    sizeEx = 0.04;
    h = 0.04;
    w = 0.3;
    x = safeZoneX + safeZoneW - 0.27;
};

class RscTitles {

    class RscMEU_Spectator {
        scriptName = "RscMEU_Spectator";
        scriptPath = "meu_respawn";
        onLoad = "[""onLoad"",_this,""RscMEU_Spectator"",'meu_respawn'] call (uinamespace getvariable 'BIS_fnc_initDisplay')";
        onUnload = "[""onUnload"",_this,""RscMEU_Spectator"",'meu_respawn'] call (uinamespace getvariable 'BIS_fnc_initDisplay')";
        idd = 3000;
        duration = 1e+011;
        fadein = 0;
        movingEnable = 0;
        class ControlsBackground {
            class Map: RscMapControl {
                x = -1;
                y = -1;
                w = 0;
                h = 0;
            };
        };
        class Controls {
            class PlayerIcon: RscPicture {
                shadow = 2;
                idc = 1200;
                text = "\A3\ui_f\data\igui\cfg\cursors\select_ca.paa";
                x = "0 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
                y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
                w = "2 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            };
            class Player: RscControlsGroup {
                x = "safezoneX + safezoneW - 16 * (((safezoneW / safezoneH) min 1.2) / 40)";
                idc = 2300;
                y = "17 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
                w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "7.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                class controls {
                    class PlayerNameBackground: RscText {
                        colorBackground[] = {0,0,0,1};
                        idc = 1000;
                        x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                        y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
                        h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    };
                    class PlayerName: RscText {
                        idc = 1002;
                        x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                        y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        w = "9 * (((safezoneW / safezoneH) min 1.2) / 40)";
                        h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    };
                    class PlayerGroup: RscText {
                        font = "PuristaLight";
                        style = 1;
                        idc = 1001;
                        x = "9 * (((safezoneW / safezoneH) min 1.2) / 40)";
                        y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        w = "6 * (((safezoneW / safezoneH) min 1.2) / 40)";
                        h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        colorText[] = {1,1,1,0.5};
                        sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    };
                    class PlayerDescription: RscStructuredText {
                        idc = 1100;
                        x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                        y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
                        h = "6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                        colorBackground[] = {0,0,0,0.5};
                    };
                };
            };
        };
    };
    
    class RscMEU_SpectatorHelp {
        idd = -1;
        onLoad = "";
        duration = 86400;
        fadein = 0.5;
        fadeout = 0;
        class controls {
            class Background {
                type = 0;
                style = 0;
                idc = -1;
                colorBackground[] = {0.16,0.16,0.16,0.5};
                colorText[] = {0.16,0.16,0.16,1};
                font = "PuristaBold";
                sizeEx = 0.04;
                text = "";
                h = 0.7;
                w = 0.45;
                x = safeZoneX + safeZoneW - 0.45;
                y = safeZoneY + safeZoneH/2 - 0.3;
            };
            class Header {
                idc = -1;
                type = 0;
                style = 0;
                colorBackground[] = {0,0,0,0};
                colorText[] = {1,1,1,1};
                font = "PuristaBold";
                sizeEx = 0.08;
                h = 0.08;
                w = 0.45;
                x = safeZoneX + safeZoneW - 0.4;
                y = safeZoneY + safeZoneH/2 - 0.25;
                text = "$STR_MEU_Respawn_SpectatorControls";
            };
            class Key0: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 - 0.15;
                text = "H";
            };
            class Desc0: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 - 0.15;
                text = "$STR_MEU_Respawn_SpectatorHelp";
            };
            class Key1: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 - 0.1;
                text = "<-/->";
            };
            class Desc1: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 - 0.1;
                text = "$STR_MEU_Respawn_SpectatorSwitch";
            };
            class Key2: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 - 0.05;
                text = "M";
            };
            class Desc2: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 - 0.05;
                text = "$STR_MEU_Respawn_SpectatorMap";
            };
            class Key3: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 - 0;
                text = "N";
            };
            class Desc3: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 - 0;
                text = "$STR_MEU_Respawn_SpectatorVision";
            };
            class Key4: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.05;
                text = "WASDQZ";
            };
            class Desc4: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.05;
                text = "$STR_MEU_Respawn_SpectatorMoveCam";
            };
            class Key5: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.1;
                text = "Num *";
            };
            class Desc5: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.1;
                text = "$STR_MEU_Respawn_SpectatorFreeLook";
            };
            class Key6: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.15;
                text = "$STR_MEU_Respawn_SpectatorDeleteKey";
            };
            class Desc6: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.15;
                text = "$STR_MEU_Respawn_SpectatorFloat";
            };
            class Key7: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.2;
                text = "F";
            };
            class Desc7: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.2;
                text = "$STR_MEU_Respawn_SpectatorFocus";
            };
            class Key8: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.25;
                text = "L";
            };
            class Desc8: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.25;
                text = "$STR_MEU_Respawn_SpectatorCrosshair";
            };
            class Key9: MEU_gui_SpectatorKeyText {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.30;
                text = "Alt";
            };
            class Desc9: MEU_gui_SpectatorKeyDescription {
                idc = -1;
                y = safeZoneY + safeZoneH/2 + 0.30;
                text = "$STR_MEU_Respawn_SpectatorToTarget";
            };
        };
    };
};