#include <d3d9.h>
#include "a3defs.h"
#include "a3Sky.h" 

var WM3_vHandle;

BMAP**   WM3_bmapBmapList;
STRING** WM3_strModelList;
WM3TEX*  WM3_sTextureList;
ENTITY** WM3_entMeshList;
ENTITY** WM3_entObjectList;

var WM3_vNumBmap;
var WM3_vNumModel;
var WM3_vNumTex;
long WM3_lNumMesh;
long WM3_lNumObject;

#define HAS_SCRIPT FLAG8
#define WM3_DEBUG

void WM3_load(STRING* strTemp)
{
	long lInput;
	var vFail;
	WM3_vHandle = file_open_read(strTemp);
	WM3_vNumBmap = 0;
	WM3_vNumModel = 0;

	WM3_setPath(strTemp);
	add_folder(".\\a3Sky"); /* shader data */

	if (WM3_vHandle)
	{
		vFail = 0;
		
		/* file header */
		lInput = wm3get32(WM3_vHandle);
		if (lInput != WM3HEADER)
		{
			error ("ERROR: invalid file");
			vFail = 1;
		}
		else
		{
			/* file version */
			lInput = wm3get32(WM3_vHandle);
			if (lInput != 0x100)
			{
				error ("ERROR: file version unsupported");
				vFail = 1;
			}
		}

		/* process file data */
		if (vFail == 0)
		{
			vFail = WM3_loadBitmaps();
		}

		if (vFail == 0)
		{
			vFail = WM3_loadModels();
		}
		
		if (vFail == 0)
		{
			vFail = WM3_loadTextures();
		}
	
		if (vFail == 0)
		{
			vFail = WM3_loadMeshes();
		}
		
		if (vFail == 0)
		{
			vFail = WM3_loadObjects();
		}

		file_close(WM3_vHandle);
		
		/* now reset all dynamic flags */
		WM3_resetDynamic();
	}
	else
	{
		error("ERROR: file not found");
	}
}

var WM3_loadBitmaps()
{
	var vFail = 0;
	STRING* strFile = str_create("");
	long lInput;
	long i;
	
	/* bitmap identifier */
	lInput = wm3get32(WM3_vHandle);
	if (lInput != WM3BITMAP)
	{
		error ("ERROR: bitmap identifier not found");
		vFail = 1;
	}
	else
	{
		/* number of bitmaps */
		WM3_vNumBmap = wm3get32(WM3_vHandle);
		
		/* allocate bitmap list */
		if (WM3_vNumBmap > 0)
			WM3_bmapBmapList = (BMAP**)sys_malloc(sizeof(BMAP*) * WM3_vNumBmap);
		
		/* read all bitmaps */
		for (i = 0; i < WM3_vNumBmap; i++)
		{
			file_str_read(WM3_vHandle, strFile); /* read null terminated string */
			//error(strFile);
			WM3_bmapBmapList[i] = bmap_create(strFile);
			if (WM3_bmapBmapList[i] != NULL)
			{
				bmap_to_mipmap(WM3_bmapBmapList[i]);
			}
			else
			{
				vFail = 1;
			}
		}
		
		if (vFail == 1)
		{
			error ("ERROR: bitmap not found");
		}
	}
	
	return vFail;
}

var WM3_loadModels()
{
	var vFail = 0;
	STRING* strFile = str_create("");
	long lInput;
	long i;
	
	/* model identifier */
	lInput = wm3get32(WM3_vHandle);
	if (lInput != WM3MODEL)
	{
		error ("ERROR: model identifier not found");
		vFail = 1;
	}
	else
	{
		/* number of models */
		WM3_vNumModel = wm3get32(WM3_vHandle);
		
		/* allocate model list */
		if (WM3_vNumModel > 0)
			WM3_strModelList = (STRING**)sys_malloc(sizeof(STRING*) * WM3_vNumModel);

		/* read all models */
		for (i = 0; i < WM3_vNumModel; i++)
		{
			file_str_read(WM3_vHandle, strFile); /* read null terminated string */
			//error(strFile);
			WM3_strModelList[i] = str_create(strFile);
		}
	}
	
	return vFail;
}

