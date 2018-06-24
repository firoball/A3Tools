/*
 *******************************************************************************
 * parser.c
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
 * Script for WDL parser
 *
 * Comments
 * 
 * for short descriptions see comments in parser.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for WDL parser.
 */


/* ----- INCLUDES ----- */


#include <acknex.h>
#include <strio.c>
#include "parsesub.h"
#include "extract.h"
#include "a3defs.h"


/* ----- GLOBALS ----- */


BMAPDATA*   sBmapData   = NULL;
TEXDATA*    sTexData    = NULL;
WALLDATA*   sWallData   = NULL;
REGIONDATA* sRegionData = NULL;
THINGDATA*  sThingData  = NULL;
MODELDATA*  sModelData  = NULL;

var vCntBmap    = 0;
var vCntTex     = 0;
var vCntWall    = 0;	
var vCntRegion  = 0;	
var vCntThing   = 0;
var vCntModel   = 0;
var vCntPalette = 0;

var vNumRelevantBmap  = 0;
var vNumRelevantModel = 0;
var vNumRelevantTex   = 0;

STRING* strParseMsg;
STRING* strPalette;

TEXDATA sTexDummy;
BMAPDATA sBmapDummy;
STRING* strDummyId = "WMP parser: dummy id";


/* ----- FUNCTIONS ----- */


void parser_init()
{
	sTexDummy.vScaleX   = 1;
	sTexDummy.vScaleY   = 1;
	sTexDummy.psBmap    = &sBmapDummy;
	sTexDummy.strId     = strDummyId;
	sTexDummy.lFlags    = 0;
	sTexDummy.vRelevant = 0;
	sTexDummy.vAmbient  = 0;
	sTexDummy.vAlbedo   = 0;
	
	sBmapDummy.strName     = NULL;
	sBmapDummy.strFileName = NULL;
	sBmapDummy.strId       = strDummyId;
	sBmapDummy.bmapTex     = bmap_createblack(64,64,8);
	sBmapDummy.vWidth      = 64;
	sBmapDummy.vHeight     = 64;
	sBmapDummy.vOrigWidth  = 64;
	sBmapDummy.vOrigHeight = 64;
	sBmapDummy.vRelevant   = 0;
	sBmapDummy.vConvert    = 0;
}

