/*
 *******************************************************************************
 * mapload.h
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
 * Definition script for map loader
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef MAPLOAD_H
#define MAPLOAD_H
/*! \file 
 *  Include file for map loader.
 */

/* ----- INCLUDES ----- */


#include "parser.h"


/* ----- STRUCTURES ----- */


/*! storage struct for single vertex in A3 WMP level */
typedef struct
{
	var vId;    /*!< internal id */
	var vPosX;  /*!< x Position */
	var vPosY;  /*!< y Position */
	var vPosZ;  /*!< z Position */
	var vPatch; /*!< indicator if vertex needs to be patched for triangulation process */
}WMPVERTEX;

/*! storage struct for single region in A3 WMP level */
typedef struct
{
	var vId;              /*!< internal id */
	REGIONDATA* psRegion; /*!< reference to WDL script definition of region */
	var vFloorHgt;        /*!< floor height (overrides definition in WDL script) */
	var vCeilHgt;         /*!< ceiling height (overrides definition in WDL script) */
}WMPREGION;

/*! storage struct for single wall in A3 WMP level */
typedef struct
{
	var vId;                  /*!< internal id */
	WALLDATA* psWall;         /*!< reference to WDL script definition of wall */
	WMPVERTEX* psVertex1;     /*!< reference to vertex 1 of wall */
	WMPVERTEX* psVertex2;     /*!< reference to vertex 2 of wall */
	WMPREGION* psRegionLeft;  /*!< reference to region on left side of wall */
	WMPREGION* psRegionRight; /*!< reference to region on right side of wall */
	var vOffsetX;             /*!< horizontal texture offset (overrides definition in WDL script) */
	var vOffsetY;             /*!< vertical texture offset (overrides definition in WDL script) */
	var vLength;              /*!< length of wall */
}WMPWALL;

/*! storage struct for single thing or actor in A3 WMP level */
typedef struct
{
	var vId;             /*!< internal id */
	THINGDATA* psThing;  /*!< reference to WDL script definition of thing or actor */
	var vPosX;           /*!< x Position */
	var vPosY;           /*!< y Position */
	var vAngle;          /*!< pan Angle */
	WMPREGION* psRegion; /*!< reference to WMP region thing/actor is located in */
}WMPTHING;


/* ----- EXTERNAL FUNCTIONS ----- */


void mapload(STRING* strPath, STRING* strFile);
void mapload_check_relevance();
WMPWALL* mapload_getWalls();
WMPREGION* mapload_getRegions();
WMPTHING* mapload_getThings();
var mapload_getNumWalls();
var mapload_getNumRegions();
var mapload_getNumVertices();
var mapload_getNumThings();
void mapload_cleanup();


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void mapload_count(vHandle);
void mapload_parse(vHandle);
void mapload_vertex(STRING* strData, var i);
void mapload_region(STRING* strData, var i);
void mapload_wall(STRING* strData, var i);
void mapload_thing(STRING* strData, var i);
var mapload_patchWall(var i, var j);
void mapload_getAttrib(STRING* strTemp, STRING* strData);

#include "mapload.c"

#endif