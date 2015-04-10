#include "script_component.hpp"

_btnId = _this select 0;
_menu = _this select 1;

uiNamespace getVariable [(format ["MEU_PRC153_MenuAct_%1", _btnId]), _menu];