var WM3_loadTextures()
{
	var vFail = 0;
	long lInput;
	long i, j;
	
	/* texture identifier */
	lInput = wm3get32(WM3_vHandle);
	if (lInput != WM3TEXTURE)
	{
		error ("ERROR: texture identifier not found");
		vFail = 1;
	}
	else
	{
		/* number of textures */
		WM3_vNumTex = wm3get32(WM3_vHandle);
				
		/* allocate texture list */
		if (WM3_vNumTex > 0)
			WM3_sTextureList = (WM3TEX*)sys_malloc(sizeof(WM3TEX) * WM3_vNumTex);
			
		for (i = 0; i < WM3_vNumTex; i++)
		{
			/* fill WM3TEXTURE struct */
			WM3_sTextureList[i].cType = wm3get8(WM3_vHandle);

			WM3_sTextureList[i].lFlags = wm3get32(WM3_vHandle);

			lInput = wm3get32(WM3_vHandle);
			WM3_sTextureList[i].fAmbient = l2f(lInput);

			lInput = wm3get32(WM3_vHandle);
			WM3_sTextureList[i].fAlbedo = l2f(lInput);

			WM3_sTextureList[i].sNumRefId = wm3get16(WM3_vHandle);
			
			/* setup material */
			WM3_sTextureList[i].matTex = mtl_create();
			WM3_sTextureList[i].matTex->albedo = WM3_sTextureList[i].fAlbedo + 100;
			WM3_sTextureList[i].matTex->ambient_blue  = WM3_sTextureList[i].fAmbient + 150;
			WM3_sTextureList[i].matTex->ambient_red   = WM3_sTextureList[i].matTex->ambient_blue;
			WM3_sTextureList[i].matTex->ambient_green = WM3_sTextureList[i].matTex->ambient_blue;

			/* sky textures need an entity material */
			if (WM3_sTextureList[i].lFlags & A3_SKY)
			{
				WM3_sTextureList[i].matEnt = mtl_create();
				a3Sky_initTex (WM3_sTextureList[i].matTex, WM3_sTextureList[i].matEnt);
			}
			else
			{
				WM3_sTextureList[i].matEnt = NULL;
			}

			/* finally get all bitmap/model references of texture */
			WM3_sTextureList[i].lRefId = (long*)sys_malloc(sizeof(long) * WM3_sTextureList[i].sNumRefId);
			for (j = 0; j < WM3_sTextureList[i].sNumRefId; j++)
			{
				(WM3_sTextureList[i].lRefId)[j] = wm3get32(WM3_vHandle);
			}
		}
	}

	return vFail;
}