var parse(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile)
{
	var vFail = 0;
	STRING* strPathFile = str_create("");
	var vHandle;
	
	parser_init();
	
	strParseMsg  = str_create(""); /* used for temporary logfile strings */
	
//error("patch wdl now"); //for debug

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL parse started...");
	#endif

	/* now parse WDL extract */
	str_cpy (strPathFile, strTgtPath);
	str_cat (strPathFile, strFile);
	vHandle = file_open_read(strPathFile);
	if (vHandle)
	{
		/* data buffers */
		sBmapData   = (BMAPDATA*)sys_malloc(sizeof(BMAPDATA) * getNumBmap());
		sTexData    = (TEXDATA*)sys_malloc(sizeof(TEXDATA) * getNumTex());
		sWallData   = (WALLDATA*)sys_malloc(sizeof(WALLDATA) * getNumWall());
		sRegionData = (REGIONDATA*)sys_malloc(sizeof(REGIONDATA) * getNumRegion());
		sThingData  = (THINGDATA*)sys_malloc(sizeof(THINGDATA) * getNumThing());
		sModelData  = (MODELDATA*)sys_malloc(sizeof(MODELDATA) * getNumModel());

		parse_read(vHandle);
		file_close (vHandle);
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		str_printf (strParseMsg, "ERROR: could not parse %s", strPathFile->chars);
		SYSMSG_print(SYSMSG_ERROR, strParseMsg);
		#endif
		vFail = 1;
	}	

	ptr_remove(strPathFile);
	ptr_remove(strParseMsg);

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
	
	vCntBmap = 0;
	vCntTex = 0;
	vCntRegion = 0;
	vCntWall = 0;
	do
	{
		vTemp = file_str_readto(vHandle, strData, "\r\n", 4000);
		if (vTemp != -1)
		{
			/* search for BMAPs */
			l = str_stri(strData, "BMAP");
			if (l == 1)
			{
				parse_bmap(strData, vCntBmap);
				vCntBmap++;
			}
			else
			{
				/* search for TEXTUREs */
				l = str_stri(strData, "TEXTURE");
				if (l == 1)
				{
					parse_tex(strData, vCntTex);
					vCntTex++;
				}
				else
				{
					/* search for WALLs */
					l = str_stri(strData, "WALL");
					if (l == 1)
					{
						parse_wall(strData, vCntWall);
						vCntWall++;
					}
					else
					{
						/* search for REGIONs */
						l = str_stri(strData, "REGION");
						if (l == 1)
						{
							parse_region(strData, vCntRegion);
							vCntRegion++;
						}
						else
						{
							/* search for THINGs and ACTORs */
							l = str_stri(strData, "THING");
							if (l < 1)
								l = str_stri(strData, "ACTOR");
							if (l == 1)
							{
								parse_thing(strData, vCntThing);
								vCntThing++;
							}
							else
							{
								/* search for MODELs */
								l = str_stri(strData, "MODEL");
								if (l == 1)
								{
									parse_model(strData, vCntModel);
									vCntModel++;
								}
								else
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
						}
					}
				}
			}
		}
	}
	while(vTemp != -1);
	
}

void parse_bmap(STRING* strData, var vIdx)
{
	var l;
	STRING* strId = str_create("");
	STRING* strName = str_create("");
	STRING* strFileName = str_create("");
	
	if (vIdx < getNumBmap())
	{
		str_clip(strData, 5); /* remove bmap identifier */
		l = str_chr(strData, 1, ' '); /* get first space */
		str_cpy(strId, strData);
		str_trunc(strId, str_len(strId) - l + 1); /* get id */ 
		str_clip(strData, l); /* remove id */
		str_replace(strData, "<", ""); /* clean up file name string */
		str_replace(strData, ">", "");
		str_replace(strData, ";", "");
		str_replaceall(strData, ",", "#");
		str_replaceall(strData, " ", "");
		str_cpy(strName, strData);
		str_cpy(strFileName, strData);
		/* remove trailing cutout parameters from filename */
		l = str_chr(strFileName, 1, '#');
		if (l)
			str_trunc(strFileName, str_len(strFileName)- l + 1);

		if (str_stri(strName, ".lbm"))	/* lbm/bbm files need to be converted to bmp */
			sBmapData[vIdx].vConvert = 1;
		else if (str_stri(strName, ".bbm"))
			sBmapData[vIdx].vConvert = 2;
		else
			sBmapData[vIdx].vConvert = 0;
		str_replace(strName, ".lbm", ".bmp");
		str_replace(strName, ".bbm", ".bmp");
		
		/* the texture pointer as well as width and height are filled later
		 * when relevance chek is performed. Thsi is done to keep computing
		 * time to a minimum as only required bitmaps are allocated
		 */
		sBmapData[vIdx].bmapTex = NULL; 
		sBmapData[vIdx].vHeight = 0;
		sBmapData[vIdx].vWidth = 0;
		sBmapData[vIdx].vOrigHeight = 0;
		sBmapData[vIdx].vOrigWidth = 0;
		
		sBmapData[vIdx].strName = strName; /* contains string for loading bmap */
		sBmapData[vIdx].strFileName = strFileName; /* contains original filename */
		sBmapData[vIdx].strId = strId;
		sBmapData[vIdx].vRelevant = 0;
		sBmapData[vIdx].vSkin = 0;
		sBmapData[vIdx].vInternalId = -1;

		#ifdef SYSMSG_ACTIVE
		str_cpy(strParseMsg, "BMAP: ");
		str_cat(strParseMsg, strId);
		SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
		#endif
	}
	else
	{	
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of BMAPs exceeded");
		#endif
	}
}

void parse_model(STRING* strData, var vIdx)
{
	var l;
	STRING* strId = str_create("");
	STRING* strFileName = str_create("");
	
	if (vIdx < getNumModel())
	{
		str_clip(strData, 6); /* remove bmap identifier */
		l = str_chr(strData, 1, ' '); /* get first space */
		str_cpy(strId, strData);
		str_trunc(strId, str_len(strId) - l + 1); /* get id */ 
		str_clip(strData, l); /* remove id */
		str_replace(strData, "<", ""); /* clean up file name string */
		str_replace(strData, ">", "");
		str_replace(strData, ";", "");
		str_replaceall(strData, " ", "");
		str_cpy(strFileName, strData);
		
		sModelData[vIdx].strFileName = strFileName; /* contains filename */
		sModelData[vIdx].strId = strId;
		sModelData[vIdx].vRelevant = 0;
		sModelData[vIdx].vInternalId = -1;

		#ifdef SYSMSG_ACTIVE
		str_cpy(strParseMsg, "MODEL: ");
		str_cat(strParseMsg, strId);
		SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
		#endif
	}
	else
	{	
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of MODELs exceeded");
		#endif
	}
}

/*! \todo: attach textures */
/*! \todo: multiple sides and bmaps */
/*! \todo: better handling of sky textures */
void parse_tex(STRING* strData, var vIdx)
{
	var i, n;
	STRING* strId = str_create("");
	STRING* strTemp = str_create("");
	STRING* strAttrib = str_create("");
	
	if (vIdx < getNumTex())
	{
		str_clip(strData, 8); /* remove texture identifier */
		parse_getStrId(strId, strData);

		/* check for ambient */
		sTexData[vIdx].vAmbient = 0;
		if (parse_attrib(strTemp, strData, "AMBIENT"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sTexData[vIdx].vAmbient = 100 * str_to_num(strAttrib);
			}		
		}
		/* check for albedo */
		sTexData[vIdx].vAlbedo = 0;
		if (parse_attrib(strTemp, strData, "ALBEDO"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sTexData[vIdx].vAlbedo = 100 * str_to_num(strAttrib);
			}		
		}
		/* check for scale */
		sTexData[vIdx].vScaleX = 16;
		sTexData[vIdx].vScaleY = 16;
		/* check for scale data in texture def */
		if (parse_attrib(strTemp, strData, "SCALE_XY"))
		{
			/* only interpret last scale definition in case someone defined it multiple times... */
			n = get_numAttrib(strTemp);
			if(get_attrib(strAttrib, strTemp, n-2))
			{
				sTexData[vIdx].vScaleX = str_to_num(strAttrib);
			}		
			if(get_attrib(strAttrib, strTemp, n-1))
			{
				sTexData[vIdx].vScaleY = str_to_num(strAttrib);
			}		
		}
		/* check for bmap */
		sTexData[vIdx].psBmap = NULL;
		/* check for BMAP reference - currently only first BMAP is used */
		if (parse_attrib(strTemp, strData, "BMAPS"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sTexData[vIdx].psBmap = search_bmap(strAttrib);
			}		
		}
		/* for compatibility... */
		else if (parse_attrib(strTemp, strData, "BMAP"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sTexData[vIdx].psBmap = search_bmap(strAttrib);
			}		
		}
		
		/* check for model */
		sTexData[vIdx].psModel = NULL;
		if (parse_attrib(strTemp, strData, "MODEL"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sTexData[vIdx].psModel = search_model(strAttrib);
			}		
		}
		/*! \todo: model frame */
		
		/* check for flags */
		sTexData[vIdx].lFlags = 0;
		if (parse_attrib(strTemp, strData, "FLAGS"))
		{
			n = get_numAttrib(strTemp);
			for (i = 0; i < n; i++)
			{
				if(get_attrib(strAttrib, strTemp, i))
				{

					if (str_stri(strAttrib, "GHOST")) 
						sTexData[vIdx].lFlags |= A3_GHOST;
					else if (str_stri(strAttrib, "DIAPHANOUS"))
						sTexData[vIdx].lFlags |= A3_DIAPHANOUS;
					else if (str_stri(strAttrib, "SKY"))
						sTexData[vIdx].lFlags |= A3_SKY;
				}
			}
		}

		/* check for script attachment */
		if (parse_attrib(strTemp, strData, "TOUCH"))
			sTexData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_TOUCH"))
			sTexData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_RELEASE"))
			sTexData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_CLICK"))
			sTexData[vIdx].lFlags |= A3_SCRIPTING;

		sTexData[vIdx].strId = strId;
		sTexData[vIdx].vRelevant = 0;	
		sTexData[vIdx].vInternalId = -1;
		
		#ifdef SYSMSG_ACTIVE
		str_cpy(strParseMsg, "TEXTURE: ");
		str_cat(strParseMsg, strId);
		SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
		#endif
	}
	else
	{	
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of TEXTUREs exceeded");
		#endif
	}
	ptr_remove(strTemp);
	ptr_remove(strAttrib);
}

void parse_wall(STRING* strData, var vIdx)
{
	var i, n;
	STRING* strId = str_create("");
	STRING* strTemp = str_create("");
	STRING* strAttrib = str_create("");
	
	if (vIdx < getNumWall())
	{
		str_clip(strData, 5); /* remove wall identifier */
		parse_getStrId(strId, strData);

		/* check for wall position */
		sWallData[vIdx].vPosition = 0;
		if (parse_attrib(strTemp, strData, "POSITION"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sWallData[vIdx].vPosition = str_to_num(strAttrib);
			}		
		}
		
		/* check for offset data in wall def */
		sWallData[vIdx].vOffsetX = 0;
		sWallData[vIdx].vOffsetY = 0;
		if (parse_attrib(strTemp, strData, "OFFSET_X"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sWallData[vIdx].vOffsetX = str_to_num(strAttrib);
			}		
		}
		if (parse_attrib(strTemp, strData, "OFFSET_Y"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sWallData[vIdx].vOffsetY = str_to_num(strAttrib);
			}		
		}

		/* check for flags */
		sWallData[vIdx].lFlags = 0;
		if (parse_attrib(strTemp, strData, "FLAGS"))
		{
			n = get_numAttrib(strTemp);
			for (i = 0; i < n; i++)
			{
				if(get_attrib(strAttrib, strTemp, i))
				{
					if (str_stri(strAttrib, "PORTCULLIS"))
						sWallData[vIdx].lFlags |= A3_PORTCULLIS;
					else if (str_stri(strAttrib, "CURTAIN"))
						sWallData[vIdx].lFlags |= A3_CURTAIN;
					else if (str_stri(strAttrib, "FENCE"))
						sWallData[vIdx].lFlags |= A3_FENCE;
					else if (str_stri(strAttrib, "TRANSPARENT"))
						sWallData[vIdx].lFlags |= A3_TRANSPARENT;
					else if (str_stri(strAttrib, "INVISIBLE"))
						sWallData[vIdx].lFlags |= A3_INVISIBLE;
				}
			}
		}

		/* check for script attachment */
		if (parse_attrib(strTemp, strData, "IF_NEAR"))
			sWallData[vIdx].lFlags |= A3_SCRIPTING;

		if (parse_attrib(strTemp, strData, "IF_FAR"))
			sWallData[vIdx].lFlags |= A3_SCRIPTING;

		if (parse_attrib(strTemp, strData, "IF_HIT"))
			sWallData[vIdx].lFlags |= A3_SCRIPTING;

		if (parse_attrib(strTemp, strData, "EACH_TICK"))
			sWallData[vIdx].lFlags |= A3_SCRIPTING;

		if (parse_attrib(strTemp, strData, "EACH_SEC"))
			sWallData[vIdx].lFlags |= A3_SCRIPTING;

		/* check for BMAP reference - currently only first BMAP is used */
		sWallData[vIdx].psTex = NULL;
		if (parse_attrib(strTemp, strData, "TEXTURE"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sWallData[vIdx].psTex = search_tex(strAttrib);
			}		
		}
		sWallData[vIdx].strId = strId;
		sWallData[vIdx].vRelevant = 0;	

		#ifdef SYSMSG_ACTIVE
		str_cpy(strParseMsg, "WALL: ");
		str_cat(strParseMsg, strId);
		SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
		#endif
	}
	else
	{	
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of WALLs exceeded");
		#endif
	}
	ptr_remove(strTemp);
	ptr_remove(strAttrib);
}

void parse_region(STRING* strData, var vIdx)
{
	var i, n;
	STRING* strId = str_create("");
	STRING* strTemp = str_create("");
	STRING* strAttrib = str_create("");
	
	if (vIdx < getNumRegion())
	{
		str_clip(strData, 7); /* remove region identifier */
		parse_getStrId(strId, strData);

		/* check for region heights */
		sRegionData[vIdx].vFloorHgt = 0;
		sRegionData[vIdx].vCeilHgt  = 0;
		if (parse_attrib(strTemp, strData, "FLOOR_HGT"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].vFloorHgt = str_to_num(strAttrib);
			}		
		}
		if (parse_attrib(strTemp, strData, "CEIL_HGT"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].vCeilHgt = str_to_num(strAttrib);
			}		
		}

		/* check for below region */
		sRegionData[vIdx].psRegionBelow = NULL;
		if (parse_attrib(strTemp, strData, "BELOW"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].psRegionBelow = search_region(strAttrib);
			}		
		}

		/* check for ambient */
		sRegionData[vIdx].vAmbient = 0;
		if (parse_attrib(strTemp, strData, "AMBIENT"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].vAmbient = 100 * str_to_num(strAttrib);
			}		
		}
		/* check for flags */
		sRegionData[vIdx].lFlags = 0;
		if (parse_attrib(strTemp, strData, "FLAGS"))
		{
			n = get_numAttrib(strTemp);
			for (i = 0; i < n; i++)
			{
				if(get_attrib(strAttrib, strTemp, i))
				{
					if (str_stri(strAttrib, "FLOOR_LIFTED"))
						sRegionData[vIdx].lFlags |= A3_FLOOR_ASCEND;
					else if (str_stri(strAttrib, "CEIL_LIFTED"))
						sRegionData[vIdx].lFlags |= A3_CEIL_DESCEND;
					else if (str_stri(strAttrib, "LIFTED"))
						sRegionData[vIdx].lFlags |= A3_CEIL_ASCEND | A3_FLOOR_ASCEND;
					else if (str_stri(strAttrib, "FLOOR_ASCEND"))
						sRegionData[vIdx].lFlags |= A3_FLOOR_ASCEND;
					else if (str_stri(strAttrib, "FLOOR_DESCEND"))
						sRegionData[vIdx].lFlags |= A3_FLOOR_DESCEND;
					else if (str_stri(strAttrib, "CEIL_ASCEND"))
						sRegionData[vIdx].lFlags |= A3_CEIL_ASCEND;
					else if (str_stri(strAttrib, "CEIL_DESCEND"))
						sRegionData[vIdx].lFlags |= A3_CEIL_DESCEND;
				}
			}		
		}
		
		/* check for script attachment */
		if (parse_attrib(strTemp, strData, "IF_ENTER"))
			sRegionData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_LEAVE"))
			sRegionData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_DIVE"))
			sRegionData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_ARISE"))
			sRegionData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "EACH_TICK"))
			sRegionData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "EACH_SEC"))
			sRegionData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "EACH_CYCLE"))
			sRegionData[vIdx].lFlags |= A3_SCRIPTING;

		/* check for texture offsets */
		sRegionData[vIdx].vFloorOffsetX = 0;
		sRegionData[vIdx].vFloorOffsetY = 0;
		sRegionData[vIdx].vCeilOffsetX  = 0;
		sRegionData[vIdx].vCeilOffsetY  = 0;
		if (parse_attrib(strTemp, strData, "FLOOR_OFFS_X"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].vFloorOffsetX = str_to_num(strAttrib);
			}		
		}
		if (parse_attrib(strTemp, strData, "FLOOR_OFFS_Y"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].vFloorOffsetY = str_to_num(strAttrib);
			}		
		}
		if (parse_attrib(strTemp, strData, "CEIL_OFFS_X"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].vCeilOffsetX = str_to_num(strAttrib);
			}		
		}
		if (parse_attrib(strTemp, strData, "CEIL_OFFS_Y"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].vCeilOffsetY = str_to_num(strAttrib);
			}		
		}
		
		/* check for TEXTURE references */
		sRegionData[vIdx].psFloorTex = NULL;
		sRegionData[vIdx].psCeilTex = NULL;
		if (parse_attrib(strTemp, strData, "FLOOR_TEX"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].psFloorTex = search_tex(strAttrib);
			}		
		}
		if (parse_attrib(strTemp, strData, "CEIL_TEX"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sRegionData[vIdx].psCeilTex = search_tex(strAttrib);
			}		
		}
		sRegionData[vIdx].strId = strId;
		sRegionData[vIdx].vRelevant = 0;	

		#ifdef SYSMSG_ACTIVE
		str_cpy(strParseMsg, "REGION: ");
		str_cat(strParseMsg, strId);
		SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
		#endif
	}
	else
	{	
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of REGIONs exceeded");
		#endif
	}
	ptr_remove(strTemp);
	ptr_remove(strAttrib);
}

