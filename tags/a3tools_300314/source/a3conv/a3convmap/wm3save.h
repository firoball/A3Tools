/*
 *******************************************************************************
 * wm3save.h
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
 * Definition script for WM3 exporter
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef WM3SAVE_H
#define WM3SAVE_H
/*! \file 
 *  Include file for WM3 exporter.
 */

/* ----- DEFINITIONS ----- */


/*! \name Constant Data 
 *  These constants are used as parameters for certain functions.
 * \{ */
#define WM3VERSION 0x0100
/* \} */


/* everything is stored as little endian */
#define wm3put8(f,d) file_asc_write(f,d&0xFF)
#define wm3put16(f,d) file_asc_write(f,d&0xFF); file_asc_write(f,(d>>8)&0xFF)
#define wm3put32(f,d) file_asc_write(f,d&0xFF); file_asc_write(f,(d>>8)&0xFF); file_asc_write(f,(d>>16)&0xFF); file_asc_write(f,(d>>24)&0xFF) 

/* without casting it will terribly break due to var range limit ;) */
#define wm3get8(f) ((long)file_asc_read(f))
#define wm3get16(f) (((long)file_asc_read(f))) | ((long)file_asc_read(f)<<8)
#define wm3get32(f) (((long)file_asc_read(f))) | (((long)file_asc_read(f))<<8) | (((long)file_asc_read(f))<<16) | ((long)file_asc_read(f)<<24)

/* Bend pointer to new data type in order to fool the compiler.
 * Normally Lite-C auto casts everything between data types.
 * In this case however the hex value must stay the same -
 * regardless whether the value still makes sense for the new data type
 * This is just ridiculous...  but hey it works! Fuck you, eye cancer...
 */
#define f2l(f) (*((long*)&f))  /* convert float to long */
#define l2f(l) (*((float*)&l)) /* convert long to float */
#define v2l(v) (*((long*)&v))  /* convert var to long */
#define l2v(l) (*((var*)&l))   /* convert long to var */


/* ----- EXTERNAL FUNCTIONS ----- */


void WM3_create(STRING* strTgtPath, STRING* strFile);
void WM3_saveBmap();
void WM3_saveModel();
void WM3_saveTex();
void WM3_saveObject(ENTITY* ent, var vTexId, long lFlags);
void WM3_saveMesh(REGIONMESH* psData, var vAmbient, long lFlags);
void WM3_writeObjectHeader(var vNumObj);
void WM3_writeMeshHeader();
void WM3_finish();

/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void WM3_writeHeader();
void WM3_finishMesh();


#include "wm3save.c"

#endif
