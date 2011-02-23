/*
 *******************************************************************************
 * wm3save.c
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
 * Script for WM3 exporter
 *
 * Comments
 * 
 * for short descriptions see comments in wm3save.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for WM3 exporter.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>
#include <strio.c>
#include "parser.h"
#include "extract.h"


/* ----- GLOBALS ----- */


var vWM3Handle = NULL;
long lWM3NumMesh;
var vWM3MeshStart;


/* ----- FUNCTIONS ----- */


void WM3_create(STRING* strTgtPath, STRING* strFile)
{
	STRING* strTemp;	
	
	strTemp = str_create(strTgtPath);
	str_cat(strTemp, strFile);
	str_replace(strTemp, ".wm3", ""); /* remove file ending if existing */
	str_cat(strTemp, ".wm3"); /* now make sure that there always is an ending */
	
	vWM3Handle = file_open_write(strTemp);
	if (vWM3Handle)
	{
		WM3_writeHeader();
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		str_printf(strTemp, "ERROR: cannot open %s", strFile->chars);
		SYSMSG_print(SYSMSG_ERROR, strTemp);
		#endif
	}
	ptr_remove(strTemp);
}


/* Bitmaps, models and textures are written from a single functions
 * which loops through all instances.
 * This is possible since these object types are reused and are
 * loaded into memory anyway.
 * Regions and objects (things/actors) are handled differently
 * (see description further down)
 */

/*! \page wm3bmap WM3 Bitmap information
 *  The section identifier can be evaluated to check whether the data read
 *  from the file is still consistent (identifier must always be found)
 *
 *  4 : "BMAP" identifier (long) \n
 *  4 : number of bitmaps (long) \n
 *
 *  \b { loop 'number of bitmaps' \n
 *  1*x : string with file name (NULL terminated) \n
 *  \b } \n
 */
 
void WM3_saveBmap()
{
	var i;
	var n;
	long lData;
	BMAPDATA* psBmap;
	
	if (vWM3Handle)
	{
		/* section identifier: 'BMAP' */
		wm3put32(vWM3Handle, 0x50414d42);
	
		/* number of relevant bitmaps */
		n = parser_getNumRelevantBmap();
		lData = n; /*auto cast */
		wm3put32(vWM3Handle, lData);
	
		/* write filenames of relevant bitmaps */
		n = getNumBmap();
		for (i = 0; i < n; i++)
		{
			psBmap = parser_getBmapdata(i);
			if (psBmap->vInternalId > -1)
			{
				file_str_write(vWM3Handle, psBmap->strName);
				file_asc_write(vWM3Handle, 0); /* mark end of filename */
			}
		}
	}	
}

/*! \page wm3model WM3 Model information
 *  The section identifier can be evaluated to check whether the data read
 *  from the file is still consistent (identifier must always be found)
 *
 *  4 : "MDL " identifier (long) \n
 *  4 : number of models (long) \n
 *
 *  \b { loop 'number of models' \n
 *  1*x : string with file name (NULL terminated) \n
 *  \b } \n
 */
 
void WM3_saveModel()
{
	var i;
	var n;
	long lData;
	MODELDATA* psModel;
	
	if (vWM3Handle)
	{
		/* section identifier: 'MDL ' */
		wm3put32(vWM3Handle, 0x204c444d);
	
		/* number of relevant models */
		n = parser_getNumRelevantModel();
		lData = n; /*auto cast */
		wm3put32(vWM3Handle, lData);
	
		/* write filenames of relevant models */
		n = getNumModel();
		for (i = 0; i < n; i++)
		{
			psModel = parser_getModeldata(i);
			if (psModel->vInternalId > -1)
			{
				file_str_write(vWM3Handle, psModel->strFileName);
				file_asc_write(vWM3Handle, 0); /* mark end of filename */
			}
		}
	}	
}


