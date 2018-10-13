/*
 *******************************************************************************
 * makewall.c
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
 * Script for wall generator
 *
 * Comments
 * 
 * for short descriptions see comments in makewall.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for wall generator.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>
#include <d3d9.h>

#include "mapload.h"
#include "parser.h"
#include "a3defs.h"
#include "regbuf.h"
#include "wm3save.h"
#include "facecalc.h"
#include "makeent.h" 


/* ----- GLOBALS ----- */


var vWallUVBuf[66];
var vWallVertBuf[99];
int vWallTriBuf[249];


/* ----- FUNCTIONS ----- */


void make_buildWall(REGIONMESH* psData, WMPWALL* psWall, WMPREGION* psOwnRegion, REGIONDATA* psRegion)
{
	/* check for isolated wall 
	 * isolated walls can be created with simplified routine
	 */
	if (psWall->psRegionLeft == psWall->psRegionRight) 
	{
		/* double wall always uses secondary mesh buffer */
		make_buildDoubleWall(psWall, psOwnRegion, psRegion);
	}
	else
	{
		make_buildSingleWall(psData, psWall, psOwnRegion, psRegion);
	}
}

void make_buildSingleWall(REGIONMESH* psData, WMPWALL* psWall, WMPREGION* psOwnRegion, REGIONDATA* psRegion)
{
	WMPREGION* psOtherRegion;
	WMPVERTEX* psV1;
	WMPVERTEX* psV2;
	REGIONDATA* psOtherCurRegion;
	REGIONDATA* psOtherNextRegion;
	var vVertices = 0; /* number of vertices per wall */
	var vLastVertices = 0; /* number of vertices before generation of current triangle */
	var vTriangles = 0; /* number of triangles per wall */
	var vPassage = 0; /* indicates whether wall has a hole (passage) */
	var vWallOrientation;
	var vHeight;
	var vRelevantBelowReg;
	var vMode = 0; /* 0: ceiling, 1: passage, 2: floor */

	var vOtherCeilHgt, vOtherFloorHgt;
	var vOtherCeilHgtV1, vOtherCeilHgtV2;
	var vOtherFloorHgtV1, vOtherFloorHgtV2;
	var vOtherNextCeilHgtV1, vOtherNextCeilHgtV2;

	var vOwnCeilHgt, vOwnFloorHgt;
	var vOwnCeilHgtV1, vOwnCeilHgtV2;
	var vOwnFloorHgtV1, vOwnFloorHgtV2;
	long lFlags;

		
	/* for texture UV mapping it is important to know whether
	 * the current ("own") region is on left or right side.
	 * The wall orientation flag is set accordingly.
	 * The "own" region is the region reffered to in the WMP
	 * map file. It is the same for all regions below this region
	 */
	if (psWall->psRegionLeft == psOwnRegion)
	{
		psOtherRegion = psWall->psRegionRight;
		psV2 = psWall->psVertex1;
		psV1 = psWall->psVertex2;
		vWallOrientation = 1;
	}
	else if (psWall->psRegionRight == psOwnRegion)
	{
		psOtherRegion = psWall->psRegionLeft;
		psV1 = psWall->psVertex1;
		psV2 = psWall->psVertex2;
		vWallOrientation = -1;
	}
	else
	{
		error("cannot create wall");
		return;
	}

	/* top region takes region heights from WMP file not from script definition */
	if (psOwnRegion->psRegion == psRegion)
	{
		vOwnFloorHgt = psOwnRegion->vFloorHgt;
		vOwnCeilHgt = psOwnRegion->vCeilHgt;
	}
	/* below region must take heights from script */
	else
	{
		vOwnFloorHgt = psRegion->vFloorHgt;
		vOwnCeilHgt = psRegion->vCeilHgt;
	}
	
	/* loop through all neighbouring region stacks.
	 * The algorithm used here does following:
	 * Consider given region as "own" region
	 * then build wall faces visible from "own" region by walking through
	 * all region stacks of the neighbouring region
	 * evaulate where wallparts need to be rendered and if this is done
	 * check for below regions and repeat the procedure.
	 */
	vVertices = 0;
	vLastVertices = 0;
	vTriangles = 0;
	vPassage = 0;
	vMode = 0;

	/* neighbouring region - copy info from WMPREGION struct*/
	vOtherCeilHgt     = psOtherRegion->vCeilHgt;
	vOtherFloorHgt    = psOtherRegion->vFloorHgt;
	psOtherNextRegion = psOtherRegion->psRegion;
	psOtherCurRegion  = psOtherNextRegion;

	/* calculate vertex z offset for sloped regions */
	vOwnFloorHgtV1 = 0;
	vOwnFloorHgtV2 = 0;
	vOwnCeilHgtV1  = 0;
	vOwnCeilHgtV2  = 0;
	if(psRegion->lFlags & A3_FLOOR_ASCEND)
	{
		vOwnFloorHgtV1 = psV1->vPosZ;
		vOwnFloorHgtV2 = psV2->vPosZ;
	}
	if(psRegion->lFlags & A3_FLOOR_DESCEND)
	{
		vOwnFloorHgtV1 = -psV1->vPosZ;
		vOwnFloorHgtV2 = -psV2->vPosZ;
	}
	if(psRegion->lFlags & A3_CEIL_ASCEND)
	{
		vOwnCeilHgtV1  = psV1->vPosZ;
		vOwnCeilHgtV2  = psV2->vPosZ;
	}
	if(psRegion->lFlags & A3_CEIL_DESCEND)
	{
		vOwnCeilHgtV1  = -psV1->vPosZ;
		vOwnCeilHgtV2  = -psV2->vPosZ;
	}

	
	/* if neighbouring walls show height differences, a detailed analysis is
	 * required.
	 * Curtain walls always go from floor to ceiling, so the detailed analysis
	 * can be skipped for walls of this type
	 */
	if (
			   ((psWall->psWall->lFlags & A3_CURTAIN) == 0)
			&& (
				   (psOtherCurRegion != psRegion)
				|| (vOwnCeilHgt != vOtherCeilHgt)
				|| (vOwnFloorHgt != vOtherFloorHgt)
			   )
		)
	{ 
		do
		{
			psOtherCurRegion = psOtherNextRegion;
			psOtherNextRegion = psOtherCurRegion->psRegionBelow;

			/* calculate vertex z offset for sloped regions */
			vOtherFloorHgtV1 = 0;
			vOtherFloorHgtV2 = 0;
			vOtherCeilHgtV1  = 0;
			vOtherCeilHgtV2  = 0;
			if(psOtherCurRegion->lFlags & A3_FLOOR_ASCEND)
			{
				vOtherFloorHgtV1 = psV1->vPosZ;
				vOtherFloorHgtV2 = psV2->vPosZ;
			}
			if(psOtherCurRegion->lFlags & A3_FLOOR_DESCEND)
			{
				vOtherFloorHgtV1 = -psV1->vPosZ;
				vOtherFloorHgtV2 = -psV2->vPosZ;
			}
			if(psOtherCurRegion->lFlags & A3_CEIL_ASCEND)
			{
				vOtherCeilHgtV1  = psV1->vPosZ;
				vOtherCeilHgtV2  = psV2->vPosZ;
			}
			if(psOtherCurRegion->lFlags & A3_CEIL_DESCEND)
			{
				vOtherCeilHgtV1  = -psV1->vPosZ;
				vOtherCeilHgtV2  = -psV2->vPosZ;
			}
			
			/* only process no border region */
			if (
				   (vOtherFloorHgt + vOtherFloorHgtV1 != vOtherCeilHgt + vOtherCeilHgtV1)
				|| (vOtherFloorHgt + vOtherFloorHgtV2 != vOtherCeilHgt + vOtherCeilHgtV2)
				)  
			{
				/* upper texture */
				if (
					(
					/* check vertex 1 */
						(
					   	(vOtherCeilHgt + vOtherCeilHgtV1 < vOwnCeilHgt + vOwnCeilHgtV1) 
						&& (vOtherCeilHgt + vOtherCeilHgtV1 >= vOwnFloorHgt + vOwnFloorHgtV1)
						)
					/* check vertex 2 */
					|| (
						(vOtherCeilHgt + vOtherCeilHgtV2 < vOwnCeilHgt + vOwnCeilHgtV2) 
						&& (vOtherCeilHgt + vOtherCeilHgtV2 >= vOwnFloorHgt + vOwnFloorHgtV2)
						)
					)
					/* check mode - avoid repeated generation of upper texture in case of below regions */
					&& (vMode == 0)
					)
				{
					vWallVertBuf[3*vVertices]   = psV2->vPosX;	
					vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
					vWallVertBuf[3*vVertices+2] = vOtherCeilHgt + vOtherCeilHgtV2;	
					vVertices++;
	
					vWallVertBuf[3*vVertices]   = psV1->vPosX;	
					vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
					vWallVertBuf[3*vVertices+2] = vOtherCeilHgt + vOtherCeilHgtV1;		
					vVertices++;
	
					vWallVertBuf[3*vVertices]   = psV1->vPosX;	
					vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
					vWallVertBuf[3*vVertices+2] = vOwnCeilHgt + vOwnCeilHgtV1;	
					vVertices++;
	
					vWallVertBuf[3*vVertices]   = psV2->vPosX;	
					vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
					vWallVertBuf[3*vVertices+2] = vOwnCeilHgt + vOwnCeilHgtV2;	
					vVertices++;
		
					/* generate triangles */
					vWallTriBuf[3*vTriangles]   = vLastVertices + 0;
					vWallTriBuf[3*vTriangles+1] = vLastVertices + 1;
					vWallTriBuf[3*vTriangles+2] = vLastVertices + 2;
					vTriangles++;
	
					vWallTriBuf[3*vTriangles]   = vLastVertices + 2;
					vWallTriBuf[3*vTriangles+1] = vLastVertices + 3;
					vWallTriBuf[3*vTriangles+2] = vLastVertices + 0;
					vTriangles++;
					
					vLastVertices += 4;
					vPassage = 1;
					vMode = 1; /* indicate that upper wall part has been generated */
				}
				/* check if upper texture is not needed at all */
				else if (
					(
					/* check vertex 1 */
						(
					   	(vOtherCeilHgt + vOtherCeilHgtV1 >= vOwnCeilHgt + vOwnCeilHgtV1) 
						&& (vOtherFloorHgt + vOtherFloorHgtV1 <= vOwnCeilHgt + vOwnCeilHgtV1)
						)
					/* check vertex 2 */
					|| (
					   	(vOtherCeilHgt + vOtherCeilHgtV2 >= vOwnCeilHgt + vOwnCeilHgtV2) 
						&& (vOtherFloorHgt + vOtherFloorHgtV2 <= vOwnCeilHgt + vOwnCeilHgtV2)
						)
					)
					/* check mode - avoid repeated generation of upper texture in case of below regions */
					&& (vMode == 0)
				)
				{
//						vPassage = 1;
					vMode = 1;
				}
	
				/* lower texture */
				if (
					/* check vertex 1 */
					   (
						   (vOtherFloorHgt + vOtherFloorHgtV1 > vOwnFloorHgt + vOwnFloorHgtV1)
						&& (vOtherFloorHgt + vOtherFloorHgtV1 <= vOwnCeilHgt + vOwnCeilHgtV1)
					   )
					/* check vertex 2 */
					|| (
						   (vOtherFloorHgt + vOtherFloorHgtV2 > vOwnFloorHgt + vOwnFloorHgtV2)
						&& (vOtherFloorHgt + vOtherFloorHgtV2 <= vOwnCeilHgt + vOwnCeilHgtV2)
						)
					)
				{
					vRelevantBelowReg = 0;
					/* switch to next below region */
					if (psOtherNextRegion)
					{
						/* evaluate vertex Z offset for sloped ceilings */
						vOtherNextCeilHgtV1 = 0;
						vOtherNextCeilHgtV2 = 0;
						if(psOtherNextRegion->lFlags & A3_CEIL_ASCEND)
						{
							vOtherNextCeilHgtV1 = psV1->vPosZ;
							vOtherNextCeilHgtV2 = psV2->vPosZ;
						}
						if(psOtherNextRegion->lFlags & A3_CEIL_DESCEND)
						{
							vOtherNextCeilHgtV1 = -psV1->vPosZ;
							vOtherNextCeilHgtV2 = -psV2->vPosZ;
						}
						
						if (
								  (psOtherNextRegion->vCeilHgt + vOtherNextCeilHgtV1 >= vOwnFloorHgt + vOwnFloorHgtV1)
								||(psOtherNextRegion->vCeilHgt + vOtherNextCeilHgtV2 >= vOwnFloorHgt + vOwnFloorHgtV2)
							)
						{
							vWallVertBuf[3*vVertices]   = psV2->vPosX;	
							vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
							vWallVertBuf[3*vVertices+2] = psOtherNextRegion->vCeilHgt + vOtherNextCeilHgtV2;
							vVertices++;
			
							vWallVertBuf[3*vVertices]   = psV1->vPosX;	
							vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
							vWallVertBuf[3*vVertices+2] = psOtherNextRegion->vCeilHgt + vOtherNextCeilHgtV1;	
							vVertices++;
							vRelevantBelowReg = 1;
							/* do not change vMode here - wall is not complete yet */
						}
					}
					/* no or not relevant below region - close the gap */
					if (!vRelevantBelowReg)
					{
						vWallVertBuf[3*vVertices]   = psV2->vPosX;	
						vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
						vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vOwnFloorHgtV2;
						vVertices++;
		
						vWallVertBuf[3*vVertices]   = psV1->vPosX;	
						vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
						vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vOwnFloorHgtV1;	
						vVertices++;
						vMode = 2; /* indicate that wall is complete */
					}	
					vWallVertBuf[3*vVertices]   = psV1->vPosX;	
					vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
					vWallVertBuf[3*vVertices+2] = vOtherFloorHgt + vOtherFloorHgtV1;	
					vVertices++;
	
					vWallVertBuf[3*vVertices]   = psV2->vPosX;	
					vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
					vWallVertBuf[3*vVertices+2] = vOtherFloorHgt + vOtherFloorHgtV2;	
					vVertices++;
	
					/* generate triangles */
					vWallTriBuf[3*vTriangles]   = vLastVertices + 0;
					vWallTriBuf[3*vTriangles+1] = vLastVertices + 1;
					vWallTriBuf[3*vTriangles+2] = vLastVertices + 2;
					vTriangles++;
	
					vWallTriBuf[3*vTriangles]   = vLastVertices + 2;
					vWallTriBuf[3*vTriangles+1] = vLastVertices + 3;
					vWallTriBuf[3*vTriangles+2] = vLastVertices + 0;
					vTriangles++;
					
					vLastVertices += 4;
					vPassage = 1;
	
				}
	
				if (
					(
					   (vOtherCeilHgt + vOtherCeilHgtV1 >= vOwnCeilHgt + vOwnCeilHgtV1)
					&& (vOtherFloorHgt + vOtherFloorHgtV1 <= vOwnFloorHgt + vOwnFloorHgtV1)
					)
					|| (						
						   (vOtherCeilHgt + vOtherCeilHgtV2 >= vOwnCeilHgt + vOwnCeilHgtV2)
						&& (vOtherFloorHgt + vOtherFloorHgtV2 <= vOwnFloorHgt + vOwnFloorHgtV2)
					)
					)
				{
					/* if there is no special wall setting, do not draw this wall */
					if (((psWall->psWall->lFlags & A3_FENCE) == 0)
					&& ((psWall->psWall->lFlags & A3_TRANSPARENT) == 0)
					/* do not draw invisible walls */
					|| ((psWall->psWall->lFlags & A3_INVISIBLE) == 1)
					)
					{
						vPassage = 1;
					}
				}
			}
	
			if (psOtherNextRegion)
			{
				/* neighbouring region - copy info from REGIONDATA struct*/
				vOtherCeilHgt = psOtherNextRegion->vCeilHgt;
				vOtherFloorHgt = psOtherNextRegion->vFloorHgt;
			}
			
		}while (psOtherNextRegion);
	}

	/* no passage to neighbour region detected - set wall from ceiling to floor - unless it's invisible */
	if (vPassage == 0 && ((psWall->psWall->lFlags & A3_INVISIBLE) == 0)) 
	{
		vWallVertBuf[3*vVertices]   = psV2->vPosX;	
		vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
		vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vOwnFloorHgtV2;
		/* position needs to be interpreted in a special case for fence walls */
		if (psWall->psWall->lFlags & A3_FENCE)
			vWallVertBuf[3*vVertices+2] -= psWall->psWall->vPosition;
		vVertices++;

		vWallVertBuf[3*vVertices]   = psV1->vPosX;	
		vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
		vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vOwnFloorHgtV1;	
		/* position needs to be interpreted in a special case for fence walls */
		if (psWall->psWall->lFlags & A3_FENCE)
			vWallVertBuf[3*vVertices+2] -= psWall->psWall->vPosition;
		vVertices++;

		if ((psWall->psWall->lFlags & A3_FENCE) == 0)
		{
			vWallVertBuf[3*vVertices]   = psV1->vPosX;	
			vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
			vWallVertBuf[3*vVertices+2] = vOwnCeilHgt + vOwnCeilHgtV1;		
			vVertices++;

			vWallVertBuf[3*vVertices]   = psV2->vPosX;	
			vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
			vWallVertBuf[3*vVertices+2] = vOwnCeilHgt + vOwnCeilHgtV2;		
			vVertices++;
		}
		/* fence walls are treated different. Their height is defined by the texture size */
		else
		{
			vHeight = psWall->psWall->psTex->psBmap->vOrigHeight / psWall->psWall->psTex->vScaleY;
			
			vWallVertBuf[3*vVertices]   = psV1->vPosX;	
			vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
			vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vHeight + vOwnFloorHgtV1;		
			/* position needs to be interpreted in a special case for fence walls */
			vWallVertBuf[3*vVertices+2] -= psWall->psWall->vPosition;
			vVertices++;

			vWallVertBuf[3*vVertices]   = psV2->vPosX;	
			vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
			vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vHeight + vOwnFloorHgtV2;		
			/* position needs to be interpreted in a special case for fence walls */
			vWallVertBuf[3*vVertices+2] -= psWall->psWall->vPosition;
			vVertices++;
		}
		
		/* generate triangles */
		vWallTriBuf[3*vTriangles]   = vLastVertices + 0;
		vWallTriBuf[3*vTriangles+1] = vLastVertices + 1;
		vWallTriBuf[3*vTriangles+2] = vLastVertices + 2;
		vTriangles++;

		vWallTriBuf[3*vTriangles]   = vLastVertices + 2;
		vWallTriBuf[3*vTriangles+1] = vLastVertices + 3;
		vWallTriBuf[3*vTriangles+2] = vLastVertices + 0;
		vTriangles++;

		vLastVertices += 4;
	}

	/* generate UV map for wall */
	if (vVertices && vTriangles)
	{	
		/* walls with special flag need to be rendered separately.
		 * use secondary buffer for this.
		 * render any wall with attached WDL script separately as well.
		 */
		if (
			   (psWall->psWall->psTex->lFlags & A3_DIAPHANOUS)
			|| (psWall->psWall->psTex->lFlags & A3_GHOST)
			|| (psWall->psWall->lFlags & A3_TRANSPARENT)
			|| (psWall->psWall->lFlags & A3_SCRIPTING)
			)
		{
			psData = regbuf_getSecondaryBuffer();
			regbuf_resetBuffer(psData);
		}
		
		//make_buildWallUV(psWall, vVertices, vTriangles, vWallOrientation, psRegion->vAmbient);
		make_buildWallUV(psWall, vVertices, vWallOrientation);
		make_copyWallMesh(psData, psWall, vWallUVBuf, vVertices, vWallVertBuf, vTriangles, vWallTriBuf);				

		/* finish off secondary buffer 
		 * primary buffer is not finished here as more walls may be added.
		 * The primary buffer will be finished off on region level
		 */
		if (
			   (psWall->psWall->psTex->lFlags & A3_DIAPHANOUS)
			|| (psWall->psWall->psTex->lFlags & A3_GHOST)
			|| (psWall->psWall->lFlags & A3_TRANSPARENT)
			|| (psWall->psWall->lFlags & A3_SCRIPTING)
			)
		{
			regbuf_finish(psData);
			lFlags = make_getWallFlags(psWall->psWall);
			WM3_saveMesh(psData, psRegion->vAmbient, lFlags);
			make_wallEnt(psData, psWall->psWall, psRegion);
		}
	}
	
}

