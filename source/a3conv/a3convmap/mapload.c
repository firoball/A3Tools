/*
 *******************************************************************************
 * mapload.c
 * Creation date: 21.02.2011
 * Author:        Firoball
 *
 *******************************************************************************
 * $Date$
 * $Revision$
 * $Author$
 *
 *******************************************************************************
 * Description
 *
 * Script for map loader
 *
 * Comments
 * 
 * for short descriptions see comments in mapload.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for map loader.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>
#include <strio.c>
#include "parser.h"


/* ----- GLOBALS ----- */


var vCntWmpRegion;
var vCntWmpWall;
var vCntWmpVertex;
var vCntWmpThing;

WMPVERTEX* sWmpVertex;
WMPREGION* sWmpRegion;
WMPWALL* sWmpWall;
WMPTHING* sWmpThing;

STRING* strMapTemp;


/* ----- EXTERNAL FUNCTIONS ----- */


var mapload(STRING* strPath, STRING* strFile)
{
	STRING* strPathFile = str_create("");
	strMapTemp = str_create("");
	STRING* strError = str_create("");
	var vHandle;
	var vFail = 0;
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WMP loader started...");
	#endif

	str_cpy (strPathFile, strPath);
	str_cat (strPathFile, strFile);

	vHandle = file_open_read(strPathFile);
	if (vHandle)
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_SYSTEM, strPathFile);
		#endif

		vCntWmpRegion = 0;
		vCntWmpWall = 0;
		vCntWmpVertex = 0;
		vCntWmpThing = 0;
		/* count keywords - read file 1st time */
		mapload_count(vHandle);
		/* allocate correct structure sizes - yes, clumsy. but I didn't want hard sized stuff here */
		if (vCntWmpVertex > 0)
		{
			sWmpVertex = (WMPVERTEX*)sys_malloc(sizeof(WMPVERTEX) * vCntWmpVertex);
		}
		else
		{
			sWmpRegion = NULL;		
		}
		if (vCntWmpRegion > 0)
		{
			sWmpRegion = (WMPREGION*)sys_malloc(sizeof(WMPREGION) * vCntWmpRegion);
		}
		else
		{
			sWmpRegion = NULL;		
		}
		if (vCntWmpWall > 0)
		{
			sWmpWall = (WMPWALL*)sys_malloc(sizeof(WMPWALL) * vCntWmpWall);
		}
		else
		{
			sWmpWall = NULL;		
		}
		if (vCntWmpThing > 0)
		{
			sWmpThing = (WMPTHING*)sys_malloc(sizeof(WMPTHING) * vCntWmpThing);
		}
		else
		{
			sWmpThing = NULL;		
		}
			
		file_seek(vHandle, 0, 0); /* reset file pointer to start of file */
	
		/* fill structs with level data  - read file 2nd time */
		mapload_parse(vHandle);

		file_close (vHandle);
	}
	else
	{
		vFail = 1;
		str_printf (strError, "ERROR: could not load %s", strPathFile->chars);
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, strError);
		#endif
	}	
		
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WMP loader done.\r\n");
	#endif

	ptr_remove(strPathFile);
	ptr_remove(strMapTemp);
	ptr_remove(strError);
	
	return vFail;
}

void mapload_count(vHandle)
{
	STRING* strData = str_create("");
	var r;
	var vTemp;

	do
	{
		vTemp = file_str_readto(vHandle, strData, "\r\n", 4000);

		/* remove comments */
		r = str_stri(strData, "#");
		if (r)
		{
			str_trunc(strData, str_len(strData) - r + 1);
		}
		
		/* search vertices */
		if (str_stri(strData, "VERTEX") == 1) /* keyword must be first in line */
		{
			vCntWmpVertex++;
		}
		/* search regions */
		else if (str_stri(strData, "REGION") == 1) /* keyword must be first in line */
		{
			vCntWmpRegion++;
		}
		/* search walls */
		else if (str_stri(strData, "WALL") == 1) /* keyword must be first in line */
		{
			vCntWmpWall++;
		}
		/* search things and actors */
		else if ((str_stri(strData, "THING") == 1) || (str_stri(strData, "ACTOR") == 1)) /* keyword must be first in line */
		{
			vCntWmpThing++;
		}

	}
	while(vTemp != -1);

	#ifdef SYSMSG_ACTIVE
	/* strData reused */
	str_for_num(strData, vCntWmpVertex);
	str_cat(strData, " vertices found");
	SYSMSG_print(SYSMSG_SYSTEM, strData);
	str_for_num(strData, vCntWmpRegion);
	str_cat(strData, " regions found");
	SYSMSG_print(SYSMSG_SYSTEM, strData);
	str_for_num(strData, vCntWmpWall);
	str_cat(strData, " walls found");
	SYSMSG_print(SYSMSG_SYSTEM, strData);
	str_for_num(strData, vCntWmpThing);
	str_cat(strData, " things found");
	SYSMSG_print(SYSMSG_SYSTEM, strData);
	#endif
	
	ptr_remove(strData);
}

