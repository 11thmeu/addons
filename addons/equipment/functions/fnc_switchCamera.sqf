/*
 * Author: Thrax
 * Reset camera
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * FUNC(switchCamera)
 *
 * Public: [No]
 */
#include "script_component.hpp"

if(GVAR(EnableCamera)) then {
    GVAR(CamPos) = nil;
    ["Exit"] call FUNC(camera);
    ["Init"] call FUNC(camera);
} else {
    titleText[(localize "STR_MEU_Equipment_OptionDisabled"), "PLAIN DOWN"];
};