void make_buildDoubleWall(WMPWALL* psWall, WMPREGION* psOwnRegion, REGIONDATA* psRegion)
{
	WMPVERTEX* psV1;
	WMPVERTEX* psV2;
	REGIONMESH* psData;
	var vVertices = 0;
	var vLastVertices = 0;
	var vTriangles = 0;
	var vOwnFloorHgt, vOwnCeilHgt;
	var vOwnCeilHgtV1, vOwnCeilHgtV2;
	var vOwnFloorHgtV1, vOwnFloorHgtV2;
	var vWallOrientation;
	var vHeight;
	var i;
	long lFlags;

	/* double sided walls are always isolated - use secondary mesh buffer */
	psData = regbuf_getSecondaryBuffer();
	regbuf_resetBuffer(psData);
	
	/* top region takes region heights from WMP file not from script definition */
	if (psOwnRegion->psRegion == psRegion)
	{
		vOwnFloorHgt = psOwnRegion->vFloorHgt;
		vOwnCeilHgt  = psOwnRegion->vCeilHgt;
	}
	/* below region must take heights from script */
	else
	{
		vOwnFloorHgt = psRegion->vFloorHgt;
		vOwnCeilHgt  = psRegion->vCeilHgt;
	}

	/* calculate vertex z offset for sloped regions */
	vOwnFloorHgtV1 = 0;
	vOwnFloorHgtV2 = 0;
	vOwnCeilHgtV1  = 0;
	vOwnCeilHgtV2  = 0;
	if(psRegion->lFlags & A3_FLOOR_ASCEND)
	{
		vOwnFloorHgtV1 = psV1->vPosZ;
		vOwnFloorHgtV2 = psV2->vPosZ;
	}
	if(psRegion->lFlags & A3_FLOOR_DESCEND)
	{
		vOwnFloorHgtV1 = -psV1->vPosZ;
		vOwnFloorHgtV2 = -psV2->vPosZ;
	}
	if(psRegion->lFlags & A3_CEIL_ASCEND)
	{
		vOwnCeilHgtV1  = psV1->vPosZ;
		vOwnCeilHgtV2  = psV2->vPosZ;
	}
	if(psRegion->lFlags & A3_CEIL_DESCEND)
	{
		vOwnCeilHgtV1  = -psV1->vPosZ;
		vOwnCeilHgtV2  = -psV2->vPosZ;
	}

	/* do everything twice - for both wall sides */
	for (i = 0; i < 2; i++)
	{
		vVertices = 0;
		vLastVertices = 0;
		vTriangles = 0;

		if (i == 0)
		{
			psV2 = psWall->psVertex1;
			psV1 = psWall->psVertex2;
			vWallOrientation = 1;
		}
		else
		{
			psV1 = psWall->psVertex1;
			psV2 = psWall->psVertex2;
			vWallOrientation = -1;
		}

		if ((psWall->psWall->lFlags & A3_INVISIBLE) == 0) 
		{
			vWallVertBuf[3*vVertices]   = psV2->vPosX;	
			vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
			vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vOwnFloorHgtV2;
			/* position needs to be interpreted in a special case for fence walls */
			if (psWall->psWall->lFlags & A3_FENCE)
				vWallVertBuf[3*vVertices+2] -= psWall->psWall->vPosition;
			vVertices++;

			vWallVertBuf[3*vVertices]   = psV1->vPosX;	
			vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
			vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vOwnFloorHgtV1;	
			/* position needs to be interpreted in a special case for fence walls */
			if (psWall->psWall->lFlags & A3_FENCE)
				vWallVertBuf[3*vVertices+2] -= psWall->psWall->vPosition;
			vVertices++;

			if ((psWall->psWall->lFlags & A3_FENCE) == 0)
			{
				vWallVertBuf[3*vVertices]   = psV1->vPosX;	
				vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
				vWallVertBuf[3*vVertices+2] = vOwnCeilHgt + vOwnCeilHgtV1;		
				vVertices++;
	
				vWallVertBuf[3*vVertices]   = psV2->vPosX;	
				vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
				vWallVertBuf[3*vVertices+2] = vOwnCeilHgt + vOwnCeilHgtV2;		
				vVertices++;
			}
			/* fence walls are treated different. Their height is defined by the texture size */
			else
			{
				vHeight = psWall->psWall->psTex->psBmap->vOrigHeight / psWall->psWall->psTex->vScaleY;
				
				vWallVertBuf[3*vVertices]   = psV1->vPosX;	
				vWallVertBuf[3*vVertices+1] = -psV1->vPosY;	
				vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vHeight + vOwnFloorHgtV1;		
				/* position needs to be interpreted in a special case for fence walls */
				vWallVertBuf[3*vVertices+2] -= psWall->psWall->vPosition;
				vVertices++;
	
				vWallVertBuf[3*vVertices]   = psV2->vPosX;	
				vWallVertBuf[3*vVertices+1] = -psV2->vPosY;	
				vWallVertBuf[3*vVertices+2] = vOwnFloorHgt + vHeight + vOwnFloorHgtV2;		
				/* position needs to be interpreted in a special case for fence walls */
				vWallVertBuf[3*vVertices+2] -= psWall->psWall->vPosition;
				vVertices++;
			}
			
			/* generate triangles */
			vWallTriBuf[3*vTriangles]   = vLastVertices + 0;
			vWallTriBuf[3*vTriangles+1] = vLastVertices + 1;
			vWallTriBuf[3*vTriangles+2] = vLastVertices + 2;
			vTriangles++;

			vWallTriBuf[3*vTriangles]   = vLastVertices + 2;
			vWallTriBuf[3*vTriangles+1] = vLastVertices + 3;
			vWallTriBuf[3*vTriangles+2] = vLastVertices + 0;
			vTriangles++;

			vLastVertices += 4;
		}

		/* generate UV map for wall */
		if (vVertices && vTriangles)
		{
			make_buildWallUV(psWall, vVertices, vWallOrientation);
			make_copyWallMesh(psData, psWall, vWallUVBuf, vVertices, vWallVertBuf, vTriangles, vWallTriBuf);				
		}
	}
	regbuf_finish(psData);
	lFlags = make_getWallFlags(psWall->psWall);
	WM3_saveMesh(psData, psRegion->vAmbient, lFlags);
 
	make_wallEnt(psData, psWall->psWall, psRegion);
}

