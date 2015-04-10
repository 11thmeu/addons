class MEU_Base;
class RscDisplayMainMap 
{
	class controls 
	{
		class Label_GridSize: MEU_Base 
		{
			colorBackground[] = {0,0,0,0};
			font = "PuristaLight";
			text = "$STR_MEU_Map_GridSize";
			idc = 62811;
			x = "0.6 * safezoneW + safezoneX";
			y = "0 * safezoneH + safezoneY";
			w = "0.5";
			h = "0.06";
			sizeEx = "0.032";
		};
		class Label_GridSizeValue: MEU_Base 
		{
			colorBackground[] = {0,0,0,0};
			font = "PuristaLight";
			text = "100m";
			idc = 62812;
			x = "0.67 * safezoneW + safezoneX";
			y = "0 * safezoneH + safezoneY";
			w = "0.5";
			h = "0.06";
			sizeEx = "0.032";
		};
	};
};