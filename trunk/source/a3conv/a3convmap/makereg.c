/*
 *******************************************************************************
 * makereg.c
 * Creation date: 04.08.2010
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
 * Script for region maker
 *
 * Comments
 * 
 * for short descriptions see comments in makereg.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for region maker.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>

#include "mapload.h"
#include "parser.h"
#include "maketris.h"
#include "makewall.h"
#include "facecalc.h"
#include "regbuf.h"
#include "wm3save.h"

#include "makeent.h"


/* ----- GLOBALS ----- */


STRING* strLog;

/* static buffers */
var vVertBuf[3000]; /* 1000 vertices should do! */
var vVertZBuf[1000]; /* 1000 vertices should do! */
int vTriFloorBuf[4500]; /* 1500 triangles for the insane... */
int vTriCeilBuf[4500]; /* 1500 triangles for the insane... */
var vContBuf[100]; /* try to reach it */
WMPWALL* psWallBuf[1000]; /* as many walls as vertices... */

var vCntRegionContours;
var vCntRegionVerts;
var vCntRegionWalls;
var vCntContourVerts;
var* vUsedVertBuf;
var* vLWallInUse;
var* vRWallInUse;

var vTemp;


/* ----- FUNCTIONS ----- */


void make_regions()
{
	var i;
	WMPREGION* psMakeRegion;
	REGIONDATA* psRegion;
	REGIONMESH* psData;
	CONFIG* psConfig;
	var vExportWm3;

	var vFirstVertex;
	var vCurrentVertex;
	var vCntTriangles = 0;
	var vFail = 0;
	
	/* get configuration */
	psConfig = config_getSettings();
	vExportWm3 = psConfig->vExportWm3;

	strLog = str_create("");
	/* buffer is used to memorize which walls have been already checked */
	/* this is requried for full detection of regions with multiple contours (regions with holes) */
	vLWallInUse = (var*)sys_malloc(sizeof(var) * mapload_getNumWalls());
	vRWallInUse = (var*)sys_malloc(sizeof(var) * mapload_getNumWalls());
	memset((void*)vLWallInUse, 0, sizeof(var) * mapload_getNumWalls());
	memset((void*)vRWallInUse, 0, sizeof(var) * mapload_getNumWalls());

	/* buffer to memorize which vertices have already been used by a region
	 * this is necessary to detect self touching regions. this needs to be fixed with a trick
	 * done in makeRegionvertex()
	 */
	vUsedVertBuf = (var*)sys_malloc(sizeof(var) * mapload_getNumVertices());	 
	
	/* clear vertex and contour buffers */
	memset((void*)vVertBuf, 0, sizeof(var)*3000);
	memset((void*)vVertZBuf, 0, sizeof(var)*1000);
	memset((void*)vContBuf, 0, sizeof(var)*100);
	memset((void*)vTriFloorBuf, 0, sizeof(var)*4500);
	memset((void*)vTriCeilBuf, 0, sizeof(var)*4500);


	max_entities = 20000;
	level_load("");
	vec_set(&screen_color, vector(255,0,0));

	var vRegion = 0;
	var vSingleRegion = 0; // for testing purposes - only process single region
	var vMakeMesh = 1; // for testing purposes - do not create meshes

	var vRegionMax = mapload_getNumRegions();
	psMakeRegion = mapload_getRegions();

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "Make regions started...");
	#endif
	
	WM3_writeMeshHeader();
	do
	{
		/* filter all border regions. They have same floor and ceil hgt 
		 * Do not filter border regions which have another below region
		 * I have no idea why someone should do this, but it has been done
		 * so I have to support it
		 */
		if (psMakeRegion[vRegion].vCeilHgt != psMakeRegion[vRegion].vFloorHgt 
		|| psMakeRegion[vRegion].psRegion->psRegionBelow != NULL)
		{
			vCntRegionVerts = 0;
			vCntRegionWalls = 0;
			vCntContourVerts = 0;
			vCntRegionContours = 0;
			vCntTriangles = 0;
			vFail = 0;
			/* mark all vertices as unused for fresh start of region contour build */
			memset((void*)vUsedVertBuf, 0, sizeof(var) * mapload_getNumVertices());

			/* iterate through vertex data until no new chunk of region walls is found */
			do
			{
				/* start with getting first neighbour vertex and hope it delivers sth. useful */
				vFirstVertex = make_getRegionVertex(STARTVERTEX, vRegion);
				if (vFirstVertex != NOVERTEX)
				{
					vCurrentVertex = vFirstVertex;
					/* now iterate through all walls and pick the walls next to
					 * current one until loop is closed
					 */
					do
					{
						vCurrentVertex = make_getRegionVertex(vCurrentVertex, vRegion);
						if (vCurrentVertex == NOVERTEX)
						{
							#ifdef SYSMSG_ACTIVE
							str_printf(strLog, "WARNING: REGION #%d damaged!", (int)vRegion); 
							SYSMSG_print(SYSMSG_SYSTEM, strLog);
							#endif
							vFail = 1; /* intentionally break loop */
						}
					}while (vCurrentVertex != vFirstVertex && !vFail);
					vContBuf[vCntRegionContours] = vCntContourVerts;	
					vCntRegionContours++;
				}
			}while (vFirstVertex != NOVERTEX && !vFail);

			if (!vFail) /* do not process degenerated regions */
			{

				sys_marker("mkd"); // for debug reasons: DLL fail
				/* triangulate and update floor / ceil mesh */
				if (vMakeMesh)
				{
					/* maketris_triangulate() fills vTriFloorBuf with the generated triangles 
					 *
					 * maketris_triangulate is a DLL call from maketris.dll
					 * if there are layered vertices or overlapping walls this DLL will simply crash.
					 * I tried to fix it so it returns 0 in case of an error,
					 * but this triangulation lib has the worst hand obfuscated traditional italian
					 * food style code I've seen in a long time.
					 * In short: I failed and I never want to see again what is inside this DLL.
					 * If it crashes even after all the patches this converter applies...
					 * ...BUILD PROPER LEVELS IN A3 WED!
					 */
					vCntTriangles = maketris_triangulate(vCntRegionContours, vContBuf, vVertBuf, vTriFloorBuf);
					/* fill vTriCeilBuf - this is done by altering the floor triangle buffer vTriFloorBuf */
					make_copyCeilMesh(&psMakeRegion[vRegion], vCntRegionVerts, vCntTriangles);
				}
				else
				{
					vCntTriangles = 0;
				}
				sys_marker("mkx"); // for debug reasons: no DLL fail
	
				if (vCntTriangles == 0)
				{
					#ifdef SYSMSG_ACTIVE
					str_printf(strLog, "WARNING: mesh error region #%d", (int)vRegion); 
					SYSMSG_print(SYSMSG_SYSTEM, strLog);
					#endif
				}

				psRegion = psMakeRegion[vRegion].psRegion;
				/* loop through complete region stack */	
				do {
					/* if a border region has a below region, it is required
					 * to calculate the floor and ceiling mesh based on the
					 * border region. But border regions must not be rendered. Ignore it here.
					 */
					
					if (psRegion != psMakeRegion[vRegion].psRegion 
						|| psMakeRegion[vRegion].vCeilHgt != psMakeRegion[vRegion].vFloorHgt)
					{
						/* get and clean buffer for region mesh */
						psData = regbuf_getBuffer();
						regbuf_resetBuffer(psData);
		
						/* first build all walls of region */				
						for (i = 0; i < vCntRegionWalls; i++)
						{
							make_buildWall(psData, psWallBuf[i], &psMakeRegion[vRegion], psRegion);
						}
	
						/* now build floor and ceiling */
						if (vCntTriangles > 0)
						{
							make_floorCeil(psData, &psMakeRegion[vRegion], psRegion, vCntTriangles);
	
							regbuf_finish(psData);
							if (vExportWm3 != 0)
							{
								WM3_saveMesh(psData, psRegion->vAmbient, (psRegion->lFlags & A3_SCRIPTING));
							}

							/* create entity from meshdata */
							make_regionEnt(psData, psRegion);
						}
						
	
					}
					else
					{
						#ifdef SYSMSG_ACTIVE
						str_printf(strLog, "ignoring border region #%d", (int)vRegion); 
						SYSMSG_print(SYSMSG_SYSTEM, strLog);
						#endif
					}

					psRegion = psRegion->psRegionBelow;
				}while (psRegion != NULL);

				#ifdef SYSMSG_ACTIVE
				str_printf(strLog, "REGION #%d: Vert %d Tris %d Tex %d", 
					(int)vRegion, (int)psData->vVertices, (int)psData->vTriangles, (int)psData->vSkins); 
				SYSMSG_print(SYSMSG_SYSTEM, strLog);
				#endif
			} /* endif FAIL */
		}

		vRegion++;
	} while((vRegion < vRegionMax) && (!vSingleRegion));
	//WM3_finishMesh(); /* must not be called here due to necessary workaround */

	
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "Make regions done.\r\n");
	#endif
	
	/* clear all buffers */
	ptr_remove(strLog);
	sys_free(vLWallInUse);
	sys_free(vRWallInUse);
	sys_free(vUsedVertBuf);
}

