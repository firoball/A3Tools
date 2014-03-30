/*
 *******************************************************************************
 * lbm2bmp.c
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
 * Script for LBM to BMP converter
 *
 * Comments
 * 
 * for short descriptions see comments in lbm2bmp.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for LBM to BMP converter.
 */


/* ----- INCLUDES ----- */


#include <acknex.h>
#include "bmpwrite.h"


/* ----- GLOBALS ----- */


/* global image properties */
long lDepth, lHeight, lWidth;
char cPack;
BMPDATA* lbm2bmp_buf = NULL;


/* ----- FUNCTIONS ----- */


long* lbm2bmp_getPalette() 
{
	if (lbm2bmp_buf != NULL)
		return lbm2bmp_buf->lPal;
	else
		return NULL;
}

void lbm2bmp(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile)
{

	var vHandle;
	var vFail = 0;
	var l;
	STRING* strTarget = str_create("");
	STRING* strPathFile = str_create("");

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "converting...");
	#endif

	l = str_stri(strFile, ".lbm");
	if (l <= 0)
		l = str_stri(strFile, ".bbm");
		
	if (l > 0)
	{
		/* create target filename */
		str_cpy(strTarget, strFile);
		str_trunc(strTarget, str_len(strTarget) - l + 1);
		str_cat(strTarget, ".bmp");
		
		
		str_cpy (strPathFile, strSrcPath);
		str_cat (strPathFile, strFile);

		/* if everything works alright, lbm2bmp_buf will be allocated
		 * within this function */
		vFail = readLbm(strPathFile);

	}
	else
	{
		printf("invalid file extension: %s", strFile->chars);
		vFail = 1;
	}

	if (!vFail)
	{
		str_cpy (strPathFile, strTgtPath);
		str_cat (strPathFile, strTarget);
		BMP_write(strPathFile, lbm2bmp_buf);
	}

	/* cleanup */
	lbm2bmp_cleanup();
	
	ptr_remove(strTarget);
	ptr_remove(strPathFile);
}


var readLbm(STRING* strPathFile)
{
	var vFail = 0;
	long lVal;
	long lDump;

	var vHandle = file_open_read(strPathFile);
	if (vHandle)
	{
		lVal = get32(vHandle);
		if (lVal != CHK_FORM)
		{
			printf("Group identifier (FORM) not found");
			error(strPathFile);
			vFail = 1;
		}
		else
		{
			lDump = get32(vHandle);
			lVal = get32(vHandle);
			if (lVal != CHK_PBM) 
			{
				printf("Form type identifier (PBM ) not found");
				vFail = 1;
			}
			else
			{
				lVal = get32(vHandle);
				while (!feof(vHandle) && !vFail) 
				{
					switch(lVal) 
					{
			
						case CHK_BMHD:
							if (!vFail)
								vFail = readLbmHeader(vHandle);
							break;


						case CHK_CMAP:
							if (!vFail)
								vFail = readLbmColormap(vHandle);
							break;
			
						case CHK_TINY:
						case CHK_DPPS:
						case CHK_CRNG:
						case CHK_GRAB:
							if (!vFail)
								vFail = readLbmTiny(vHandle);
							break;
			
						case CHK_BODY:
							if (!vFail)
								vFail = readLbmBody(vHandle);
							break;
			
						default:
							printf("unknown chunk : 0x%x",lVal);
							break;
					}
					lVal = get32(vHandle);
				}
			}
			
		}

		file_close(vHandle);
	}
	else
	{
		printf("invalid file handle");
		vFail = 1;
	}
	
	return vFail;
}

var readLbmHeader(var vHandle)
{
	var vFail = 0;
	long lVal;
	long lDump;
	long lLen;
	
	lLen = get32(vHandle);
	/* chunks length is rounded to the next even number */
	if (lLen % 2) lLen++;

	lWidth = get16(vHandle);
	lLen -= 2;
	lHeight = get16(vHandle);

	/* allocate bitmap buffer structure */
	lbm2bmp_buf = BMP_create(lWidth, lHeight, 8);
	lLen -= 2;
	lDump = get32(vHandle);
	lLen -= 4;

	lDepth = get8(vHandle);
	lLen--;
	if (lDepth > 8) 
	{
		printf("can't handle depth>8, aborting...");
		vFail = 1;
	}
	else
	{

		lDump = get8(vHandle);
		lLen--;
		/* ByteRun1 compression ? */
		cPack = get8(vHandle);
		lLen--;

		while( lLen > 0 && !feof(vHandle)) 
		{
			lDump = get8(vHandle);
			lLen--;
		}

		if (lLen !=0 ) 
		{
			printf("BMHD chunk truncated");
			vFail = 1;
		}
	}
	
	return vFail;
}

