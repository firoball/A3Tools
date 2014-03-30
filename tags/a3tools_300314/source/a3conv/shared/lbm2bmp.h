/*
 *******************************************************************************
 * lbm2bmp.h
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
 * Definition script for LBM to BMP converter
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef LBM2BMP
#define LBM2BMP
/*! \file 
 *  Include file for LBM to BMP converter.
 */

/* ----- DEFINITIONS ----- */


#define put8(f,d) file_asc_write(f,d&0xFF)
#define put16(f,d) file_asc_write(f,d&0xFF); file_asc_write(f,(d>>8)&0xFF)
#define put32(f,d) file_asc_write(f,d&0xFF); file_asc_write(f,(d>>8)&0xFF); file_asc_write(f,(d>>16)&0xFF); file_asc_write(f,(d>>24)&0xFF) 

/* without casting it will terribly break due to var range limit ;) */
#define get8(f) ((long)file_asc_read(f))
#define get16(f) (((long)file_asc_read(f))<<8) | ((long)file_asc_read(f))
#define get32(f) (((long)file_asc_read(f))<<24) | (((long)file_asc_read(f))<<16) | (((long)file_asc_read(f))<<8) | ((long)file_asc_read(f))

#define feof(f) (file_seek(f,1,4) == file_length(f))
#define rgb(r,g,b)   ( ((long)(r)) | (((long)(g))<<8) | (((long)(b))<<16) )

/*! \name Constant Data 
 *  These constants are used as parameters for certain functions.
 * \{ */
##define CHK_FORM	0x464F524D
#define CHK_PBM	0x50424D20
#define CHK_BMHD	0x424D4844
#define CHK_CMAP	0x434D4150
#define CHK_DPPS	0x44505053
#define CHK_CRNG	0x43524E47
#define CHK_TINY	0x54494E59
#define CHK_GRAB  0x47524142
#define CHK_BODY	0x424F4459

#define cmpNone         0
#define cmpByteRun1     1
/* \} */


/* ----- EXTERNAL FUNCTIONS ----- */


void lbm2bmp(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile);
var readLbm(STRING* strPathFile);
long* lbm2bmp_getPalette();
void lbm2bmp_cleanup();


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


var readLbmHeader(var vHandle);
var readLbmColormap(var vHandle);
var readLbmTiny(var vHandle);
var readLbmBody(var vHandle);

#include "lbm2bmp.c"

#endif