void make_floorCeil(REGIONMESH* psData, WMPREGION* psWmpRegion, REGIONDATA* psRegion, var vCntTriangles)
{
	/* build floor and ceiling polygons for region and below regions */
	
	var vCeilHgt;
	var vFail;
	
	/* for speed reasons, triangulation is only done once per region.
	 * since all floors and ceilings of the original region and all below regions
	 * have the same shape, it is possible to derieve all polygon planes from the
	 * first triangulated polygon using some strange offset routines.
	 *
	 * algorithm:
	 * - start with region floor. If current region is a below region, patch floor height
	 * - patch meshdata for ceiling (flip faces) and update z Pos.
	 */

	/* check for below region
	 * for below regions the z positions of the floor polygon vertices have to be adapted
	 */
	if (psRegion != psWmpRegion->psRegion)
	{
		make_patchBelowMesh(psRegion, vCntRegionVerts);
	}
	/* copy polygon mesh to region mesh buffer */
	make_copyRegionMesh(psData, psRegion, FLOOR, vCntRegionVerts, vVertBuf, vCntTriangles, vTriFloorBuf);
	
	
	/* generate d3d mesh for ceiling */
	/* check if current region is top region or below region */
	if (psRegion == psWmpRegion->psRegion)
	{
	 	/* for top region the z position of the ceiling is taken from WED setting (WMP file) */
		vCeilHgt = psWmpRegion->vCeilHgt;
	}
	else
	{
	 	/* for below regions the z position of the ceiling is taken from script definition */
		vCeilHgt = psRegion->vCeilHgt;
	}
	make_patchCeilMesh(psRegion, vCeilHgt, vCntRegionVerts);
	/* copy polygon mesh to region mesh buffer */
	make_copyRegionMesh(psData, psRegion, CEILING, vCntRegionVerts, vVertBuf, vCntTriangles, vTriCeilBuf);
}

