/*
 *******************************************************************************
 * a3convmap.c
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
 * Script for A3 level converter
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for A3 level converter.
 */


/* ----- INCLUDES ----- */


#include <acknex.h>
#include <default.c>

#define PRAGMA_POINTER

#define SYSMSG_vBufferSize 50

/* files shared with WM3 loader */
#define PRAGMA_PATH "..\\shared\\toolbox\\tags\\181215"
#define PRAGMA_PATH "..\\shared\\a3sky"
#define PRAGMA_PATH "..\\shared"

#define PRAGMA_PATH "shared"    /* A3 converter shared files */
#define PRAGMA_PATH "a3convmap" /* own files */

#define TOOLBOX_USE_SYSMSG
#include "toolbox.h"

#include "parser.h"
#include "mapload.h"
#include "makereg.h"
#include "makethi.h"
#include "extract.h"
#include "filecopy.h"
#include "wm3save.h"
#include "config.h"
#include "makeent.h" 



/*-------------------------------Local stuff-----------------------*/

//STRING* strSrcPath = "d:\\acknex3\\massacretemp\\";
//STRING* strSrcPath = "d:\\acknex3\\gamenewtemp\\";
//STRING* strFile = "game.wdl";
//STRING* strLevel = "cemetary.wmp";
//STRING* strLevel = "village.wmp";

//STRING* strSrcPath = "E:\\a3games\\abiventure_src\\";
//STRING* strFile = "schule2.wdl";
//STRING* strLevel = "schule2.wmp";

//STRING* strSrcPath = "E:\\a3games\\varghina_Src\\";
//STRING* strFile = "esa.wdl";
//STRING* strLevel = "esa.wmp ";

//STRING* strSrcPath = "E:\\a3games\\isgame\\";
//STRING* strFile = "ismain.wdl";
//STRING* strLevel = "ismain.wmp ";

//STRING* strSrcPath = "E:\\a3games\\adeptus_src\\";
//STRING* strFile = "adeptus.wdl";
//STRING* strLevel = "world.wmp ";

//STRING* strSrcPath = "E:\\a3games\\opdemo3_src\\";
//STRING* strFile = "demo3.wdl";
//STRING* strLevel = "d3wmp.wmp ";

/*---------------------------end Local stuff-----------------------*/


/* ----- FUNCTIONS ----- */


void exitmain()
{
	/* call cleaners in reversed order !! */
	make_cleanupRegions();
	make_cleanupThings();
	mapload_cleanup();
	parser_cleanup();
	config_unload();
	
	SYSMSG_remove();
	wait(1);
	sys_exit("");
}


void main()
{
	var vFail = 0;
	CONFIG* psConfig;
	STRING* strSrcPath;
	STRING* strTgtPath;
	STRING* strFile;
	STRING* strLevel;
	STRING* strWm3;
	var vExportWm3;

	sun_light = 30;	
	on_esc = NULL; /* disable default exit */

	SYSMSG_create();
	SYSMSG_logToFile(ON);
//	SYSMSG_hide();
	SYSMSG_print(SYSMSG_SYSTEM, "start conversion...");

	config_init();
	vFail += config_read();

	/* get configuration */
	psConfig   = config_getSettings();
	strSrcPath = psConfig->strSrcPath;
	strTgtPath = psConfig->strTgtPath;
	strFile    = psConfig->strWdlFile;
	strLevel   = psConfig->strWmpFile;
	strWm3     = psConfig->strWm3File;
	vExportWm3 = psConfig->vExportWm3;
	
	if (vFail == 0)
	{
		vFail += extract(strSrcPath, strTgtPath, strFile);
		wait(3);
		vFail += parse(strSrcPath, strTgtPath, strFile);
		wait(3);
		vFail += mapload(strSrcPath, strLevel);
		wait(3);
		mapload_check_relevance();
		parser_check_relevance();
		wait(3);
	}
	
	if (vFail == 0)
	{
		/* within the following functions heavy pointer use is done
		 * null pointer checks would slow down things remarkably
		 * and code would become even more complex as it already is
		 *
		 * Damaged WDL and WMP files may still crash the whole thing
		 * but the obvious user errors like wrong paths and filenames
		 * are covered pretty good this way.
		 */
		copy_files(strSrcPath, strTgtPath);
	
		if (vExportWm3 != 0)
		{
			/* WM3 exporter */
			WM3_create(strTgtPath, strWm3);
			WM3_saveBmap();
			WM3_saveModel();
			WM3_saveTex();
		}
	
		wait(3);
		/* make_regions and make_things process one object after another
		 * inside loops. For this reason they have to call the WM3 exporter
		 * in each run through their loops.
		 * unlike bmap, model and texture data which is stored in structure
		 * lists, region and thing buffers only carry the region/thing
		 * currently processed. The main rotuine cannot call the WM3
		 * routines here
		 */
		make_regions();
		make_things(strTgtPath);
	
		if (vExportWm3 != 0)
		{
			/* WM3 exporter */
			WM3_finish();
		}
		
		/* from default.c */
		def_moveset();
	}
	else
	{
		/* it's broken */
		error("ERROR: Conversion failed. See log file.");
	}
	on_esc = exitmain;
	SYSMSG_print(SYSMSG_SYSTEM, "all done.\r\n");
}

