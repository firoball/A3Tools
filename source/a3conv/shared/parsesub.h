/*
 *******************************************************************************
 * parsesub.h
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
 * Definition script for WDL parser sub routines
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef PARSESUB_H
#define PARSESUB_H
/*! \file 
 *  Include file for WDL parser sub routines.
 */

/* ----- EXTERNAL FUNCTIONS ----- */


var parse_attrib(STRING* strTgt, STRING* strSrc, STRING* strAttrib);
var get_numAttrib(STRING* strSrc);
var get_attrib(STRING* strTgt, STRING* strSrc, var vIdx);
void parse_getStrId(STRING* strId, STRING* strData);

#include "parsesub.c"

#endif
