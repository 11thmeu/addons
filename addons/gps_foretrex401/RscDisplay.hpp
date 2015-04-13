/* #Dusyky
$[
	1.063,
	["meu11th_gps_foretrex401",[["0","0","1","1"],"0.0025","0.004","GUI_GRID"],0,1,1],
	[1200,"background",[1,"\11th_gps\data\garmin_foretrex_401v2.paa",["0.795313 * safezoneW + safezoneX","0.57952 * safezoneH + safezoneY","0.162094 * safezoneW","0.2576 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"time",[1,"00:00",["0.840594 * safezoneW + safezoneX","0.65932 * safezoneH + safezoneY","0.042 * safezoneW","0.0364 * safezoneH"],[0,0,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","8"],[]],
	[1600,"coordinates",[1,"00000N 00000E",["0.841907 * safezoneW + safezoneX","0.7016 * safezoneH + safezoneY","0.0780938 * safezoneW","0.0364 * safezoneH"],[0,0,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","7"],[]],
	[1602,"elevation",[1,"0000",["0.88325 * safezoneW + safezoneX","0.65876 * safezoneH + safezoneY","0.03675 * safezoneW","0.0364 * safezoneH"],[0,0,0,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","8"],[]]
]
*/

class MEU_GPS_BackPicture;
class MEU_GPS_HiddenButton;
class RscTitles
{
	class GVAR(RscDisplay)
	{
		duration = 1e+011;
		idd = -1;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['MEU_GPS_FORETREX401_Display', _this select 0]; if(sunOrMoon < 0.2)then{((_this select 0) displayCtrl 99) ctrlSetText '\z\meu\addons\gps_foretrex401\UI\display_night.paa';};";

		class controlsBackground
		{
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT START (by Kavinsky, v1.063, #Dusyky)
			////////////////////////////////////////////////////////

			class background: MEU_GPS_BackPicture
			{
				idc = 99;
				text = PATHTOF(UI\display_day.paa);
				x = 0.795313 * safezoneW + safezoneX;
				y = 0.57952 * safezoneH + safezoneY;
				w = 0.162094 * safezoneW;
				h = 0.2576 * safezoneH;
				shadow = 0;
			};
			class time: MEU_GPS_HiddenButton
			{
				idc = 100;
				text = "--:-- --";
				x = 0.840594 * safezoneW + safezoneX;
				y = 0.65932 * safezoneH + safezoneY;
				w = 0.042 * safezoneW;
				h = 0.0364 * safezoneH;
				colorText[] = {0,0,0,1};
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 40) * 1.2)";
				shadow = 0;
				font = QUOTE(GVARMAIN(LCD_Font));
			};
			class coordinates: MEU_GPS_HiddenButton
			{
				idc = 101;
				text = "-----f ------f";
				x = 0.841907 * safezoneW + safezoneX;
				y = 0.7016 * safezoneH + safezoneY;
				w = 0.0780938 * safezoneW;
				h = 0.0364 * safezoneH;
				colorText[] = {0,0,0,1};
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 40) * 1.2)";
				shadow = 0;
				font = QUOTE(GVARMAIN(LCD_Font));
			};
			class elevation: MEU_GPS_HiddenButton
			{
				idc = 102;
				text = "----m";
				x = 0.88325 * safezoneW + safezoneX;
				y = 0.65876 * safezoneH + safezoneY;
				w = 0.03675 * safezoneW;
				h = 0.0364 * safezoneH;
				colorText[] = {0,0,0,1};
				sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 40) * 1.2)";
				shadow = 0;
				font = QUOTE(GVARMAIN(LCD_Font));
			};
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT END
			////////////////////////////////////////////////////////
		};
	};
};