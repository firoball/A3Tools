/*
 *******************************************************************************
 * a3conv.c
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
 * Script for A3 palette converter
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for A3 palette converter.
 */


/* ----- INCLUDES ----- */


#include <acknex.h>
#include <default.c>

#define PRAGMA_POINTER

#define SYSMSG_vBufferSize 50

#define PRAGMA_PATH "..\\shared\\toolbox"
#define PRAGMA_PATH "..\\shared"
#define PRAGMA_PATH "shared"
#define PRAGMA_PATH "a3conv"

#define TOOLBOX_USE_SYSMSG
#include "toolbox.h"

#include "parsepal.h"
#include "extract.h"
#include "makepal.h"
#include "config.h"


/*
 * Since Acknex needs the palette before(!) startup some
 * sort of preprocessing has to be done for the palette.
 */


/* ----- FUNCTIONS ----- */


void pal_copy(STRING* strSrcPath, STRING* strTgtPath)
{
	STRING* strPalette;
	STRING* strPathFileOut = str_create("");
	
	/* first copy palette */
	strPalette = parser_getPalette();
	pal_create(strSrcPath, strTgtPath, strPalette);

	/* copy palette to root dir - engine needs it there */
	str_cpy(strPathFileOut, strTgtPath);
	str_cat(strPathFileOut, "palette.raw");
	if(!file_cpy("palette.raw", strPathFileOut))
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "WARNING: copy of palette.raw failed");
		#endif
	}
	ptr_remove(strPathFileOut);
}

void main()
{
	var vFail = 0;
	STRING* strConfig;
	CONFIG* psConfig;
	STRING* strSrcPath;
	STRING* strTgtPath;
	STRING* strFile;
	STRING* strParam = str_create("-cfg ");

	video_screen = 0; /* do not open engine window */	

	config_init();
	vFail += config_read();

	/* get configuration */
	psConfig = config_getSettings();
	strSrcPath = psConfig->strSrcPath;
	strTgtPath = psConfig->strTgtPath;
	strFile = psConfig->strWdlFile;

	SYSMSG_create();
	SYSMSG_logToFile(ON);
	SYSMSG_hide();
	SYSMSG_print(SYSMSG_SYSTEM, "start conversion...");

	
	if (vFail == 0)
	{
		vFail += extract(strSrcPath, strTgtPath, strFile);
		wait(3);
		vFail += parse(strSrcPath, strTgtPath, strFile);
		wait(3);
	}

	if (vFail == 0)
	{
		pal_copy(strSrcPath, strTgtPath);

		/* 
		 * now execture the real conversion process
		 * This however will only work in compiled mode since it
		 * tries to call the binary
		 */
		strConfig = config_getFilename();
		str_cat (strParam, strConfig);
		exec("a3convmap.exe", strParam);
	}
	else
	{
		/* it's broken */
		error("ERROR: Conversion failed. See log file.");
	}
	SYSMSG_print(SYSMSG_SYSTEM, "all done.\r\n");
	SYSMSG_remove();

	parser_cleanup();
	config_unload();
	ptr_remove (strParam);
	
	wait(1);
	sys_exit("");
}

/*! \page a3conv A3conv
 *  This is an outsourced script part. Since A8 needs a proper 
 *  palette prior to start, this palette has to be created first.
 *  \e A3conv therefore does an WDL extraction. It grabs the interesting
 *  script parts out of the WDL and creates a minimum WDL file for the
 *  script parser. Afterwards the parser scans for palette definitions
 *  and a corresponding \e "palette.raw" file is created.
 *  \e A3conv always calls \e A3convmap. 
 */

