#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

GVAR(DisplayVisible) 	= false;
GVAR(InterfaceVisible) 	= false;

[
	CBA_KEYBIDING_CATEGORY,
	QGVAR(open_display),
	"GPS: Toggle Overlay", // @todo localize
	{
		_this call FUNC(toggleDisplay);
	},
	{}, // up action
	[DIK_M, false, true, false]
] call CBA_fnc_addKeybind;

[
	CBA_KEYBIDING_CATEGORY,
	QGVAR(open_display),
	"GPS: Toggle Interface", // @todo localize
	{
		_this call FUNC(toggleInterface);
	},
	{}, // up action
	[DIK_M, false, false, true]
] call CBA_fnc_addKeybind;


_gridOrigin = mapGridPosition [0,0];
_xOrigin = [_gridOrigin,0,2] call BIS_fnc_trimString;
_yOrigin = [_gridOrigin,3,5] call BIS_fnc_trimString;

//is Y inverted ?
_gridStepY = mapGridPosition [0,100];
_yStep = [_gridStepY,3,5] call BIS_fnc_trimString;
_yInverted = false;
if ((parseNumber _yOrigin) > (parseNumber _yStep)) then {
	_yInverted = true;
};

//find map origin (bottom left) coords
_i = 1; _j = 1;
while {mapGridPosition [0,-_i] == _gridOrigin} do { _i = _i + 1; };
if _yInverted then { _i = 0 - _i; };
_yOffset = (parseNumber _yOrigin) * 100 + _i;

while {mapGridPosition [-_j,0] == _gridOrigin} do { _j = _j + 1; };
_xOffset = (parseNumber _xOrigin) * 100 + _j; //Assume X is never inverted

missionNamespace setVariable [QGVAR(MapOriginX), _xOffset];
missionNamespace setVariable [QGVAR(MapOriginY), _yOffset];
missionNamespace setVariable [QGVAR(MapOriginYInverted), _yInverted];