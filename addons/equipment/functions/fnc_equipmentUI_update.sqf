/*
 * Author: Thrax
 * Update the equipment dialog
 *
 * Arguments:
 * 0: Reset side <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(equipmentUI_saveLoad)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_resetSide", "_type", "_side", "_collection", "_tooltip", "_load", "_protection", "_vconfig", "_index", "_insignias"];

if (GVAR(Reset)) exitWith {GVAR(Reset) = false;};

if (GVAR(Updating)) then { waitUntil {!GVAR(Updating)}; };

GVAR(Updating) = true;

_resetSide = _this select 0;
_type = lbCurSel 7554;
_side = lbCurSel 7555;
_collection = [];

if(_resetSide) then {
	_side = 0;
	GVAR(Reset) = true;
	lbSetCurSel [7555,0];
};

if(_side == -1) then { _side = 0; };

lbClear 7556;

if (GVAR(PresetsOnly)) then { _type = _type + 4; };

if (!GVAR(Insignias) && GVAR(EnablePresets)) then { _type = _type + 1; };

switch(_type) do 
{
	case 0:
	{
		GVAR(Type) = 0;
		
		//Set available factions
		lbClear 7555;
		lbAdd [7555, localize "STR_MEU_Equipment_ModuleEquipment_Type_all"];
		{ lbAdd [7555, _x]; } forEach GVAR(UniformFactions);
		
		//Check side
		if(_side == 0) then {
			{ { _collection pushBack _x; } forEach _x; } forEach GVAR(Uniforms);
		} else {
			_collection = GVAR(Uniforms) select (_side - 1);
		};

		//Add elements to listbox
		{
			_vconfig = configFile >> "CfgWeapons" >> _x;
			_index = lbAdd [7556,getText(_vconfig >> "displayName")];
			lbSetData[7556,_index,_x];
			lbSetPicture [7556,_index,getText(_vconfig >> "picture")];
			
			if ((getText (_vconfig >> "DLC")) != "") then {
				lbSetColor [7556, _index, [1,1,0,1]];
			};
			
			_tooltip = "";
			if (GVAR(Info)) then {
				_tooltip = (localize "STR_MEU_Equipment_ModuleEquipment_Capacity") + ": " + ([getText (_vconfig >> "ItemInfo" >> "containerClass"), "Supply", ""] call CBA_fnc_replace);
			};
			if (GVAR(Classnames)) then { _tooltip = _tooltip + format[" [%1]", _x]; };	
			if (_tooltip != "") then { lbSetTooltip[7556,_index,_tooltip]; };
		} forEach _collection;
	};
	
	case 1:
	{
		GVAR(Type) = 1;

		//Set available factions
		lbClear 7555;
		lbAdd [7555, localize "STR_MEU_Equipment_ModuleEquipment_Type_all"];
		{ lbAdd [7555, _x]; } forEach GVAR(VestFactions);
		
		//Check side
		if(_side == 0) then {
			{ { _collection pushBack _x; } forEach _x; } forEach GVAR(Vests);
		} else {
			_collection = GVAR(Vests) select (_side - 1);
		};
		
		//Add elements to listbox
		{
			_vconfig = configFile >> "CfgWeapons" >> _x;
			_index = lbAdd [7556,getText(_vconfig >> "displayName")];
			lbSetData[7556,_index,_x];
			lbSetPicture [7556,_index,getText(_vconfig >> "picture")];

			_tooltip = "";
			if (GVAR(Info)) then {
				_tooltip = (localize "STR_MEU_Equipment_ModuleEquipment_Capacity") + ": " + ([getText (_vconfig >> "ItemInfo" >> "containerClass"), "Supply", ""] call CBA_fnc_replace);
				_tooltip = _tooltip + format[" | %1: %2", localize "STR_MEU_Equipment_ModuleEquipment_Protection", getNumber (_vconfig >> "ItemInfo" >> "armor")];
			};
			if (GVAR(Classnames)) then { _tooltip = _tooltip + format[" [%1]", _x]; };	
			if (_tooltip != "") then { lbSetTooltip[7556,_index,_tooltip]; };
		} forEach _collection;
	};
	
	case 2:
	{
		GVAR(Type) = 2;

		//Set available factions
		lbClear 7555;
		lbAdd [7555, localize "STR_MEU_Equipment_ModuleEquipment_Type_all"];
		{ lbAdd [7555, _x]; } forEach GVAR(BackpackFactions);
		
		//Check side
		if(_side == 0) then {
			{ { _collection pushBack _x; } forEach _x; } forEach GVAR(Backpacks);
		} else {
			_collection = GVAR(Backpacks) select (_side - 1);
		};
		
		//Add elements to listbox
		{
			_vconfig = configFile >> "CfgVehicles" >> _x;
			_index = lbAdd [7556,getText(_vconfig >> "displayName")];
			lbSetData[7556,_index,_x];
			lbSetPicture [7556,_index,getText(_vconfig >> "picture")];

			_tooltip = "";
			if (GVAR(Info)) then { 
				_tooltip = format["%1: %2", localize "STR_MEU_Equipment_ModuleEquipment_Capacity", getNumber (_vconfig >> "maximumLoad")]; 
			};
			if (GVAR(Classnames)) then { _tooltip = _tooltip + format[" [%1]", _x]; };	
			if (_tooltip != "") then { lbSetTooltip[7556,_index,_tooltip]; };
		} forEach _collection;
	};
	
	case 3:
	{
		GVAR(Type) = 3;

		//Set available factions
		lbClear 7555;
		lbAdd [7555, localize "STR_MEU_Equipment_ModuleEquipment_Type_all"];
		{ lbAdd [7555, _x]; } forEach GVAR(HeadgearFactions);
		
		//Check side
		if(_side == 0) then {
			{ {	_collection pushBack _x; } forEach _x; } forEach GVAR(Headgear);
		} else {
			_collection = GVAR(Headgear) select (_side - 1);
		};
		
		//Add elements to listbox
		{
			_vconfig = configFile >> "CfgWeapons" >> _x;
			_index = lbAdd [7556,getText(_vconfig >> "displayName")];
			lbSetData[7556,_index,_x];
			lbSetPicture [7556,_index,getText(_vconfig >> "picture")];

			_tooltip = "";
			if (GVAR(Info)) then { 
				_tooltip = format["%1: %2", localize "STR_MEU_Equipment_ModuleEquipment_Protection", getNumber (_vconfig >> "ItemInfo" >> "armor")]; 
			};
			if (GVAR(Classnames)) then { _tooltip = _tooltip + format[" [%1]", _x]; };	
			if (_tooltip != "") then { lbSetTooltip[7556,_index,_tooltip]; };
		} forEach _collection;
	};
	
	case 4:
	{
		GVAR(Type) = 4;
		
		//Set available factions
		lbClear 7555;
		lbAdd [7555, localize "STR_MEU_Equipment_ModuleEquipment_Type_all"];
		{ lbAdd [7555, _x]; } forEach GVAR(GoggleFactions);
		
		//Check side
		if(_side == 0) then {
			{ { _collection pushBack _x; } forEach _x; } forEach GVAR(Goggles);
		} else {
			_collection = GVAR(Goggles) select (_side - 1);
		};

		//Add elements to listbox
		{
			_vconfig = configFile >> "CfgGlasses" >> _x;
			_index = lbAdd [7556,getText(_vconfig >> "displayName")];
			lbSetData[7556,_index,_x];
			lbSetPicture [7556,_index,getText(_vconfig >> "picture")];
			
			if (GVAR(Classnames)) then {
				_tooltip = "";
				_tooltip = format["[%1]", _x];
				lbSetTooltip[7556,_index,_tooltip];
			};
		} forEach _collection;
	};
	
	case 5:
	{
		GVAR(Type) = 5;
		
		//Set available factions
		lbClear 7555;
		lbAdd [7555, localize "STR_MEU_Equipment_ModuleEquipment_Type_all"];
		
		//If insignias are not preloaded fetch them from config (slower)
		if (isNil "MEU_Equipment_AllInsignias") then {
			_insignias = (configfile >> "CfgUnitInsignia") call BIS_fnc_returnchildren;
		} else {
			_insignias = GVAR(AllInsignias);
		};
		
		{
			_index = lbAdd [7556, getText (_x >> "displayName")];
			lbSetData [7556, _index, configName _x];
			lbSetPicture [7556, _index, getText (_x >> "texture")];
		} forEach _insignias;
	};
	
	case 6: {
		GVAR(Type) = 6;
	
		//Set available factions
		lbClear 7555;
		lbAdd [7555, localize "STR_MEU_Equipment_ModuleEquipment_Type_all"];
		{ lbAdd [7555, _x]; } forEach GVAR(PresetFactions);

		//Check side
		if(_side == 0) then {
			{ { _collection pushBack _x; } forEach _x; } forEach GVAR(Presets);
		} else {
			_collection = GVAR(Presets) select (_side - 1);
		};

		//Add elements to listbox
		{
			{
				_index = lbAdd [7556,_x select 0];
				lbSetData[7556,_index,str(_x)];
				lbSetPicture [7556,_index,getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture")];
				
				_load = 0;
				_protection = 0;
				_tooltip = "";
				if (GVAR(Info)) then {
					_load = _load + parseNumber([getText (configFile >> "CfgWeapons" >> (_x select 1) >> "ItemInfo" >> "containerClass"), "Supply", ""] call CBA_fnc_replace);
					_load = _load + parseNumber([getText (configFile >> "CfgWeapons" >> (_x select 2) >> "ItemInfo" >> "containerClass"), "Supply", ""] call CBA_fnc_replace);
					_load = _load + getNumber (configFile >> "CfgVehicles" >> (_x select 3) >> "maximumLoad");
					_protection = _protection + getNumber (configFile >> "CfgWeapons" >> (_x select 2) >> "ItemInfo" >> "armor");
					if (((_x select 4) != "G_Diving") && ((_x select 4) != "")) then {
						_protection = _protection + getNumber (configFile >> "CfgWeapons" >> (_x select 4) >> "ItemInfo" >> "armor");
					};
					_tooltip = format["%1: %2 | %3: %4", localize "STR_MEU_Equipment_ModuleEquipment_Capacity", _load, localize "STR_MEU_Equipment_ModuleEquipment_Protection", _protection];
					lbSetTooltip[7556,_index,_tooltip];
				};
			} forEach _x;
		} forEach [_collection, GVAR(PresetsArray)];
	};

	default {
		ERROR("Error in equipment update function");
	};

};

MEU_Equipment_Updating = false;