/*! \page wm3tex WM3 Texture information
 *  The section identifier can be evaluated to check whether the data read
 *  from the file is still consistent (identifier must always be found)
 *
 *  4 : "TEX " identifier (long) \n
 *  4 : num textures (long) \n
 *
 *  \b { loop 'num textures' \n
 *  1 : type 1-sprite 2-model (char) \n
 *  4 : flags (long) \n
 *  4 : ambient (float) \n
 *  4 : albedo (float) \n
 *  2 : num bitmaps (always 1 for models) (short) \n
 *
 *  \b { loop 'num bitmaps' (currently always 1) \n
 *  4 : bitmap reference id (long) \n
 *  \b } \n
 *
 *  \b } \n
 */
void WM3_saveTex()
{
	var n;
	var i;
	long lData;
	char cData;
	float fTemp;
	TEXDATA* psTex;
	
	if (vWM3Handle)
	{
		/* section identifier: 'TEX ' */
		wm3put32(vWM3Handle, 0x20584554);
	
		/* number of relevant textures */
		n = parser_getNumRelevantTex();
		lData = n; /* auto cast */
		wm3put32(vWM3Handle, lData);
			
		/* write info of relevant textures */
		n = getNumTex();
		for (i = 0; i < n; i++)
		{
			psTex = parser_getTexdata(i);
			if (psTex->vInternalId > -1)
			{
				/* texture type */
				if (psTex->psModel != NULL)
					cData = 2; /* model */
				else
					cData = 1; /* sprite/bitmap */
				wm3put8(vWM3Handle, cData);
				
				/* texture flags */
				wm3put32(vWM3Handle, psTex->lFlags);
				
				/* ambient */
				fTemp = psTex->vAmbient; /* auto cast */
				lData = f2l(fTemp);
				wm3put32(vWM3Handle, lData);
		
				/* albedo */
				fTemp = psTex->vAlbedo; /* auto cast */
				lData = f2l(fTemp);
				wm3put32(vWM3Handle, lData);
		
				/* number of bitmaps */
				if (psTex->psModel != NULL)
				{
					wm3put16(vWM3Handle, 1); /* always 1 for models */
				}
				else
				{
					wm3put16(vWM3Handle, 1); /*! \todo: use SIDES parameter here */
				}
				/* bitmap/model reference */
				/*! \todo: loop will be needed here for more bitmaps */
				if (psTex->psModel != NULL)
					lData = psTex->psModel->vInternalId;
				else
					lData = psTex->psBmap->vInternalId;
				wm3put32(vWM3Handle, lData);
			}			
		}
	}
}

/* Regions and objects are written one by one from within a loop.
 * This is done in order to minimize the required memory.
 * After a region /object is generated, all data is stored into the
 * WM3 file and afterwards the memory buffer is reused
 */
 
/*! \page wm3obj WM3 Object information
 *  The section identifier can be evaluated to check whether the data read
 *  from the file is still consistent (identifier must always be found)
 *
 *  4 : "OBJ " identifier (long) \n
 *  4 : num objects (long) \n
 *
 *  \b { loop 'num objects' \n
 *  4 : texture reference id (long) \n
 *  4 : position x (float) \n
 *  4 : position y (float) \n
 *  4 : position z (float) \n
 *  4 : angle pan (float) \n
 *  4 : scale x (float) \n
 *  4 : scale y (float) \n
 *  4 : scale z (float) \n
 *  4 : ambient (float) \n
 *  4 : flags (long)\n
 *  \b } \n
 */
void WM3_saveObject(ENTITY* ent, var vTexId, long lFlags)
{
	float fData;
	long lData;

	if (vWM3Handle)
	{
		/* texture reference id */
		lData = vTexId; /* auto cast */
		wm3put32(vWM3Handle, lData);
		
		/* object position and angle */
		fData = ent->x; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
		fData = ent->y; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
		fData = ent->z; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
		fData = ent->pan; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
	
		/* object scale */
		fData = ent->scale_x; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
		fData = ent->scale_y; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
		fData = ent->scale_z; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
	
		/* object brightness */
		fData = ent->ambient; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
	
		/* object flags */
		wm3put32(vWM3Handle, lFlags);
	}
}

