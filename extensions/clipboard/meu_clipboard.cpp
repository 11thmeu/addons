/*
 * Author: Thrax
 * Gets or sets the Windows clipboard
 *
 * Arguments:
 * 0: Text to set to the clipboard <STRING>
 *
 * Return Value:
 * If empty string given as argument, returns clipboard contents <STRING>
 *
 * Example:
 * _text = "meu_clipboard" callExtension "";
 * "meu_clipboard" callExtension "someText";
 *
 */
 
#include "stdafx.h"
#include <iostream>
#include <windows.h>

extern "C"
{
	__declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function); 
} 

void setClipboard(const char *output)
{
	const size_t len = strlen(output) + 1;
	HGLOBAL hMem = GlobalAlloc(GMEM_MOVEABLE, len);
	memcpy(GlobalLock(hMem), output, len);
	GlobalUnlock(hMem);
	OpenClipboard(0);
	EmptyClipboard();
	SetClipboardData(CF_TEXT, hMem);
	CloseClipboard();
}

char* getClipboard() {
	OpenClipboard(NULL);
	HANDLE pText = GetClipboardData(CF_TEXT);
	CloseClipboard();
	LPVOID text = GlobalLock(pText);
	return (char*)text;
}

void __stdcall RVExtension(char *output, int outputSize, const char *function) 
{ 	
	if (strcmp(function, ""))
	{
		setClipboard(function);
	}
	else 
	{
		strncpy_s(output, outputSize, getClipboard(), _TRUNCATE);
	}
}