/*
 *******************************************************************************
 * bmpwrite.c
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
 * Script for bmp exporter
 *
 * Comments
 * 
 * for short descriptions see comments in bmpwrite.h
 *
 *******************************************************************************
 */
 
/*! \file 
 *  Script for bmp exporter.
 */


/* ----- FUNCTIONS ----- */


void BMP_write(STRING* strFile, BMPDATA* psBmp)
{
	/* writes a palettized or true color uncompressed bmp */
	long lType = 0x4D42;
	long lInfoSize = 40;
	long lHeaderSize = 14;
	long lTemp = 0;
	long lOffset;
	long lSize;
	long lPlanes = 1;
	long lBits;
	long lImgSize;
	long lImgSizePadded;
	long lColors;
	long lPaddedWidth;
	long lRow, lCol;
	long i, l;

	/* bmp info / header size */
	lOffset = lInfoSize + lHeaderSize;
	if (psBmp->cImgP != NULL)
	{
		/* palette size */
		lOffset += 256 * 4;
		lBits = 8;
		lColors = 256;
	}
	else
	{
		/* true color - no palette */
		lBits = 24;
		lColors = 0;
	}
	/* image data */
	/* BMPs get aligned to a width multiple of 4 */
	/* nonmatching sizes need to be padded       */
	if (psBmp->lWidth % 4)
		lPaddedWidth = (4 - (psBmp->lWidth % 4)) + psBmp->lWidth;
	else
		lPaddedWidth = psBmp->lWidth;
		
	lSize = lOffset + (lPaddedWidth * psBmp->lHeight * (lBits / 8));
	/* image size (padded)*/
	lImgSizePadded = lPaddedWidth * psBmp->lHeight * (lBits / 8);
	/* image size (unpadded) */
	lImgSize = psBmp->lWidth * psBmp->lHeight;
	
	var vHandle = file_open_write(strFile);
	if (vHandle)
	{
		/* write file header */
		bmpput16(vHandle, lType);
		bmpput32(vHandle, lSize);		
		bmpput32(vHandle, lTemp);		
		bmpput32(vHandle, lOffset);		
		bmpput32(vHandle, lInfoSize);		

		/* write info header */
		bmpput32(vHandle, psBmp->lWidth);		
		bmpput32(vHandle, psBmp->lHeight);		
		bmpput16(vHandle, lPlanes);		
		bmpput16(vHandle, lBits);		
		bmpput32(vHandle, lTemp);	//no compression
		bmpput32(vHandle, lImgSizePadded);		
		bmpput32(vHandle, lTemp);	//no hor ppm resolution
		bmpput32(vHandle, lTemp);	//no ver ppm resolution
		bmpput32(vHandle, lColors);		
		bmpput32(vHandle, lColors);

		/* palettized image */
		if (psBmp->cImgP != NULL)
		{
			/* write palette */
			for (i = 0; i < lColors; i++)
			{
				bmpput32(vHandle, psBmp->lPal[i]);
			}
	
			/* write image data */
			l = 0;
			for (i = 0; i < lImgSize; i++)
			{
				/* flip rows */
				lRow = i / psBmp->lWidth; /* row */
				lCol = i % psBmp->lWidth; /* col */
				lCol += psBmp->lWidth * (psBmp->lHeight - lRow - 1); 
				bmpput8(vHandle, (psBmp->cImgP)[lCol]);
				l++;
				if(l >= psBmp->lWidth)
				{
					for(l = 0; l < lPaddedWidth - psBmp->lWidth; l++)
						bmpput8(vHandle, 0);
					l = 0;
				}
			}		
		}
		/* true color image */
		else
		{
			/* write image data */
			l = 0;
			for (i = 0; i < lImgSize; i++)
			{
				/* flip rows */
				lRow = i / psBmp->lWidth; /* row */
				lCol = i % psBmp->lWidth; /* col */
				lCol += psBmp->lWidth * (psBmp->lHeight - lRow - 1); 
				bmpput8(vHandle, (psBmp->cImgB)[lCol]);
				bmpput8(vHandle, (psBmp->cImgG)[lCol]);
				bmpput8(vHandle, (psBmp->cImgR)[lCol]);
				l++;
				if(l >= psBmp->lWidth)
				{
					for(l = 0; l < lPaddedWidth - psBmp->lWidth; l++)
					{
						bmpput8(vHandle, 0);
						bmpput8(vHandle, 0);
						bmpput8(vHandle, 0);
					}
					l = 0;
				}
			}		
		}
		file_close(vHandle);
	}
}

BMPDATA* BMP_create(long lWidth, long lHeight, var vDepth)
{
	BMPDATA* psBmp;
	
	psBmp = (BMPDATA*)sys_malloc(sizeof(BMPDATA));

	psBmp->cImgP = NULL;
	psBmp->cImgR = NULL;
	psBmp->cImgG = NULL;
	psBmp->cImgB = NULL;

	/* palettized or true color bitmap? */
	if (vDepth == 8)
	{
		psBmp->cImgP = (char*)sys_malloc(sizeof(char) * lWidth * lHeight);
	}
	else /* any stupid parameter will lead to true color image */
	{
		psBmp->cImgR = (char*)sys_malloc(sizeof(char) * lWidth * lHeight);
		psBmp->cImgG = (char*)sys_malloc(sizeof(char) * lWidth * lHeight);
		psBmp->cImgB = (char*)sys_malloc(sizeof(char) * lWidth * lHeight);
	}
	
	psBmp->lWidth = lWidth;
	psBmp->lHeight = lHeight;
	
	return psBmp;
}

void BMP_remove(BMPDATA* psBmp)
{
	if (psBmp != NULL)
	{
		if (psBmp->cImgP != NULL)
			sys_free(psBmp->cImgP);
		if (psBmp->cImgR != NULL)
			sys_free(psBmp->cImgR);
		if (psBmp->cImgG != NULL)
			sys_free(psBmp->cImgG);
		if (psBmp->cImgB != NULL)
			sys_free(psBmp->cImgB);
		sys_free(psBmp);
	}
}

void BMP_setPal(BMPDATA* psBmp, long lColor, char cIdx)
{
	if (psBmp->cImgP != NULL)
		psBmp->lPal[cIdx] = lColor;
	else
		error("BMP_setPal: Cannot set palette color. Bitmap is not palettized!");
}

void BMP_setImg(BMPDATA* psBmp, char cPalIdx, long lIdx)
{
	/* palettized images only */
	if (psBmp->cImgP != NULL)
		(psBmp->cImgP)[lIdx] = cPalIdx;
	else
		error("BMP_setImg: Cannot set palette index. Bitmap is not palettized!");
}

void BMP_setImg(BMPDATA* psBmp, COLOR* colPixel, long lIdx)
{
	/* true color images only */
	if (psBmp->cImgR != NULL)
	{
		(psBmp->cImgR)[lIdx] = colPixel->red;
		(psBmp->cImgG)[lIdx] = colPixel->green;
		(psBmp->cImgB)[lIdx] = colPixel->blue;
	}
	else
		error("BMP_setImg: Cannot set color. Bitmap is not true color!");
}
