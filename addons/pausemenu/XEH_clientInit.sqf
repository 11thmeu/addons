#include "script_component.hpp"

tawvd_foot = viewDistance;
tawvd_car = viewDistance;
tawvd_air = viewDistance;
tawvd_syncObject = true; //Enable the automatic syncing of Object View rendering with the current view distance.
tawvd_object = tawvd_foot;

tawvd_addon_disable = true;

["playerChanged", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;
["PlayerJIP", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;
["cameraViewChanged", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;
["playerVehicleChanged", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;
["zeusDisplayChanged", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;