var readLbmColormap(var vHandle)
{
	var vFail = 0;
	long lLen;
	char cR, cG, cB;

	/* buffer must have been created before, otherwise source image 
	 * data is corrupted
	 */
	if (lbm2bmp_buf == NULL)
		vFail = 1;
		
	if (!vFail)
	{
		lLen = get32(vHandle);
		/* chunks length is rounded to the next even number */
		if (lLen % 2) lLen++;
	
		/* fill colormap */
		do
		{
			cB = get8(vHandle);
			cG = get8(vHandle);
			cR = get8(vHandle);
			BMP_setPal(lbm2bmp_buf, rgb(cR, cG, cB), 256 - (lLen / 3));
			lLen -= 3;
		}while(lLen > 0 && !feof(vHandle));
	
		if (lLen!=0) 
		{
			printf("CMAP chunk truncated");
			vFail = 1;
		}
	}
	return vFail;
}

var readLbmTiny(var vHandle)
{
	var vFail = 0;
	long lDump;
	long lLen;
	
	lLen = get32(vHandle);
	/* chunks length is rounded to the next even number */
	if (lLen%2) lLen++;

	lDump = get8(vHandle);
	lLen--;
	while (lLen > 0 && !feof(vHandle)) 
   {
      lDump = get8(vHandle);
		lLen--;
	}

	if (lLen != 0) 
	{
		printf("TINY chunk truncated");
		vFail = 1;
	}
	
	return vFail;
}

var readLbmBody(var vHandle)
{
	var vFail = 0;
	int iSdata;
	int iUdata;
	long lIdx, lPadIdx;
	int i,j;
	long lLen;
	var vPadded;

	/* buffer must have been created before, otherwise source image 
	 * data is corrupted
	 */
	if (lbm2bmp_buf == NULL)
		vFail = 1;
		
	if (!vFail)
	{
		lLen = get32(vHandle);
		/* chunks length is rounded to the next even number */
	//	if (lLen%2) lLen++;
	
		lPadIdx = 0;
		if (lWidth % 2) /* detect padding */
			vPadded = 1;
		else
			vPadded = 0;
					
		/* packed */
		if (cPack == cmpByteRun1) 
		{
			/* image data allocation */
			iSdata = get8(vHandle);
			lIdx = 0;
			
			while(lLen > 0 && !feof(vHandle)) 
			{
				lLen--;
				/* ByteRun1 decompression */
	
				/* [0..127]   : followed by n+1 bytes of data. */
				if (iSdata >= 0 && iSdata < 128) 
				{
					i = iSdata + 1;
					for(j = 0; j < i; j++)
					{
						iUdata = get8(vHandle);
						lLen--;
						if (vPadded) lPadIdx++;

						if (!feof(vHandle)) 
						{
							if (!vPadded || (lPadIdx%lWidth))
							{
								BMP_setImg(lbm2bmp_buf, iUdata & 0xFF, lIdx);
								lIdx++;
							}
							else
							{
								lPadIdx = 0;
							}
						}
					}
				}
				/* [-1..-127] : followed by byte to be repeated (-n)+1 times*/
				/* A8 uses unsigned char, so it's x - 256 */
				else if (iSdata > 128) 
				{
					i = (int)(256 - iSdata) + 1;
						iUdata = get8(vHandle);
						lLen--;
						for(j = 0; j < i; j++) 
						{
							if (vPadded) lPadIdx++;
							if (!vPadded || (lPadIdx%lWidth))
							{
								BMP_setImg(lbm2bmp_buf, iUdata & 0xFF, lIdx);
								lIdx++;
							}
							else
							{
								lPadIdx = 0;
							}
						}
				}

				/* 128       : NOOP. */
				iSdata = get8(vHandle);
			}
		}
		else if (cPack == cmpNone) 
		{
			lIdx = 0;
			
			iUdata = get8(vHandle);
			lLen--;
			while( lLen > 0 && !feof(vHandle)) 
			{
				BMP_setImg(lbm2bmp_buf, iUdata & 0xFF, lIdx);
				lIdx++;
				lPadIdx++;
				/*temp*/if (lIdx >= lWidth * lHeight) lIdx = lWidth * lHeight - 1; 
				iUdata = get8(vHandle);
				lLen--;
				/* ignore padding correction if necessary */
				if (vPadded && !(lPadIdx%lWidth) && lLen > 0)
				{
					/* dummy read padding */
					iUdata = get8(vHandle);
					lLen--;
					lPadIdx = 0;
				}
			}
		}
		else
			printf("Unknown compression");
	
		if (lLen!=0) 
		{
			printf("BODY chunk truncated");
			//vFail = 1;
		}
	}	
	
	return vFail;
}

void lbm2bmp_cleanup()
{
	BMP_remove(lbm2bmp_buf);
	lbm2bmp_buf = NULL;
}


