#include "script_component.hpp"

private ["_display", "_pos"];

_display = uiNamespace getVariable "MEU_GPS_FORETREX401_Display";
_pos = getPosASL ACE_Player;

_posString = mapGridPosition ACE_player;
_eastingText = "";
_northingText = "";
if (count _posString > 0) then {
    _eastingText = (_posString select [0, ((count _posString)/2)]) + "e";
    _northingText = (_posString select [(count _posString)/2, (count _posString - 1)]) + "n";
};

(_display displayCtrl 102) ctrlSetText format ["%1m", [round (_pos select 2), 4] call CBA_fnc_formatNumber];
(_display displayCtrl 101) ctrlSetText (format ["%1 %2", _eastingText, _northingText]);
(_display displayCtrl 100) ctrlSetText ([] call EFUNC(main,formatTime12));