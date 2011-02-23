/*
 *******************************************************************************
 * makeent.c
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
 * Script for entity creation
 *
 * Comments
 * 
 * for short descriptions see comments in makeent.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for entity creation.
 */

/* ----- INCLUDES ----- */


#include <d3d9.h>

#include "regbuf.h"
#include "parser.h"
#include "a3Sky.h"


/* ----- FUNCTIONS ----- */


void make_regionEnt(REGIONMESH* psData, REGIONDATA* psRegion)
{
	LPD3DXMESH psMesh;
	TEXDATA* psTex;
	MATERIAL* psMat;
	ENTITY* entLevel;
	BMAP* psBmap;
	var i;
	
	/* create the entity */
	psMesh = regbuf_createMesh(psData);
	entLevel = ent_create (CUBE_MDL, &psData->vecPos, NULL);
	ent_clone(entLevel);
	ent_setmesh(entLevel, psMesh, 0, 0);

	for (i = 0; i < psData->vSkins; i++)
	{
		psTex = regbuf_getTexById(psData, i);
		psBmap = psTex->psBmap->bmapTex;
		psMat = mtl_create();
		psMat->albedo = psTex->vAlbedo + 100;
		psMat->ambient_blue  = psTex->vAmbient + 150;
		psMat->ambient_red   = psMat->ambient_blue;
		psMat->ambient_green = psMat->ambient_blue;

		ent_setskin(entLevel, psBmap, i+1);
		ent_mtlset (entLevel, psMat,  i+1);
		/* sky textures need shader */
		if (psTex->lFlags & A3_SKY)
		{
			entLevel->material = mtl_create();
			a3Sky_init(entLevel, i, psMat);
		}
	}

	entLevel->ambient = 50+psRegion->vAmbient;
	entLevel->eflags |= CLIP1;
	entLevel->flags |= POLYGON;
	c_setminmax(entLevel);
	wait(1);
	entLevel->emask &= ~DYNAMIC; 
}

void make_wallEnt(REGIONMESH* psData, WALLDATA* psWall, REGIONDATA* psRegion)
{
	LPD3DXMESH psMesh;
	TEXDATA* psTex;
	MATERIAL* psMat;
	ENTITY* entLevel;
	BMAP* psBmap;
	var i;

	/* create wall and set all needed flags */
	psMesh = regbuf_createMesh(psData);

	entLevel = ent_create (CUBE_MDL, &psData->vecPos, NULL);
	ent_clone(entLevel);
	ent_setmesh(entLevel, psMesh, 0, 0);

	/* translucent wall */
	if (((psWall->psTex->lFlags & A3_DIAPHANOUS)
	|| (psWall->psTex->lFlags & A3_GHOST))
	&& (psWall->lFlags & A3_TRANSPARENT)
	)
	{
		entLevel->flags |= TRANSLUCENT;
		entLevel->alpha = 50;
	}
	/* transparent wall - black parts invisible) */
	if ((psWall->lFlags & A3_TRANSPARENT))
	{
		entLevel->flags |= OVERLAY;
	}

	for (i = 0; i < psData->vSkins; i++)
	{
		psTex = psData->psTexBuf[0]; /* only single skin */
		psBmap = psTex->psBmap->bmapTex;

		psMat = mtl_create();
		psMat->albedo = psTex->vAlbedo + 100;
		psMat->ambient_blue  = psTex->vAmbient + 150;
		psMat->ambient_red   = psMat->ambient_blue;
		psMat->ambient_green = psMat->ambient_blue;

		ent_setskin(entLevel, psBmap, i+1);
		ent_mtlset (entLevel, psMat,  i+1);
		/* sky textures need shader */
		if (psWall->psTex->lFlags & A3_SKY)
		{
			entLevel->material = mtl_create();
			a3Sky_init(entLevel, i, psMat);
		}
	}

	entLevel->ambient = 50 + psRegion->vAmbient; 
	entLevel->eflags |= CLIP1;
	entLevel->flags |= POLYGON;
	c_setminmax(entLevel);
	wait(1);
	entLevel->emask &= ~DYNAMIC;
}

void make_cleanupRegions()
{
	/* remove everything from memory. */
	 
	ENTITY* entTemp;
	ENTITY* entNext;
	LPD3DXMESH psMesh;
	var i;
	
	entTemp = ent_next(NULL);	

	while (entTemp != NULL)
	{
		entNext = ent_next(entTemp);	

		/* remove mesh */
		if (!(entTemp->flags & FLAG1))
		{
			psMesh = ent_getmesh(entTemp,0,0);
			psMesh->Release();
			ent_setmesh(entTemp, NULL,0,0);
			for (i = 0; i < ent_status(entTemp, 8); i++)
				ent_setskin(entTemp, NULL, i+1);
			/* remove entity */
			ptr_remove(entTemp);
		}
			
		entTemp = entNext;	
	}
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "Make regions memory released.");
	#endif
	
}