/*! \page wm3mesh WM3 Mesh information
 *  The section identifier can be evaluated to check whether the data read
 *  from the file is still consistent (identifier must always be found)
 *
 *  4 : "MESH" identifier (long) \n
 *  4 : num meshes (long) \n
 *  
 *  \b { loop 'num meshes' \n
 *  4 : position x (float) \n
 *  4 : position y (float) \n
 *  4 : position z (float) \n
 *  4 : number of vertices (long) \n
 *  4 : number of triangles (long) \n
 *  2 : number of skins (short) \n
 *  
 *  \b { loop 'number of vertices' \n
 *  4 : vertex x (float) \n
 *  4 : vertex y (float) \n
 *  4 : vertex z (float) \n
 *  4 : vertex u1 (float) \n
 *  4 : vertex v1 (float) \n
 *  4 : vertex nx (float) \n
 *  4 : vertex ny (float) \n
 *  4 : vertex nz (float) \n
 *  \b } \n
 *  
 *  \b { loop 'number of triangles' \n
 *  2 : vertex ref id point 1 (short) \n
 *  2 : vertex ref id point 2 (short) \n
 *  2 : vertex ref id point 3 (short) \n
 *  1 : triangle skin id (char) \n
 *  \b } \n
 *  
 *  \b { loop 'number of skins' \n
 *  4 : texture reference id (long) \n
 *  1 : used side (char) \n
 *  \b } \n
 *
 *  4 : ambient (float) \n
 *  4 : flags (long) \n
 *  \b } \n
 */
void WM3_saveMesh(REGIONMESH* psData, var vAmbient, long lFlags)
{
	
	var i;
	long lData;
	float fData;
	short sData;
	char cData;
	TEXDATA* psTex;
	
	if (vWM3Handle)
	{
		fData = psData->vecPos.x; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
	
		fData = psData->vecPos.y; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
	
		fData = psData->vecPos.z; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
	
		/* number of vertices */
		lData = psData->vVertices;
		wm3put32(vWM3Handle, lData);
		
		/* number of triangles */
		lData = psData->vTriangles;
		wm3put32(vWM3Handle, lData);
		
		/* number of skins */
		sData = psData->vSkins; /* auto cast */
		wm3put16(vWM3Handle, sData);
		
		for (i = 0; i < psData->vVertices; i++)
		{
			/* vertex positions */
			fData = psData->vVertexBuf[i*3];
			lData = f2l(fData);
			wm3put32(vWM3Handle, lData);
	
			fData = psData->vVertexBuf[i*3+1];
			lData = f2l(fData);
			wm3put32(vWM3Handle, lData);
	
			fData = psData->vVertexBuf[i*3+2];
			lData = f2l(fData);
			wm3put32(vWM3Handle, lData);
			
			/* vertex UVs */
			fData = psData->vUVBuf[i*2];
			lData = f2l(fData);
			wm3put32(vWM3Handle, lData);
	
			fData = psData->vUVBuf[i*2+1];
			lData = f2l(fData);
			wm3put32(vWM3Handle, lData);
	
			/* vertex normals */
			fData = psData->vNormalBuf[i*3];
			lData = f2l(fData);
			wm3put32(vWM3Handle, lData);
	
			fData = psData->vNormalBuf[i*3+1];
			lData = f2l(fData);
			wm3put32(vWM3Handle, lData);
	
			fData = psData->vNormalBuf[i*3+2];
			lData = f2l(fData);
			wm3put32(vWM3Handle, lData);
		}
	
		for (i = 0; i < psData->vTriangles; i++)
		{
			/* vertex references */
			sData = psData->vTriangleBuf[i*3];
			wm3put16(vWM3Handle, sData);
	
			sData = psData->vTriangleBuf[i*3+1];
			wm3put16(vWM3Handle, sData);
	
			sData = psData->vTriangleBuf[i*3+2];
			wm3put16(vWM3Handle, sData);
				
			/* skin id */
			cData = psData->vSkinBuf[i];
			wm3put8(vWM3Handle, cData);
		}
	
		for (i = 0; i < psData->vSkins; i++)
		{
			/* internal texture id */
			psTex = regbuf_getTexById(psData, i);
			lData = psTex->vInternalId; /* auto cast */
			wm3put32(vWM3Handle, lData);
	
			/* side */
			wm3put8(vWM3Handle, 0); /*! \todo: interprete sides - starting from 0 instead of 1 */
			
		}
	
		/* ambient */
		fData = vAmbient; /* auto cast */
		lData = f2l(fData);
		wm3put32(vWM3Handle, lData);
	
		/* flags */
		wm3put32(vWM3Handle, lFlags);
	
		lWM3NumMesh++;
	}
}


