/*
 * Author: Spooner (CBA)
 * Replaces substrings within a string. Case-dependent.
 *
 * Arguments:
 * 0: String to make replacement in <STRING>
 * 1: Substring to replace <STRING>
 * 2: String to replace the pattern with <STRING>
 *
 * Return Value:
 * String with replacements made <STRING>
 *
 * Example:
 * ["string", "match", "replacement"] call EFUNC(main,replace)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

PARAMS_3(_string,_pattern,_replacement);

[[_string, _pattern] call CBA_fnc_split, _replacement] call CBA_fnc_join