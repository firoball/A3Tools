/*
 *******************************************************************************
 * parsecfg.c
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
 * Script for config file parser
 *
 * Comments
 * 
 * for short descriptions see comments in parsecfg.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for config file parser.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>
#include <strio.c>


/* ----- FUNCTIONS ----- */


var CONFIG_initRead(STRING* strCfg)
{
	var vHandle;
	vHandle = file_open_read(strCfg);
	
	return vHandle;
}

var CONFIG_searchString(var vHandle, STRING* strId, STRING* strResult)
{
	var vEof = 0;
	var vFound = 0;
	STRING* strData = str_create("");

	if (vHandle != NULL)
	{
		/* set file pointer to start of file */
		file_seek (vHandle, 0, 0);
		do
		{
			
			/* get line from file */
			vEof = file_str_readto(vHandle, strData, "\r\n", 4000);

			if (vEof != CONFIG_EOF)
			{
				/* clean up string */
				CONFIG__strClean(strData);
			
				/* check for comments */
				if ((str_getchr(strData, 1) != ';') && (str_getchr(strData, 1) != '[') && (str_getchr(strData, 1) != '#'))
				{
					vFound = CONFIG__findId(strId, strData);
				}
			}		
		}while((vEof != CONFIG_EOF) && (vFound != 1));
	}

	/* if id was found, copy string to result string */
	if (vFound != 0)
	{
		str_cpy(strResult, strData);
	}
	ptr_remove(strData);
	
	return vFound;
}

var CONFIG_searchNum(var vHandle, STRING* strId, var* pvData)
{
	var vRetVal;
	STRING* strData = str_create("");
	
	/* config internally always uses strings, so the string routine
	 * can be used here as well.
	 * in the end, just transform to a numeric variable 
	 */
	vRetVal = CONFIG_searchString(vHandle, strId, strData);
	*pvData = str_to_num (strData);	

	ptr_remove(strData);
	
	return vRetVal;
}

void CONFIG_close(var vHandle)
{
	if (vHandle != NULL)
	{
		file_close(vHandle);
	}
}

void CONFIG__strClean(STRING* strData)
{
	var l = 0;

	/* kill tabs */
	str_replaceall(strData, "	", " ");

	/* kill leading spaces */
	do
	{
		l = str_stri(strData, " ");
		if (l == 1)
			str_clip(strData, 1);
	}while (l == 1);
	
	/* kill trailing spaces */
	do
	{
		l = str_getchr(strData, str_len(strData));
		if (l == ' ')
			str_trunc(strData, 1);
	}while (l == ' ');
}

var CONFIG__findId(STRING* strId, STRING* strData)
{
	var vFound = 0;
	var l;	
	STRING* strIdSection = str_create("");

	/* isolate identifier string */
	l = str_stri(strData, "=");
	if (l > 0)
	{
		str_cpy(strIdSection, strData);
		/* remove everyhting after '=' */
		str_trunc(strIdSection, str_len(strIdSection) - l + 1);
		/* perform another cleanup */
		CONFIG__strClean(strIdSection);
		/* compare ids */
		vFound = str_cmpi(strId, strIdSection);

		/* prepare data string */
		if (vFound != 0)
		{
			/* remove everyhting before '=' */
			str_clip(strData, l);
			/* perform another cleanup */
			CONFIG__strClean(strData);
		}
	}
	ptr_remove (strIdSection);
	
	return vFound;
}