/* these functions are only called once in order to open or
 * close a certain file section which is filled step by step
 */
void WM3_writeObjectHeader(var vNumObj)
{
	long lNumObj;
	
	if (vWM3Handle)
	{
		/* section identifier: 'OBJ ' */
		wm3put32(vWM3Handle, 0x204a424f);
		
		/* number of objects */
		lNumObj = vNumObj; /* auto cast */
		wm3put32(vWM3Handle, lNumObj);
	}
}

void WM3_writeMeshHeader()
{
	/* this is quite ugly
	 * since the final number of region meshes is unknown at
	 * the time this function is called, the current file position
	 * is stored and patched later... I know... I know...
	 */
	lWM3NumMesh = 0;

	if (vWM3Handle)
	{
		/* section identifier: 'MESH' */
		wm3put32(vWM3Handle, 0x4853454d);
		
		/* save current file position */
		vWM3MeshStart = file_seek(vWM3Handle, 0, 4);
		
		/* number of meshes - patched later */
		wm3put32(vWM3Handle, 0);
	}
}

/*! \page wm3header WM3 Header information
 *  The header identifier can be evaluated to check whether the file read
 *  appears to be a WM3 or not.
 *
 *  The format version allows to distinguish between different releases
 *  of the WM3 format.
 *
 *  4 : "WM3 " identifier (long) \n
 *  4 : format version (long) \n
 */
void WM3_writeHeader()
{
	long lVersion = WM3VERSION;
	/* format identifier 'WM3 ' */
	wm3put32(vWM3Handle, 0x20334D57);
	
	/* format version */	
	wm3put32(vWM3Handle, lVersion);
}

void WM3_finishMesh()
{

	/* get file position of mesh number */
	file_seek(vWM3Handle, vWM3MeshStart, 0);
	
	/* patch number of meshes */
	wm3put32(vWM3Handle, lWM3NumMesh);
	
	/* if done properly, the file pointer would be set back to follower address
	 * at this point. However Lite-C only allows var range which does not
	 * offer enough value range in order to handle files way beyond 1MB
	 * 
	 * In order to overcome this annoying limitation this function must
	 * only be called after all data has been written. Otherwise data sections
	 * will be overwritten instead of new data being appended to file!!
	 */
}

void WM3_finish()
{
	if (vWM3Handle)
	{
		WM3_finishMesh(); /* this should not be done here, but for workaround it is... */
		file_close(vWM3Handle);
	}
}

/*! \page wm3format WM3 format description
 * A brief desciption of the WM3 format. The format is divided into different sections
 * which are arranged in a fixed order. Their content is explained below.
 *
 * The information is given in the following layout: \n
 * \e 4 : - number of bytes \n
 * \e identifier - description \n
 * \e (\e long) - data type \n
 * 
 * The format also features variable length buffers defined by a size located in the format.
 * To indicate that the information has to be read in a loop, brackets \e {} and the variable
 * to be looped over are shown.
 *
 * The sections are found in the file the same order as linked below:
 * - \subpage wm3header
 * - \subpage wm3bmap
 * - \subpage wm3model
 * - \subpage wm3tex
 * - \subpage wm3obj
 * - \subpage wm3mesh
 */
