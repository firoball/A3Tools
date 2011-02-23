/*
 *******************************************************************************
 * regbuf.c
 * Creation date: 21.02.2011
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
 * Script for region buffers
 *
 * Comments
 * 
 * for short descriptions see comments in regbuf.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for region buffers.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>
#include "parser.h"
#include <d3d9.h>
#include "config.h"


/* ----- GLOBALS ----- */


REGIONMESH sRegionMeshPrimary;   /* this is the primary mesh buffer usually used */
REGIONMESH sRegionMeshSecondary; /* the seocndary buffer may be used to store mesh data in parallel to the primary buffer */ 


/* ----- FUNCTIONS ----- */


var regbuf_getTexId(REGIONMESH* psData, TEXDATA* psTex)
{
	var i;
	
	if (psData != NULL && psTex != NULL)
	{
		for (i = 0; i < psData->vSkins; i++)
		{
			/* Here is room for improvement. Assigning integer ids during
			 * parse process could speed up the check done here
			 * During parsing there are already search routines for the
			 * texture id running.
			 */
			if (str_cmpi(psTex->strId, psData->psTexBuf[i]->strId))
			{
				return i;
			}
		} 
		/* texture was not found. add it */
		if (psData->vSkins < REGNUMSKINS)
		{
			psData->psTexBuf[psData->vSkins] = psTex;
			psData->vSkins++;

			return (psData->vSkins - 1);
		}
		else
		{
			/* texture buffer too small */
			#ifdef SYSMSG_ACTIVE
			SYSMSG_print(SYSMSG_ERROR, "ERROR: regbuf_getId: Limit of texture buffer reached");
			#endif
		}	
	}
	return -1;	/* sth. went wrong - should never happen */
}

TEXDATA* regbuf_getTexById(REGIONMESH* psData, var vId)
{
	if (vId < psData->vSkins)
	{
		return psData->psTexBuf[vId];
	}
	else
	{
		return NULL;	
	}
}

REGIONMESH* regbuf_getBuffer()
{
	return &sRegionMeshPrimary;
}

REGIONMESH* regbuf_getSecondaryBuffer()
{
	return &sRegionMeshSecondary;
}

var regbuf_checkBuffer(REGIONMESH* psData, var vVertices, var vTriangles)
{
	if (
		   (psData->vVertices + vVertices > REGNUMVERTS / 3)
		|| (psData->vTriangles + vTriangles > REGNUMTRIS / 3)
		)
	{
		/* buffer size exceeded */
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: regbuf_checkBuffer: Limit of mesh buffer reached");
		#endif
		
		return 0;
	}
	else
	{
		/* everything ok */
		return 1;
	}
}

void regbuf_updateCount(REGIONMESH* psData, var vVertices, var vTriangles)
{
	psData->vVertices += vVertices;
	psData->vTriangles += vTriangles;
}

void regbuf_resetBuffer(REGIONMESH* psData)
{
	psData->vVertices = 0;
	psData->vTriangles = 0;
	psData->vSkins = 0;
	vec_set(&psData->vecPos, nullvector);
}

