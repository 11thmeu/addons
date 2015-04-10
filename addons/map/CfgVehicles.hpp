class CfgVehicles
{
	class NonStrategic;
	class MEU_MapLight: NonStrategic
	{
		_generalmacro = "MEU_MapLight";
		author = "Thrax";
		displayName = "";
		model = "\a3\weapons_f\empty.p3d";
		animated = 0;
		mapsize = 0;
		typicalCargo[] = {};
		transportAmmo = 0;
		transportRepair = 0;
		transportFuel = 0;
		vehicleclass = "Lamps";
		icon = "iconObject";
		scope = 1;
		nameSound = "";
		accuracy = 0.2;
		class DestructionEffects{};
		class Markerlights {};
		class Reflectors
		{
			class LampLight
			{
				color[] = {1,0,0,1};
				ambient[] = {1,0,0,1};
				position = "Light";
				direction = "LightDown";
				hitpoint = "lampa";
				selection = "";
				size = 1.00;
				brightness = 1.00;
			};
		};
	};
};