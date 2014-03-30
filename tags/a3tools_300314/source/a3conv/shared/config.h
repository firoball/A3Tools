/*
 *******************************************************************************
 * config.h
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
 * Definition script for config reader
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef CONFIG_H
#define CONFIG_H
/*! \file 
 *  Include file for config reader.
 */


/* ----- STRUCTURES ----- */


/*! storage struct for user configuration */
typedef struct
{
	STRING* strSrcPath; /*!< source path of A3 game */
	STRING* strTgtPath; /*!< target path for converted files */
	STRING* strWdlFile; /*!< main WDL script of A3 game */
	STRING* strWmpFile; /*!< WMP level file of A3 game */
	STRING* strWm3File; /*!< target file for WM3 export */
	STRING* strPalette; /*!< optional - use custom color palette */
	var vMeshScale;     /*!< scale factor for exported level mesh (default: 5) */
	var vExportWm3;     /*!< 0: do not export WM3 - 1: export WM3*/
	var vCustomPalette; /*!< 0: search palette in script - 1: use custom palette*/
}CONFIG;


/* ----- EXTERNAL FUNCTIONS ----- */


void config_init();
var config_read();
void config_unload();
CONFIG* config_getSettings();
STRING* config_getFilename();


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void config__fixPath(STRING* strData);
void config__strClean(STRING* strData);

#include "config.c"

#endif