void parse_thing(STRING* strData, var vIdx)
{
	var i, n;
	STRING* strId = str_create("");
	STRING* strTemp = str_create("");
	STRING* strAttrib = str_create("");
	
	if (vIdx < getNumThing())
	{
		str_clip(strData, 6); /* remove thing/actor identifier */
		parse_getStrId(strId, strData);

		/* check for height */
		sThingData[vIdx].vHeight = 0;
		if (parse_attrib(strTemp, strData, "HEIGHT"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sThingData[vIdx].vHeight = str_to_num(strAttrib);
			}		
		}

		/* check for angle */
		sThingData[vIdx].vAngle  = 0;
		if (parse_attrib(strTemp, strData, "ANGLE"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sThingData[vIdx].vAngle = str_to_num(strAttrib);
			}		
		}

		/* check for flags */
		sThingData[vIdx].lFlags = 0;
		if (parse_attrib(strTemp, strData, "FLAGS"))
		{
			n = get_numAttrib(strTemp);
			for (i = 0; i < n; i++)
			{
				if(get_attrib(strAttrib, strTemp, i))
				{
					if (str_stri(strAttrib, "INVISIBLE"))
						sThingData[vIdx].lFlags |= A3_INVISIBLE;
					else if (str_stri(strAttrib, "PASSABLE"))
						sThingData[vIdx].lFlags |= A3_PASSABLE;
					else if (str_stri(strAttrib, "FLAT"))
						sThingData[vIdx].lFlags |= A3_FLAT;
					else if (str_stri(strAttrib, "GROUND"))
						sThingData[vIdx].lFlags |= A3_GROUND;
					else if (str_stri(strAttrib, "CANDELABER"))
						sThingData[vIdx].lFlags |= A3_CANDELABER;
				}
			}		
		}

		/* check for script attachment */
		if (parse_attrib(strTemp, strData, "IF_NEAR"))
			sThingData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_FAR"))
			sThingData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_ARRIVED"))
			sThingData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "IF_HIT"))
			sThingData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "EACH_CYCLE"))
			sThingData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "EACH_TICK"))
			sThingData[vIdx].lFlags |= A3_SCRIPTING;
		
		if (parse_attrib(strTemp, strData, "EACH_SEC"))
			sThingData[vIdx].lFlags |= A3_SCRIPTING;
		
		/* check for TEXTURE references */
		sThingData[vIdx].psTex = NULL;
		if (parse_attrib(strTemp, strData, "TEXTURE"))
		{
			if(get_attrib(strAttrib, strTemp, 0))
			{
				sThingData[vIdx].psTex = search_tex(strAttrib);
			}		
		}
		sThingData[vIdx].strId = strId;
		sThingData[vIdx].vRelevant = 0;	

		#ifdef SYSMSG_ACTIVE
		str_cpy(strParseMsg, "THING: ");
		str_cat(strParseMsg, strId);
		SYSMSG_print(SYSMSG_SYSTEM, strParseMsg);
		#endif
	}
	else
	{	
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_ERROR, "ERROR: number of THINGs exceeded");
		#endif
	}
	ptr_remove(strTemp);
	ptr_remove(strAttrib);
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