/*! \todo: try to move all the patch routines into separate functions to reduce the mess */
var make_getRegionVertex(var vVertexId, var vRegionId)
{
	var i;
	WMPWALL* psMakeWall;
	VECTOR vecPatch;
	VECTOR vecPatchSub;

	/* this function is tricky.
	 * it evaluates which vertex belongs to which region and sorts them so the
	 * triangulation lib can generate triangles from this information.
	 * This is done by marching through the wall information and searching the
	 * next wall which shares a vertex with the current wall.
	 * This way shapes can be detected. Open shapes will be dropped, although
	 * Acknex3 was able to render even those. But it is not the way regions should
	 * be built - better fix the WMP file with A3 WED if this happens.
	 * Regions can have holes (they can surround other regions).
	 * In order to take care of this, a single region can contain multiple shapes
	 * which are tracked by a contour counter.
	 * with all this information the triangulation lib can build a usable mesh.
	 */
	 
	/* reference path for structs
	 * WMPWALL
	 *    WMPREGION psRegionLeft
	 *        vId, vFloorHgt, vCeilHgt
	 *        REGIONDATA psRegion
	 *            lFlags
	 *    WMPREGION psRegionRight
	 *        (see above)
	 *    WMPVERTEX psVertex1
	 *        vPosX, vPosY, vPosZ
	 *    WMPVERTEX psVertex2
	 *        (see above)
	 */
	 
	psMakeWall = mapload_getWalls();
	for (i = 0; i < mapload_getNumWalls(); i++)
	{
		/* drop walls with same region on both sides (this means isolated wall - not relevant for triangulation) */
		if (psMakeWall[i].psRegionLeft->vId != psMakeWall[i].psRegionRight->vId)
		{
			/* left or right sided wall? - determines whether vertex1 or vertex2 is right one for return */
			if ((psMakeWall[i].psRegionLeft->vId == vRegionId) && (!vLWallInUse[psMakeWall[i].vId]))
			{

				/* for left sided walls vertices must be interchanged!! */
				
				if ((psMakeWall[i].psVertex2->vId == vVertexId) || (vVertexId == STARTVERTEX))
				{
					/* VERTEX 2 
					 * every run will only add one new vertex and reuse 
					 * vertex 2 (= vertex 1 of the last wall) 
					 */
					
	
					/* VERTEX 1 
					 * this vertex is also relevant for the next wall - return it */
					vVertBuf[3*vCntRegionVerts]   = psMakeWall[i].psVertex1->vPosX;
					vVertBuf[3*vCntRegionVerts+1] = -psMakeWall[i].psVertex1->vPosY;
					vVertBuf[3*vCntRegionVerts+2] = psMakeWall[i].psRegionLeft->vFloorHgt;
	
					/* check for lifted regions and update z Position */
					if (psMakeWall[i].psRegionLeft->psRegion->lFlags & A3_FLOOR_ASCEND)
					{
						vVertBuf[3*vCntRegionVerts+2] += psMakeWall[i].psVertex1->vPosZ;
					}
					else if (psMakeWall[i].psRegionLeft->psRegion->lFlags & A3_FLOOR_DESCEND)
					{
						vVertBuf[3*vCntRegionVerts+2] -= psMakeWall[i].psVertex1->vPosZ;
					}
					/* unmodified z value of vertices - required for below regions */
					vVertZBuf[vCntRegionVerts] = psMakeWall[i].psVertex1->vPosZ;
	
					/* first vertex of contour
					 * - reset vertex counter
					 * - do not set region as used - as only start vertex is taken, but no wall built
					 */
					if (vVertexId != STARTVERTEX)
					{
						/* check for self touching region. Fix it by truncating wall length a little bit.
						 * Also check for layered vertices (their patch flag is set). The same fix applies...
						 *
						 * condition (1): same vertex was already used
						 * condition (2): vertex layers another vertex of the same region
						 *
						 * I'll go to hell for this hack... */
						if ((vUsedVertBuf[psMakeWall[i].psVertex1->vId] > 0) || (psMakeWall[i].psVertex1->vPatch > 0))
						{
							/* vertex 1 */
							vec_set(&vecPatch, vector(psMakeWall[i].psVertex1->vPosX, psMakeWall[i].psVertex1->vPosY, 0));
							/* substract vertex 2 to get wall vector */
							/* use patched vertex */
							vec_sub(&vecPatch, vector(psMakeWall[i].psVertex2->vPosX, psMakeWall[i].psVertex2->vPosY, 0));

							/* truncate wall length - means endvertex is moved*/
							vec_set(&vecPatchSub, &vecPatch);
							vec_normalize(&vecPatchSub, 0.01);
							vec_sub(&vecPatch, &vecPatchSub);
							/* rebuild vertex 1 */
							vVertBuf[3*vCntRegionVerts] = vecPatch.x + psMakeWall[i].psVertex2->vPosX;
							vVertBuf[3*vCntRegionVerts+1] = -(vecPatch.y + psMakeWall[i].psVertex2->vPosY);

							#ifdef SYSMSG_ACTIVE
							str_printf(strLog, "Vertex %d patched", (int)psMakeWall[i].psVertex1->vId);
							SYSMSG_print(strLog);
							#endif
						}

						/* second vertex is checked for patchlevel = 2. This means it's the second point of the previous overlapping wall.
						 * move this vertex afterwards to make sure it will not touch another wall anymore
						 * this is only possible if.... 
						 * - vertex1 is not the first vertex of the contour (contour counter must not be 0)
						 * - vertex1 is not flagged as wall vertex to patch (patchlevel = 2) - this would mean current wall is overlapping
						 * otherwise it messes up
						 * This is insanely dirty... */
						 if ((psMakeWall[i].psVertex2->vPatch > 1) && (psMakeWall[i].psVertex1->vPatch < 2) && (vCntContourVerts > 0))
						 {
							 vec_set(&vecPatch, vector(psMakeWall[i].psVertex2->vPosX, psMakeWall[i].psVertex2->vPosY, 0));
							/* substract vertex 1 to get wall vector */
							vec_sub(&vecPatch, vector(psMakeWall[i].psVertex1->vPosX, psMakeWall[i].psVertex1->vPosY, 0));
							/* truncate wall length - means endvertex is moved*/
							vec_set(&vecPatchSub, &vecPatch);
							vec_normalize(&vecPatchSub, 0.01);
							vec_sub(&vecPatch, &vecPatchSub);
							vVertBuf[3*(vCntRegionVerts-1)] = vecPatch.x + psMakeWall[i].psVertex1->vPosX;
							vVertBuf[3*(vCntRegionVerts-1)+1] = -(vecPatch.y + psMakeWall[i].psVertex1->vPosY);
 						}
						vLWallInUse[psMakeWall[i].vId] = 1;
						psWallBuf[vCntRegionWalls] = &psMakeWall[i];

						vCntContourVerts++;
						vCntRegionVerts++;
						vCntRegionWalls++;

						vUsedVertBuf[psMakeWall[i].psVertex1->vId] = 1;
					}
					else
					{
						vCntContourVerts = 0;
					}
									
					return psMakeWall[i].psVertex1->vId;
				}
			}
			else if ((psMakeWall[i].psRegionRight->vId == vRegionId) && (!vRWallInUse[psMakeWall[i].vId]))
			{
				if ((psMakeWall[i].psVertex1->vId == vVertexId) || (vVertexId == STARTVERTEX))
				{
					/* VERTEX 1 
					 * every run will only add one new vertex and reuse 
					 * vertex 1 (= vertex 2 of the last wall)
					 */
	
					/* VERTEX 2 
					 * this vertex is also relevant for the next wall - return it */
					vVertBuf[3*vCntRegionVerts]   = psMakeWall[i].psVertex2->vPosX;
					vVertBuf[3*vCntRegionVerts+1] = -psMakeWall[i].psVertex2->vPosY;
					vVertBuf[3*vCntRegionVerts+2] = psMakeWall[i].psRegionRight->vFloorHgt;
	
					/* check for lifted regions and update z Position */
					if (psMakeWall[i].psRegionRight->psRegion->lFlags & A3_FLOOR_ASCEND)
					{
						vVertBuf[3*vCntRegionVerts+2] += psMakeWall[i].psVertex2->vPosZ;
					}
					else if (psMakeWall[i].psRegionRight->psRegion->lFlags & A3_FLOOR_DESCEND)
					{
						vVertBuf[3*vCntRegionVerts+2] -= psMakeWall[i].psVertex2->vPosZ;
					}
					/* unmodified z value of vertices - required for below regions */
					vVertZBuf[vCntRegionVerts] = psMakeWall[i].psVertex2->vPosZ;
	
					/* first vertex of contour
					 * - reset vertex counter
					 * - do not set region as used - as only start vertex is taken, but no wall built
					 */
					if (vVertexId != STARTVERTEX)
					{
						/* check for self touching region. Fix it by truncating wall length a little bit.
						 * Also check for layered vertices (their patch flag is set). The same fix applies...
						 *
						 * condition (1): same vertex was already used
						 * condition (2): vertex layers another vertex of the same region
						 * 
						 * I'll go to hell for this hack... */
						if ((vUsedVertBuf[psMakeWall[i].psVertex2->vId] > 0) || (psMakeWall[i].psVertex2->vPatch > 0))
						{
							/* vertex 2 */
							vec_set(&vecPatch, vector(psMakeWall[i].psVertex2->vPosX, psMakeWall[i].psVertex2->vPosY, 0));
							/* substract vertex 1 to get wall vector */
							/* use patched vertex */
							vec_sub(&vecPatch, vector(psMakeWall[i].psVertex1->vPosX, psMakeWall[i].psVertex1->vPosY, 0));
							/* truncate wall length - means endvertex is moved*/
							vec_set(&vecPatchSub, &vecPatch);
							vec_normalize(&vecPatchSub, 0.01);
							vec_sub(&vecPatch, &vecPatchSub);
							/* rebuild vertex 1 */
							vVertBuf[3*vCntRegionVerts] = vecPatch.x + psMakeWall[i].psVertex1->vPosX;
							vVertBuf[3*vCntRegionVerts+1] = -(vecPatch.y + psMakeWall[i].psVertex1->vPosY);

							#ifdef SYSMSG_ACTIVE
							str_printf(strLog, "Vertex %d patched", (int)psMakeWall[i].psVertex1->vId);
							SYSMSG_print(strLog);
							#endif
						}

						/* first vertex is checked for patchlevel = 2. This means it's the second point of the previous overlapping wall.
						 * move this vertex afterwards to make sure it will not touch another wall anymore
						 * this is only possible if.... 
						 * - vertex2 is not the first vertex of the contour (contour counter must not be 0)
						 * - vertex2 is not flagged as wall vertex to patch (patchlevel = 2) - this would mean current wall is overlapping
						 * otherwise it messes up
						 * This is insanely dirty... */
						 if ((psMakeWall[i].psVertex1->vPatch > 1) && (psMakeWall[i].psVertex2->vPatch < 2) && (vCntContourVerts > 0))
						 {
							 vec_set(&vecPatch, vector(psMakeWall[i].psVertex1->vPosX, psMakeWall[i].psVertex1->vPosY, 0));
							/* substract vertex 2 to get wall vector */
							vec_sub(&vecPatch, vector(psMakeWall[i].psVertex2->vPosX, psMakeWall[i].psVertex2->vPosY, 0));
							/* truncate wall length - means endvertex is moved*/
							vec_set(&vecPatchSub, &vecPatch);
							vec_normalize(&vecPatchSub, 0.01);
							vec_sub(&vecPatch, &vecPatchSub);
							vVertBuf[3*(vCntRegionVerts-1)] = vecPatch.x + psMakeWall[i].psVertex2->vPosX;
							vVertBuf[3*(vCntRegionVerts-1)+1] = -(vecPatch.y + psMakeWall[i].psVertex2->vPosY);
 						}
 						
						vRWallInUse[psMakeWall[i].vId] = 1;
						psWallBuf[vCntRegionWalls] = &psMakeWall[i];

						vCntContourVerts++;
						vCntRegionVerts++;
						vCntRegionWalls++;

						vUsedVertBuf[psMakeWall[i].psVertex2->vId] = 1;
					}
					else
					{
						vCntContourVerts = 0;
					}
					
					return psMakeWall[i].psVertex2->vId;
				}
			}
		
		}
		/* wall is bordered by the same region on both sides - not allowed for region contour 
		 * It is only put to the wall buffer but is not part of the contour.
		 */
		else
		{
			/* mark wall as used as it must not be added to any contour - regardless which region */
			vLWallInUse[psMakeWall[i].vId] = 1;
			vRWallInUse[psMakeWall[i].vId] = 1;
			if (psMakeWall[i].psRegionLeft->vId == vRegionId)
			{
				/* but put it to the wall render pipeline if it matches the current region
				 * This is an isolated wall.
				 */
				psWallBuf[vCntRegionWalls] = &psMakeWall[i]; 
				vCntRegionWalls++;
			}
		}
	}

	/* no vertex found or all contours processed */
	return NOVERTEX;
}

