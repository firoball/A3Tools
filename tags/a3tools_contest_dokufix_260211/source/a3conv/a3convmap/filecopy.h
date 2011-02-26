/*
 *******************************************************************************
 * filecopy.h
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
 * Definition script for file copy routines
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef FILECOPY_H
#define FILECOPY_H
/*! \file 
 *  Include file for file copy routines.
 */

/* ----- INCLUDES ----- */


#include "parser.h"


/* ----- EXTERNAL FUNCTIONS ----- */


void copy_files(STRING* strSrcPath, STRING* strTgtPath);


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void bmap_copy(STRING* strSrcPath, STRING* strTgtPath);
STRING* bmap_scale(BMAPDATA* psBmap, var vNewWidth, var vNewHeight, STRING* strTgtPath);
void model_copy(STRING* strSrcPath, STRING* strTgtPath);

#include "filecopy.c"

#endif