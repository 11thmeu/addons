/*
 * Author: Thrax
 * Initializes the equipment module
 *
 * Arguments:
 * 0: Module to initialize <LOGIC>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * [module, [], true] call FUNC(moduleEquipment)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_logic", "_units", "_activated"];
private ["_action", "_type", "_presets", "_presetsArray", "_info", "_classnames", "_presetsOnly", "_insignias", "_users", "_camera", "_nv", "_saveLoad", "_defaultProfiles", "_persistent", "_loadVR", "_condition"];

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {true};

//Configurable parameters
_action = GETVAR(_logic,Action,localize "STR_MEU_Equipment_ModuleEquipment_Action_defaultValue");
_type = GETVAR(_logic,Type,"blufor");
_camera = GETVAR(_logic,Camera,true);
_nv = GETVAR(_logic,NV,true);
_saveLoad = GETVAR(_logic,SaveLoad,true);
_persistent = GETVAR(_logic,Persistent,false);
_presets = GETVAR(_logic,Presets,true);
_presetsArray = call compile (GETVAR(_logic,PresetsArray,'[]'));
_info = GETVAR(_logic,Info,true);
_classnames = GETVAR(_logic,Classnames,false);
_presetsOnly = GETVAR(_logic,PresetsOnly,false);
_insignias = GETVAR(_logic,Insignias,true);
_users = call compile (GETVAR(_logic,Users,'[]'));
_defaultProfiles = GETVAR(_logic,DefaultProfiles,true);
_loadVR = GETVAR(_logic,LoadVR,true);

if (typeName _presetsArray != "ARRAY") then { _presetsArray = []; };
if (typeName _users != "ARRAY") then { _users = []; };

{
    if (_x getVariable [format["MEU_Equipment_Action_%1", _type], true]) then {
        
        if ((count _users) != 0) then {
            _condition = "(typeOf _this) in " + str(_users);
        } else {
            _condition = "true";
        };

        _x addAction [MEU_TEXT_RED(_action), 
        {["open",_this] call FUNC(equipmentUI)}, 
        [_type, _camera, _nv, _saveLoad, _persistent, _presets, _presetsArray, _info, _classnames, _presetsOnly, _insignias, _defaultProfiles, _loadVR],
        1.5, true, true, "", _condition];

        _x setVariable [format["MEU_Equipment_Action_%1", _type], false, false];
    };
} forEach _units;

//If insignias are enabled preload them
if (_insignias && (isNil QGVAR(AllInsignias))) then {
    GVAR(AllInsignias) = (configfile >> "CfgUnitInsignia") call BIS_fnc_returnchildren;
};

LOG("[MEU]: Equipment Module Initialized");

true 