var WM3_loadMeshes()
{
	var vFail = 0;

	LPD3DXMESH psMesh;
	ENTITY* entMesh;
	BMAP* bmapTex;
	MATERIAL* matTex;
	WM3TEX* psTex;
	VECTOR vecPos;

	long lNumVertex;
	long lNumTriangle;
	short sNumTex;
	
	D3DVERTEX* sV;
	WORD* wIndex;
	long *dwAttrib; 

	long lInput;
	float fInput;
	char cInput;
	var vIndex;
	long i;
	long j;
	
	/* mesh identifier */
	lInput = wm3get32(WM3_vHandle);
	if (lInput != WM3MESH)
	{
		error ("ERROR: mesh identifier not found");
		vFail = 1;
	}
	else
	{
		/* number of meshes */
		WM3_lNumMesh = wm3get32(WM3_vHandle);
		
		/* allocate mesh list */
		if (WM3_lNumMesh > 0)
			WM3_entMeshList = (ENTITY**)sys_malloc(sizeof(ENTITY*) * WM3_lNumMesh);		
		
		for(i = 0; i < WM3_lNumMesh; i++)
		{
			/* mesh position */
			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			vecPos.x = fInput; /* auto cast */

			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			vecPos.y = fInput; /* auto cast */

			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			vecPos.z = fInput; /* auto cast */
			
			/* number of vertices, triangles, textures */
			lNumVertex   = wm3get32(WM3_vHandle);
			lNumTriangle = wm3get32(WM3_vHandle);
			sNumTex      = wm3get16(WM3_vHandle);

			/* create the entity */
			entMesh = ent_create(CUBE_MDL, &vecPos, NULL);
			ent_clone(entMesh);
			WM3_entMeshList[i] = entMesh;

			/* create the mesh */
			D3DXCreateMesh(lNumTriangle, lNumVertex, D3DXMESH_MANAGED, pvertexdecl, (LPDIRECT3DDEVICE9)pd3ddev, &psMesh); /* A8 */
		//	D3DXCreateMeshFVF(lNumTriangle, lNumVertex, D3DXMESH_MANAGED, D3DFVF_D3DVERTEX, (LPDIRECT3DDEVICE9)pd3ddev, &psMesh); /* A7 */

			/* lock mesh buffers */
			psMesh->LockVertexBuffer(0, &sV);
			psMesh->LockIndexBuffer(0, &wIndex);
			psMesh->LockAttributeBuffer(0, &dwAttrib);
				
			/* cycle through all vertices of current mesh */
			for (j = 0; j < lNumVertex; j++)
			{
				/* copy vertex position */
				lInput = wm3get32(WM3_vHandle);
				sV[j].x = l2f(lInput);	
				lInput = wm3get32(WM3_vHandle);
				sV[j].y = l2f(lInput);	
				lInput = wm3get32(WM3_vHandle);
				sV[j].z = l2f(lInput);	
	
				/* copy uv map */
				lInput = wm3get32(WM3_vHandle);
				sV[j].u1 = l2f(lInput);
				lInput = wm3get32(WM3_vHandle);
				sV[j].v1 = l2f(lInput);
		
				/* copy vertex normal */
				lInput = wm3get32(WM3_vHandle);
				sV[j].nx = l2f(lInput);	
				lInput = wm3get32(WM3_vHandle);
				sV[j].ny = l2f(lInput);	
				lInput = wm3get32(WM3_vHandle);
				sV[j].nz = l2f(lInput);	
			}

			/* cycle through all triangles of current mesh */
			for (j = 0; j < lNumTriangle; j++)
			{
				/* vertex indices */
				wIndex[3*j]   = wm3get16(WM3_vHandle);
				wIndex[3*j+1] = wm3get16(WM3_vHandle);
				wIndex[3*j+2] = wm3get16(WM3_vHandle);
				
				/* triangle texture id */
				dwAttrib[j] = wm3get8(WM3_vHandle);
			}

			/* unlock mesh buffers */
			psMesh->UnlockVertexBuffer();
			psMesh->UnlockIndexBuffer();
			psMesh->UnlockAttributeBuffer();
			
			/* apply mesh to entity */
			ent_setmesh(entMesh, psMesh, 0, 0);
			
			/* cycle through all skins of current mesh */
			for (j = 0; j < sNumTex; j++)
			{
				/* texture reference id */
				lInput = wm3get32(WM3_vHandle);
				/* number of sub bitmap */
				cInput = wm3get8(WM3_vHandle);
				/* get BMAP and MATERIAL from texture */
				vIndex = (WM3_sTextureList[lInput].lRefId)[cInput];
				bmapTex = WM3_bmapBmapList[vIndex];
				matTex = WM3_sTextureList[lInput].matTex;
				/* apply to entity */
				ent_setskin(entMesh, bmapTex, j + 1);
				ent_mtlset(entMesh, matTex, j + 1);
				/* special sky texture handling */
				if (WM3_sTextureList[lInput].lFlags & A3_SKY)
				{
					entMesh->material = WM3_sTextureList[lInput].matEnt;		
					a3Sky_initEnt (entMesh, j);
				}
			}
			
			/* mesh ambient */
			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			entMesh->ambient = /*50 +*/ fInput; /* auto cast */
			
			/* flags */
			lInput = wm3get32(WM3_vHandle);
			WM3_setMeshFlags(entMesh, lInput);
//effect_load(entMesh->material, "showNormal.fxo");
			
		}
	}
	
	return vFail;
}

