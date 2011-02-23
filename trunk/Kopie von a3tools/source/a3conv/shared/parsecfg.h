/*
 *******************************************************************************
 * parsecfg.h
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
 * Definition script for config file parser
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef PARSECFG_H
#define PARSECFG_H
/*! \file 
 *  Include file for config file parser.
 */

/* ----- DEFINITIONS ----- */


/*! \name Constant Data 
 *  These constants are used as parameters for certain functions.
 * \{ */
#define CONFIG_EOF -1
/* \} */


/* ----- EXTERNAL FUNCTIONS ----- */


var CONFIG_initRead(STRING* strCfg);
var CONFIG_searchString(var vHandle, STRING* strId, STRING* strResult);
var CONFIG_searchNum(var vHandle, STRING* strId, var* pvData);
void CONFIG_close(var vHandle);


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void CONFIG__strClean(STRING* strData);
var CONFIG__findId(STRING* strId, STRING* strData);

#include "parsecfg.c"

#endif