void make_buildWallUV(WMPWALL* psWall, var vVertices, var vWallOrientation)
{
	ENTITY* entLevel;
	LPD3DXMESH psMesh;
	BMAP* psBmap;
	var i,j;
	
	for (i = 0; i < vVertices; i++)
	{
		/* left or right sided wall? */
		vWallUVBuf[i*2] = vWallOrientation;
		/* vertical texture offset - horizontal position is derived via wall length later */					
		vWallUVBuf[i*2+1] = vWallVertBuf[3*i+2];

		if (psWall->psWall->lFlags & A3_PORTCULLIS || psWall->psWall->lFlags & A3_FENCE)
		{
			//psWall->vOffsetY = 0; /* Y Offset is ignored on fence and portcullis walls */

			/* texture attached to bottom of wall - substract z values of vertices 0 and 1 */
			if (psWall->psWall->vPosition == 0 || psWall->psWall->lFlags & A3_FENCE)
			{
				j = i&3;
				switch(j)
				{	
					case 0:
					case 1:
						vWallUVBuf[i*2+1] = 0;
						break;
					case 2:
						vWallUVBuf[i*2+1] -= vWallVertBuf[3*(i-1)+2];
						break;
					case 3:
						vWallUVBuf[i*2+1] -= vWallVertBuf[3*(i-3)+2];
						break;
				}
			}
			/* texture attached to top of wall - substract z values of vertices 2 and 3 */
			else
			{
				j = i&3;
				switch(j)
				{	
					case 0:
						vWallUVBuf[i*2+1] -= vWallVertBuf[3*(i+3)+2];
						break;
					case 1:
						vWallUVBuf[i*2+1] -= vWallVertBuf[3*(i+1)+2];
						break;
					case 2:
					case 3:
						vWallUVBuf[i*2+1] =0;
						break;
				}
			}
		}	
	}
}