BMAPDATA* search_bmap(STRING* strId)
{
	var i;
	for (i = 0; i < vCntBmap; i++)
	{
		if (str_cmpi(strId, sBmapData[i].strId))
		{
			return &(sBmapData[i]);
		}
	} 
	#ifdef SYSMSG_ACTIVE
	str_printf(strParseMsg, "WARNING: BMAP %s not found", strId->chars);
	SYSMSG_print(SYSMSG_ERROR, strParseMsg);
	#endif
//	return NULL;
	return &sBmapDummy;
}

MODELDATA* search_model(STRING* strId)
{
	var i;
	for (i = 0; i < vCntModel; i++)
	{
		if (str_cmpi(strId, sModelData[i].strId))
		{
			return &(sModelData[i]);
		}
	} 
	#ifdef SYSMSG_ACTIVE
	str_printf(strParseMsg, "WARNING: MODEL %s not found", strId->chars);
	SYSMSG_print(SYSMSG_ERROR, strParseMsg);
	#endif
	return NULL;
}

TEXDATA* search_tex(STRING* strId)
{
	var i;
	for (i = 0; i < vCntTex; i++)
	{
		if (str_cmpi(strId, sTexData[i].strId))
		{
			return &(sTexData[i]);
		}
	} 
	#ifdef SYSMSG_ACTIVE
	str_printf(strParseMsg, "WARNING: TEXTURE %s not found", strId->chars);
	SYSMSG_print(SYSMSG_ERROR, strParseMsg);
	#endif
//	return NULL;
	return &sTexDummy;
}

