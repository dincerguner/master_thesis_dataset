/*
 * unlaunch.c - part of jEditLauncher package
 * Copyright (C) 2001 John Gellene
 * jgellene@nyc.rr.com
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or any later version.
 *
 * Notwithstanding the terms of the General Public License, the author grants
 * permission to compile and link object code generated by the compilation of
 * this program with object code and libraries that are not subject to the
 * GNU General Public License, provided that the executable output of such
 * compilation shall be distributed with source code on substantially the
 * same basis as the jEditLauncher package of which this program is a part.
 * By way of example, a distribution would satisfy this condition if it
 * included a working makefile for any freely available make utility that
 * runs on the Windows family of operating systems. This condition does not
 * require a licensee of this software to distribute any proprietary software
 * (including header files and libraries) that is licensed under terms
 * prohibiting redistribution to third parties.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 * $Id: unlaunch.c,v 1.2 2001/08/26 14:46:48 jgellene Exp $
 */


#define WIN32_LEAN_AND_MEAN		// Exclude rarely-used stuff from Windows headers
#include <windows.h>

TCHAR *szApp = TEXT("jEditLauncher");

TCHAR *szMsg =
	TEXT("Could not find uninstall module.  The jEditLauncher package was not properly installed.");

TCHAR *szModule = TEXT("jedinstl.dll");

int __cdecl main()
{
	int nRet = 0xFF;
	HMODULE hModule = LoadLibrary(szModule);
	FARPROC proc = hModule ? GetProcAddress(hModule, "Uninstall") : 0;
	if(proc != 0)
		nRet = (proc)();
	else
		MessageBox(0, szMsg, szApp, MB_ICONERROR);
	if(hModule != 0)
		FreeLibrary(hModule);
	return nRet;
}