void mapload_parse(vHandle)
{
	STRING* strData = str_create("");
	var r;
	var vTemp;
	var vVertex = 0;
	var vRegion = 0;
	var vWall = 0;
	var vThing = 0;
		
	do
	{
		vTemp = file_str_readto(vHandle, strData, "\r\n", 4000);

		/* remove comments */
		r = str_stri(strData, "#");
		if (r)
		{
			str_trunc(strData, str_len(strData) - r + 1);
		}
		/* replace annoying tabs with ; */
		str_replaceall(strData, "	", ";");
		/* ...same for spaces - easier parsing */
		str_replaceall(strData, " ", ";");
		
		/* search vertices */
		if (str_stri(strData, "VERTEX") == 1) /* keyword must be first in line */
		{
			mapload_vertex(strData, vVertex);
			vVertex++;
		}
		/* search regions */
		else if (str_stri(strData, "REGION") == 1) /* keyword must be first in line */
		{
			mapload_region(strData, vRegion);
			vRegion++;
		}
		/* search walls */
		else if (str_stri(strData, "WALL") == 1) /* keyword must be first in line */
		{
			mapload_wall(strData, vWall);
			vWall++;
		}
		/* search things and actors */
		else if ((str_stri(strData, "THING") == 1) || (str_stri(strData, "ACTOR") == 1)) /* keyword must be first in line */
		{
			mapload_thing(strData, vThing);
			vThing++;
		}

	}
	while(vTemp != -1);

	ptr_remove(strData);
}

void mapload_vertex(STRING* strData, var i)
{
	var j;
	
	if (i < vCntWmpVertex)
	{
		strData = str_clip(strData, 6);

		/* id */
		sWmpVertex[i].vId = i;
		
		/* posX */
		mapload_getAttrib(strMapTemp, strData);
		sWmpVertex[i].vPosX = str_to_num(strMapTemp);
		 		
		/* posY */
		mapload_getAttrib(strMapTemp, strData);
		sWmpVertex[i].vPosY = str_to_num(strMapTemp);

		/* posZ */
		mapload_getAttrib(strMapTemp, strData);
		sWmpVertex[i].vPosZ = str_to_num(strMapTemp);

		/* patch
		 * if a vertex is layered (shares the same position with another one
		 * this has to be fixed by slightly displaying the vertex on mesh 
		 * generation. The patch flag is evaluated then */
		sWmpVertex[i].vPatch = 0;
		for (j = 0; j < i; j++)
		{
			if ((sWmpVertex[i].vPosX == sWmpVertex[j].vPosX) && (sWmpVertex[i].vPosY == sWmpVertex[j].vPosY))
			{
				sWmpVertex[i].vPatch = 1;
				break;
			}
		} 		 
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of VERTEXes exceeded");
		#endif
	}
}

void mapload_region(STRING* strData, var i)
{
	
	if (i < vCntWmpRegion)
	{
		strData = str_clip(strData, 6);

		/* id */
		sWmpRegion[i].vId = i;
		
		/* Region WDL */
		mapload_getAttrib(strMapTemp, strData);
		sWmpRegion[i].psRegion = search_region(strMapTemp);

		/* Floor Height */
		mapload_getAttrib(strMapTemp, strData);
		sWmpRegion[i].vFloorHgt = str_to_num(strMapTemp);

		/* Ceil Height */
		mapload_getAttrib(strMapTemp, strData);
		sWmpRegion[i].vCeilHgt = str_to_num(strMapTemp);


	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of REGIONs exceeded");
		#endif
	}
}

