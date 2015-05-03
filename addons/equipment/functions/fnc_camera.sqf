/*
 * Author: Thrax
 * Open the equipment dialog with the configured parameters
 *
 * Arguments:
 * 0: Mode <STRING>
 * 1: Parameters <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * [0, []] call FUNC(camera)
 *
 * Public: [No]
 */
#include "script_component.hpp"

disableserialization;

#define IDC_MOUSEAREA 7650

_mode = [_this,0,"Open",[""]] call BIS_fnc_param;
_this = [_this,1,[]] call BIS_fnc_param;

switch _mode do {
    ///////////////////////////////////////////////////////////////////////////////////////////
    case "Init": {
        _display = GETUVAR(EquipmentDialog,displayNull);
        GVAR(Mouse) = [0,0];
        GVAR(Buttons) = [[],[]];
        _center = ACE_Player;
        cutText ["", "plain"];
        showCommandingMenu "";

        _display displayAddEventHandler ["mousebuttondown", { ['MouseButtonDown', _this] call FUNC(camera); }];
        _display displayAddEventHandler ["mousebuttonup", { ['MouseButtonUp', _this] call FUNC(camera); }];

        _ctrlMouseArea = _display displayCtrl IDC_MOUSEAREA;
        _ctrlMouseArea ctrlAddEventHandler ["mousemoving", { ['Mouse', _this] call FUNC(camera); }];
        _ctrlMouseArea ctrlAddEventHandler ["mouseholding", { ['Mouse', _this] call FUNC(camera); }];
        _ctrlMouseArea ctrlAddEventHandler ["mousezchanged", { ['MouseZChanged', _this] call FUNC(camera); }];
        ctrlSetFocus _ctrlMouseArea;

        if (isNil QGVAR(CamPos)) then {GVAR(CamPos) = [5,13,1.5, [-1.4,0.3,1]];};

        _target = createAgent ["Logic", position _center, [], 0, "none"];
        _target attachto [_center, GVAR(CamPos) select 3, ""];
        GVAR(Target) = _target;

        _cam = "camera" camCreate (position _center);
        _cam cameraEffect ["internal","back"];
        _cam camPrepareFocus [-1,-1];
        _cam camPrepareFov 0.35;
        _cam camCommitPrepared 0;
        cameraEffectEnableHUD true;
        showCinemaBorder false;
        camUseNVG false;
        GVAR(Camera) = _cam;

        ["Mouse", [controlNull,0,0]] call FUNC(camera);
        GVAR(Draw3D) = addMissionEventHandler ["draw3D", { ['draw3D', _this] call FUNC(camera); }];
        
        GVAR(CameraMarker) = "Sign_Arrow_F" createVehicleLocal (getPosATL ACE_Player);
        GVAR(CameraMarker) setPosATL [getPosATL ACE_Player select 0, getPosATL ACE_Player select 1, (getPosATL ACE_Player select 2) + 1.9];
    };

    ///////////////////////////////////////////////////////////////////////////////////////////
    case "Exit": {

        removeMissionEventHandler ["draw3D", GVAR(Draw3D)];

        deleteVehicle GVAR(Target);
        GVAR(Target) = nil;

        _cam = GVAR(Camera);
        _cam cameraEffect ["terminate", "back"];
        camDestroy _cam;

        GVAR(Camera) = nil;
        GVAR(Mouse) = nil;
        GVAR(Buttons) = nil;
        
        deleteVehicle GVAR(CameraMarker);
    };

    ///////////////////////////////////////////////////////////////////////////////////////////
    case "draw3D": {
        _cam = GVAR(Camera);
        _center = ACE_Player;
        _target = GVAR(Target);

        _dis = GVAR(CamPos) select 0;
        _dirH = GVAR(CamPos) select 1;
        _dirV = GVAR(CamPos) select 2;
        _x = cos _dirV * _dis;
        _z = sin _dirV * _dis;
        _campos = [[0,0,_z], _x, _dirH] call BIS_fnc_relPos;
        _cam attachTo [_target, _campos, ""];
        if ((getPosATL _cam select 2) < 0) then {
            _campos set [2, (_campos select 2) - (getPosATL _cam select 2)];
            _cam attachto [_target, _campos, ""];
        };
        _cam camPrepareTarget _target;
        _cam camCommitPrepared 0;
    };

    ///////////////////////////////////////////////////////////////////////////////////////////
    case "Mouse": {
        _mX = _this select 1;
        _mY = _this select 2;
        GVAR(Mouse) = [_mX, _mY];

        _cam = GVAR(Camera);
        _center = ACE_Player;
        _target = GVAR(Target);

        _dis = GVAR(CamPos) select 0;
        _dirH = GVAR(CamPos) select 1;
        _dirV = GVAR(CamPos) select 2;
        _targetPos = GVAR(CamPos) select 3;
        _disLocal = _dis;

        _LMB = GVAR(Buttons) select 0;
        _RMB = GVAR(Buttons) select 1;

        if (count _LMB > 0) then {
            _cX = _LMB select 0;
            _cY = _LMB select 1;
            _dX = (_cX - _mX);
            _dY = (_cY - _mY);
            GVAR(Buttons) set [0, [_mX, _mY]];

            _targetPos = [_targetPos, _dX, _dirH - 90] call BIS_fnc_relPos;
            _targetPos = [
                [0, 0, ((_targetPos select 2) - _dY) max 0 min 2],
                ([[0,0,0], _targetPos] call BIS_fnc_distance2D) min 1.5,
                [[0,0,0], _targetPos] call BIS_fnc_dirTo
            ] call BIS_fnc_relPos;

            _target attachto [_center,_targetPos,""];
            GVAR(CamPos) set [3,_targetPos];
        };

        if (count _RMB > 0) then {
            _cX = _RMB select 0;
            _cY = _RMB select 1;
            _dX = (_cX - _mX) * 0.75;
            _dY = (_cY - _mY) * 0.75;

            _dirH = (_dirH - _dX * 180) % 360;
            _dirV = (_dirV - _dY * 100) max -89 min 89;

            _targetPos = [
                [0,0, _targetPos select 2],
                [[0,0,0], _targetPos] call BIS_fnc_distance2D,
                ([[0,0,0], _targetPos] call BIS_fnc_dirTo) - _dX * 180
            ] call BIS_fnc_relPos;
            _target attachTo [_center, _targetPos, ""];

            GVAR(CamPos) set [1, _dirH];
            GVAR(CamPos) set [2, _dirV];
            GVAR(CamPos) set [3, _targetPos];
            GVAR(Buttons) set [1, [_mX, _mY]];
        };
    };

    ///////////////////////////////////////////////////////////////////////////////////////////
    case "MouseButtonDown": {
        GVAR(Buttons) set [_this select 1, [_this select 2, _this select 3]];
    };

    ///////////////////////////////////////////////////////////////////////////////////////////
    case "MouseButtonUp": {
        GVAR(Buttons) set [_this select 1, []];
    };

    ///////////////////////////////////////////////////////////////////////////////////////////
    case "MouseZChanged": {
        _z = _this select 1;
        _dis = GVAR(CamPos) select 0;
        _dis = _dis - (_z / 10);
        _dis = _dis max 0.75 min 5;
        GVAR(CamPos) set [0, _dis];
    };
};