var WM3_loadObjects()
{
	var vFail = 0;
	long lInput;
	float fInput;
	VECTOR vecPos;
	char cType;
	ENTITY* entObj;
	STRING* strModel;
	BMAP* bmapTex;
	var vIndex;
	long i;
	
	/* object identifier */
	lInput = wm3get32(WM3_vHandle);
	if (lInput != WM3OBJECT)
	{
		error ("ERROR: object identifier not found");
		vFail = 1;
	}
	else
	{
		/* number of objects */
		WM3_lNumObject = wm3get32(WM3_vHandle);
		
		/* allocate object list */
		if (WM3_lNumObject > 0)
			WM3_entObjectList = (ENTITY**)sys_malloc(sizeof(ENTITY*) * WM3_lNumObject);		
		
		for(i = 0; i < WM3_lNumObject; i++)
		{
			/* texture reference id */
			lInput = wm3get32(WM3_vHandle);
			cType = WM3_sTextureList[lInput].cType;
			vIndex = (WM3_sTextureList[lInput].lRefId)[0]; /* always first reference */

			/* object position */
			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			vecPos.x = fInput; /* auto cast */

			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			vecPos.y = fInput; /* auto cast */

			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			vecPos.z = fInput; /* auto cast */

			if (cType == 1) /* sprite */
			{
				/* resolve texture and bmap references */
				bmapTex = WM3_bmapBmapList[vIndex];
				entObj = ent_create(SHADOW_DDS, &vecPos, NULL);
				ent_cloneskin(entObj);
				ent_setskin(entObj, bmapTex, 1);
			}
			else /* model */
			{
				/* resolve texture and model references */
				strModel = WM3_strModelList[vIndex];
				entObj = ent_create(strModel, &vecPos, NULL);
				//entObj = ent_create(SHADOW_DDS, &vecPos, NULL);
			}
			WM3_entObjectList[i] = entObj;

			/* angle (pan only) */
			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			entObj->pan = fInput; /* auto cast */

			/* object scale */
			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			entObj->scale_x = fInput; /* auto cast */

			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			entObj->scale_y = fInput; /* auto cast */

			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			entObj->scale_z = fInput; /* auto cast */

			/* ambient */
			lInput = wm3get32(WM3_vHandle);
			fInput = l2f(lInput);
			entObj->ambient = fInput; /* auto cast */
			
			/* flags */
			lInput = wm3get32(WM3_vHandle);
			WM3_setObjectFlags(entObj, lInput);
		}
		
	}

	return vFail;
}

void WM3_setMeshFlags(ENTITY* entMesh, long lFlags)
{
	if (lFlags & A3_DIAPHANOUS)
	{
		entMesh->flags |= TRANSLUCENT;
		entMesh->alpha = 70;
	}	
	
	if (lFlags & A3_TRANSPARENT)
	{
		entMesh->flags |= OVERLAY;
	}
	
	if (lFlags & A3_PASSABLE)
	{
		entMesh->flags |= PASSABLE;
	}	

	if (lFlags & A3_INVISIBLE)
	{
		entMesh->flags |= INVISIBLE;
	}	

	if (lFlags & A3_SCRIPTING)
	{
		entMesh->flags |= HAS_SCRIPT;
	}

	/* meshes need polygonal collision detection */
	entMesh->flags |= POLYGON;	
}

void WM3_setObjectFlags(ENTITY* entObj, long lFlags)
{
	if (lFlags & A3_DIAPHANOUS)
	{
		entObj->flags |= TRANSLUCENT;
		entObj->alpha = 70;
	}	
	
	if (lFlags & A3_PASSABLE)
	{
		entObj->flags |= PASSABLE;
	}	

	if (lFlags & A3_INVISIBLE)
	{
		entObj->flags |= INVISIBLE;
	}	

	if (lFlags & A3_SCRIPTING)
	{
		entObj->flags |= HAS_SCRIPT;
	}

	/* black pixels are always invisible for objects */
	entObj->flags |= OVERLAY;	
}