void regbuf_finish(REGIONMESH* psData)
{
	var i;
	VECTOR vecMin;
	VECTOR vecMax;
	VECTOR vecCenter;
	CONFIG* psConfig;
	var vMeshScale;
	var vFacX;
		
	/* get configuration */
	psConfig = config_getSettings();
	vMeshScale = psConfig->vMeshScale;

	vecMin.x = 999999;
	vecMin.y = 999999;
	vecMin.z = 999999;
	vecMax.x = -999999;
	vecMax.y = -999999;
	vecMax.z = -999999;

	/* cycle through all vertices and get dimensions */
	for (i = 0; i < psData->vVertices; i++)
	{
		/* min/max calculation without scale factor */
		vecMin.x = minv(vecMin.x, psData->vVertexBuf[3*i]);
		vecMin.y = minv(vecMin.y, -psData->vVertexBuf[3*i+2]);
		vecMin.z = minv(vecMin.z, psData->vVertexBuf[3*i+1]);
		vecMax.x = maxv(vecMax.x, psData->vVertexBuf[3*i]);
		vecMax.y = maxv(vecMax.y, -psData->vVertexBuf[3*i+2]);
		vecMax.z = maxv(vecMax.z, psData->vVertexBuf[3*i+1]);

	}

	/* now calculate offset */
	vec_set(&vecCenter, &vecMax);
	vec_add(&vecCenter, &vecMin);
	vec_scale(&vecCenter, 0.5);
	
	
	/* now cycle through all vertices again and adjust positions */
	for (i = 0; i < psData->vVertices; i++)
	{
		/* first add offset... */
		psData->vVertexBuf[3*i]   -= vecCenter.x;
		psData->vVertexBuf[3*i+2] += vecCenter.y;
		psData->vVertexBuf[3*i+1] -= vecCenter.z;

		/* ...now scale */
		psData->vVertexBuf[3*i]   *= vMeshScale;
		psData->vVertexBuf[3*i+2] *= vMeshScale;
		psData->vVertexBuf[3*i+1] *= vMeshScale;
	}
	
	/* adjust region position */
	psData->vecPos.x = vecCenter.x * vMeshScale;
	psData->vecPos.y = -vecCenter.y * vMeshScale;
	psData->vecPos.z = vecCenter.z * vMeshScale;
}

LPD3DXMESH regbuf_createMesh(REGIONMESH* psData)
{
	LPD3DXMESH psMesh;
	D3DVERTEX* sV;
	WORD* wIndex;
	long *dwAttrib; 
	var i;

/*! \todo: check if mesh data is filled */
	D3DXCreateMesh(psData->vTriangles, psData->vVertices, D3DXMESH_MANAGED, pvertexdecl, (LPDIRECT3DDEVICE9)pd3ddev, &psMesh); /* A8 */
//	D3DXCreateMeshFVF(psData->vTriangles, psData->vVertices, D3DXMESH_MANAGED, D3DFVF_D3DVERTEX, (LPDIRECT3DDEVICE9)pd3ddev, &psMesh); /* A7 */
	if (psMesh == NULL)
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: regbuf_createMesh: invalid mesh pointer");
		#endif
	}
	else
	{
		psMesh->LockVertexBuffer(0, &sV);
		psMesh->LockIndexBuffer(0, &wIndex);
		psMesh->LockAttributeBuffer(0, &dwAttrib);
	
		/* copy faces and skin identifiers */
		for (i = 0; i < psData->vTriangles; i++)
		{
			wIndex[3*i]   = psData->vTriangleBuf[3*i];
			wIndex[3*i+1] = psData->vTriangleBuf[3*i+1];
			wIndex[3*i+2] = psData->vTriangleBuf[3*i+2];
			
			dwAttrib[i] = psData->vSkinBuf[i];
		}
	
		/* copy vertices */
		for (i = 0; i < psData->vVertices; i++)
		{
			/* automatically casted to float */
			sV[i].x = psData->vVertexBuf[i*3];	
			sV[i].y = psData->vVertexBuf[i*3+1];	
			sV[i].z = psData->vVertexBuf[i*3+2];	
	
			/* copy uv map */
			sV[i].u1 = psData->vUVBuf[2*i];
			sV[i].v1 = psData->vUVBuf[2*i+1];
	
			/* copy normals */
			sV[i].nx = psData->vNormalBuf[i*3];	
			sV[i].ny = psData->vNormalBuf[i*3+1];	
			sV[i].nz = psData->vNormalBuf[i*3+2];	
		}
	
		psMesh->UnlockVertexBuffer();
		psMesh->UnlockIndexBuffer();
		psMesh->UnlockAttributeBuffer();
	}	
	
	return psMesh;
}