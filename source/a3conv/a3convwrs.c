#include <acknex.h>
#include <default.c>

#define PRAGMA_POINTER

#define SYSMSG_vBufferSize 50
#define LIST_ARRAY_STEPS   200

#define PRAGMA_PATH "..\\shared\\toolbox\\tags\\181215"

#define PRAGMA_PATH "shared"    /* A3 converter shared files */
#define PRAGMA_PATH "a3convwrs" /* own files */

#define TOOLBOX_USE_SYSMSG
#define TOOLBOX_USE_LIST
#include "toolbox.h"

#include "config.h"
#include "convert.h"
#include "unpack.h"
#include "config.h"


/* converts A3 WRS to A5 WRS
 * quick and dirty, but good. 
 */


//STRING* strSrcPath = "E:\\a3games\\opdemo3_src2\\demo3.wrs";
//STRING* strTgtPath = "E:\\a3games\\opdemo3_src2\\";
//STRING* strFile = "demo3_a5.wrs";



void main()
{
	CONFIG* psConfig;
	STRING* strSrcPath;
	STRING* strTgtPath;
	STRING* strWrsFile;
	STRING* strPatchedFile;
	STRING* strListContent;
	STRING* strSrcPathFile;
	STRING* strTgtPathFile;
	int iListCount;
	long i;
	var vFail = 0;
	var vConvertWrs;
	LIST* pFileList;

	//video_screen = 0; /* do not open engine window */	

	config_init();
	vFail += config_read();

	/* get configuration */
	psConfig    = config_getSettings();
	strSrcPath  = psConfig->strSrcPath;
	//strTgtPath  = psConfig->strTgtPath;
	strWrsFile  = psConfig->strWrsFile;
	vConvertWrs = psConfig->vConvertWrs;

	if (vConvertWrs != 0)
	{
		pFileList = LIST_create();
		
		/* file name for patched WRS file */
		strPatchedFile = str_create(strWrsFile);
		str_trunc(strPatchedFile, 4);
		str_cat(strPatchedFile, "_patched.wrs");
		
		/* merge pathes and file names */
		strSrcPathFile = str_create("");
		str_cpy(strSrcPathFile, strSrcPath);
		str_cat(strSrcPathFile, strWrsFile);
		strTgtPathFile = str_create("");
		str_cpy(strTgtPathFile, strSrcPath);
		str_cat(strTgtPathFile, strPatchedFile);
	
	
		SYSMSG_create();
		SYSMSG_logToFile(ON, "a3convwrs.log");
		SYSMSG_hide();
		SYSMSG_print(SYSMSG_SYSTEM, "start A3convwrs");

//	int x;
//	long lChunkSize;
//	long s;
//	var vExt;

//	long lNumFiles = 0;
//	var vHandleR = file_open_read(strSrcPath);
//	var vHandleW = file_open_write(strTgtPathFile);
//	char cResourceFile[14];

//	cResourceFile[13] = '\0'; /* null terminated string */

	
		wait(1);

		convert_resource(strSrcPathFile, strTgtPathFile, pFileList);
error("start unpack");
		unpack_resource(strSrcPath, strPatchedFile, pFileList);
	
	
		/* clean up */
		iListCount = LIST_items(pFileList);
		for (i = 0; i < iListCount; i++)
		{
			strListContent = (STRING*)LIST_getItem(pFileList, i);
			//error(strListContent);
			ptr_remove(strListContent);
		}
		LIST_remove(pFileList);
	
		SYSMSG_print(SYSMSG_SYSTEM, "A3convwrs done.\r\n");
		SYSMSG_remove();
		ptr_remove(strParseMsg);
		ptr_remove(strSrcPathFile);
		ptr_remove(strTgtPathFile);
		ptr_remove(strPatchedFile);
	}
	
	wait(1);
	sys_exit("");
}