WALLDATA* search_wall(STRING* strId)
{
	var i;
	for (i = 0; i < vCntWall; i++)
	{
		if (str_cmpi(strId, sWallData[i].strId))
		{
			return &(sWallData[i]);
		}
	} 
	#ifdef SYSMSG_ACTIVE
	str_printf(strParseMsg, "WARNING: WALL not found: %s", strId->chars);
	SYSMSG_print(SYSMSG_ERROR, strParseMsg);
	#endif
	return NULL;
}

REGIONDATA* search_region(STRING* strId)
{
	var i;
	for (i = 0; i < vCntRegion; i++)
	{
		if (str_cmpi(strId, sRegionData[i].strId))
		{
			return &(sRegionData[i]);
		}
	} 
	#ifdef SYSMSG_ACTIVE
	str_printf(strParseMsg, "WARNING: REGION not found: %s", strId->chars);
	SYSMSG_print(SYSMSG_ERROR, strParseMsg);
	#endif
	return NULL;
}

THINGDATA* search_thing(STRING* strId)
{
	var i;
	for (i = 0; i < vCntThing; i++)
	{
		if (str_cmpi(strId, sThingData[i].strId))
		{
			return &(sThingData[i]);
		}
	} 
	#ifdef SYSMSG_ACTIVE
	str_printf(strParseMsg, "WARNING: THING not found: %s", strId->chars);
	SYSMSG_print(SYSMSG_ERROR, strParseMsg);
	#endif
	return NULL;
}

