/*
 * Author: Thrax
 * Use clipboard extension to copy text to clipboard
 *
 * Arguments:
 * 0: text to copy to clipboard <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["sometext"] call FUNC(copyToClipboard)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

private "_text";
_text = [_this, 0, " "] call BIS_fnc_param;
"meu_clipboard" callExtension _text;