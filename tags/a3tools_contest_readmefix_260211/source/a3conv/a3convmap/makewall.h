/*
 *******************************************************************************
 * makewall.h
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
 * Definition script for wall generator
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef MAKEWALL_H
#define MAKEWALL_H
/*! \file 
 *  Include file for wall generator.
 */

/* ----- INCLUDES ----- */


#include "mapload.h"
#include "parser.h"
#include "regbuf.h"


/* ----- EXTERNAL FUNCTIONS ----- */


void make_buildWall(REGIONMESH* psData, WMPWALL* psWall, WMPREGION* psOwnRegion, REGIONDATA* psRegion);


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void make_buildSingleWall(REGIONMESH* psData, WMPWALL* psWall, WMPREGION* psOwnRegion, REGIONDATA* psRegion);
void make_buildDoubleWall(WMPWALL* psWall, WMPREGION* psOwnRegion, REGIONDATA* psRegion);
void make_buildWallUV(WMPWALL* psWall, var vVertices, var vWallOrientation);
void make_copyWallMesh(REGIONMESH* psData, WMPWALL* psWall, var* vUVBuf, var vVertices, var* vVertexBuf, var vTriangles, int* iTriangleBuf);
long make_getWallFlags(WALLDATA* psWall);


#include "makewall.c"

#endif