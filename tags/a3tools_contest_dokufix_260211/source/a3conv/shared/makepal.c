/*
 *******************************************************************************
 * makepal.c
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
 * Script for palette extractor
 *
 * Comments
 * 
 * for short descriptions see comments in makepal.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for palette extractor.
 */

/* ----- INCLUDES ----- */
 
 
#include "lbm2bmp.h"


/* ----- GLOBALS ----- */
 
 
long* lPalette = NULL;
long lCurrentPalette[256];


/* ----- FUNCTIONS ----- */


void pal_create(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile)
{

	var vHandle;
	var vFail = 0;
	var l;
	STRING* strTgtFile = str_create("");
	STRING* strSrcFile = str_create("");

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "Creating palette.raw...");
	#endif

	/* source */
	str_cpy (strSrcFile, strSrcPath);
	str_cat (strSrcFile, strFile);

	/* target */
	str_cpy (strTgtFile, strTgtPath);
	str_cat (strTgtFile, "palette.raw");
	
	l = str_stri(strFile, ".lbm");
	if (l <= 0)
		l = str_stri(strFile, ".bbm");
	/* handle lbm and bbm */
	if (l > 0)
	{
		/* use lbm converter to extract palette */
		vFail = readLbm(strSrcFile);
		if (!vFail)
		{
			lPalette = lbm2bmp_getPalette();
			pal_writeRaw(strTgtFile);
			pal_copy(lPalette);
			/* cleanup */
			lbm2bmp_cleanup();
		}
		else
		{
			printf("invalid palette file: %s", strFile->chars);
		}
	}
	else 
	{
		l = str_stri(strFile, ".pcx");
		/* handle pcx directly in makepal */
		if (l > 0)
		{
			vFail = pal_readPcx(strSrcFile);
			if (!vFail)
			{
				pal_writeRaw(strTgtFile);
				pal_copy(lPalette);
				pal_cleanup();
			}
		}
		else
		{
			printf("invalid palette file: %s", strFile->chars);
		}
	}
	
	ptr_remove(strTgtFile);
	ptr_remove(strSrcFile);
}

void pal_writeRaw(STRING* strFile)
{
	long i;
	long lColors = 256; /* assume always 8 bit */
	long lFirstColor;
	var vHandle = file_open_write(strFile);
	if (vHandle)
	{
		/* first color must be 0/0/0 */
		lFirstColor = 0;
		putrgb(vHandle, lFirstColor);
		
		/* write palette */
		for (i = 1; i < lColors; i++)
		{
			putrgb(vHandle, lPalette[i]);
		}
		file_close(vHandle);
	}
}

var pal_readPcx(STRING* strFile)
{
	var vHandle = file_open_read(strFile);
	int iDummy;
	int iVersion;
	var vLength;
	var i;
	char cR, cG, cB;
	var vFail = 0;
	
	if (vHandle)
	{
		vLength = file_length(vHandle);
		iDummy = get8(vHandle);
		iVersion = get8(vHandle);

		/* only PCX version 5 is supported */
		if (iVersion == 5)
		{
			for (i = 2; i < vLength - 769; i++)
			{
				/* skip the whole content - palette is stored at the end of file */
				iDummy = get8(vHandle);
			}
			iDummy = get8(vHandle);
			/* 12 means there is a 256 color palette coming up next... */
			if (iDummy == 12)
			{
				lPalette = (long*)sys_malloc(sizeof(long) * 256);
				for (i = 0; i < 256; i++)
				{
					cB = get8(vHandle);
					cG = get8(vHandle);
					cR = get8(vHandle);
					lPalette[i] = rgb(cR, cG, cB);
				}
			}
			else
			{
				printf("no palette found in pcx file");
				vFail = 1;
			}
		}
		else
		{
			printf("wrong pcx file version.");
			vFail = 1;
		}
		 
		file_close(vHandle);
	}
	else
		vFail = 1;
		
	return vFail;
}

void pal_cleanup()
{
	if (lPalette != NULL)
		sys_free(lPalette);
}

void pal_copy(long* lPal)
{
	var i;
	
	/* copy palette to permanent buffer */
	for (i= 0; i < 256; i++)
	{
		lCurrentPalette[i] = lPal[i];
	}
}

char pal_getIndex(long lColor)
{
	var i;
	char cRetVal;
	var vRetVal;
	
	i = 0;
	vRetVal = -1; /* error value */
	
	/* search through palette until matching color was found */
	do
	{
		if (lCurrentPalette[i] == lColor)
			vRetVal = i;
		i++;
	}while ((i < 256) && (vRetVal == -1));
	
	cRetVal = vRetVal; /* auto cast */

	return cRetVal;
}

long pal_getColor(char cIndex)
{
	if (cIndex >= 0 && cIndex < 256)
		return lCurrentPalette[cIndex];
	else
		return -1;
}
