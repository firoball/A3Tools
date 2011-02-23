/*
 *******************************************************************************
 * parsepal.c
 * Creation date: 21.02.2011
 * Author:        Firoball
 *
 *******************************************************************************
 * $Date: 2010-10-05 23:48:05 +0200 (Di, 05 Okt 2010) $
 * $Revision: 7 $
 * $Author: Firo $
 *
 *******************************************************************************
 * Description
 *
 * Script for palette parser 
 *
 * Comments
 * 
 * for short descriptions see comments in parsepal.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for palette parser.
 */

/* This file is pretty much ripped from parser.c.
 * all functionality is reduced to obtain the filename
 * of the palette to be used by the engine.
 */
 
/* ----- INCLUDES ----- */


#include <acknex.h>
#include <strio.c>
#include "parsesub.h"
#include "extract.h"


/* ----- GLOBALS ----- */
 
 
 var vCntPalette = 0;
STRING* strPalette;
STRING* strParseMsg;


/* ----- FUNCTIONS ----- */


var parse(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile)
{
	var vFail = 0;
	STRING* strPathFile = str_create("");
	STRING* strError = str_create("");
	var vHandle;
	
	
	strParseMsg  = str_create(""); /* used for temporary logfile strings */
	

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL parse started...");
	#endif

	/* now parse WDL extract */
	str_cpy (strPathFile, strTgtPath);
	str_cat (strPathFile, strFile);
	vHandle = file_open_read(strPathFile);
	if (vHandle)
	{
		parse_read(vHandle);
		file_close (vHandle);
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		str_printf (strError, "ERROR: could not parse %s", strPathFile->chars);
		SYSMSG_print(SYSMSG_ERROR, strError);
		#endif
		vFail = 1;
	}	

	ptr_remove(strPathFile);
	ptr_remove(strParseMsg);
	ptr_remove(strError);

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL parse done.\r\n");
	#endif
	
	return vFail;
}

void parse_read(var vHandle)
{
	STRING* strData = str_create("");
	var l;
	var vTemp;
	
	do
	{
		vTemp = file_str_readto(vHandle, strData, "\r\n", 4000);
		if (vTemp != -1)
		{
			/* search for PALETTEs */
			l = str_stri(strData, "PALETTE");
			if (l == 1)
			{
				vCntPalette++;
				/* only last palette defined in script is relevant */
				if (vCntPalette == getNumPalette())
					parse_palette(strData);
			}
		}
	}
	while(vTemp != -1);
	
}

void parse_palette(STRING* strData)
{
	STRING* strTemp = str_create("");
	strPalette = str_create("");
	
	str_clip(strData, 8); /* remove palette identifier */
	parse_getStrId(strTemp, strData); /* identifier is not relevant */
	if (parse_attrib(strTemp, strData, "PALFILE"))
	{
		if(get_attrib(strPalette, strTemp, 0))
		{
			str_replace(strPalette, "<", ""); /* clean up file name string */
			str_replace(strPalette, ">", "");

			#ifdef SYSMSG_ACTIVE
			str_cpy(strParseMsg, "PALETTE: ");
			str_cat(strParseMsg, strPalette);
			SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
			#endif
		}		
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: palette information corrupted");
		#endif
	}

	ptr_remove(strTemp);
}



void parser_cleanup()
{
	/* palette */
	if (strPalette != NULL)
		ptr_remove(strPalette);
	
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL parser memory released.");
	#endif
}

STRING* parser_getPalette()
{
	return strPalette;
}

