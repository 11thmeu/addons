/*
 * Author: Thrax
 * Use clipboard extension to copy text from clipboard
 *
 * Arguments:
 * -
 *
 * Return Value:
 * Contents of the clipboard <STRING>
 *
 * Example:
 * _text = call FUNC(copyFromClipboard)
 *
 * Public: [Yes]
 */
#include "script_component.hpp"

private "_text";
_text = "meu_clipboard" callExtension "";
_text 