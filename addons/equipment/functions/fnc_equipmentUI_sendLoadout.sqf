/*
 * Author: Thrax
 * Open the equipment send loadout dialog
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call FUNC(equipmentUI_sendLoadout)
 *
 * Public: [No]
 */
#include "script_component.hpp"

/*
//List near players
_players = [];
{
	if ((isPlayer _x) && ((ACE_Player distance _x) < 10)) {
		_players pushBack _x;
	};
} forEach playableUnits;

//Populate listbox
{
	_index = lbAdd [_ctrl, name _x];
	lbSetData [_ctrl, str(_x)]; //TODO: can get object back from call compile?

} forEach _players;
*/