
#define WIN32_LEAN_AND_MEAN	// Exclude rarely-used stuff from Windows headers
#include <windows.h>
#include <stdio.h>

// engine specific header file
#define DLL_USE	// always define before including adll.h
#include "adll.h"	

// project includes
#include "interface.h"



// DLL main entry point
BOOL APIENTRY DllMain( HANDLE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved )
{
	engine_bind();
	return TRUE;
}

inline double _DOUBLE(var x) { return ((double)x)/(1<<10); }

DLLFUNC var maketris_triangulate(var ncontours, var* cntr, var* vertices, int* triangles)
{
	int ret;
	// da die scheiße anders nicht will, kopieren wirs halt einfach um.
	int i;

	int numverts = 0;
	int numcontours = _INT(ncontours);
	int* cont = new int[_INT(ncontours)];
	
	for (i = 0; i < numcontours; i++)
	{
		numverts += _INT(cntr[i]);
		cont[i] = _INT(cntr[i]);
	}
	double* vert = new double[numverts*2];
	for(i = 0; i < numverts; i++)
	{
		vert[i*2]   = _DOUBLE(vertices[i*3]);
		vert[i*2+1] = _DOUBLE(vertices[i*3+1]);
	}
	try
	{
		ret = triangulate_polygon(numcontours, cont, vert, triangles);
	}
	catch (...)
	{
		ret = 0;
	}
	delete cont;
	delete vert;

	return _VAR(ret);
}


DLLFUNC var maketris_getPointInPoly(var* vertex)
{
	int ret;
	double v[2];
	v[0] = _DOUBLE(vertex[0]);
	v[1] = _DOUBLE(vertex[1]);
	ret = is_point_inside_polygon(v);

	return _VAR(ret);
}


