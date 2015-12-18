/*
 *******************************************************************************
 * convert.h
 * Creation date: 06.04.2014
 * Author:        Firoball
 *
 *******************************************************************************
 * $Date: 2011-02-23 22:27:12 +0100 (Mi, 23 Feb 2011) $
 * $Revision: 6 $
 * $Author: Firo $
 *
 *******************************************************************************
 * Description
 *
 * definition script for WRS converter
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef CONVERT_H
#define CONVERT_H
/*! \file 
 *  Include file for WRS converter.
 */


/* ----- DEFINITIONS ----- */


#define WRS_HEADER  0x57525300 //0x00535257 /* 'WRS' */
#define WRS2_HEADER 0x57525332 //0x32535257 /* 'WRS2' */

#define wrsput8(f,d)  fputc(d&0xFF, f)
#define wrsput32(f,d) fputc((d>>24)&0xFF, f); fputc((d>>16)&0xFF, f); fputc((d>>8)&0xFF, f); fputc(d&0xFF, f)   

#define wrsget8(f)  (fgetc(f))
#define wrsget32(f) (((long)fgetc(f))<<24) | (((long)fgetc(f))<<16) | (((long)fgetc(f))<<8) | ((long)fgetc(f))
 
#define EOF -1


/* ----- EXTERNAL FUNCTIONS ----- */


void convert_resource(STRING* strSrcPathFile, STRING* strTgtPathFile, LIST* pFileList);


/* ----- INTERNAL FUNCTIONS ----- */


void convert_init();
var convert_copydata(long lChunkSize);
var convert_getfilename(LIST* pFileList);



#include "convert.c"

#endif