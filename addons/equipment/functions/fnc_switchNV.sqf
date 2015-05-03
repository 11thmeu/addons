/*
 * Author: Thrax
 * Enable or disable the camera night vision
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * FUNC(switchNV)
 *
 * Public: [No]
 */
#include "script_component.hpp"

if (GVAR(EnableCamera)) then {
    if (GVAR(NV)) then {
        camUseNVG false;
        GVAR(NV) = false;
    } else {
        camUseNVG true;
        GVAR(NV) = true;
    };
};