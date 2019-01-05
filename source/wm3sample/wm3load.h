#ifndef WM3LOAD_H
#define WM3LOAD_H

#include <acknex.h>

typedef struct
{
	char cType;
	long lFlags;
	float fAmbient;
	float fAlbedo;
	MATERIAL* matTex;
	MATERIAL* matEnt;
	short sNumRefId;
	long* lRefId;	
}WM3TEX;

/* everything is stored as little endian */
/* without casting it will terribly break due to var range limit ;) */
#define wm3get8(f) ((long)file_asc_read(f))
#define wm3get16(f) ((long)file_asc_read(f)) | (((long)file_asc_read(f))<<8)
#define wm3get32(f) ((long)file_asc_read(f)) | (((long)file_asc_read(f))<<8) | (((long)file_asc_read(f))<<16) | (((long)file_asc_read(f))<<24)

/* Bend pointer to new data type in order to fool the compiler.
 * Normally Lite-C auto casts everything between data types.
 * In this case however the hex value must stay the same -
 * regardless whether the value still makes sense for the new data type
 * This is just ridiculous...  but hey it works! Fuck you, eye cancer...
 */
#define f2l(f) (*((long*)&f))  /* convert float to long */
#define l2f(l) (*((float*)&l)) /* convert long to float */
#define v2l(v) (*((long*)&v))  /* convert var to long */
#define l2v(l) (*((var*)&l))   /* convert long to var */

/* file internal section identifiers */
#define WM3HEADER  0x20334D57 /* 'WM3 ' */
#define WM3BITMAP  0x50414d42 /* 'BMAP' */
#define WM3MODEL   0x204c444d /* 'MDL ' */
#define WM3TEXTURE 0x20584554 /* 'TEX ' */
#define WM3MESH    0x4853454d /* 'MESH' */
#define WM3OBJECT  0x204a424f /* 'OBJ ' */


void WM3_load(STRING* strTemp);
var WM3_loadBitmaps();
var WM3_loadModels();
var WM3_loadTextures();
var WM3_loadMeshes();
var WM3_loadObjects();
void WM3_setMeshFlags(ENTITY* entMesh, long lFlags);
void WM3_setObjectFlags(ENTITY* entObj, long lFlags);
void WM3_unload();
void WM3_setPath(STRING* strPathFile);
void WM3_resetDynamic();

#include "wm3load.c"

#endif