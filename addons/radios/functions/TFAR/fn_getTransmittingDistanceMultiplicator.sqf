/*
 	Name: TFAR_fnc_getTransmittingDistanceMultiplicator

 	Author(s):
		NKey

 	Description:
		Return multiplicator for sending distance of radio.

	Parameters:
		Nothing

 	Returns:
		Nothing

 	Example:
		call TFAR_fnc_getTransmittingDistanceMultiplicator;
*/
private ["_result"];
_result = currentUnit getVariable "tf_sendingDistanceMultiplicator";
if (isNil "_result") then {
	_result = 1.0;
};

// 11TH MEU
// WEATHER IMPLICATIONS
_rain = rain;
_overcast = overcast;

if(_overcast >= 0.6) then {
	_result = ((_result * 1) / _overcast) * 0.8;
};

if(_rain > 0.2) then {
	_result = _result - (_rain / 2);
};
// END 11TH MEU

_result;