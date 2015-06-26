/*
	File: fn_tawvdInit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master init for TAW View Distance (Addon version).
	If the script verson is present it will exit.
*/
tawvd_foot = viewDistance;
tawvd_car = viewDistance;
tawvd_air = viewDistance;
tawvd_syncObject = true; //Enable the automatic syncing of Object View rendering with the current view distance.
tawvd_object = tawvd_foot;

tawvd_addon_disable = true;
//The hacky method... Apparently if you stall (sleep or waitUntil) with CfgFunctions you stall the mission initialization process... Good job BIS, why wouldn't you spawn it via preInit or postInit?
["playerChanged", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;
["PlayerJIP", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;
["cameraViewChanged", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;
["playerVehicleChanged", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;
["zeusDisplayChanged", {[] call TAWVD_fnc_updateViewDistance;}] call ace_common_fnc_addEventHandler;