void make_patchBelowMesh(REGIONDATA* psRegion, var vCntVerts)
{
	/* As the base floor polygon is built based on the floor height set
	 * in WED of the top region, the z offset has to be adjusted for
	 * below regions only.
	 */	
	var i;
	
	for (i = 0; i < vCntVerts; i++)
	{
		
		vVertBuf[3*i+2] = psRegion->vFloorHgt;
		if (psRegion->lFlags & A3_FLOOR_ASCEND)
		{
			vVertBuf[3*i+2] += vVertZBuf[i];
		}
		else if (psRegion->lFlags & A3_FLOOR_DESCEND)
		{
			vVertBuf[3*i+2] -= vVertZBuf[i];
		}
		
	}
}

void make_copyCeilMesh(WMPREGION* psWmpRegion, var vCntVerts, var vCntTris)
{
	/* for generating the ceiling it is simply sufficient to flip all
	 * faces of the floor polygon
	 */	
	var i;
	
	for (i = 0; i < vCntTris; i++)
	{
		/* flip triangles */
		vTriCeilBuf[3*i]     = vTriFloorBuf[3*i];
		vTriCeilBuf[3*i + 1] = vTriFloorBuf[3*i + 2];
		vTriCeilBuf[3*i + 2] = vTriFloorBuf[3*i + 1];
	}

}

