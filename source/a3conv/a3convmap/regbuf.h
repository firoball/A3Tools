/*
 *******************************************************************************
 * regbuf.h
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
 * Definition script for region buffers
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef REGBUF_H
#define REGBUF_H
/*! \file 
 *  Include file for region buffers.
 */

/* ----- INCLUDES ----- */


#include <d3d9.h>
#include "parser.h"


/* ----- DEFINITIONS ----- */


/*! \name Constant Data 
 *  These constants are used as parameters for certain functions.
 * \{ */

/* take way too big sizes to be sure they won't be exceeded */
/* viel hilft viel */
#define REGNUMVERTS 30000//1000*3 /*!< each vertex has x/y/z and nx/ny/nz */
#define REGNUMUV    20000//1000*2 /*!< each vertex has u1/v1 */
#define REGNUMTRIS  30000//1000*3 /*!< each triangle needs 3 vertices */
#define REGNUMATTR  10000//REGNUMTRIS/3 /*!< each triangle has only one texture */
#define REGNUMSKINS 100 /*!< maximum number of different textures a region may have */
/* \} */


/* ----- STRUCTURES ----- */


/*! storage struct for D3D compatible mesh representing an A3 region including walls */
typedef struct
{
	VECTOR vecPos;                 /*!< absolute position of mesh in the level */
	
	var vTriangles;                /*!< number of mesh triangles */
	var vVertices;                 /*!< number of mesh vertices */
	var vSkins;                    /*!< numer of different textures (skins) */
	
	var vVertexBuf[REGNUMVERTS];   /*!< buffer for D3DVERTEX position */ 
	var vNormalBuf[REGNUMVERTS];   /*!< buffer for D3DVERTEX normals */
	var vTriangleBuf[REGNUMTRIS];  /*!< buffer for D3D vertex indices (mesh faces) */
	var vUVBuf[REGNUMUV];          /*!< buffer for D3DVERTEX texture UVs */
	var vSkinBuf[REGNUMATTR];      /*!< buffer for mesh triangle attributes (type of texture) */
	TEXDATA* psTexBuf[REGNUMSKINS];/*!< references to information required for texture mapping */
}REGIONMESH;


/* ----- EXTERNAL FUNCTIONS ----- */


var regbuf_getTexId(REGIONMESH* psData, TEXDATA* psTex);
TEXDATA* regbuf_getTexById(REGIONMESH* psData, var vId);
REGIONMESH* regbuf_getBuffer();
REGIONMESH* regbuf_getSecondaryBuffer();
var regbuf_checkBuffer(REGIONMESH* psData, var vVertices, var vTriangles);
void regbuf_updateCount(REGIONMESH* psData, var vVertices, var vTriangles);
void regbuf_resetBuffer(REGIONMESH* psData);
void regbuf_finish(REGIONMESH* psData);
LPD3DXMESH regbuf_createMesh(REGIONMESH* psData);


#include "regbuf.c"

#endif