void parser_check_relevance_tex(TEXDATA* psTex, var vSkin)
{
	
	BMAPDATA* psBmap;
	MODELDATA* psModel;
	
	psBmap = psTex->psBmap;
	psModel = psTex->psModel;

	if (psBmap != NULL)
	{
		psBmap->vRelevant = 1;
		psBmap->vSkin = vSkin; /* skins need to be power of 2. set indicator for later bitmap scaling */
	}
	else if (psModel != NULL)
	{
		psModel->vRelevant = 1;
	}
	#ifdef SYSMSG_ACTIVE
	else 
	{
		str_printf(strParseMsg, "texture %s: BMAP not found", psTex->strId->chars);
		SYSMSG_print(SYSMSG_ERROR, strParseMsg);
	}
	#endif
}

void parser_check_relevance()
{
	var i, n;
	TEXDATA* psTex;
	REGIONDATA* psBelowRegion;
	
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL parser check relevances...");
	#endif

	strParseMsg = str_create("");
	n = getNumWall();
	for (i = 0; i < n; i++)
	{
		if (sWallData[i].vRelevant)
		{
			psTex = sWallData[i].psTex;
			if (psTex != NULL)
			{
				psTex->vRelevant = 1;
				parser_check_relevance_tex(psTex, SKIN);
			}
			#ifdef SYSMSG_ACTIVE
			else
			{
				str_printf(strParseMsg, "wall %s: TEXTURE not found", sWallData[i].strId->chars);
				SYSMSG_print(SYSMSG_ERROR, strParseMsg);
			}
			#endif
		}
	}
	
	n = getNumThing();
	for (i = 0; i < n; i++)
	{
		if (sThingData[i].vRelevant)
		{
			psTex = sThingData[i].psTex;
			if (psTex != NULL)
			{
				psTex->vRelevant = 1;
				parser_check_relevance_tex(psTex, SPRITE);
			}
			#ifdef SYSMSG_ACTIVE
			else
			{
				str_printf(strParseMsg, "thing %s: TEXTURE not found", sThingData[i].strId->chars);
				SYSMSG_print(SYSMSG_ERROR, strParseMsg);
			}
			#endif
		}
	}

	n = getNumRegion();
	for (i = 0; i < n; i++)
	{
		if (sRegionData[i].vRelevant)
		{
			psTex = sRegionData[i].psFloorTex;
			if (psTex != NULL)
			{
				psTex->vRelevant = 1;
				parser_check_relevance_tex(psTex, SKIN);
			}
			#ifdef SYSMSG_ACTIVE
			else
			{
				str_printf(strParseMsg, "region %s: floor TEXTURE not found", sRegionData[i].strId->chars);
				SYSMSG_print(SYSMSG_ERROR, strParseMsg);
			}
			#endif

			psTex = sRegionData[i].psCeilTex;
			if (psTex != NULL)
			{
				psTex->vRelevant = 1;
				parser_check_relevance_tex(psTex, SKIN);
			}
			#ifdef SYSMSG_ACTIVE
			else
			{
				str_printf(strParseMsg, "region %s: ceil TEXTURE not found", sRegionData[i].strId->chars);
				SYSMSG_print(SYSMSG_ERROR, strParseMsg);
			}
			#endif
		}
	}

	/* count relevant definitions of bmap, model, texture
	 * and set internal Id 
	 * The Id is required for later referencing by textures in the WM3 file format
	 */
	n = getNumBmap();
	for (i = 0; i < n; i++)
	{
		if (sBmapData[i].vRelevant)
		{
			sBmapData[i].vInternalId = vNumRelevantBmap;
			vNumRelevantBmap++;
		}
	}
	
	n = getNumModel();
	for (i = 0; i < n; i++)
	{
		if (sModelData[i].vRelevant)
		{
			sModelData[i].vInternalId = vNumRelevantModel;
			vNumRelevantModel++;
		}
	}

	n = getNumTex();
	for (i = 0; i < n; i++)
	{
		if (sTexData[i].vRelevant)
		{
			sTexData[i].vInternalId = vNumRelevantTex;
			vNumRelevantTex++;
		}
	}

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL parser relevance check done.\r\n");
	#endif
	ptr_remove(strParseMsg);
}