void make_copyWallMesh(REGIONMESH* psData, WMPWALL* psWall, var* vUVBuf, var vVertices, var* vVertexBuf, var vTriangles, int* iTriangleBuf)
{
	var i;
	var j;
	var k;
	var vScaleX, vScaleY;
	var vOffsetX, vOffsetY;
	var vPixelX, vPixelY;
	var vVertOffs;
	var vTriOffs;
	var vTexId;
	TEXDATA* psTex;
	VECTOR vecN;
	var vNormalFound;

	/* setup buffer offsets */
	vVertOffs = psData->vVertices;
	vTriOffs  = psData->vTriangles;
	
	/* setup texture scaling information */
	psTex = psWall->psWall->psTex;
	vTexId = regbuf_getTexId(psData, psTex);

	vPixelX = psTex->psBmap->vOrigWidth;
	vScaleX = psTex->vScaleX / vPixelX;

	vPixelY = psTex->psBmap->vOrigHeight;
	vScaleY = psTex->vScaleY / vPixelY;

	if (psWall->psWall->vOffsetX == 0) /* only use WED X offset when no explicit offset was defined in script */
		vOffsetX = psWall->vOffsetX % vPixelX;	/* offset from WED - always positive */
	else
		vOffsetX = psWall->psWall->vOffsetX % vPixelX; /* offset from script - always positive */

	/* ignore y offset for portcullis walls */
	if (psWall->psWall->lFlags & A3_PORTCULLIS || psWall->psWall->lFlags & A3_FENCE)
	{
		vOffsetY = 0;
	}
	else
	{
		if (psWall->psWall->vOffsetY == 0) /* only use WED Y offset when no explicit offset was defined in script */
			vOffsetY = psWall->vOffsetY; /* offset from WED - can also be negative */
		else
			vOffsetY = psWall->psWall->vOffsetY; /* offset from script - can also be negative */
	}
	
	vOffsetX /= psTex->vScaleX;
	vOffsetY /= psTex->vScaleY;
	
	if (regbuf_checkBuffer(psData, vVertices, vTriangles) && vTexId >= 0)
	{
		vNormalFound = 0;
		vec_set(&vecN, nullvector); /* in case nonormal can be found */

		/* copy faces */
		for (i = 0; i < vTriangles; i++)
		{
			/* adjust index in order to skip degenerated faces */
			j = i + vTriOffs;

			if (vNormalFound == 0)
			{
				if (face_checkDegenerated(vVertexBuf, iTriangleBuf, i, &vecN) == 0) 
				{
					/* I would love to drop degenerated faces here, but unfortunately the var data
					 * type is THAT unprecise that non degenerated faces with awkward forms are
					 * detected as degenerated and vice versa.
					 *
					 * To overcome this, I now don't remove degenerated faces, but instead just pick
					 * the first non degenerated face for normal calculation.
					 * OH WELL...
					 */
					vNormalFound = 1;
				}
			}
			/* auto cast int -> var */
			psData->vTriangleBuf[3*j]   = iTriangleBuf[3*i] + psData->vVertices;
			psData->vTriangleBuf[3*j+1] = iTriangleBuf[3*i+1] + psData->vVertices;
			psData->vTriangleBuf[3*j+2] = iTriangleBuf[3*i+2] + psData->vVertices;
		
			psData->vSkinBuf[j] = vTexId;
		}
		
		if (vNormalFound == 0)
		{
			#ifdef SYSMSG_ACTIVE
			SYSMSG_print(SYSMSG_SYSTEM, "WARNING: could not generate wall normal");			
			#endif
		}
			
		/* copy vertices */
		for (i = k = 0; i < vVertices; i++)
		{
			j = i + vVertOffs;
	
			/* automatically casted to float */
			psData->vVertexBuf[j*3]   = vVertexBuf[i*3];	
			psData->vVertexBuf[j*3+1] = vVertexBuf[i*3+2];	
			psData->vVertexBuf[j*3+2] = -vVertexBuf[i*3+1];	
	
			/* copy uv map 
			 * vUVBuf[2*i]   contains wall orientation (left sided -1 or right sided +1)
			 * vUVBuf[2*i+1] contains y texture offset due to POSITION or PORTCULLIS
			 *
			 * depending on wall orientation either vertices 0 and 3 (right side)
			 * or vertices 1 and 2 (left side) need the wall length as offset added
			 */
			 
			if (((k == 0 || k == 3) && vUVBuf[2*i] == 1) || ((k == 1 || k == 2) && vUVBuf[2*i] == -1))
				psData->vUVBuf[2*j] = (psWall->vLength + vOffsetX) * vScaleX * vUVBuf[2*i];
			else
				psData->vUVBuf[2*j] = vOffsetX * vScaleX * vUVBuf[2*i];	
	
			psData->vUVBuf[2*j+1] = -(vOffsetY + vUVBuf[2*i+1]) * vScaleY;	
	
			/* copy normals */
			psData->vNormalBuf[3*j]   = vecN.x;
			psData->vNormalBuf[3*j+1] = vecN.z;
			psData->vNormalBuf[3*j+2] = -vecN.y;
	
			k++;
			k &= 3; /* cycle from 0 to 3 */
		}
	
		/* update buffer counters
		 * it is necessary to decrease the number of triangles by the count
		 * of degenerated faces as the psData content does not carry any
		 * degenerated triangles anymore
		 */
		regbuf_updateCount(psData, vVertices, vTriangles);
	}
}

long make_getWallFlags(WALLDATA* psWall)
{
	long lFlags = 0;
	
	/* translucent wall */
	if (
		(
			(psWall->psTex->lFlags & A3_DIAPHANOUS)
		|| (psWall->psTex->lFlags & A3_GHOST)
		)
		&& (psWall->lFlags & A3_TRANSPARENT)
	)
	{
		lFlags |= A3_DIAPHANOUS;
	}
	/* transparent wall - black parts invisible) */
	if ((psWall->lFlags & A3_TRANSPARENT))
	{
		lFlags |= A3_TRANSPARENT;
	}
	/* passable wall */
	if ((psWall->lFlags & A3_PASSABLE))
	{
		lFlags |= A3_PASSABLE;
	}
	/* wall has script attached */
	if ((psWall->lFlags & A3_SCRIPTING))
	{
		lFlags |= A3_SCRIPTING;
	}
	
	
	return lFlags;
}