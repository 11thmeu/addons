#include "script_component.hpp"

GVAR(MapLight) = false;
GVAR(ZoomLevels) = []; //Get zoom values for current world

#include "initKeybinds.sqf"


{
	GVAR(ZoomLevels) pushBack [getNumber (_x >> "zoomMax"), getNumber (_x >> "stepX")];
} forEach ((configFile >> "CfgWorlds" >> worldName >> "Grid") call BIS_fnc_returnchildren);

//Add map draw event handler
[] spawn {
	sleep 5;
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {_this call FUNC(drawMap);}];
};