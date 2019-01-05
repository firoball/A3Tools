/*
 *******************************************************************************
 * parser.h
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
 * Definition script for WDL parser
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef PARSER_H
#define PARSER_H
/*! \file 
 *  Include file for WDL parser.
 */


/* ----- STRUCTURES ----- */


/*! storage struct for BMAP definition in A3 WDL script */
typedef struct
{
	STRING* strName;     /*!< filename of bitmap defined in A3 WDL script */
	STRING* strFileName; /*!< resulting filename of bitmap (filename needs to be updated in special cases) */
	STRING* strId;       /*!< identifier name defined in A3 WDL script */
	BMAP* bmapTex;       /*!< reference to BMAP object */
	var vWidth;          /*!< bitmap power of two width */
	var vHeight;         /*!< bitmap power of two height */
	var vOrigWidth;      /*!< bitmap width defined in A3 WDL script */
	var vOrigHeight;     /*!< bitmap height defined in A3 WDL script */
	var vRelevant;       /*!< required by filecopy relevance check */
	var vConvert;        /*!< marker, whether bitmap has to be covnerted to .BMP */
	var vSkin;           /*!< indicator whether bitmap is used as skin. skins need to be covnerted to pwoer of two size */
	var vInternalId;     /*!< internal reference id (needed by WM3 export) */
}BMAPDATA;

/*! storage struct for MODEL definition in A3 WDL script */
typedef struct
{
	STRING* strFileName; /*!< filename of model */
	STRING* strId; /*!< identifier name defined in A3 WDL script */
	var vRelevant; /*!< required by filecopy relevance check */
	var vInternalId; /*!< internal reference id (needed by WM3 export) */
}MODELDATA;

/*! storage struct for TEXTURE definition in A3 WDL script */
typedef struct
{
	var vScaleX;        /*!< texture horizontal scale */
	var vScaleY;        /*!< texture vertical scale */
	BMAPDATA* psBmap;   /*!< bmap reference (if no model is referenced) */
	MODELDATA* psModel; /*!< model reference (if no bmap is referenced) */
	STRING* strId;      /*!< identifier name defined in A3 WDL script */
	long lFlags;        /*!< special flags set in A3 WDL script */
	var vRelevant;      /*!< required by filecopy relevance check */
	var vAmbient;       /*!< light level of texture */
	var vAlbedo;        /*!< albedo of texture */
	var vInternalId;    /*!< internal reference id (needed by WM3 export) */
}TEXDATA;

/*! storage struct for WALL definition in A3 WDL script */
typedef struct
{
	var vOffsetX;   /*!< horizontal wall texture offset */
	var vOffsetY;   /*!< vertical wall texture offset */
	var vPosition;  /*!< vertical height offset of wall (FENCE flag) or texture attachment (PORTCULLIS flag) */
	STRING* strId;  /*!< identifier name defined in A3 WDL script */
	TEXDATA* psTex; /*!< texture reference */
	long lFlags;    /*!< special flags set in A3 WDL script */
	var vRelevant;  /*!< required by filecopy relevance check */
}WALLDATA;

/*! storage struct for REGION definition in A3 WDL script */
typedef struct sREGIONDATA
{
	var vFloorHgt;      /*!< floor height defined in script (overwritten if height ia given in WMP) */
	var vCeilHgt;       /*!< ceil height defined in script (overwritten if height ia given in WMP) */
	var vFloorOffsetX;  /*!< x offset of floor texture */
	var vFloorOffsetY;  /*!< x offset of floor texture */
	var vCeilOffsetX;   /*!< x offset of ceiling texture */
	var vCeilOffsetY;   /*!< x offset of ceiling texture */
	STRING* strId;      /*!< identifier name defined in A3 WDL script */
	TEXDATA* psCeilTex; /*!< texture reference for ceiling */
	TEXDATA* psFloorTex;/*!< texture reference for floor */
	struct sREGIONDATA* psRegionBelow; /*!< reference to below region (stacked regions) */
	long lFlags;        /*!< special flags set in A3 WDL script */
	var vRelevant;      /*!< required by filecopy relevance check */
	var vAmbient;       /*!< light level of region (added to texture light level) */
}REGIONDATA;

/*! storage struct for THING and ACTOR definitions in A3 WDL script */
typedef struct
{
	STRING* strId;  /*!< identifier name defined in A3 WDL script */
	TEXDATA* psTex; /*!< texture reference */
	var vHeight;    /*!< vertical height offset of object */
	var vAngle;     /*!< pan angle of object */
	long lFlags;    /*!< special flags set in A3 WDL script */
	var vRelevant;  /*!< required by filecopy relevance check */
}THINGDATA;


/* ----- EXTERNAL FUNCTIONS ----- */


void parser_init();
var parse(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile);
void parser_check_relevance();
void parser_cleanup();
STRING* parser_getPalette();
BMAPDATA* parser_getBmapdata(var vIdx);
MODELDATA* parser_getModeldata(var vIdx);
TEXDATA* parser_getTexdata(var vIdx);
var parser_getNumRelevantBmap();
var parser_getNumRelevantModel();
var parser_getNumRelevantTex();


/* ----- INTERNAL FUNCTIONS - DO NOT USE ----- */


void parse_read(var vHandle);
void parse_bmap(STRING* strData, var vIdx);
void parse_model(STRING* strData, var vIdx);
void parse_tex(STRING* strData, var vIdx);
void parse_wall(STRING* strData, var vIdx);
void parse_region(STRING* strData, var vIdx);
void parse_thing(STRING* strData, var vIdx);
void parse_palette(STRING* strData);
BMAPDATA* search_bmap(STRING* strId);
MODELDATA* search_model(STRING* strId);
TEXDATA* search_tex(STRING* strId);
WALLDATA* search_wall(STRING* strId);
REGIONDATA* search_region(STRING* strId);
THINGDATA* search_thing(STRING* strId);
void parser_check_relevance_tex(TEXDATA* psTex, var vSkin);

#include "parser.c"

#endif