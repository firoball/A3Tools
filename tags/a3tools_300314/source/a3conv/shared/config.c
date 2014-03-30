/*
 *******************************************************************************
 * config.c
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
 * Script for config reader
 *
 * Comments
 * 
 * for short descriptions see comments in config.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for config reader.
 */


/* ----- INCLUDES ----- */


#include <acknex.h>
#include "parsecfg.h"


/* ----- GLOBALS ----- */


STRING* strConfig;
CONFIG sConfig;


/* ----- EXTERNAL FUNCTIONS ----- */


void config_init()
{
	var l;

	l = str_stri(command_str, "-cfg ");
	if (l > 0)
	{
		l += 4; /* '-cfg ' */
		strConfig = str_create(command_str);
		str_clip(strConfig, l);
		config__strClean(strConfig);

		/* search for next space */
		l = str_stri(strConfig, " ");
		if (l > 0)
			str_trunc(strConfig, str_len(strConfig) - l + 1);
		/* 
		 * if no space was found, it is assumed that there is no
		 * other parameter is following
		 */
		if (str_stri(strConfig, ".ini") == 0)
		{
			/* damaged -cfg parameter, use default file: config.ini */
			str_cpy(strConfig, "config.ini");
		}
	}
	else
	{
		/* use default file: config.ini */
		strConfig = str_create("config.ini");
	}
	
}

var config_read()
{
	var vHandle = NULL;
	var vResult;
	var vFail = 0;
	var vNum;
	STRING* strTemp = str_create("");

	/* first, initialize struct */
	sConfig.strSrcPath = str_create("");
	sConfig.strTgtPath = str_create("");
	sConfig.strWdlFile = str_create("");
	sConfig.strWmpFile = str_create("");
	sConfig.strWm3File = str_create("");
	sConfig.strPalette = str_create("");
	sConfig.vExportWm3 = 0;
	sConfig.vMeshScale = 5;
	sConfig.vCustomPalette = 0;
	
	if (strConfig != NULL)
	{
		vHandle = CONFIG_initRead(strConfig);
	}

	/* if config file was found, read in data */
	if (vHandle != NULL)
	{
		/* source path */
		if (CONFIG_searchString(vHandle, "source_path", strTemp))
		{
			str_cpy(sConfig.strSrcPath, strTemp);
			config__fixPath(sConfig.strSrcPath);
		}
		
		/* target path */
		if (CONFIG_searchString(vHandle, "target_path", strTemp))
		{
			str_cpy(sConfig.strTgtPath, strTemp);
			config__fixPath(sConfig.strTgtPath);
		}
				
		/* wdl filename */
		if (CONFIG_searchString(vHandle, "script", strTemp))
		{
			str_cpy(sConfig.strWdlFile, strTemp);
		}
		
		/* wmp filename */
		if (CONFIG_searchString(vHandle, "level", strTemp))
		{
			str_cpy(sConfig.strWmpFile, strTemp);
		}
		
		/* wm3 filename */
		if (CONFIG_searchString(vHandle, "wm3file", strTemp))
		{
			str_cpy(sConfig.strWm3File, strTemp);
			sConfig.vExportWm3 = 1;
		}
		
		/* palette filename */
		if (CONFIG_searchString(vHandle, "palette", strTemp))
		{
			str_cpy(sConfig.strPalette, strTemp);
			sConfig.vCustomPalette = 1;
		}
		
		/* mesh scaling */
		if (CONFIG_searchNum(vHandle, "mesh_scale", &vNum))
		{
			sConfig.vMeshScale = vNum;
		}

		CONFIG_close(vHandle);
	}
	else
	{
		error("ERROR: unable to open config file");
		vFail = 1;
	}
	
	ptr_remove(strTemp);
	
	return vFail;
}

void config_unload()
{
	ptr_remove(sConfig.strSrcPath);
	ptr_remove(sConfig.strTgtPath);
	ptr_remove(sConfig.strWdlFile);
	ptr_remove(sConfig.strWmpFile);
	ptr_remove(sConfig.strWm3File);
	ptr_remove(sConfig.strPalette);
}

CONFIG* config_getSettings()
{
	return &sConfig;
}

STRING* config_getFilename()
{
	return strConfig;
}


/* ----- INTERNAL FUNCTIONS ----- */


void config__fixPath(STRING* strData)
{
	if (str_getchr(strData, strlen(strData)) !='\\')
		str_cat(strData, "\\");	
}
	
/* this should be moved to some string library... */
void config__strClean(STRING* strData)
{
	var l = 0;

	/* kill tabs */
	str_replaceall(strData, "	", " ");

	/* kill leading spaces */
	do
	{
		l = str_stri(strData, " ");
		if (l == 1)
			str_clip(strData, 1);
	}while (l == 1);
	
	/* kill trailing spaces */
	do
	{
		l = str_getchr(strData, str_len(strData));
		if (l == ' ')
			str_trunc(strData, 1);
	}while (l == ' ');
}
