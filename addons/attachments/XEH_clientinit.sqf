#include "script_component.hpp"
if (!hasInterface) exitWith {};

// Add keybinds
[CBA_KEYBIDING_CATEGORY, QGVAR(switchPointer), localize "STR_MEU_Attachments_SwitchPointer",
{
    call FUNC(switchPointer);
    true
},
{false},
[38, [false, true, false]], false] call cba_fnc_addKeybind; //Key CTRL+L

[CBA_KEYBIDING_CATEGORY, QGVAR(switchOptics), localize "STR_MEU_Attachments_SwitchOptics",
{
    call FUNC(switchOptics);
    true
},
{false},
[181, [false, true, false]], false] call cba_fnc_addKeybind; //Key CTRL+/