/*
 *******************************************************************************
 * parsesub.c
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
 * Script for WDL parser sub routines
 *
 * Comments
 * 
 * for short descriptions see comments in parsesub.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for WDL parser sub routines.
 */


/* ----- INCLUDES ----- */


#include <acknex.h>
#include <strio.c>


/* ----- FUNCTIONS ----- */


var parse_attrib(STRING* strTgt, STRING* strSrc, STRING* strAttrib)
{
	var l, r;
	char c;
	var vRet = 0;
	var vOffs = 0;
	STRING* strParseTemp = str_create("");

	/* the target string contains all values for a certain attribute 
	 * it can be further evaluated by using get_attrib()
	 */
	str_cpy(strTgt, "");
	str_cpy(strParseTemp, strSrc);

	/* it is possible that the same attribute keyword was used
	 * multiple times. Scan through the source multiple times
	 * until there is no new find.
	 */
	do
	{
		l = str_stri(strParseTemp, strAttrib);
		/* if attrib was not found at beginning, check if previous char was ; { or space */
		if (l > 2)
		{
			c = str_getchr (strParseTemp, l - 1);
			if(c != ';' && c != ' ' && c != '{')
			{
				/* looks like a false detect - might be a different longer keyword */
				/* destroy keyword in string and do another search */
				/* clearly not nice, but it's working! */
				str_setchr(strParseTemp, l, ' ');
				l = str_stri(strParseTemp, strAttrib);
			} 
		}
	
		/* attibute string found - now collect the attribute values in a string */
		if (l)
		{
			/* now cut out everything after the attribute until the next semicolon */
			r = str_chr(strParseTemp, l, ';');
			if (r)
			{
				str_cut(strParseTemp, strSrc, vOffs + l + str_len(strAttrib), vOffs + r - 1);
				/* do some cleanup */
				str_replaceall(strParseTemp, " ", ""); /* kill spaces */
				if (str_stri(strParseTemp, ",") == 1)	/* leading comma found - get rid of it */
					str_clip(strParseTemp, 1);
	
				/* if this is not the first segment to be found, insert a comma 
				 * as divider to the previous segment 
				 * vRet can be used as indicator as it is only != 0 after at least
				 * one segment has been found before
				 */
				if (vRet > 0)
					str_cat(strTgt, ",");
	
				vRet = 1; /* indicate that there was a match */
				/* add extracted data to target string */
				str_cat(strTgt, strParseTemp);
	
				/* prepare data string for next loop - remove 
				 * previous occurence of attribute definition
				 */
				str_cpy(strParseTemp, strSrc);
				vOffs += r; /* required for string cutting as original unclipped string is used */
				str_clip(strParseTemp, vOffs);
			}
			
		}
	}while (l > 0);
	ptr_remove(strParseTemp);

	return vRet;
}

var get_numAttrib(STRING* strSrc)
{
	var i = 0;
	var l = 0;

	if (str_len(strSrc) > 0)
	{
		i = 1;	/* there is at least one attribute */
		do
		{
			/* just count commas... */
			l = str_chr(strSrc, l + 1, ',');
			if (l) i++;
		}while(l);
	}	
	return i;
}

var get_attrib(STRING* strTgt, STRING* strSrc, var vIdx)
{
	var l, r;
	var i;
	var vRet = 0;

	if (str_len(strSrc) > 0)
	{
		/* string is not empty - first attribute found */
		i = 0;
		l = 1;
		do
		{
			r = str_chr(strSrc, l, ',');
			/* follower element found */
			if (r) 
			{
				if (i == vIdx)
				{
					/* requested element found - cut from data string */
					str_cut(strTgt, strSrc, l , r - 1);
					vRet = 1; /* indicate that there was a match */
				}
				i++;
				l = r + 1;
			}
			else
			{
				/* last element found - drop everything prior to this element */
				str_cut(strTgt, strSrc, l, str_len(strSrc));
				vRet = 1; /* indicate that there was a match */
			}

		}while(r && (i <= vIdx));
	}	
	
	return vRet;
}


void parse_getStrId(STRING* strId, STRING* strData)
{
	var l;
	l = str_chr(strData, 1, ' '); /* get first space */
	if (l)
	{
		str_cpy(strId, strData);
		str_trunc(strId, str_len(strId) - l + 1); /* get id */ 
		str_clip(strData, l); /* remove id */
	}
}

