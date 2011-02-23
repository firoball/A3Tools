/*
 *******************************************************************************
 * parsepal.h
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
 * definition script for palette parser
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef PARSEPAL_H
#define PARSEPAL_H
/*! \file 
 *  Include file for palette parser.
 */


/* ----- EXTERNAL FUNCTIONS ----- */


var parse(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile);
void parse_read(var vHandle);
void parse_palette(STRING* strData);
void parser_cleanup();
STRING* parser_getPalette();

#include "parsepal.c"

#endif