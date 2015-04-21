/*
 * Author: Thrax
 * Open or close an IFAK
 *
 * Arguments:
 * 0: Open or close <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * [true] call FUNC(ifak)
 *
 * Public: [No]
 */
#include "script_component.hpp"

#define IFAKContents [ \
"ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", \
"ACE_elasticBandage", "ACE_elasticBandage", \
"ACE_packingBandage", \
"ACE_quikclot", "ACE_quikclot", \
"ACE_tourniquet", \
"ACE_morphine", "ACE_morphine", \
"ACE_epinephrine", "ACE_epinephrine"]

/*
  IFAK Mass:
  - 3x field dressing (1) = 3
  - 2x bandage elastic (1) = 2
  - 1x packing bandage (1) = 1
  - 2x quikclot (1) = 2
  - 1x tourniquet (1) = 1
  - 2x morphine (1) = 2
  - 2x epinephrine (1) = 2;
  Total: 13
*/

private "_action";
_action = _this select 0;

//Open
if (_action) then {
    private ["_uniform", "_vest", "_backpack"];

    if (!("MEU_IFAK" in (items ACE_Player))) exitWith {};

    _uniform = false;
    _vest = false;
    _backpack = false;

    if ("MEU_IFAK" in (uniformItems ACE_Player)) then { _uniform = true; };
    if ("MEU_IFAK" in (vestItems ACE_Player)) then { _vest = true; };
    if ("MEU_IFAK" in (backpackItems ACE_Player)) then { _backpack = true; };

    switch true do {
        case _uniform: {
            ACE_Player removeItemFromUniform "MEU_IFAK";
            ACE_Player addItemToUniform "MEU_IFAK_Empty";
            { ACE_Player addItemToUniform _x; } forEach IFAKContents;
        };

        case _vest: {
            ACE_Player removeItemFromVest "MEU_IFAK";
            ACE_Player addItemToVest "MEU_IFAK_Empty";
            { ACE_Player addItemToVest _x; } forEach IFAKContents;
        };

        case _backpack: {
            ACE_Player removeItemFromBackpack "MEU_IFAK";
            ACE_Player addItemToBackpack "MEU_IFAK_Empty";
            { ACE_Player addItemToBackpack _x; } forEach IFAKContents;
        };
    };
//Close
} else {
    private ["_playerItems", "_index", "_invalid", "_uniform", "_vest", "_backpack"];

    if (!("MEU_IFAK_Empty" in (items ACE_Player))) exitWith {};

    _playerItems = items ACE_Player;
    _invalid = false;

    {
        _index = _playerItems find _x;
        if (_index == -1) exitWith { _invalid = true; };
        _playerItems deleteAt _index;
    } forEach IFAKContents;

    if (!_invalid) then {
        //Player has items, remove them and add full IFAK
        { ACE_Player removeItem _x; } forEach IFAKContents;

        _uniform = false;
        _vest = false;
        _backpack = false;

        if ("MEU_IFAK_Empty" in (uniformItems ACE_Player)) then { _uniform = true; };
        if ("MEU_IFAK_Empty" in (vestItems ACE_Player)) then { _vest = true; };
        if ("MEU_IFAK_Empty" in (backpackItems ACE_Player)) then { _backpack = true; };
        
        switch true do {
            case _uniform: {
                ACE_Player removeItemFromUniform "MEU_IFAK_Empty";
                ACE_Player addItemToUniform "MEU_IFAK";
            };

            case _vest: {
                ACE_Player removeItemFromVest "MEU_IFAK_Empty";
                ACE_Player addItemToVest "MEU_IFAK";
            };

            case _backpack: {
                ACE_Player removeItemFromBackpack "MEU_IFAK_Empty";
                ACE_Player addItemToBackpack "MEU_IFAK";
            };
        };
    } else {
        //Player doesn't have all items, show message
        [localize "STR_MEU_Medical_IFAK_cantRepack", 2] call ACEFUNC(common,displayTextStructured);
    };
};