void mapload_wall(STRING* strData, var i)
{
	var vTemp;
	var j, vDone;
	
	if (i < vCntWmpWall)
	{
		strData = str_clip(strData, 4);

		/* id */
		sWmpWall[i].vId = i;
		
		/* Wall WDL */
		mapload_getAttrib(strMapTemp, strData);
		sWmpWall[i].psWall = search_wall(strMapTemp);

		/* Vertex 1 WMP */
		mapload_getAttrib(strMapTemp, strData);
		vTemp = str_to_num(strMapTemp);
		sWmpWall[i].psVertex1 = &sWmpVertex[vTemp];

		/* Vertex 2 WMP */
		mapload_getAttrib(strMapTemp, strData);
		vTemp = str_to_num(strMapTemp);
		sWmpWall[i].psVertex2 = &sWmpVertex[vTemp];

		/* Left Region WMP */
		mapload_getAttrib(strMapTemp, strData);
		vTemp = str_to_num(strMapTemp);
		sWmpWall[i].psRegionLeft = &sWmpRegion[vTemp];

		/* Right Region WMP */
		mapload_getAttrib(strMapTemp, strData);
		vTemp = str_to_num(strMapTemp);
		sWmpWall[i].psRegionRight = &sWmpRegion[vTemp];

		/* Texture Offset X */
		mapload_getAttrib(strMapTemp, strData);
		sWmpWall[i].vOffsetX = str_to_num(strMapTemp);

		/* Texture Offset Y */
		mapload_getAttrib(strMapTemp, strData);
		sWmpWall[i].vOffsetY = str_to_num(strMapTemp);

		/* length */
		sWmpWall[i].vLength = vec_length(vector(sWmpWall[i].psVertex2->vPosX - sWmpWall[i].psVertex1->vPosX,
			sWmpWall[i].psVertex2->vPosY - sWmpWall[i].psVertex1->vPosY, 0));
			
		/* patch
		 * if a wall touches another wall with one or more vertices
		 * and the other wall does not own the same vertex as start / end vertex  
		 * there is a problem and patching is needed */

		for (j = 0; j < i; j++)
		{
			vDone = mapload_patchWall(i, j);
			if (vDone) break;
		} 		 

	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of WALLs exceeded");
		#endif
	}
}

void mapload_thing(STRING* strData, var i)
{
	var vTemp;
	
	if (i < vCntWmpThing)
	{
		strData = str_clip(strData, 5);

		/* id */
		sWmpThing[i].vId = i;
		
		/* Thing WDL */
		mapload_getAttrib(strMapTemp, strData);
		sWmpThing[i].psThing = search_thing(strMapTemp);

		/* Pos X */
		mapload_getAttrib(strMapTemp, strData);
		sWmpThing[i].vPosX = str_to_num(strMapTemp);

		/* Pos Y */
		mapload_getAttrib(strMapTemp, strData);
		sWmpThing[i].vPosY = str_to_num(strMapTemp);

		/* Angle */
		mapload_getAttrib(strMapTemp, strData);
		sWmpThing[i].vAngle = str_to_num(strMapTemp);

		/* Region WMP */
		mapload_getAttrib(strMapTemp, strData);
		vTemp = str_to_num(strMapTemp);
		sWmpThing[i].psRegion = &sWmpRegion[vTemp];

	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of THINGs exceeded");
		#endif
	}
}

var mapload_patchWall(var i, var j)
{

	WMPWALL* psShort;
	WMPWALL* psLong;
	var p1X, p2X, pS1X, pS2X;
	var p1Y, p2Y, pS1Y, pS2Y;
	
	/* default: own wall is short wall */
	
	/* vertices of foreign wall */
	p1X = sWmpWall[j].psVertex1->vPosX;
	p1Y = sWmpWall[j].psVertex1->vPosY;
	p2X = sWmpWall[j].psVertex2->vPosX;
	p2Y = sWmpWall[j].psVertex2->vPosY;
	psLong = &sWmpWall[j];
		
	/* vertices of own wall */
	pS1X = sWmpWall[i].psVertex1->vPosX;
	pS1Y = sWmpWall[i].psVertex1->vPosY;
	pS2X = sWmpWall[i].psVertex2->vPosX;
	pS2Y = sWmpWall[i].psVertex2->vPosY;
	psShort = &sWmpWall[i];

	/* interchange walls if foreign wall is the shorter wall */
	if (psLong->vLength <= psShort->vLength)
	{
		/* vertices of own wall (longer wall) */
		p1X = sWmpWall[i].psVertex1->vPosX;
		p1Y = sWmpWall[i].psVertex1->vPosY;
		p2X = sWmpWall[i].psVertex2->vPosX;
		p2Y = sWmpWall[i].psVertex2->vPosY;
		psLong = &sWmpWall[i];
		
		/* vertices of foreign wall (shorter wall) */
		pS1X = sWmpWall[j].psVertex1->vPosX;
		pS1Y = sWmpWall[j].psVertex1->vPosY;
		pS2X = sWmpWall[j].psVertex2->vPosX;
		pS2Y = sWmpWall[j].psVertex2->vPosY;
		psShort = &sWmpWall[j];
	}

	if	(psShort->psVertex1->vPatch == 0 || psShort->psVertex2->vPatch == 0)
	{
		/* VERTEX 1
		 * check if walls are neighbours - in this case they share a vertex and the check must be skipped! */
		if ((psShort->psVertex1->vId != psLong->psVertex1->vId) && (psShort->psVertex1->vId != psLong->psVertex2->vId))
		{		
			/* check for overlapping 
			 * compare vector length: (v1->v2) == (v1->S)+(S->v2), S being vertex 1 of short wall 
			 * in case of a match, walls are touching - mark vertices for patch */
			if (	
					((vec_length(vector(pS1X - p1X,pS1Y - p1Y,0)) + vec_length(vector(p2X - pS1X,p2Y - pS1Y,0))) ==
//					vec_length(vector(p2X - p1X,p2Y - p1Y,0))) 
					psLong->vLength)
//				|| 
//					((vec_length(vector(pS1X - p2X,pS1Y - p2Y,0)) + vec_length(vector(p1X - pS1X,p1Y - pS1Y,0))) ==
//					vec_length(vector(p1X - p2X,p1Y - p2Y,0)))
//					psLong->vLength)
				)
			{  
				/* patch own vertices */
				psShort->psVertex1->vPatch = 2;
				psShort->psVertex2->vPatch = 2;
				return 1;
			}
		}					
	
		/* VERTEX 2
		 * check if walls are neighbours - in this case they share a vertex and the check must be skipped! */
		if ((psShort->psVertex2->vId != psLong->psVertex1->vId) && (psShort->psVertex2->vId != psLong->psVertex2->vId))
		{
			/* check for overlapping 
			 * compare vector length: (v1->v2) == (v1->S)+(S->v2), S being vertex 2 of short wall 
			 * in case of a match, walls are touching - mark vertices for patch */
			if (	
					((vec_length(vector(pS2X - p1X,pS2Y - p1Y,0)) + vec_length(vector(p2X - pS2X,p2Y - pS2Y,0))) ==
//					vec_length(vector(p2X - p1X,p2Y - p1Y,0))) 
					psLong->vLength)
//				|| 
//					((vec_length(vector(pS2X - p2X,pS2Y - p2Y,0)) + vec_length(vector(p1X - pS2X,p1Y - pS2Y,0))) ==
//					vec_length(vector(p1X - p2X,p1Y - p2Y,0)))
//					psLong->vLength)
				)
			{  
				/* patch own vertices */
				psShort->psVertex1->vPatch = 2;
				psShort->psVertex2->vPatch = 2;
				return 1;
			}
		}					
	}
	
	/* no overlapping walls */
	return 0;
}

