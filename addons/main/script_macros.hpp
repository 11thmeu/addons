#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#define MEU_AUTHORS author = "11th MEU"

#define CBA_KEYBIDING_CATEGORY QUOTE(11th MEU Addons)

// Addaction defines for colored text
#define MEU_TEXT_ORANGE(Text) ("<t color='#ffa500'>" + ##Text + "</t>")
#define MEU_TEXT_RED(Text) ("<t color='#FF0000'>" + ##Text + "</t>")
#define MEU_TEXT_GREEN(Text) ("<t color='#00FF00'>" + ##Text + "</t>")
#define MEU_TEXT_YELLOW(Text) ("<t color='#FFFF00'>" + ##Text + "</t>")

#define ACEFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)

#define EGVAR(module,var) TRIPLES(PREFIX,module,var)
#define QEGVAR(module,var) QUOTE(EGVAR(module,var))

#define DFUNC(var1) TRIPLES(ADDON,fnc,var1)
#define DEFUNC(var1,var2) TRIPLES(DOUBLES(PREFIX,var1),fnc,var2)

#define QFUNC(var1) QUOTE(DFUNC(var1))
#define QEFUNC(var1,var2) QUOTE(DEFUNC(var1,var2))

#define PATHTOEF(var1,var2) PATHTOF_SYS(PREFIX,var1,var2)


#define GETVAR_SYS(var1,var2) getVariable [ARR_2(QUOTE(var1),var2)]
#define SETVAR_SYS(var1,var2) setVariable [ARR_2(QUOTE(var1),var2)]
#define SETPVAR_SYS(var1,var2) setVariable [ARR_3(QUOTE(var1),var2,true)]

#define GETVAR(var1,var2,var3) var1 GETVAR_SYS(var2,var3)
#define GETMVAR(var1,var2) missionNamespace GETVAR_SYS(var1,var2)
#define GETUVAR(var1,var2) uiNamespace GETVAR_SYS(var1,var2)
#define GETPRVAR(var1,var2) profileNamespace GETVAR_SYS(var1,var2)
#define GETPAVAR(var1,var2) parsingNamespace GETVAR_SYS(var1,var2)

#define SETVAR(var1,var2,var3) var1 SETVAR_SYS(var2,var3)
#define SETPVAR(var1,var2,var3) var1 SETPVAR_SYS(var2,var3)
#define SETMVAR(var1,var2) missionNamespace SETVAR_SYS(var1,var2)
#define SETUVAR(var1,var2) uiNamespace SETVAR_SYS(var1,var2)
#define SETPRVAR(var1,var2) profileNamespace SETVAR_SYS(var1,var2)
#define SETPAVAR(var1,var2) parsingNamespace SETVAR_SYS(var1,var2)

#define GETGVAR(var1,var2) GETMVAR(GVAR(var1),var2)
#define GETEGVAR(var1,var2,var3) GETMVAR(EGVAR(var1,var2),var3)

#define ARR_SELECT(ARRAY,INDEX,DEFAULT) if (count ARRAY > INDEX) then {ARRAY select INDEX} else {DEFAULT}

#define MACRO_ADDWEAPON(WEAPON,COUNT) class _xx_##WEAPON { \
  weapon = #WEAPON; \
  count = COUNT; \
}

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
}

#define MACRO_ADDMAGAZINE(MAGAZINE,COUNT) class _xx_##MAGAZINE { \
  magazine = #MAGAZINE; \
  count = COUNT; \
}


#ifdef DISABLE_COMPILE_CACHE
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf))
#else
    #define PREP(fncName) DFUNC(fncName) = QUOTE(PATHTOF(functions\DOUBLES(fnc,fncName).sqf)) call SLX_XEH_COMPILE
#endif

#include "script_debug.hpp"