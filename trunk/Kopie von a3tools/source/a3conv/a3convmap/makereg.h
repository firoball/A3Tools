/*
 *******************************************************************************
 * makereg.h
 * Creation date: 04.08.2010
 * Author:        Firoball
 *
 *******************************************************************************
 * $Date: 2010-09-22 00:07:23 +0200 (Mi, 22 Sep 2010) $
 * $Revision: 6 $
 * $Author: Firo $
 *
 *******************************************************************************
 * Description
 *
 * Definition script for region maker
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef MAKEREG_H
#define MAKEREG_H
/*! \file 
 *  Include file for region maker.
 */

/* ----- INCLUDES ----- */


#include "mapload.h"
#include "parser.h"
#include "regbuf.h"


/* ----- DEFINITIONS ----- */


/*! \name Constant Data 
 *  These constants are used as parameters for certain functions.
 * \{ */
#define STARTVERTEX -1
#define NOVERTEX -1
/* \} */


/* ----- EXTERNAL FUNCTIONS ----- */


void make_regions();


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void make_floorCeil(REGIONMESH* psData, WMPREGION* psMakeRegion, REGIONDATA* psRegion, var vCntTriangles);
var make_getRegionVertex(var vVertexId, var vRegionId);
void make_patchBelowMesh(REGIONDATA* psRegion, var vCntVerts);
void make_copyCeilMesh(WMPREGION* psWmpRegion, var vCntVerts, var vCntTris);
void make_patchCeilMesh(REGIONDATA* psRegion, var vCeilHgt, var vCntVerts);
void make_regionEnt(REGIONMESH* psData, REGIONDATA* psRegion);
void make_copyRegionMesh(REGIONMESH* psData, REGIONDATA* psRegion, var vType, var vVertices, var* vVertexBuf, var vTriangles, int* iTriangleBuf);

#include "makereg.c"

#endif