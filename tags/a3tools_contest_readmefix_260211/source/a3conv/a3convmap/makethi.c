/*
 *******************************************************************************
 * makethi.c
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
 * Script for thing generator
 *
 * Comments
 * 
 * for short descriptions see comments in makethi.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for thing generator.
 */


/* ----- INCLUDES ----- */


#include <acknex.h>

#include "mapload.h"
#include "parser.h"
#include "a3defs.h"
#include "wm3save.h"
#include "config.h"


/* ----- EXTERNAL FUNCTIONS ----- */


void make_things(STRING* strTgtPath)
{
	/* this function simply loops through all things and places them accordingly
	 * of course some special flags and constellations have to be handled
	 *
	 * In the end, everything is exported to the WM3 file entity after entity
	 */
	 
	VECTOR vecTemp;
	var vTemp;
	var vTraceMode;
	var i;
	var n;
	var vType;
	var vTexId;
	var vMeshScale;
	var vExportWm3;
	long lFlags;
	ENTITY* entLevel;
	BMAP* bmapTex;
	WMPTHING* psThing;
	REGIONDATA* psRegion;
	CONFIG* psConfig;
	STRING* strModel = str_create("");
	
	psThing = mapload_getThings();
	/* get configuration */
	psConfig = config_getSettings();
	vMeshScale = psConfig->vMeshScale;
	vExportWm3 = psConfig->vExportWm3;

	n = mapload_getNumThings();
	WM3_writeObjectHeader(n);
	
	for (i = 0; i < n; i++)
	{
		/* determine object type - written to file */
		if (psThing[i].psThing->psTex->psModel == NULL)
			vType = 1; /* sprite */
		else
			vType = 2; /* model */
			
			
		vecTemp.x = psThing[i].vPosX * vMeshScale;
		vecTemp.y = psThing[i].vPosY * vMeshScale;
		vecTemp.z = 0;
		
		if (vType == 1) /* sprite */
		{
			//vTexId = psThing[i].psThing->psTex->psBmap->vInternalId; /* written to file */
			bmapTex = psThing[i].psThing->psTex->psBmap->bmapTex;
			entLevel = ent_create(SHADOW_DDS, &vecTemp, NULL);
			ent_cloneskin(entLevel);

#ifdef A8beta
			/* original SHADOW_DDS is 128x128 in size
			 * this has to be taken into account when setting the real scale 
			 * by default after ent_setskin the displayed x-size (128 pixels @ scale = 1)
			 * is taken over for the new skin which results in a different default scale
			 * if bitmap sizes between SHADOW_DDS and new bitmap are differing.
			 */
			vTemp = vMeshScale * psThing[i].psThing->psTex->psBmap->vOrigWidth; / 128;
			entLevel->scale_x = vTemp / psThing[i].psThing->psTex->vScaleX;
			entLevel->scale_y = vTemp / psThing[i].psThing->psTex->vScaleY;

			/* height offset calculation
			 * this one is tricky as 50 % of the y scale and the original 
			 * SHADOW_DDS size as well as x/y size aspect have to be taken into account
			 * for correct offset position
			 * the reason for the aspect is, that due to different sizes of SHADOW_DDS and 
			 * the new bitmap, the aspect can change from 1 to any other value
			 */
			vTemp = psThing[i].psThing->psTex->psBmap->vOrigHeight / psThing[i].psThing->psTex->psBmap->vOrigWidth;
			vTemp = 64 * vTemp * entLevel->scale_y; /* offset: 50% of height */
			ent_setskin(entLevel, bmapTex, 1);
#else
			ent_setskin(entLevel, bmapTex, 1);
			vTemp = psThing[i].psThing->psTex->psBmap->vWidth / psThing[i].psThing->psTex->psBmap->vOrigWidth;
			entLevel->scale_x = vMeshScale / psThing[i].psThing->psTex->vScaleX;
			entLevel->scale_x *= vTemp;
			vTemp = psThing[i].psThing->psTex->psBmap->vHeight / psThing[i].psThing->psTex->psBmap->vOrigHeight;
			entLevel->scale_y = vMeshScale / psThing[i].psThing->psTex->vScaleY;
			entLevel->scale_y *= vTemp;
			vTemp = psThing[i].psThing->psTex->psBmap->vOrigHeight * entLevel->scale_y * 0.5; /* offset: 50% of height */
#endif
			/* if entity pan is not 0, ORIENTED flag is set automatically */
			if (psThing[i].psThing->lFlags & A3_FLAT)
			{
				if (psThing[i].vAngle == 0)
					entLevel->pan = 0.01; /* because A8 is stupid and resets ORIENTED flag */
				else
					entLevel = psThing[i].vAngle;
			}
		}
		else /* model */
		{
			str_cpy(strModel, strTgtPath);
			str_cat(strModel, psThing[i].psThing->psTex->psModel->strFileName);
			entLevel = ent_create(CUBE_MDL, &vecTemp, NULL);
			ent_morph(entLevel, strModel);
			entLevel->scale_x = vMeshScale / psThing[i].psThing->psTex->vScaleX;
			entLevel->scale_y = entLevel->scale_x;
			entLevel->scale_z = entLevel->scale_x;

			/* models need their bounding box set in order to calculate the correct position */
			c_setminmax(entLevel);
			if (psThing[i].psThing->lFlags & A3_CANDELABER)
				vTemp = entLevel->max_z;
			else
				vTemp = -entLevel->min_z;
				
			/*! \todo: find out if models need x/y pos correction */

			entLevel->pan = psThing[i].vAngle;
		}
		
		
		/* setup trace mode for entities on slanted regions */
		vTraceMode = USE_POLYGON+IGNORE_ME+IGNORE_SPRITES+IGNORE_CONTENT;
		me = entLevel;

		if (psThing[i].psThing->lFlags & A3_CANDELABER)
		{
			if ((psThing[i].psRegion->psRegion->lFlags & A3_CEIL_DESCEND) || (psThing[i].psRegion->psRegion->lFlags & A3_CEIL_ASCEND))
			{
				/* use c_trace to adjust thing z pos to slanted region */
				/* clumsy - but it was easier to let the engine do this... */
				if (c_trace(vector(vecTemp.x, vecTemp.y, psThing[i].psRegion->vFloorHgt * vMeshScale + 1), 
								vector(vecTemp.x, vecTemp.y, psThing[i].psRegion->vCeilHgt * vMeshScale + 100), vTraceMode) > 0)
					entLevel->z = -vTemp + hit->z + (psThing[i].psThing->vHeight * vMeshScale);
				else
					entLevel->z = -vTemp + (psThing[i].psRegion->vCeilHgt + psThing[i].psThing->vHeight) * vMeshScale;
			}
			else
			{
				entLevel->z = -vTemp + (psThing[i].psRegion->vCeilHgt + psThing[i].psThing->vHeight) * vMeshScale;
			}
		}
		else
		{
			if (psThing[i].psThing->lFlags & A3_GROUND)
				entLevel->z = vTemp + psThing[i].psThing->vHeight * vMeshScale;
			else
			{
				if ((psThing[i].psRegion->psRegion->lFlags & A3_FLOOR_DESCEND) || (psThing[i].psRegion->psRegion->lFlags & A3_FLOOR_ASCEND))
				{
					/* use c_trace to adjust thing z pos to slanted region */
					/* clumsy - but it was easier to let the engine do this... */
					if (c_trace(vector(vecTemp.x, vecTemp.y, psThing[i].psRegion->vCeilHgt * vMeshScale - 1), 
									vector(vecTemp.x, vecTemp.y, psThing[i].psRegion->vFloorHgt * vMeshScale - 100), vTraceMode) > 0)
						entLevel->z = vTemp + hit->z + (psThing[i].psThing->vHeight * vMeshScale);
					else				
						entLevel->z = vTemp + (psThing[i].psRegion->vFloorHgt + psThing[i].psThing->vHeight) * vMeshScale;
				}
				else
				{
					entLevel->z = vTemp + (psThing[i].psRegion->vFloorHgt + psThing[i].psThing->vHeight) * vMeshScale;
				}
			}
		}

		lFlags = 0;			
		/* entity effects */
		if ((psThing[i].psThing->psTex->lFlags & A3_DIAPHANOUS) || (psThing[i].psThing->psTex->lFlags & A3_GHOST))
		{
			entLevel->flags |= TRANSLUCENT;
			entLevel->alpha = 70; /* diaphanous: 30% */
			lFlags |= A3_DIAPHANOUS; /* written to file */
		}
		
		if (psThing[i].psThing->lFlags & A3_INVISIBLE)
		{
			entLevel->flags |= INVISIBLE;
			lFlags |= A3_INVISIBLE; /* written to file */
		}

		psRegion = psThing[i].psRegion->psRegion;
		entLevel->ambient = psThing[i].psThing->psTex->vAmbient + psRegion->vAmbient;
		entLevel->albedo = psThing[i].psThing->psTex->vAlbedo;
		entLevel->flags |= FLAG1; /* important for removal - mark entity as sprite */
		
		/* finally save to file */
		vTexId = psThing[i].psThing->psTex->vInternalId; /* written to file */
		if (vExportWm3 != 0)
			WM3_saveObject(entLevel, vTexId, lFlags);
	}
	ptr_remove(strModel);

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "Make things done.\r\n");
	#endif
}

void make_cleanupThings()
{
	/* remove everything from memory. */

	ENTITY* entTemp;
	ENTITY* entNext;
	var i;
	
	entTemp = ent_next(NULL);	

	while (entTemp != NULL)
	{
		entNext = ent_next(entTemp);	

		/* remove entity */
		if (entTemp->flags & FLAG1)
		{
			for (i = 0; i < ent_status(entTemp, 8); i++)
				ent_setskin(entTemp, NULL, i+1);
			ptr_remove(entTemp);
		}

		entTemp = entNext;	
	}
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "Make things memory released.");
	#endif
	
}