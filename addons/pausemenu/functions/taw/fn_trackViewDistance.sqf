/*
	File: fn_trackViewDistance.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Constantly monitors the players state.

	i.e Player gets in landvehicle then adjust viewDistance.
*/
private["_old","_recorded"];
while {true} do
{
	_recorded = vehicle player;

	[] call TAWVD_fnc_updateViewDistance;
	waitUntil {_recorded != vehicle player || !alive player};
};