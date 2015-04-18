/*
 * Author: Thrax
 * Teleports the player to his group/team
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(teleportJip)
 *
 * Public: [No]
 */
#include "script_component.hpp"

ISNILS(ACE_medical,false);

private ["_player", "_leader", "_target", "_squad", "_pos", "_posX", "_posY", "_posZ", "_altPos"];

//ACE medical mode
if (ACE_medical) then {
    _player = ACE_Player;
    if (!alive _player) exitWith {};

    if (GETVAR(_player,ACE_isUnconscious,false)) exitWith {};

    _leader = leader _player;
    _target = objNull;

    if ((_leader == _player) || (GETVAR(_leader,ACE_isUnconscious,false))) then {
        _squad = units (group _player);
        {
            if ((alive _x) && (_x != _player)) then {
                if (!(GETVAR(_x,ACE_isUnconscious,false))) exitWith { _target = _x; };
            };
        } forEach _squad;
        
        if (isNull _target) then {
            _squad = allUnits;
            {
                if ((alive _x) && (isPlayer _x) && (_x != _player)) then {
                    if ((side _x) == (side _player)) then {
                        if (!(GETVAR(_x,ACE_isUnconscious,false))) exitWith { _target = _x; };
                    };
                };
            } forEach _squad;
        };
    } else {
        _target = _leader;
    };

//Vanilla ARMA 3 mode
} else {
    _player = player;
    if (!alive _player) exitWith {};

    _leader = leader player;
    _target = objNull;

    if (_leader == player) then {
        _squad = units (group player);
        {
            if ((alive _x) && (_x != player)) exitWith { _target = _x; };
        } forEach _squad;

        if (isNull _target) then {
            _squad = allunits;
            {
                if ((alive _x) && (isPlayer _x) && (_x != player)) then {
                    if ((side _x) == (side player)) exitWith { _target = _x; };
                };
            } forEach _squad;
        };
    } else {
        _target = _leader;
    };
};

if (!isNull _target) then {
    _pos = getPosATL _target;
    _posX = _pos select 0;
    _posY = _pos select 1;
    _posZ = _pos select 2;
    _pos set[0, (_posX + (random 2) - 1)];
    _pos set[1, (_posY + (random 2) - 1)];
    
    if (_posZ > 1) then {
        _altPos = _pos findEmptyPosition [1, 30, typeOf _player];
        if ((count _altPos) > 1) then {
            _pos = _altPos;
        };
    };

    _player setPosATL _pos;
    GVAR(JIPTeleport) = false;
    [QGVAR(JIPTeleport), "keydown"] call CBA_fnc_removeKeyHandler;
};