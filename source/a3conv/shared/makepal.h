/*
 *******************************************************************************
 * makepal.h
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
 * Definition script for palette extractor
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef MAKEPAL_H
#define MAKEPAL_H
/*! \file 
 *  Include file for palette extractor.
 */

/* ----- DEFINITIONS ----- */


#define putrgb(f,d) file_asc_write(f,(d>>16)&0xFF); file_asc_write(f,(d>>8)&0xFF); file_asc_write(f,d&0xFF) 


/* ----- EXTERNAL FUNCTIONS ----- */


void pal_create(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile);
void pal_copy(long* lPal);
char pal_getIndex(long lColor);
long pal_getColor(char cIndex);
void pal_cleanup();


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void pal_writeRaw(STRING* strFile);
var pal_readPcx(STRING* strFile);


#include "makepal.c"

#endif