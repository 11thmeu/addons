#include "script_component.hpp"

#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\ui_f\hpp\defineResincl.inc"
#include "\A3\ui_f\hpp\defineResinclDesign.inc"

_fnc_units = {
    private ["_groups", "_allunits", "_units"];
    _groups = GETMVAR(RscSpectator_allowedGroups,allgroups);
    _allunits = playableunits + switchableunits;
    _units = [];
    {
        if (group _x in _groups) then { 
            if (!GETVAR(_x,GVAR(Dead),false)) then { 
                _units set [count _units, _x]; 
            }; 
        };
    } foreach _allunits;

    _units
};

disableSerialization;
_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case "onLoad": {
        _display = if (isNil {GVAR(SpectatorDisplay)}) then {displayNull} else {GVAR(SpectatorDisplay)};
        if (isNull _display) then {
            ["init", _params, _class] spawn RscMEU_Spectator_script;
        };
    };

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case "init": {
        _display = _params select 0;
        _ctrlMap = _display displayCtrl IDC_MAP;
        _ctrlMainMap = (findDisplay IDD_MAIN_MAP) displayCtrl IDC_MAP;

        GVAR(SpectatorDisplay) = _display;
        GVAR(SpectatorVision) = 0;
        GVAR(SpectatorInterface) = true;
        GVAR(SpectatorView) = true;
        GVAR(SpectatorMap) = false;
        GVAR(SpectatorKeys) = [];
        if (isNil {GVAR(SpectatorHints)}) then {GVAR(SpectatorHints) = [false, false, false];};
        GVAR(SpectatorPlayerIcon) = getText (configFile >> "CfgInGameUI" >> "cursor" >> "select");
        
        //Spectator help
        (QGVAR(SpectatorHelp) call BIS_fnc_rscLayer) cutRsc ["RscMEU_SpectatorHelp", "PLAIN"];
        GVAR(SpectatorHelp) = true;

        _displayMission = [] call BIS_fnc_displayMission;
        _ctrlMap ctrlAddEventHandler ["draw", "with uiNamespace do {['draw',_this,''] call RscMEU_Spectator_script};"];
        _ehDown = _displayMission displayAddEventHandler ["keydown", "with uiNamespace do {['keyDown',_this,''] call RscMEU_Spectator_script};"];
        _ehUp = _displayMission displayAddEventHandler ["keyup", "with uiNamespace do {['keyUp',_this,''] call RscMEU_Spectator_script};"];
        _ehClick = _ctrlMainMap ctrlAddEventHandler ["mousebuttonclick", "with uiNamespace do {['click',_this,''] call RscMEU_Spectator_script};"];
        _ehDrawMap = _ctrlMainMap ctrlAddEventHandler ["draw", "with uiNamespace do {['drawMap',_this,''] call RscMEU_Spectator_script};"];

        //--- Create camera
		_pos = missionNamespace getVariable [GVAR(DeathPos), [0,0,0]];
        _pos set [2, (_pos select 2) + 2];
        _camera = "camera" camCreate _pos;
        _camera setDir direction cameraOn;

        _units = [] call _fnc_units;
        if (count _units == 0) then {
            _camera cameraEffect ["internal", "back"];
            _camera setPos (missionNamespace getVariable [GVAR(DeathPos), [0,0,0]]);
            _camera setVelocity [0, 0, 0];
            _camera camCommand "manual on";
            _camera camCommand "inertia on";
            cameraEffectEnableHUD true;
            _camera camCommitPrepared 0;
        } else {
            _camera cameraEffect ["terminate", "back"];
            _camera camCommand "manual off";
            _camera camCommand "inertia on";
        };
        
        showCinemaBorder false;
        showHUD false;

		missionNamespace setVariable [GVAR(SpectatorCameras), [[],[],[],[],[],[],[],[],[],[]]];
		missionNamespace setVariable [GVAR(SpectatorPlayers), ["","","","","","","","","",""]];
        with missionNamespace do {
            _units = [] call _fnc_units;
            GVAR(SpectatorCamera) = _camera;
            GVAR(SpectatorPlayer) = if (count _units > 0) then {_units select 0} else {objNull};
            [] spawn {
                with uinamespace do {
                    ["keyDown", [displayNull, DIK_RIGHT, false, false, false], ""] call RscMEU_Spectator_script;
                    ["keyUp", [displayNull, DIK_RIGHT, false, false, false], ""] call RscMEU_Spectator_script;
                };
            };
        };

        SETMVAR(RscStatic_mode,0);
        (QGVAR(SpectatorFade) call BIS_fnc_rscLayer) cutRsc ["rscstatic", "plain"];

        if !(GVAR(SpectatorHints) select 0) then {
            GVAR(SpectatorHints) set [0, true];
            with missionNamespace do {
                [["spectating", "spectatorinfo"]] spawn BIS_fnc_advHint;
                [["spectating", "spectatorcamera"]] spawn BIS_fnc_advHint;
            };
        };

        _camParams = [position _camera, vectorUp _camera, vectorDir _camera, velocity _camera];

        //--- Loop
        waitUntil {
            //--- Disable free cam
            _allowFreeCam = GETMVAR(RscMEU_Spectator_AllowFreeCam,true);
            if (!GVAR(SpectatorView) && !_allowFreeCam) then {["switchView", [false, true], ""] call RscMEU_Spectator_script;};

            _time = time + 0.1;
            waitUntil {isNull _camera || time > _time};

            //--- Restore the camera after RMB was pressed
            if (isNull _camera) then {
                _camera = "camera" camCreate getPosATL cameraOn;
                _camera cameraEffect ["internal", "back"];
                _camera setPos (_camParams select 0);
                _camera setVectorDir (_camParams select 1);
                _camera setVectorUp (_camParams select 2);
                _camera setVelocity (_camParams select 3);
                _camera camCommand "inertia on";
                _camera camCommand "manual on";
                with missionNamespace do {
                    GVAR(SpectatorCamera) = _camera;
                };
            };
            _camParams = [position _camera, vectorDir _camera, vectorUp _camera, velocity _camera];
            isNull _display
        };
        //////////////////////////////////////////////////////////////////////////////////////////////////////////

        //--- Display closed
        (QGVAR(SpectatorFade) call BIS_fnc_rscLayer) cutText ["", "black in"];
        showHUD true;

        _display closeDisplay 2;
        _displayMission displayRemoveEventHandler ["keydown", _ehDown];
        _displayMission displayRemoveEventHandler ["keyup", _ehUp];
        _ctrlMainMap ctrlRemoveEventHandler ["mousebuttonclick", _ehClick];
        _ctrlMainMap ctrlRemoveEventHandler ["draw", _ehDrawMap];

        GVAR(SpectatorDisplay) = nil;
        GVAR(SpectatorMap) = nil;
        GVAR(SpectatorKeys) = nil;

        _camera cameraEffect ["terminate", "back"];
        camDestroy _camera;

        with missionNamespace do {
            GVAR(SpectatorPlayer) = nil;
            GVAR(SpectatorCamera) = nil;
        };

        ACE_Player switchCamera "internal";
    };
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case "keyDown": {
        _key = _params select 1;
        if !(_key in GVAR(SpectatorKeys)) then {GVAR(SpectatorKeys) set [count GVAR(SpectatorKeys), _key];};
        _ctrl = (DIK_LCONTROL) in GVAR(SpectatorKeys);

        _switchPlayer = false;
        _deltaPlayerID = 0;
        _result = false;
        _camera = GETMVAR(GVAR(SpectatorCamera),objNull);
        _view = GVAR(SpectatorView);

        //--- Store players
        _setPlayer = {
            with missionNamespace do {
                GVAR(SpectatorPlayers) set [_this, name GVAR(SpectatorPlayer)];
            };
        };
        _getPlayer = {
            with missionNamespace do {
                _playerName = GVAR(SpectatorPlayers) select _this;
                _currentPlayerName = name GVAR(SpectatorPlayer);
                _units = [] call _fnc_units;
                {
                    if (name _x == _playerName && _playerName != _currentPlayerName) exitWith {
                        _switchPlayer = true;
                        GVAR(SpectatorPlayer) = _x;
                    };
                } foreach _units;
            };
        };

        //--- Store camera settings
        _setCamera = {
            with missionNamespace do {
                _cameraParams = if (_view) then {
                    [_view,name GVAR(SpectatorPlayer), cameraview]
                } else {
                    [_view, position GVAR(SpectatorCamera), vectorDir GVAR(SpectatorCamera), vectorUp GVAR(SpectatorCamera), velocity _camera]
                };
                GVAR(SpectatorCameras) set [_this, _cameraParams];
            };
        };
        _getCamera = {
            _cameraParams = (missionNamespace getVariable [GVAR(SpectatorCameras), [[],[],[],[],[],[],[],[],[],[]]]) select _this;

            _view = _cameraParams select 0;
            _currentView = GVAR(SpectatorView);
            _switchView = str _view != str _currentView;
            if (!isNil _view) then {
                GVAR(SpectatorView) = _view;
            };
            if (_switchView) then {GVAR(SpectatorView) = !GVAR(SpectatorView)};
            if (_view) then {
                _playerName = _cameraParams select 1;
                _cameraView = _cameraParams select 2;
                _units = [] call _fnc_units;
                {
                    if (name _x == _playerName) exitWith {
                        _switchPlayer = true;
                        SETMVAR(GVAR(SpectatorPlayer),_x);
                    };
                } foreach _units;

                ["switchView", [false, _switchView], ""] call RscMEU_Spectator_script;
                cameraOn switchCamera _cameraView;
            } else {
                ["switchView", [false, _switchView], ""] call RscMEU_Spectator_script;

                _position = _cameraParams select 1;
                _vectordir = _cameraParams select 2;
                _vectorup = _cameraParams select 3;
                _velocity = _cameraParams select 4;

                _camera camCommand "manual off";
                _camera camPrepareTarget objNull;
                _camera camCommitPrepared 0;
                _camera setPos _position;
                _camera setVectorDir _vectordir;
                _camera setVectorUp _vectorup;
                _camera setVelocity _velocity;
                _camera camCommand "manual on";
            };
        };
        switch _key do {
            case (DIK_ESCAPE): {
                if (GVAR(SpectatorMap)) then {
                    openMap [false, false];
                    GVAR(SpectatorMap) = false;
                };
            };
            case (DIK_SPACE): {
                _aliveUnits = [] call _fnc_units;
                if ((!GVAR(SpectatorMap)) && ((count _aliveUnits) != 0)) then {
                    ["switchView", [_ctrl, true], ""] call RscMEU_Spectator_script;
                    _result = true;
                };
            };
            case (DIK_LMENU): {
                if !(GVAR(SpectatorMap)) then {
                    ["switchView", [_ctrl, false], ""] call RscMEU_Spectator_script;
                    _result = true;
                };
            };
            case (DIK_NUMPAD0): {
                _result = !_view; //--- Disable escaping camera by Numpad 0
            };

            case (DIK_N): {
                GVAR(SpectatorVision) = GVAR(SpectatorVision) + 1;
                _vision = GVAR(SpectatorVision) % 3;
                switch (_vision) do {
                    case 0: {
                        camUseNVG false;
                        false setCamUseTi 0;
                    };
                    case 1: {
                        camUseNVG true;
                        false SetCamUseTi 0;
                    };
                    case 2: {
                        camUseNVG false;
                        true SetCamUseTi 0;
                    };
                    case 3: {
                        camUseNVG false;
                        true SetCamUseTi 1;
                    };
                };
                _result = true;
            };
            case (DIK_M): {
                if (GVAR(SpectatorMap)) then {
                    openMap [false, false];
                    GVAR(SpectatorMap) = false;
                } else {
                    openMap [true, true];
                    GVAR(SpectatorMap) = true;
                    mapAnimAdd [0, 0.1, position _camera];
                    mapAnimCommit;
                };
            };

            case (DIK_J): {
                _display = GVAR(SpectatorDisplay);
                _fade = [0,1] select GVAR(SpectatorInterface);
                {
                    _control = _display displayctrl _x;
                    _control ctrlsetfade _fade;
                    _control ctrlcommit 0.2;
                } foreach [
                    IDC_RSCSPECTATOR_PLAYER,
                    IDC_RSCSPECTATOR_PLAYERICON
                ];
                GVAR(SpectatorInterface) = !GVAR(SpectatorInterface);
                _result = true;            
            };

            case (DIK_LEFT): {_deltaPlayerID = -1; _switchPlayer = true; _result = true;};
            case (DIK_RIGHT): {_deltaPlayerID = +1; _switchPlayer = true; _result = true;};
            case (DIK_DOWN): {_deltaPlayerID = -10; _switchPlayer = true; _result = true;};
            case (DIK_UP): {_deltaPlayerID = +10; _switchPlayer = true; _result = true;};

            case (DIK_F1): {if (_ctrl) then {0 call _setPlayer} else {0 call _getPlayer}; _result = true;};
            case (DIK_F2): {if (_ctrl) then {1 call _setPlayer} else {1 call _getPlayer}; _result = true;};
            case (DIK_F3): {if (_ctrl) then {2 call _setPlayer} else {2 call _getPlayer}; _result = true;};
            case (DIK_F4): {if (_ctrl) then {3 call _setPlayer} else {3 call _getPlayer}; _result = true;};
            case (DIK_F5): {if (_ctrl) then {4 call _setPlayer} else {4 call _getPlayer}; _result = true;};
            case (DIK_F6): {if (_ctrl) then {5 call _setPlayer} else {5 call _getPlayer}; _result = true;};
            case (DIK_F7): {if (_ctrl) then {6 call _setPlayer} else {6 call _getPlayer}; _result = true;};
            case (DIK_F8): {if (_ctrl) then {7 call _setPlayer} else {7 call _getPlayer}; _result = true;};
            case (DIK_F9): {if (_ctrl) then {8 call _setPlayer} else {8 call _getPlayer}; _result = true;};
            case (DIK_F10): {if (_ctrl) then {9 call _setPlayer} else {9 call _getPlayer}; _result = true;};

            case (DIK_1): {if (_ctrl) then {0 call _setCamera} else {0 call _getCamera}; _result = true;};
            case (DIK_2): {if (_ctrl) then {1 call _setCamera} else {1 call _getCamera}; _result = true;};
            case (DIK_3): {if (_ctrl) then {2 call _setCamera} else {2 call _getCamera}; _result = true;};
            case (DIK_4): {if (_ctrl) then {3 call _setCamera} else {3 call _getCamera}; _result = true;};
            case (DIK_5): {if (_ctrl) then {4 call _setCamera} else {4 call _getCamera}; _result = true;};
            case (DIK_6): {if (_ctrl) then {5 call _setCamera} else {5 call _getCamera}; _result = true;};
            case (DIK_7): {if (_ctrl) then {6 call _setCamera} else {6 call _getCamera}; _result = true;};
            case (DIK_8): {if (_ctrl) then {7 call _setCamera} else {7 call _getCamera}; _result = true;};
            case (DIK_9): {if (_ctrl) then {8 call _setCamera} else {8 call _getCamera}; _result = true;};
            case (DIK_0): {if (_ctrl) then {9 call _setCamera} else {9 call _getCamera}; _result = true;};
            
            case (DIK_H): {
                if (GVAR(SpectatorHelp)) then {
                    GVAR(SpectatorHelp) = false;
                    (QGVAR(SpectatorHelp) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
                } else {
                    GVAR(SpectatorHelp) = true;
                    (QGVAR(SpectatorHelp) call BIS_fnc_rscLayer) cutRsc ["RscMEU_SpectatorHelp", "PLAIN"];
                };
            };
        };

        with missionNamespace do {
            _units = [] call _fnc_units;
            if (_switchPlayer && count _units > 0) then {
                _playerID = _units find GVAR(SpectatorPlayer);
                _playerID = _playerID + _deltaPlayerID;
                _playerID = ((count _units) + _playerID) % (count _units);
                GVAR(SpectatorPlayer) = _units select _playerID;
                if (_view) then {
                    vehicle GVAR(SpectatorPlayer) switchCamera cameraView;
                    (QGVAR(SpectatorFade) call BIS_fnc_rscLayer) cutText ["", "black in"];
                };
            };
        };

        _result
    };

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case "keyUp": {
        _key = _params select 1;
        GVAR(SpectatorKeys) = GVAR(SpectatorKeys) - [_key];
    };

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case "switchView": {
        _ctrl = _params select 0;
        _static = _params select 1;

        _allowFreeCam = GETMVAR(RscMEU_Spectator_AllowFreeCam,true);
        _player = GETMVAR(GVAR(SpectatorPlayer),ACE_Player);

        if (!_allowFreeCam && isNull _player) then {
            _camera camCommand "manual off";
            _camera cameraEffect ["terminate", "back"];
            ACE_Player switchCamera "internal";
        } else {
            if !(_static) then {GVAR(SpectatorView) = !GVAR(SpectatorView);};

            if (GVAR(SpectatorView)) then {

                //--- FreeCam
                if (_allowFreeCam) then {

                    if (!_ctrl) then {
                        _intCameraPosition = _player selectionPosition "pilot";
                        _extCameraPosition = getArray (configFile >> "CfgVehicles" >> typeOf vehicle _player >> "extCameraPosition");
                        if (count _extCameraPosition != 3) then {_extCameraPosition = [0, 0, 0]};
                        _cameraPosition = [0, 0, 0];
                        _cameraPosition set [0, (_intCameraPosition select 0) + (_extCameraPosition select 0)];
                        _cameraPosition set [1, (_intCameraPosition select 1) + (_extCameraPosition select 2)];
                        _cameraPosition set [2, (_intCameraPosition select 2) + (_extCameraPosition select 1)];
                        _camera setPos (_player modelToWorld _cameraPosition);
                        _camera camPrepareTarget vehicle _player;
                        _camera camCommitPrepared 0;
                    };

                    _camera setVelocity [0, 0, 0];
                    _camera camCommand "manual on";
                    _camera cameraEffect ["internal", "back"];
                    cameraEffectEnableHUD true;

                    if (_static) then {
                        SETMVAR(RscStatic_mode,0);
                        (QGVAR(SpectatorFade) call BIS_fnc_rscLayer) cutRsc ["rscstatic", "plain"];
                    } else {
                        (QGVAR(SpectatorFade) call BIS_fnc_rscLayer) cutText ["", "black in"];
                    };

                    if !(GVAR(SpectatorHints) select 1) then {
                        GVAR(SpectatorHints) set [1, true];
                        with missionNamespace do {
                            [["spectating", "spectatorfreeview"]] spawn BIS_fnc_advHint;
                        };
                    };
                };
                GVAR(SpectatorView) = !GVAR(SpectatorView);
            } else {
                if (_static) then {
                    //--- Player view
                    _camera camCommand "manual off";
                    _camera cameraEffect ["terminate", "back"];
                    _camera setVelocity [0, 0, 0];
                    vehicle _player switchCamera cameraView;

                    if (_allowFreeCam) then {
                        if (_static) then {
                            SETMVAR(RscStatic_mode,0);
                            (QGVAR(SpectatorFade) call BIS_fnc_rscLayer) cutRsc ["rscstatic", "plain"];
                        } else {
                            (QGVAR(SpectatorFade) call BIS_fnc_rscLayer) cutText ["", "black in"];
                        };
                    };

                    if !(GVAR(SpectatorHints) select 2) then {
                        GVAR(SpectatorHints) set [2, true];
                        with missionNamespace do {
                            [["spectating", "spectatorunitview"]] spawn BIS_fnc_advHint;
                        };
                    };
                };
                GVAR(SpectatorView) = !GVAR(SpectatorView);
            };
        };
    };

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case "click": {
        _button = _params select 1;
        if (_button == 0) then {
            _x = _params select 2;
            _y = _params select 3;
            _worldpos = (_params select 0) posScreenToWorld [_x, _y];
            _camera = GETMVAR(GVAR(SpectatorCamera),objNull);
            _camera setPos [_worldpos select 0, _worldpos select 1, getPosATL _camera select 2];
        };
    };

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case "draw": {
        _display = ctrlParent (_params select 0);
        _ctrlPlayer = _display displayCtrl IDC_RSCSPECTATOR_PLAYER;
        _ctrlPlayerNameBackground = _display displayCtrl IDC_RSCSPECTATOR_PLAYERNAMEBACKGROUND;
        _ctrlPlayerName = _display displayCtrl IDC_RSCSPECTATOR_PLAYERNAME;
        _ctrlPlayerGroup = _display displayCtrl IDC_RSCSPECTATOR_PLAYERGROUP;
        _ctrlPlayerIcon = _display displayCtrl IDC_RSCSPECTATOR_PLAYERICON;
        _ctrlPlayerIconPos = ctrlPosition _ctrlPlayerIcon;
        _ctrlPlayerIconPos set [0, -1];
        _ctrlPlayerIconPos set [1, -1];

        _player = GETMVAR(GVAR(SpectatorPlayer),ACE_Player);
        if (isNull _player) then {
            _ctrlPlayer ctrlShow false;
            _ctrlPlayerIconPos set [0, -1];
            _ctrlPlayerIconPos set [1, -1];
            _ctrlPlayerIcon ctrlSetPosition _ctrlPlayerIconPos;
            _ctrlPlayerIcon ctrlCommit 0;
        } else {
            _playerName = "";
            _playerColor = [0, 0, 0, 1];
            if (alive _player) then {
                _playerName = name _player;
                _playerColor = side _player call BIS_fnc_sideColor;
            };

            _ctrlPlayer ctrlShow true;
            _ctrlPlayerName ctrlSetText _playerName;
            _ctrlPlayerNameBackground ctrlSetBackgroundColor _playerColor;
            _ctrlPlayerGroup ctrlSetText getText (configFile >> "CfgVehicles" >> typeOf vehicle _player >> "displayName");

            if !(GVAR(SpectatorView) || GVAR(SpectatorMap)) then {
                _playerPos = getPosATL _player;
                if ((getTerrainHeightASL _playerPos) < 0) then {_playerPos = getPosASL _player;};
                _playerScreenPos = worldToScreen _playerPos;
                if (count _playerScreenPos > 0) then {
                    _ctrlPlayerIconPos set [0, (_playerScreenPos select 0) - (_ctrlPlayerIconPos select 2) / 2];
                    _ctrlPlayerIconPos set [1, (_playerScreenPos select 1) - (_ctrlPlayerIconPos select 3) / 2];
                    _ctrlPlayerIcon ctrlSetTextColor _playerColor;
                };
            };
        };
        _ctrlPlayerIcon ctrlSetPosition _ctrlPlayerIconPos;
        _ctrlPlayerIcon ctrlCommit 0;
    };

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case "drawMap": {
        _ctrlMap = _params select 0;
        _camera = GETMVAR(GVAR(SpectatorCamera),objNull);

        _ctrlMap drawIcon [
            "\a3\Ui_f\data\GUI\Rsc\RscDisplayMissionEditor\iconCamera_ca.paa",
            [0, 0, 0, 1],
            position _camera,
            32,
            32,
            direction _camera
        ];
    };
};