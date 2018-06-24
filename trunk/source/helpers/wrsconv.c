#include <acknex.h>
#include <default.c>
#include "unpack.h"

#define PRAGMA_POINTER

#define SYSMSG_vBufferSize 50
#define LIST_ARRAY_STEPS   200

#define PRAGMA_PATH "..\\shared\\toolbox\\tags\\181215"
#define PRAGMA_PATH "..\\shared"
#define PRAGMA_PATH "shared"

#define TOOLBOX_USE_SYSMSG
#define TOOLBOX_USE_LIST
#include "toolbox.h"


/* converts A3 WRS to A5 WRS
 * quick and dirty, but good. 
 */

#define put8(f,d) file_asc_write(f,d&0xFF)
#define put32(f,d) file_asc_write(f,(d>>24)&0xFF); file_asc_write(f,(d>>16)&0xFF); file_asc_write(f,(d>>8)&0xFF); file_asc_write(f,d&0xFF)   

#define get8(f)   (file_asc_read(f))
#define get32(f) (((long)file_asc_read(f))<<24) | (((long)file_asc_read(f))<<16) | (((long)file_asc_read(f))<<8) | ((long)file_asc_read(f))
 
#define EOF -1

STRING* strSrcPath = "E:\\a3games\\opdemo3_src2\\demo3.wrs";
STRING* strTgtPath = "E:\\a3games\\opdemo3_src2\\";
STRING* strFile = "demo3_a5.wrs";



void main()
{
	int x;
	long i;
	long l;
	long s;
	var vExt;

	long lNumFiles = 0;
	STRING* strTgtPathFile = str_create("");
	str_cpy(strTgtPathFile, strTgtPath);
	str_cat(strTgtPathFile, strFile);
	var vHandleR = file_open_read(strSrcPath);
	var vHandleW = file_open_write(strTgtPathFile);
	STRING* strParseMsg = str_create("");
	char cResourceFile[14];

	SYSMSG_create();
	SYSMSG_logToFile(ON, "wrsconv.log");
	SYSMSG_hide();
	SYSMSG_print(SYSMSG_SYSTEM, "start conversion...");
	cResourceFile[13] = '\0'; /* null terminated string */

	LIST* pFileList = LIST_create();
	
	wait(1);
	if (vHandleR)
	{
		if (vHandleW)
		{
			printf("Start patching... Don't panic, just wait!");
	
			/* set lookup table for filenames */
			lookup_init();
			
			/* WRS2 header */
			put8(vHandleW, 0x57); /* W */
			put8(vHandleW, 0x52); /* R */
			put8(vHandleW, 0x53); /* S */
			put8(vHandleW, 0x32); /* 2 */

			do
			{
				/* read file info */
				vExt = 0; /* extension not yet found */
				for (i = 0; i < 13; i++)
				{
					x = get8(vHandleR);
					if (x != EOF)
					{
						cResourceFile[i] = (char)x;
							
						switch (vExt)
						{
							/* patch 'pak' extension to resource file */
							case 1:
								x = iNameConv['p'];
								vExt++;
								break;
								
							case 2:
								x = iNameConv['a'];
								vExt++;
								break;
								
							case 3:
								x = iNameConv['k'];
								vExt++;
								break;

							/* any letter before file extension is handled here */
							default:
								if (((char)x) == '.')
									vExt = 1; /* extension found */
								x = iNameConv[(x & 0xFF)]; /* decrypt filename */
								break;
								
						}
						put8(vHandleW, x);
					}
					else
					{
						cResourceFile[i] = '\0';
					}
				}

				if (x != EOF)
				{
					#ifdef SYSMSG_ACTIVE
					str_printf(strParseMsg, "File found: %s", cResourceFile);
					SYSMSG_print(SYSMSG_ERROR, strParseMsg);
					#endif
					LIST_append(pFileList, str_create(cResourceFile));

					/* file length is 32 byte for A5 - put zeros */
					for (i = 0; i < 19; i++)
						put8(vHandleW, 0);

					/* 4 bytes containing encrypted size */
					l = get32(vHandleR);
					put32(vHandleW, l);
//					printf("%d %x", l, l);
	
					/* 4 bytes containing real size */
					s = get32(vHandleR);
					put32(vHandleW, s);
									
					/* data section */
					for (i = 0; i < l; i++)
					{
						x = get8(vHandleR);
						put8(vHandleW, x);
					}
					
					/* file counter */
					lNumFiles++;
				}					
			}while(x != EOF);
			
			file_close(vHandleW);
			#ifdef SYSMSG_ACTIVE
			str_printf(strParseMsg, "%d resource files found.", lNumFiles);
			SYSMSG_print(SYSMSG_ERROR, strParseMsg);
			#endif
		}
		else
		{
			#ifdef SYSMSG_ACTIVE
			str_printf(strParseMsg, "Error: Could not write to target %s", strTgtPath->chars);
			SYSMSG_print(SYSMSG_ERROR, strParseMsg);
			#endif
		}
		file_close(vHandleR);
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		str_printf(strParseMsg, "Error: Could not read source %s", strSrcPath->chars);
		SYSMSG_print(SYSMSG_ERROR, strParseMsg);
		#endif
	}

	SYSMSG_print(SYSMSG_SYSTEM, "conversion done.\r\n");

unpack_resource(strTgtPath, strFile, pFileList);

	SYSMSG_remove();
	ptr_remove(strParseMsg);

	/* clean up */
	int iListCount = LIST_items(pFileList);
	STRING* strListContent;
	for (i = 0; i < iListCount; i++)
	{
		strListContent = (STRING*)LIST_getItem(pFileList, i);
		//error(strListContent);
		ptr_remove(strListContent);
	}
	LIST_remove(pFileList);

//	printf("done.");
	sys_exit("");
}

