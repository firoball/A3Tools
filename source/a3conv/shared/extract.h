/*
 *******************************************************************************
 * extract.h
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
 * Definition script for WDL extractor
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef EXTRACT_H
#define EXTRACT_H
/*! \file 
 *  Include file for WDL extractor.
 */


/* ----- EXTERNAL FUNCTIONS ----- */


var getNumTex();
var getNumBmap();
var getNumRegion();
var getNumWall();
var getNumThing();
var getNumPalette();
var extract(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile);


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


var extract_read(STRING* strPath, STRING* strFile);
var foundSection(STRING* strData, STRING* strId);
void dataWrite(STRING* strData);
void nlWrite();
void strClean(STRING* strData);

#include "extract.c"

#endif