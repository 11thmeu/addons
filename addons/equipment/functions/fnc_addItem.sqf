/*
 * Author: Thrax
 * Adds the selected item to the player
 *
 * Arguments:
 * 0: Add the contents of the previous item <BOOL>
 *
 * Return Value:
 * -
 *
 * Example:
 * [false] call FUNC(addItem)
 *
 * Public: [No]
 */
#include "script_component.hpp"

private ["_replace", "_selected", "_type", "_items", "_container", "_data", "_insignia"];

_replace = _this select 0;
_selected = lbCurSel 7556;
_type = GVAR(Type);

if(_selected != -1) then {
    switch(_type) do {
        case 0: {
            _items = uniformItems ACE_Player;
            _insignia = [ACE_Player] call BIS_fnc_getUnitInsignia; 
            removeUniform ACE_Player;
            ACE_Player forceAddUniform (lbData [7556, _selected]);
            
            //Clear new container items
            _container = uniformContainer ACE_Player;
            clearWeaponCargo _container;
            clearMagazineCargo _container;
            clearItemCargo _container;
            
            if (_replace) then {
                { ACE_Player addItemToUniform ([_x] call EFUNC(main,processItem)); } forEach _items;
                if (_insignia != "") then { [ACE_Player, _insignia] call BIS_fnc_setUnitInsignia; };
            };
        };
        
        case 1: {
            _items = vestItems ACE_Player;
            removeVest ACE_Player;
            ACE_Player addVest (lbData [7556, _selected]);
            
            //Clear new container items
            _container = vestContainer ACE_Player;
            clearWeaponCargo _container;
            clearMagazineCargo _container;
            clearItemCargo _container;
            
            if (_replace) then {
                { ACE_Player addItemToVest ([_x] call EFUNC(main,processItem)); } forEach _items;
            };
        };
        
        case 2: {
            _items = backpackItems ACE_Player;
            removeBackpack ACE_Player;
            ACE_Player addBackpack (lbData [7556, _selected]);
            
            //Clear new container items
            _container = backpackContainer ACE_Player;
            clearWeaponCargo _container;
            clearMagazineCargo _container;
            clearItemCargo _container;
            
            if (_replace) then {
                { ACE_Player addItemToBackpack ([_x] call EFUNC(main,processItem)); } forEach _items;
            };
        };
        
        case 3: {
            removeHeadgear ACE_Player;
            ACE_Player addHeadgear (lbData [7556, _selected]);
        };
        
        case 4: {
            removeGoggles ACE_Player;
            ACE_Player addGoggles (lbData [7556, _selected]);
        };
        
        case 5: {
            [ACE_Player, lbData [7556, _selected]] call BIS_fnc_setUnitInsignia;
        };
        
        case 6: {
            removeUniform ACE_Player;
            removeVest ACE_Player;
            removeBackpack ACE_Player;
            removeHeadgear ACE_Player;
            removeGoggles ACE_Player;
            
            _data = call compile format["%1", lbData [7556, _selected]];
            
            ACE_Player forceAddUniform (_data select 1);
            _container = uniformContainer ACE_Player;
            clearWeaponCargo _container;
            clearMagazineCargo _container;
            clearItemCargo _container;
            
            ACE_Player addVest (_data select 2);
            _container = vestContainer ACE_Player;
            clearWeaponCargo _container;
            clearMagazineCargo _container;
            clearItemCargo _container;
            
            ACE_Player addBackpack (_data select 3);
            _container = backpackContainer ACE_Player;
            clearWeaponCargo _container;
            clearMagazineCargo _container;
            clearItemCargo _container;
            
            if ((_data select 4) != "") then {
                if ((_data select 2) == "V_RebreatherB") then {
                    ACE_Player addGoggles (_data select 4);
                } else {
                    ACE_Player addHeadgear (_data select 4);
                };
            };
        };
        
        default {
            ERROR("Error in equipment addItem function");
        };
    };
};