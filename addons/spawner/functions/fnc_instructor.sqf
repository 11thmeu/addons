/*
 * Author: Thrax
 * Open or execute action in instructor menu
 *
 * Arguments:
 * 0: Target object <OBJECT>
 * 1: Activator unit <OBJECT>
 * 2: Action id <NUMBER>
 * 3: Action parameters <ARRAY>
 *        0: Action type <NUMBER>
 *        1: (optional) Action ids <ARRAY>
 * 
 *
 * Return Value:
 * -
 *
 * Example:
 * [unit,0,0,[0,[1,2,3]]] call FUNC(instructor)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_vehicle", "_action", "_actionID", "_trainingIDs", "_ids"];
_vehicle = _this select 0;
_actionID = _this select 2;
_action = (_this select 3) select 0;

switch (_action) do {
    //Open instructor menu
    case 0: {
        _vehicle removeAction _actionID;
        _ids = [];

        _ids pushBack (_vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_HitVRotorLow"), 
        {        
            [_this, QFUNC(instructor), (_this select 0)] call ACEFUNC(common,execRemoteFnc);
        }, [2], 3, false, true, "", "(player in _target)"]);
        
        _ids pushBack (_vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_HitVRotor"), 
        {
            [_this, QFUNC(instructor), (_this select 0)] call ACEFUNC(common,execRemoteFnc);
        }, [3], 3, false, true, "", "(player in _target)"]);
        
        _ids pushBack (_vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_HitHRotor"), 
        {
            [_this, QFUNC(instructor), (_this select 0)] call ACEFUNC(common,execRemoteFnc);
        }, [4], 3, false, true, "", "(player in _target)"]);
        
        _ids pushBack (_vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_DisableDamage"), 
        {
            [_this, QFUNC(instructor), (_this select 0)] call ACEFUNC(common,execRemoteFnc);
        }, [5], 3, false, true, "", "(player in _target)"]);
        
        _ids pushBack (_vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_EnableDamage"), 
        {
            [_this, QFUNC(instructor), (_this select 0)] call ACEFUNC(common,execRemoteFnc);
        }, [6], 3, false, true, "", "(player in _target)"]);
        
        _ids pushBack (_vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_Repair"), 
        {
            [_this, QFUNC(instructor), (_this select 0)] call ACEFUNC(common,execRemoteFnc);
        }, [7], 3, false, true, "", "(player in _target)"]);
        
        _vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_DisableInstructor"), 
        {
            _this call FUNC(instructor);
        }, [1, _ids], 3, false, true, "", "(player in _target)"];
    };

    //Close instructor menu
    case 1: {
        _trainingIDs = (_this select 3) select 1;
        { _vehicle removeAction _x; } forEach _trainingIDs;
        
        _vehicle removeAction _actionID;
        _vehicle addAction [MEU_TEXT_ORANGE(localize "STR_MEU_Spawner_EnableInstructor"), 
                           {_this call FUNC(instructor);}, [0], 3, false, true, "", "((player in _target) && ((driver _target) != player))"];
    };

    //Minor tail rotor failure
    case 2: { _vehicle setHitPointDamage ["HitVRotor", 0.5]; };

    //Total tail rotor failure
    case 3: { _vehicle setHitPointDamage ["HitVRotor", 1]; };

    //Main rotor failure
    case 4: { _vehicle setHitPointDamage ["HitHRotor", 1]; };

    //Disable damage
    case 5: { _vehicle allowDamage false; };

    //Enable damage
    case 6: { _vehicle allowDamage true; };

    //Repair
    case 7: {
        if ((damage _vehicle) != 1) then {
            _vehicle setDamage 0;
        };
    };

    //Delete vehicle
    case 8: { deleteVehicle _vehicle; };
    
    //Repair/Reammo/Refuel
    case 9: {
        _vehicle setVehicleAmmo 1;
        _vehicle setFuel 1;
        if ((damage _vehicle) != 1) then {
            _vehicle setDamage 0;
        };
    };

    default {
        ERROR("Error in spawner module, undefined instructor action");
    };
};