/*! \mainpage A3 map converter - Introduction
 *  These Lite-C scripts convert an A3 WMP file and parts of its corresponding 
 *  WDL scripts to A8 compatible data structures.
 *  There is also the possibility to export A3 levels to a special WM3 format
 *  which is optimized to be read by A8 and Lite-C easily.
 * 
 *  An reusable example can be found in the \e "wm3load" source folder.
 *
 *
 *  This documentation is intended as a minimum guide through the source code
 *  for interested developers. Therefore it focusses on the internal processes
 *  done by the map converter.
 *
 *  This developer documentation is - as usual - by far not complete, but it
 *  features a file index, todo list and some basic overview as well as dependency
 *  graphs.
 *  There is a lot more info hidden in comments inside the code files. A lot of work
 *  arounds were necessary to get this running properly, so code most likely is
 *  not easy to understand without some basic knowledge on how the converter
 *  internally works.
 *
 *  As additional information it is very useful to check out the \e A3 \e user \e manual.
 *  It features in depth information about how A3 scipting and level building works. This 
 *  knowledge is mandatory for understanding what this converter does - or at least
 *  is trying to do.
 *
 *  Back to the converter and its internal structure.
 *  The converter itself consists of two executables:
 * - \subpage a3conv
 * - \subpage a3convmap
 *
 *  A brief description of the WM3 format:
 * - \subpage wm3format
 *
 */

/*! \page a3convmap A3convmap
 *  This is the main script. It more or less includes everything which
 *  was already done by \e A3conv. The covnersion of an A3 level is done in
 *  following steps:
 *  - \b Config: Obtain input files and output folder from config file.
 *  default file (when no name is given via command line) is \e "config.ini".
 *  - \b Extract: Extract important data from script and create a minimum
 *  to be read in the next step.
 *  - \b Parse: \e A3convmap features an extended
 *  parser which also search REGION, WALL, TEXTURE, THING, ACTOR and
 *  BMAP definitions. Those are the base for the level map. These 
 *  definitions influence the later visual appearance.
 *  - \b Mapload: The A3 WMP file contains
 *  the basic level layout including object and enemy placement. It also
 *  references WALL, REGION and THING/ACTOR definitions from the WDL
 *  script.
 *  - \b Filecopy: All necessary bitmap files are copied to the target folder.
 *  LBM files are converted, since A8 cannot read this bitmap format.
 *  - \b MakeRegions: The vertex data deom the is used to create the region 
 *  shapes. Those are handed over to the triangulation library in order to
 *  obtain floor and ceiling meshes. 
 *  - \b MakeWalls: In the next step the walls of the region are constructed
 *  by the make walls submodule.
 *  In the end a completely textured region is generated as single A8
 *  ENTITY.
 *  - \b MakeThings: All static and dynamic objects are placed into the
 *  newly generated level. Scale and textures are taken over from the
 *  original definitions in the A3 WDL files.
 *  - \b WM3export: The A3 level can be exported to the WM3 format.
 *  The advantage is, that all the calculations done by the map converter
 *  do not need to be repeated, as WM3 is optimized to be loaded with A8. 
 */