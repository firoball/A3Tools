//////////////////////////////////////////////////////////////////////
// Acknex engine DLL/EXE header for C++
// (c) Conitec / jcl 2004
//////////////////////////////////////////////////////////////////////
// For using the acknex.dll, add the acknex.lib to your project
// For creating a plugin DLL, add the adll.lib to your project
// For MingW, use binutils\reimp to convert .lib to .a
//////////////////////////////////////////////////////////////////////
#ifndef adll_h
#define adll_h

typedef unsigned char byte;
typedef long var;
#include "atypes.h"		// engine structs and flags

//////////////////////////////////////////////////////////////////////
#define ENGINE_VAR		var*
#define ENGINE_VECTOR	VECTOR*
#define ENGINE_COLOR	COLOR*
#define ENGINE_ANGLE	ANGLE*
#define ENGINE_EVENT	EVENT*
#define ENGINE_ENTITY	ENTITY*
#define ENGINE_STRING	STRING*
#define ENGINE_BMAP		BMAP*
#define ENGINE_VIEW		VIEW*
#define ENGINE_MATERIAL	MATERIAL*
#define ENGINE_

#define my		me			// convenience macros
#define your	you
#define MTL		v(mtl)
#define CAMERA	v(camera)

// define a struct with pointers to all exported engine variables
typedef struct {
	#include "avars.h"
} ENGINE_VARS;

extern ENGINE_VARS *ev;

//////////////////////////////////////////////////////////////////////
// engine functions
#define EXT	extern "C"	// prevent VC++ Linker from adding a "?" to C++ functions
#define DLLFUNC extern "C" __declspec(dllexport)

#ifdef DLL_USE
#define F(f) (*f)	// use function pointers in a DLL
#else
#define F(f) f		// use function prototypes in a EXE
#endif
#include "afuncs.h"	// include a list of engine functions

#undef F
#undef EXT

//////////////////////////////////////////////////////////////////////
// conversion macros
inline var _VAR(int i) { return i<<10; }					// int -> var
inline var _VAR(double f) { return (var)(f*(1<<10)); }		// double -> var, overloaded
inline int _INT(var x) { return x>>10; }					// var -> int
inline float _FLOAT(var x) { return ((float)x)/(1<<10); }	// var -> float
inline char* _CHR(STRING* s) { return s->chars; }			// STRING* -> char*

#define v(a)		(*ev->a)			// uses ENGINE_VARS *ev struct
#define SETV(a,x)	v(a) = _VAR(x)		// set an engine variable
#define INTV(a)		_INT(v(a))			// read an int from an engine variable
#define FLOATV(a)	_FLOAT(v(a))		// read a float from an engine variable

#endif ///////////////////////////////////////////////////////////////
