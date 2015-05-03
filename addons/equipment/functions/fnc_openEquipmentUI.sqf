/*
 * Author: Thrax
 * Open the equipment dialog with the configured parameters
 *
 * Arguments:
 * 0: -
 * 1: -
 * 2: -
 * 3: Action parameters <ARRAY>
 *        0: Configuration type <NUMBER>
 * 		  1: Enable camera <BOOL>
 *		  2: Enable night vision <BOOL>
 *		  3: Enable save and load <BOOL>
 *	      4: Enable persistence <BOOL>
 *		  5: Enable presets <BOOL>
 *		  6: List of presets <ARRAY>
 *		  7: Show item information <BOOL>
 * 		  8: Show item classnames <BOOL>
 * 		  9: Show only presets <BOOL>
 *		  10: Show insignias <BOOL>
 * 		  11: Show default profiles <BOOL>
 * 		  12: Set personal data <BOOL>
 * 		  13: Allow loading from virtual arsenal <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["", "", "", [0, true, true, true, true, true, [], true, true, true, true, true, true, true] call FUNC(openEquipmentUI)
 *
 * Public: [No]
 */
#include "script_component.hpp"

//Module parameters
private "_type";
_type = (_this select 3) select 0;

GVAR(NewConfig) = false;
GVAR(Updating) = false;
GVAR(Reset) = true;

if(isNil QGVAR(ConfigID) || {GVAR(ConfigID) != _type}) then {
	//Only update configuration if it's the first use or a different configuration was called
	GVAR(NewConfig) = true;
	
	[_type] call MEU_fnc_readConfig;

	GVAR(ConfigID) = _type;
};

GVAR(EnableCamera) = (_this select 3) select 1;
GVAR(EnableNV) = (_this select 3) select 2;
GVAR(EnableSaveLoad) = (_this select 3) select 3;
GVAR(EnablePersistence) = (_this select 3) select 4;
GVAR(EnablePresets) = (_this select 3) select 5;
GVAR(PresetsArray) = (_this select 3) select 6;
GVAR(Info) = (_this select 3) select 7;
GVAR(Classnames) = (_this select 3) select 8;
GVAR(PresetsOnly) = (_this select 3) select 9;
GVAR(Insignias) = (_this select 3) select 10;
GVAR(EnableDefaultProfiles) = (_this select 3) select 11;
GVAR(SetPersonalData) = (_this select 3) select 12;
GVAR(AllowVirtualLoad) = (_this select 3) select 13;

waitUntil {!GVAR(NewConfig)};

//-------------------------------------------------
private ["_types", "_object", "_target", "_position"];

createDialog "MEU_Dialog_equipment";

//Set config title
ctrlSetText [7557,(format["%1 - [%2]", localize "STR_MEU_Equipment_ModuleEquipment_Action_defaultValue", GVAR(ConfigType)])];

//Add item types
_types = [];
if (!GVAR(PresetsOnly)) then {
	_types set[0, localize "STR_MEU_Equipment_ModuleEquipment_Uniforms"];
	_types set[1, localize "STR_MEU_Equipment_ModuleEquipment_Vests"];
	_types set[2, localize "STR_MEU_Equipment_ModuleEquipment_Backpacks"];
	_types set[3, localize "STR_MEU_Equipment_ModuleEquipment_Headgear"];
};
_types pushBack (localize "STR_MEU_Equipment_ModuleEquipment_Goggles");

if (GVAR(Insignias)) then {
	_types pushBack (localize "STR_MEU_Equipment_ModuleEquipment_Insignias");
};

if (GVAR(EnablePresets)) then {
	_types pushBack (localize "STR_MEU_Equipment_ModuleEquipment_Presets");
};

{ lbAdd [7554, _x]; } forEach _types;
lbSetCurSel [7554,0];

//Add factions from configuration 
lbAdd [7555, localize "STR_MEU_Equipment_ModuleEquipment_Type_all"];
{ lbAdd [7555, _x]; } forEach GVAR(UniformFactions);
lbSetCurSel [7555,0];

//Camera
if (GVAR(EnableCamera)) then {

	_object = _this select 0;

	_object hideObject true;
	["Init"] call MEU_fnc_equipmentDialog_camera;
	GVAR(NV) = false;
	
	[_object] spawn {
		private "_object";
		_object = _this select 0;
		
		waitUntil {!dialog};
		
		["Exit"] call MEU_fnc_equipmentDialog_camera;
		_object hideObject false;
	};
	
	//Disable NV
	if (!GVAR(EnableNV)) then {
		ctrlShow [7571, false];
		ctrlSetText [7581, ""] 
	};
	
} else {
	//Disable buttons
	ctrlShow [7570, false];
	ctrlSetText [7580, ""];
	ctrlShow [7571, false];
	ctrlSetText [7581, ""];
};

//Save/Load system
if (!GVAR(EnableSaveLoad)) then {
	ctrlShow [7572, false];
	ctrlSetText [7582, ""];
	ctrlShow [7573, false];
	ctrlSetText [7583, ""];
};

//Default profiles
if (!GVAR(EnableDefaultProfiles)) then {
	ctrlShow [7578, false];
	ctrlSetText [7584, ""];
};

if (!GVAR(AllowVirtualLoad)) then {
	ctrlShow [7579, false];
	ctrlSetText [7585, ""];
};