#include "script_component.hpp"

/*
	Author: Thrax

	Description:
	Check light, draw map overlay and update grid level


	Parameter(s):
		0: CONTROL - map control

	Returns:
	-
*/

disableSerialization;

//----------------------------------------------------------------------------
//Map grid size logic

private ["_ctrlMap", "_mapScale", "_display", "_labelScale"];
_ctrlMap = _this select 0;
_mapScale = ctrlMapScale _ctrlMap;
_display = findDisplay 12;
_labelScale = _display displayCtrl 62812;

{
	if (_mapScale < (_x select 0)) exitWith {
		_labelScale ctrlSetText format["%1m", _x select 1];
	};
} forEach GVAR(ZoomLevels);

//----------------------------------------------------------------------------
//Map light logic

if ((!("ItemMap" in assignedItems ACE_Player)) || (sunOrMoon == 1)) exitWith {};

private ["_baseAlpha", "_alpha", "_mapBorder", "_mapTexture", "_mapMask", "_maskMode", "_vehicle"];

_baseAlpha = if (round overcast > 0.5) then { 0.975 } else { 0.93 };
_alpha = _baseAlpha min abs(sunOrMoon - 1);
_mapBorder = [0,0,0,(_alpha * 1.1)];
_mapTexture = format["#(rgb,1,1,1)color(0,0,0,%1)", _alpha];
_mapMask = true;
_maskMode = 0;

if (vehicle ACE_Player == ACE_Player) then {
	//Player outside

	private ["_campfires", "_fire", "_lamps", "_lamp", "_chemlights", "_chemlightsBlue", "_chemlightsGreen", "_chemlightsRed", "_chemlightsYellow"];

	if (currentVisionMode ACE_Player == 1) then {
		//Nightvision
		_mapBorder = [0,0.96,0,0.8];
		_mapTexture = "#(rgb,1,1,1)color(0,0.96,0,0.8)";
		_maskMode = 1;
	} else {

		//Campfires
		_campfires = nearestObjects [ACE_Player, ["Land_Campfire_F", "Land_FirePlace_F", "Land_Fire"], 4];
		if (count _campfires > 0) then {
			_fire = _campfires select 0;
			if (inflamed _fire) then {
				_alpha = (((ACE_Player distance _fire) min 4)/4) min _baseAlpha;
				_mapBorder = [0,0,0,_alpha];
				_mapTexture = format["#(rgb,1,1,1)color(0,0,0,%1)", _alpha];
				_maskMode = 2;
			};
		};

		//Street lamps
		_lamps = nearestObjects [ACE_Player, ["Lamps_base_F"], 15];
		if (count _lamps > 0) then {
			_lamp = _lamps select 0;
			if (isLightOn _lamp) then {
				_alpha = (((ACE_Player distance _lamp) min 15)/15) min _baseAlpha;
				_mapBorder = [0,0,0,_alpha];
				_mapTexture = format["#(rgb,1,1,1)color(0,0,0,%1)", _alpha];
				_maskMode = 2;
			};
		};

		//Chemlights (TODO check color)
		_chemlightsBlue = (getpos ACE_Player nearObjects ["Chemlight_blue",3]);
		_chemlightsGreen = (getpos ACE_Player nearObjects ["Chemlight_green",3]);
		_chemlightsRed = (getpos ACE_Player nearObjects ["Chemlight_red",3]);
		_chemlightsYellow = (getpos ACE_Player nearObjects ["Chemlight_yellow",3]);
		_chemlights = _chemlightsBlue + _chemlightsGreen + _chemlightsRed + _chemlightsYellow;
		if (count _chemlights > 0) then {
			_chemlight = _chemlights select 0;
			if (alive _chemlight) then {
				_alpha = (((ACE_Player distance _chemlight) min 2)/2) min 0.5;
				_mapBorder = [0,0,0,_alpha];
				_mapTexture = format["#(rgb,1,1,1)color(0,0,0,%1)", _alpha];
				_maskMode = 2;
			};
		};
	};

} else {
	//Player is in a vehicle
	_vehicle = vehicle ACE_Player;

	if (_vehicle isKindOf "Tank") then {
		_mapMask = false;
	};

	if (currentVisionMode ACE_Player == 1) then {
		//Nightvision
		_mapBorder = [0,0.96,0,0.8];
		_mapTexture = "#(rgb,1,1,1)color(0,0.96,0,0.8)";
		_maskMode = 1;
	};
};

if (_mapMask) then {

	//If using map light, apply color
	if (GVAR(MapLight)) then {
		switch (_maskMode) do
		{
			//No light source
			case 0:
			{
				_mapBorder = [0.96,0,0,0.7];
				_mapTexture = "#(rgb,1,1,1)color(0.96,0,0,0.7)";
			};

			//Using night vision
			case 1:
			{
				_mapBorder = [0.96,0.96,0,0.8];
				_mapTexture = "#(rgb,1,1,1)color(0.96,0.96,0,0.8)";
			};

			//External light source
			case 2:
			{
				_mapBorder set [0, 0.96];
				_mapTexture = format["#(rgb,1,1,1)color(0.96,0,0,%1)", _alpha];
			};
		};
	};

	((findDisplay 12) displayCtrl 51) drawRectangle [(getArray(configFile >> 'CfgWorlds' >> worldName >> 'centerPosition')), 80000, 80000, 0, _mapBorder, _mapTexture];
};