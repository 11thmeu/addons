#include "script_component.hpp"

ADDON = false;

PREP(playerFix);

//TAWVD Functions
TAWVD_fnc_onSliderChange = compile preprocessFileLineNumbers QUOTE(PATHTOF(functions\taw\fnc_onSliderChange.sqf));
TAWVD_fnc_onTerrainChange = compile preprocessFileLineNumbers QUOTE(PATHTOF(functions\taw\fnc_onTerrainChange.sqf));
TAWVD_fnc_openTAWVD = compile preprocessFileLineNumbers QUOTE(PATHTOF(functions\taw\fnc_openTAWVD.sqf));
TAWVD_fnc_updateViewDistance = compile preprocessFileLineNumbers QUOTE(PATHTOF(functions\taw\fnc_updateViewDistance.sqf));

ADDON = true;
