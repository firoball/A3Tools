/*
 *******************************************************************************
 * filecopy.c
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
 * Script for file copy routines
 *
 * Comments
 * 
 * for short descriptions see comments in filecopy.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for file copy routines.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>
#include <strio.c>
#include "parser.h"
//#include "makepal.h"
#include "lbm2bmp.h"


/* ----- FUNCTIONS ----- */
 
 
void copy_files(STRING* strSrcPath, STRING* strTgtPath)
{
	bmap_copy(strSrcPath, strTgtPath);
	model_copy(strSrcPath, strTgtPath);
}

void bmap_copy(STRING* strSrcPath, STRING* strTgtPath)
{
	var i, j, n;
	var r;
	var vProcessed;
	BMAPDATA* psBmap;
	BMAPDATA* psBmapPrev;
	BMAP* bmapScaled;
	var vNewWidth, vNewHeight;
	var vSquared;
	STRING* strTemp = str_create("");
	STRING* strFile = str_create("");
	STRING* strPathFileIn = str_create("");
	STRING* strPathFileOut = str_create("");
	STRING* strParseMsg = str_create("");
	//STRING* strPalette;
	STRING* strScaledFile;

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "copy bitmaps started...");
	#endif

#ifdef DONE_BY_A3CONV
	/* first copy palette */
	//strPalette = parser_getPalette(); --done by a3conv
	//pal_create(strSrcPath, strTgtPath, strPalette); --done by a3conv

	/* copy palette to root dir - engine needs it there */
	str_cpy(strPathFileOut, strTgtPath);
	str_cat(strPathFileOut, "palette.raw");
	if(!file_cpy("palette.raw", strPathFileOut))
	{
		#ifdef SYSMSG_ACTIVE
		//str_printf(strParseMsg, "WARNING: copy of %s failed", strPalette->chars);
		//SYSMSG_print(SYSMSG_ERROR, strParseMsg);
		SYSMSG_print(SYSMSG_ERROR, "WARNING: copy of palette.raw failed");
		#endif
	}
#endif

	n = getNumBmap();
	for (i = 0; i < n; i++)
	{
		psBmap = parser_getBmapdata(i);
		vProcessed = 0;
		if (i > 0)
		{
			/* search previous bitmaps for same name */
			for (j = 0; j < i && !vProcessed; j++)
			{
				psBmapPrev = parser_getBmapdata(j);
				if (str_cmpi(psBmap->strFileName, psBmapPrev->strFileName)
					&& psBmapPrev->vRelevant) 
				{
					vProcessed = 1;
				}
			}
		}

		/* only copy the bitmaps which have not yet been processed */
		if (psBmap->vRelevant && !vProcessed)
		{
			str_cpy(strFile, psBmap->strFileName);

			#ifdef SYSMSG_ACTIVE
			SYSMSG_print(SYSMSG_SYSTEM, strFile);
			#endif

			/* convert lbm and bbm files to bmp */
			if(psBmap->vConvert)
			{
				lbm2bmp(strSrcPath, strTgtPath, strFile);
			}
			/* copy bmp and pcx files */
			else
			{
				str_cpy (strPathFileIn, strSrcPath);
				str_cat (strPathFileIn, strFile);
				str_cpy (strPathFileOut, strTgtPath);
				str_cat (strPathFileOut, strFile);
				if(!file_cpy(strPathFileOut, strPathFileIn))
				{
					#ifdef SYSMSG_ACTIVE
					str_printf(strParseMsg, "WARNING: copy of %s failed", strFile->chars);
					SYSMSG_print(SYSMSG_ERROR, strParseMsg);
					#endif
				}
			}
		}

		/*! \todo: there should be no extra IF case. needs rework 
		 *  Currently rescaling is done several times. Uncool.
		 */
		if (psBmap->vRelevant)
		{
			/* bitmap is relevant - load bitmap data now */
			str_cpy(strTemp, strTgtPath); /* needed for published version */
			str_cat(strTemp, psBmap->strName);
			psBmap->bmapTex = bmap_create(strTemp); //will be done by WM3 loader later
			if (psBmap->bmapTex != NULL)
			{
				psBmap->vWidth = bmap_width(psBmap->bmapTex);
				psBmap->vHeight = bmap_height(psBmap->bmapTex);
				psBmap->vOrigWidth = psBmap->vWidth;
				psBmap->vOrigHeight = psBmap->vHeight;
			}
			else
			{
				/* no texture assigned - prevent division by zero */
				psBmap->vWidth = 1;
				psBmap->vHeight = 1;
				psBmap->vOrigWidth = 1;
				psBmap->vOrigHeight = 1;
			}

			if (psBmap->vSkin == SKIN)
			{
				/* resize bitmaps if necessary - they need to be power of two in width and height */
				vSquared = 64;
				while((psBmap->vWidth > vSquared) && (vSquared < 2048)) 
					vSquared *= 2;
				vNewWidth = vSquared;
					
				vSquared = 64;
				while((psBmap->vHeight > vSquared) && (vSquared < 2048)) 
					vSquared *= 2;
				vNewHeight = vSquared;
	
				/* check if rescaling of bitmap is necessary */
				if(psBmap->vWidth != vNewWidth || psBmap->vHeight != vNewHeight)
				{
					strScaledFile = bmap_scale(psBmap, vNewWidth, vNewHeight, strTgtPath);
					str_cpy(psBmap->strName, strScaledFile);
					ptr_remove(strScaledFile);
					psBmap->vWidth = vNewWidth;
					psBmap->vHeight = vNewHeight;
					/* drop old bmap */
					bmap_purge(psBmap->bmapTex);
					ptr_remove(psBmap->bmapTex);
					/* create new bmap */
					str_cpy(strTemp, strTgtPath); /* needed for published version */
					str_cat(strTemp, psBmap->strName);
					psBmap->bmapTex = bmap_create(strTemp);
		
					#ifdef SYSMSG_ACTIVE
					str_printf(strParseMsg, "%s resized", psBmap->strId->chars);
					SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
					#endif
				}
			}
			bmap_to_mipmap(psBmap->bmapTex); 
		}
	}
	ptr_remove(strFile);
	ptr_remove(strPathFileIn);
	ptr_remove(strPathFileOut);
	ptr_remove(strTemp);
	ptr_remove(strParseMsg);
	
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "copy bitmaps done.\r\n");
	#endif
}