void WM3_unload()
{
	long i,j;
	LPD3DXMESH psMesh;
	
	/* IMPORTANT: remove everything in reversed order */
	
//error(str_for_num(NULL,WM3_lNumObject));
	/* object data */
	for (i = 0; i < WM3_lNumObject; i++)
	{
		/* remove skin from entity (deleted seperately) */
		//ent_setskin(WM3_entObjectList[i], NULL, 1);
	
		/* remove entity */
		ptr_remove(WM3_entObjectList[i]);
	}
	sys_free(WM3_entObjectList);

//error(str_for_num(NULL,WM3_lNumMesh));
	/* mesh data */
	for (i = 0; i < WM3_lNumMesh; i++)
	{
		/* remove mesh from entity (deleted seperately) */
		psMesh = ent_getmesh(WM3_entMeshList[i], 0, 0);
		psMesh->Release();
		ent_setmesh(WM3_entMeshList[i], NULL, 0, 0);
	
		/* remove skins from entity (deleted seperately) */
//		for (j = 0; j < ent_status(WM3_entMeshList[i], 8); i++)
//			ent_setskin(WM3_entMeshList[i], NULL, j+1);
	
		/* remove entity */
		ptr_remove(WM3_entMeshList[i]);
	}
	sys_free(WM3_entMeshList);

//error(str_for_num(NULL,WM3_vNumTex));
	/* texture data */
	for (i = 0; i < WM3_vNumTex; i++)
	{
		sys_free(WM3_sTextureList[i].lRefId);
		ptr_remove(WM3_sTextureList[i].matTex);
		if (WM3_sTextureList[i].matEnt != NULL)
			ptr_remove(WM3_sTextureList[i].matEnt);		
	}
	sys_free(WM3_sTextureList);


//error(str_for_num(NULL,WM3_vNumModel));
	/* model data */
	for (i = 0; i < WM3_vNumModel; i++)
	{
		ptr_remove(WM3_strModelList[i]);
	}
	sys_free(WM3_strModelList);


//error(str_for_num(NULL,WM3_vNumBmap));
	/* bitmap data */
	for (i = 0; i < WM3_vNumBmap; i++)
	{
		ptr_remove(WM3_bmapBmapList[i]);
	}
	sys_free(WM3_bmapBmapList);
}

void WM3_setPath(STRING* strPathFile)
{
	STRING* strFile;
	var i;		

	/* get path from file */
	strFile = str_create(strPathFile);
	do
	{
		i = str_stri(strFile, "\\");
		if (i != 0)
		{
			str_clip(strFile, i);
		}
	}while(i != 0);
	/* check position of WM3 filename in path */
	i = str_stri(strPathFile, strFile);
	/* remove filename from path */
	str_trunc(strPathFile, str_len(strPathFile) - i + 1);

	add_folder(strPathFile);

	ptr_remove(strFile);
}

void WM3_resetDynamic()
{
	var i;

	for (i = 0; i < WM3_lNumMesh; i++)
	{
		WM3_entMeshList[i]->emask &= ~DYNAMIC;
	}
	
	for (i = 0; i < WM3_lNumObject; i++)
	{
		WM3_entObjectList[i]->emask &= ~DYNAMIC;
	}
}

#ifdef WM3_DEBUG

void WM3_index_startup()
{
	ENTITY* entLast = NULL;
	long i;

	mouse_mode = 4;
	wait(-1);

	while(key_esc == 0)
	{
		if (entLast && entLast != mouse_ent)
		{
			reset(entLast, TRANSLUCENT);
			entLast = NULL;
		}

		if (mouse_ent)
		{
			for (i = 0; i < WM3_lNumMesh; i++)
			{
				if (mouse_ent == WM3_entMeshList[i])
				{
					draw_text("Mesh",10,180,COLOR_RED);
					DEBUG_VAR(i, 200);
					DEBUG_VAR((is(WM3_entMeshList[i], HAS_SCRIPT) != 0), 220);
				}
			}
	
			for (i = 0; i < WM3_lNumObject; i++)
			{
				if (mouse_ent == WM3_entObjectList[i])
				{
					draw_text("Object",10,180,COLOR_RED);
					DEBUG_VAR(i, 200);
					DEBUG_VAR((is(WM3_entObjectList[i], HAS_SCRIPT) != 0), 220);
				}
			}
			entLast = mouse_ent;
			set(mouse_ent, TRANSLUCENT);
		}
		
//		DEBUG_VAR(mouse_pos.x, 30);
//		DEBUG_VAR(mouse_pos.y, 50);
		wait (1);
	}
}
#endif