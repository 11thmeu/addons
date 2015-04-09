#include "script_component.hpp"

//Init view distance system variables
// TODO: PORT THIS TO NEW ACE
ISNILS(MEU_VD_OnFoot, round(viewDistance));
ISNILS(MEU_VD_OnGround, round(viewDistance));
ISNILS(MEU_VD_OnAir, round(viewDistance));
ISNILS(MEU_VD_Dynamic, false);
ISNILS(MEU_VD_Maximum, 12000);
ISNILS(MEU_VD_ChangeTerrain, 2);

if (isDedicated) exitWith {};

GVAR(Tablet_Showing) = false;

//CSE BlueForceTracker add custom options
// DEPRECATED
/*[] spawn {
	waitUntil {sleep 0.1; !isNil "CSE_TOGGLE_CALLSIGNS_CC"};
	{
		if ((_x select 0) == "cc_app") then {
			(_x select 4) pushBack ["Toggle Leaders only", "button", "if (isnil 'CSE_TOGGLE_LEADERSONLY_CC') then { CSE_TOGGLE_LEADERSONLY_CC = true; } else { CSE_TOGGLE_LEADERSONLY_CC = !CSE_TOGGLE_LEADERSONLY_CC; };", 0];
			(_x select 4) pushBack ["Dynamic BG mode", "button", "MEU_Main_Tablet_Dynamic = true;
			if ([player,'cse_m_tablet'] call cse_fnc_hasItem_CC) then { [true] call MEU_fnc_BFTBG_openClose; };", 0];
			(_x select 4) pushBack ["Static BG mode", "button", "MEU_Main_Tablet_Dynamic = false;
			if ([player,'cse_m_tablet'] call cse_fnc_hasItem_CC) then { [true] call MEU_fnc_BFTBG_openClose; };", 0];
			(_x select 4) pushBack ["Mark lased target", "button", "call MEU_fnc_BFT_markLasedTarget;", 0];
		};
	} forEach CSE_REGISTERED_APPLICATIONS_CC;
};*/

// TODO: PORT THIS TO NEW ACE
//[] spawn MEU_fnc_frameworkInit;