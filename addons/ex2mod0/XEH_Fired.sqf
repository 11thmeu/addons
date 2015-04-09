#include "script_component.hpp"

/*
 * Author: Kavinsky
 *
 * FiredNear event handler
 *
 * Arguments:
 *
 *
 * Return Value:
 * (Nothing)
 */

private ["_weapon", "_projectile", "_magazine"];

if (ACE_Player != (_this select 0)) exitWith {};

_weapon = _this select 1;
_projectile = _this select 5;
_magazine = _this select 6;


if (_weapon != "Throw") exitWith {};

if ((_magazine == "MEU_EX2MOD0_Red") or (_magazine == "MEU_EX2MOD0_Green") or (_magazine == "MEU_EX2MOD0_Yellow")) then {
	nul = _this spawn {
		_projectile = _this select 5;
		_magazine = _this select 6;

		sleep 3.7;

		[[_projectile, _magazine], QUOTE(FUNC(TIARA5Effect)), nil, false] call BIS_fnc_MP;
	};
};
