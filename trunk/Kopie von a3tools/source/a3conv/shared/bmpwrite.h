/*
 *******************************************************************************
 * bmpwrite.h
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
 * Definition script for bmp exporter
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */
 
#ifndef BMPWRITE_H
#define BMPWRITE_H
/*! \file 
 *  Include file for bmp exporter.
 */

/* ----- DEFINITIONS ----- */


#define bmpput8(f,d) file_asc_write(f,d&0xFF)
#define bmpput16(f,d) file_asc_write(f,d&0xFF); file_asc_write(f,(d>>8)&0xFF)
#define bmpput32(f,d) file_asc_write(f,d&0xFF); file_asc_write(f,(d>>8)&0xFF); file_asc_write(f,(d>>16)&0xFF); file_asc_write(f,(d>>24)&0xFF) 

/* without casting it will terribly break due to var range limit ;) */
#define bmpget8(f) ((long)file_asc_read(f))
#define bmpget16(f) (((long)file_asc_read(f))) | ((long)file_asc_read(f)<<8)
#define bmpget32(f) (((long)file_asc_read(f))) | (((long)file_asc_read(f))<<8) | (((long)file_asc_read(f))<<16) | ((long)file_asc_read(f)<<24)


/* ----- STRUCTURES ----- */


/*! storage struct for 8 Bit or 24 Bit Bitmap */
typedef struct
{
	long lWidth;    /*!< bitmap width */
	long lHeight;   /*!< bitmap height */
	char* cImgP;    /*!< 8Bit image: palette index for each pixel (if RGB is not used) */
	char* cImgR;    /*!< 24Bit image: red color byte for each pixel (if palette is not used) */
	char* cImgG;    /*!< 24Bit image: green color byte for each pixel (if palette is not used) */
	char* cImgB;    /*!< 24Bit image: blue color byte for each pixel (if palette is not used) */
	long lPal[256]; /*!< 8Bit image: bitmap palette (if RGB is not used) */
} BMPDATA;


/* ----- EXTERNAL FUNCTIONS ----- */


void BMP_write(STRING* strFile, BMPDATA* psBmp);
BMPDATA* BMP_create(long lWidth, long lHeight, var vDepth);
void BMP_remove(BMPDATA* psBmp);
void BMP_setPal(BMPDATA* psBmp, long lColor, char cIdx);
void BMP_setImg(BMPDATA* psBmp, char cPalIdx, long lIdx);
void BMP_setImg(BMPDATA* psBmp, COLOR* colPixel, long lIdx);

#include "bmpwrite.c"

#endif