STRING* bmap_scale(BMAPDATA* psBmap, var vNewWidth, var vNewHeight, STRING* strTgtPath)
{
	STRING* strFile;
	STRING* strPathFile;
	STRING* strTemp;
	long i;
	var j;
	var vPixel;
	var vFormat;
	COLOR colPixel;
	BMPDATA* psBmp;
	long lColor;
	char cPalIndex;
	var vX, vY;
	long lSize;
		
	strFile = str_create("");
	strTemp = str_create("");

	/* scaling has to be done in a more complex way as it sounds
	 * There are several steps do be done.
	 */

	/* Generate target file name: "<orig name>_<width>x<height>.bmp" */
	strPathFile = str_create(strTgtPath);
	str_cpy(strFile, psBmap->strName);

	str_replace(strFile, ".bmp", "");
	str_replace(strFile, ".pcx", "");
	str_replace(strFile, ".lbm", "");
	str_replace(strFile, ".bbm", "");
	str_replaceall(strFile, "#", "");
	str_cat(strFile, "_"); 
	str_for_num(strTemp, vNewWidth);
	str_cat(strFile, strTemp);
	str_cat(strFile, "x"); 
	str_for_num(strTemp, vNewHeight);
	str_cat(strFile, strTemp);
	str_cat(strFile, ".bmp");
	str_cat(strPathFile, strFile);

	/* Now save a palettized .bmp 
	 * since a 24 bit 888 Bitmap was scaled, it is necessary to
	 * save it in true color instead of palettized 8 bit
	 */
	psBmp = BMP_create(vNewWidth, vNewHeight, 24);
	/* save image data */
	vFormat = bmap_lock(psBmap->bmapTex, 0);
	lSize = vNewWidth * vNewHeight; /* auto cast */
	for (i = 0; i < lSize; i++)
	{
		vX = i % vNewWidth;
		vY = integer(i / vNewWidth);
		/* scale pixel position to old bitmap */
		vX = integer(vX * psBmap->vWidth / vNewWidth);
		vY = integer(vY * psBmap->vHeight / vNewHeight);
		vPixel = pixel_for_bmap(psBmap->bmapTex, vX, vY);
		pixel_to_vec(&colPixel, NULL, vFormat, vPixel);
		BMP_setImg(psBmp, &colPixel, i);
	}
	BMP_write(strPathFile, psBmp);
	bmap_unlock(psBmap->bmapTex);
	BMP_remove(psBmp);

	/* cleanup */
	//ptr_remove(strFile); // must be removed in calling function!!
	ptr_remove(strPathFile);
	ptr_remove(strTemp);

	return strFile;
}

void model_copy(STRING* strSrcPath, STRING* strTgtPath)
{
	var i, j, n;
	var vProcessed;
	MODELDATA* psModel;
	MODELDATA* psModelPrev;
	STRING* strFile = str_create("");
	STRING* strPathFileIn = str_create("");
	STRING* strPathFileOut = str_create("");
	STRING* strParseMsg = str_create("");

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "copy models started...");
	#endif

	n = getNumModel();
	for (i = 0; i < n; i++)
	{
		psModel = parser_getModeldata(i);
		vProcessed = 0;
		if (i > 0)
		{
			/* search previous models for same name */
			for (j = 0; j < i && !vProcessed; j++)
			{
				psModelPrev = parser_getModeldata(j);
				if (str_cmpi(psModel->strFileName, psModelPrev->strFileName)
					&& psModelPrev->vRelevant)
				{ 
					vProcessed = 1;
				}
			}
		}

		/* only copy the models which have not yet been processed */
		if (psModel->vRelevant && !vProcessed)
		{
			str_cpy(strFile, psModel->strFileName);

			#ifdef SYSMSG_ACTIVE
			SYSMSG_print(SYSMSG_SYSTEM, strFile);
			#endif

			str_cpy (strPathFileIn, strSrcPath);
			str_cat (strPathFileIn, strFile);
			str_cpy (strPathFileOut, strTgtPath);
			str_cat (strPathFileOut, strFile);
			if(!file_cpy(strPathFileOut, strPathFileIn))
			{
				#ifdef SYSMSG_ACTIVE
				str_printf(strParseMsg, "WARNING: copy of %s failed", strFile->chars);
				SYSMSG_print(SYSMSG_ERROR, strParseMsg);
				#endif
			}
		}

	}
	ptr_remove(strFile);
	ptr_remove(strPathFileIn);
	ptr_remove(strPathFileOut);
	ptr_remove(strParseMsg);
		
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "copy models done.\r\n");
	#endif
}