void mapload_getAttrib(STRING* strTemp, STRING* strData)
{
	var r;

	/* find next semicolon */
	r = str_stri(strData, ";");
	if (r == 1)
	{
		/* cut first letter if already a semicolon */
		str_clip(strData, 1);
		r = str_stri(strData, ";");
	}
		
	if (r)
	{
		str_cpy(strTemp, strData);
		/* cut away unused stuff */
		str_trunc(strTemp, str_len(strTemp) - r + 1);		
		/* clip read attribute from source string */
		str_clip(strData, str_len(strTemp));
	}	
	else
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: Data string truncated");
		#endif
	}
}

void mapload_check_relevance()
{
	var i;
	WALLDATA* psWall;
	REGIONDATA* psRegion;
	REGIONDATA* psBelowRegion;
	THINGDATA* psThing;

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WMP loader check relevances...");
	#endif
	for (i = 0; i < vCntWmpWall; i++)
	{
		psWall = sWmpWall[i].psWall;
		if (psWall != NULL)
		{
			psWall->vRelevant = 1;
		}
	}

	for (i = 0; i < vCntWmpRegion; i++)
	{
		psRegion = sWmpRegion[i].psRegion;
		if (psRegion != NULL)
		{
			psRegion->vRelevant = 1;
		
			/* check for below regions - they are only script based and can't be read from map */
			psBelowRegion = psRegion->psRegionBelow;
			while (psBelowRegion != NULL)
			{
				psBelowRegion->vRelevant = 1;
				psBelowRegion = psBelowRegion->psRegionBelow;	
			}
		}
	}
	
	for (i = 0; i < vCntWmpThing; i++)
	{
		psThing = sWmpThing[i].psThing;
		if (psThing != NULL)
		{
			psThing->vRelevant = 1;
		}
	}
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WMP loader relevance check done.\r\n");
	#endif
}

WMPWALL* mapload_getWalls()
{
	return sWmpWall;
}

WMPREGION* mapload_getRegions()
{
	return sWmpRegion;
}

WMPTHING* mapload_getThings()
{
	return sWmpThing;
}

var mapload_getNumWalls()
{	
	return vCntWmpWall;
}

var mapload_getNumRegions()
{	
	return vCntWmpRegion;
}

var mapload_getNumVertices()
{	
	return vCntWmpVertex;
}

var mapload_getNumThings()
{	
	return vCntWmpThing;
}

void mapload_cleanup()
{
	sys_free(sWmpVertex);
	sys_free(sWmpRegion);
	sys_free(sWmpWall);
	sys_free(sWmpThing);

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WMP loader memory released.");
	#endif
}
