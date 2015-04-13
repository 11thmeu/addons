#include "script_component.hpp"

_pos = _this select 0;

_grid = [_pos] call MEU_fnc_posToGridPrecision;
format ["%1E %2N", _grid select 0, _grid select 1]