void make_patchCeilMesh(REGIONDATA* psRegion, var vCeilHgt, var vCntVerts)
{
	/* here a region of type REGIONDATA (WDL parser format) is
	 * evaluated since below regions are fully script based
	 * and unknown to WED
	 * triangles are not flipped as buffer can be reused from top region 
	 */	
	var i;
	
	for (i = 0; i < vCntVerts; i++)
	{
		
		vVertBuf[3*i+2] = vCeilHgt;
		if (psRegion->lFlags & A3_CEIL_ASCEND)
		{
			vVertBuf[3*i+2] += vVertZBuf[i];
		}
		else if (psRegion->lFlags & A3_CEIL_DESCEND)
		{
			vVertBuf[3*i+2] -= vVertZBuf[i];
		}
		
	}
}

void make_copyRegionMesh(REGIONMESH* psData, REGIONDATA* psRegion, var vType, var vVertices, var* vVertexBuf, var vTriangles, int* iTriangleBuf)
{
	var i,j;
	var vScaleX, vScaleY;
	var vPixelX, vPixelY;
	var vVertOffs;
	var vTriOffs;
	var vTexId;
	var vOffsetX, vOffsetY;
	TEXDATA* psTex;
	VECTOR vecN;
	var vNormalFound;
	
	/* setup buffer offsets */
	vVertOffs = psData->vVertices;
	vTriOffs  = psData->vTriangles;
	
	/* floor or ceiling? */
	if (vType == CEILING)
	{
		psTex = psRegion->psCeilTex;
		vOffsetX = psRegion->vCeilOffsetX / psTex->vScaleX;
		vOffsetY = psRegion->vCeilOffsetY / psTex->vScaleY;
	}
	else
	{
		psTex = psRegion->psFloorTex;
		vOffsetX = psRegion->vFloorOffsetX / psTex->vScaleX;
		vOffsetY = psRegion->vFloorOffsetY / psTex->vScaleY;
	}
	
	/* setup texture scaling information */
	vTexId = regbuf_getTexId(psData, psTex);

	vPixelX = psTex->psBmap->vOrigWidth;
	vScaleX = psTex->vScaleX / vPixelX;
		
	vPixelY = psTex->psBmap->vOrigHeight;
	vScaleY = psTex->vScaleY / vPixelY;

	
	if (regbuf_checkBuffer(psData, vVertices, vTriangles) && vTexId >= 0)
	{
		
		vNormalFound = 0;
		vec_set(&vecN, nullvector); /* in case no normal can be found */
		
		/* copy faces */
		for (i = 0; i < vTriangles; i++)
		{
			/* adjust index in order to sip degenerated faces */
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
		
		/* awkward shaped faces will create wrong normal */
		if (vNormalFound == 0)
		{
			#ifdef SYSMSG_ACTIVE
			SYSMSG_print(SYSMSG_SYSTEM, "WARNING: could not generate region normal");			
			#endif
		}

		/* copy vertices */
		for (i = 0; i < vVertices; i++)
		{
			j = i + vVertOffs;
	
			/* automatically casted to float */
			psData->vVertexBuf[j*3]   = vVertexBuf[i*3];	
			psData->vVertexBuf[j*3+1] = vVertexBuf[i*3+2];	
			psData->vVertexBuf[j*3+2] = -vVertexBuf[i*3+1];	
	
			/* copy uv map */
			psData->vUVBuf[2*j]   = (vVertexBuf[i*3] + vOffsetX) * vScaleX;	
			psData->vUVBuf[2*j+1] = (-vVertexBuf[i*3+1] + vOffsetY) * vScaleY;	
	
			/* copy normals */
			psData->vNormalBuf[3*j]   = vecN.x;
			psData->vNormalBuf[3*j+1] = vecN.z;
			psData->vNormalBuf[3*j+2] = -vecN.y;
		}
	
		/* update buffer counters
		 * it is necessary to decrease the number of triangles by the count
		 * of degenerated faces as the psData content does not carry any
		 * degenerated triangles anymore
		 */
		regbuf_updateCount(psData, vVertices, vTriangles );
	}
}



