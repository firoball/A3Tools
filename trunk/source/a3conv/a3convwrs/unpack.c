/*
 *******************************************************************************
 * unpack.c
 * Creation date: 06.04.2014
 * Author:        Firoball
 *
 *******************************************************************************
 * $Date: 2011-02-23 22:27:12 +0100 (Mi, 23 Feb 2011) $
 * $Revision: 6 $
 * $Author: Firo $
 *
 *******************************************************************************
 * Description
 *
 * Script for WRS unpacker 
 *
 * Comments
 * 
 * for short descriptions see comments in unpack.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for WRS unpacker.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>


/* ----- FUNCTIONS ----- */


void unpack_resource(STRING* strPath, STRING* strWrsFile, LIST* pFileList)
{
	int iNumFiles;
	int i;
	var vSuccess;

	STRING* strOriginalFile;
	STRING* strPackedFile  = str_create("");
	STRING* strPathWrsFile = str_create("");
	STRING* strPathTgtFile = str_create("");
	STRING* strParseMsg    = str_create("");

	str_cpy (strPathWrsFile, strPath);
	str_cat (strPathWrsFile, strWrsFile);
error(strPathWrsFile);	
	if (file_exists(strPathWrsFile) && (pFileList != NULL))
	{
		add_resource(strPathWrsFile);
		iNumFiles = LIST_items(pFileList);
		for (i = 0; i < iNumFiles; i++)
		{
			strOriginalFile = (STRING*)LIST_getItem(pFileList, i);

			/* assemble packed string (without path, read from resource) */
			str_cpy(strPackedFile, strOriginalFile);
			//str_trunc(strPackedFile, 4);
			str_cat(strPackedFile, ".pak");

			/* assemble original string (with path, write to target folder) */
			str_cpy(strPathTgtFile, strPath);
			str_cat(strPathTgtFile, strOriginalFile);

			
			/* now unpack file from resource */
			if (file_cpy(strPathTgtFile, strPackedFile) == 0)
			{
				#ifdef SYSMSG_ACTIVE
				str_printf(strParseMsg, "Warning: Could not unpack file %s.", strOriginalFile->chars);
				SYSMSG_print(SYSMSG_WARNING, strParseMsg);
				#endif
			}
			
		}
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		if (!file_exists(strPathWrsFile))
		{
			str_printf(strParseMsg, "Error: Could not open resource %s.", strPathWrsFile->chars);
			SYSMSG_print(SYSMSG_ERROR, strParseMsg);
		}
		else if (pFileList == NULL)
		{
			SYSMSG_print(SYSMSG_WARNING, "Warning: No files to unpack.");
		}
		#endif
	}
	
	/* cleanup */
	ptr_remove(strPackedFile);
	ptr_remove(strPathWrsFile);
	ptr_remove(strPathTgtFile);
	ptr_remove(strParseMsg);
}