void parser_cleanup()
{
	var i;

	/* palette */
	if (strPalette != NULL)
		ptr_remove(strPalette);

	/* regions */
	for (i = 0; i < vCntRegion; i++)
	{
		ptr_remove(sRegionData[i].strId); /* remove ID string */
	}
	sys_free(sRegionData);

	/* walls */
	for (i = 0; i < vCntWall; i++)
	{
		ptr_remove(sWallData[i].strId); /* remove ID string */
	}
	sys_free(sWallData);

	/* textures */
	for (i = 0; i < vCntTex; i++)
	{
		ptr_remove(sTexData[i].strId); /* remove ID string */
	}
	sys_free(sTexData);

	/* bmaps */
	for (i = 0; i < vCntBmap; i++)
	{
		ptr_remove(sBmapData[i].strId); /* remove ID string */
		ptr_remove(sBmapData[i].strName); /* remove filename used for loading */
		ptr_remove(sBmapData[i].strFileName); /* remove original filename */
	}
	sys_free(sBmapData);

	/* models */
	for (i = 0; i < vCntModel; i++)
	{
		ptr_remove(sModelData[i].strId); /* remove ID string */
		ptr_remove(sModelData[i].strFileName); /* remove original filename */
	}
	sys_free(sModelData);

	/* things */
	for (i = 0; i < vCntThing; i++)
	{
		ptr_remove(sThingData[i].strId); /* remove ID string */
	}
	sys_free(sThingData);
	
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL parser memory released.");
	#endif
}

STRING* parser_getPalette()
{
	return strPalette;
}

BMAPDATA* parser_getBmapdata(var vIdx)
{
	if ((vIdx >= 0) && (vIdx < getNumBmap()))
		return &sBmapData[vIdx];
}

MODELDATA* parser_getModeldata(var vIdx)
{
	if ((vIdx >= 0) && (vIdx < getNumModel()))
		return &sModelData[vIdx];
}

TEXDATA* parser_getTexdata(var vIdx)
{
	if ((vIdx >= 0) && (vIdx < getNumTex()))
		return &sTexData[vIdx];
}

var parser_getNumRelevantBmap() {return vNumRelevantBmap;}
var parser_getNumRelevantModel() {return vNumRelevantModel;}
var parser_getNumRelevantTex() {return vNumRelevantTex;}
