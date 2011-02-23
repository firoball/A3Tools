/*
 *******************************************************************************
 * extract.c
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
 * Script for WDL extractor
 *
 * Comments
 * 
 * for short descriptions see comments in extract.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for WDL extractor.
 */


/* ----- INCLUDES ----- */


#include <acknex.h>
#include <strio.c>


/* ----- GLOBALS ----- */


var vWriteHandle;
var vNumTex;
var vNumBmap;
var vNumRegion;
var vNumWall;
var vNumThing;
var vNumPalette;
var vNumModel;


/* ----- FUNCTIONS ----- */


var getNumTex()    {return vNumTex;}
var getNumBmap()   {return vNumBmap;}
var getNumRegion() {return vNumRegion;}
var getNumWall()   {return vNumWall;}
var getNumThing()  {return vNumThing;}
var getNumPalette(){return vNumPalette;}
var getNumModel()  {return vNumModel;}

/*! \todo: evaluate DEFINEs */
var extract(STRING* strSrcPath, STRING* strTgtPath, STRING* strFile)
{
	var vFail = 0;
	STRING* strPathFile = str_create("");
	STRING* strTemp = str_create("");
	STRING* strError = str_create("");

	vNumTex     = 0;
	vNumBmap    = 0;
	vNumRegion  = 0;
	vNumWall    = 0;
	vNumThing   = 0;
	vNumPalette = 0;
	vNumModel   = 0;
	
	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL extract started...");
	#endif

	str_cpy (strPathFile, strTgtPath);
	str_cat (strPathFile, strFile);

	vWriteHandle = file_open_write(strPathFile);	
	if (vWriteHandle)
	{
		vFail = extract_read(strSrcPath, strFile);
		#ifdef SYSMSG_ACTIVE
		str_for_num(strTemp, vNumBmap);
		str_cat(strTemp, " bitmaps found");
		SYSMSG_print(SYSMSG_SYSTEM, strTemp);
		str_for_num(strTemp, vNumRegion);
		str_cat(strTemp, " regions found");
		SYSMSG_print(SYSMSG_SYSTEM, strTemp);
		str_for_num(strTemp, vNumWall);
		str_cat(strTemp, " walls found");
		SYSMSG_print(SYSMSG_SYSTEM, strTemp);
		str_for_num(strTemp, vNumTex);
		str_cat(strTemp, " textures found");
		SYSMSG_print(SYSMSG_SYSTEM, strTemp);
		str_for_num(strTemp, vNumThing);
		str_cat(strTemp, " things found");
		SYSMSG_print(SYSMSG_SYSTEM, strTemp);
		str_for_num(strTemp, vNumModel);
		str_cat(strTemp, " models found");
		SYSMSG_print(SYSMSG_SYSTEM, strTemp);
		str_for_num(strTemp, vNumPalette);
		str_cat(strTemp, " palettes found");
		SYSMSG_print(SYSMSG_SYSTEM, strTemp);
		#endif
		
		file_close (vWriteHandle);
	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		str_printf (strError, "ERROR: could not write to %s", strPathFile->chars);
		SYSMSG_print(SYSMSG_ERROR, strError);
		#endif
		vFail = 1;
	}	

	ptr_remove(strPathFile);
	ptr_remove(strTemp);
	ptr_remove(strError);

	#ifdef SYSMSG_ACTIVE
	SYSMSG_print(SYSMSG_SYSTEM, "WDL extract done.\r\n");
	#endif

	return vFail;
}

var extract_read(STRING* strPath, STRING* strFile)
{
	var vFail = 0;
	STRING* strData = str_create("");
	STRING* strPathFile = str_create("");
	STRING* strError = str_create("");
	var vTemp = 0;
	var l, r;
	var codesection = 0; /* 0 no section - 1 relevant section - 2 irrelevant section */
	var commentsection = 0;
	
	str_cpy (strPathFile, strPath);
	str_cat (strPathFile, strFile);
	//str_cpy (delimit_str,"\r\n");

	var vHandle = file_open_read(strPathFile);
	if (vHandle)
	{
		#ifdef SYSMSG_ACTIVE
		SYSMSG_print(SYSMSG_SYSTEM, strPathFile);
		#endif

		do
		{
			vTemp = file_str_readto(vHandle,strData, "\r\n", 4000);
			if (vTemp != -1)
			{
				strClean(strData);
				
				/* comment section open */
				if (commentsection == 1)
				{
					l = str_stri(strData, "*/");
					if (l)
					{
						str_clip(strData, l + 1);
						commentsection = 0;
						/* found end of section - continue parsing */
					}
					
				}
				
				if (commentsection == 0)
				{
					/* drop comments */
					r = str_stri(strData, "#");
					if (r)
					{
						str_trunc(strData, str_len(strData) - r + 1);
					}
					r = str_stri(strData, "//");
					if (r)
					{
						str_trunc(strData, str_len(strData) - r + 1);
					}
					r = str_stri(strData, "/*");
					if (r)
					{
						str_trunc(strData, str_len(strData) - r + 1);
						commentsection = 1;
					}
					
					
					/* find code sections */
					if (codesection != 0)
					{
						if (codesection == 1) /* relevant section - copy to file */
						{
							dataWrite(strData);
						}
						r = str_stri(strData, "}");
						if (r)
						{
							if (codesection == 1) /* relevant section - copy to file */
							{
								nlWrite();
							}
							codesection = 0;
						}
					}
					else
					/* no code section active */
					{
						if (str_stri(strData, "BMAP ")) /* BMAP always is a one liner */
						{
							dataWrite(strData);
							nlWrite();
							vNumBmap++;
						}
						else 
						{
							l = foundSection(strData, "REGION "); /* REGIONs have a section */
							if (l)
							{
								dataWrite(strData);
								if (l == 1) codesection = 1; /* open section */
								else nlWrite();
								vNumRegion++;
							}
							else 
							{
								l = foundSection(strData, "WALL "); /* WALLs have a section */
								if (l)
								{
									dataWrite(strData);
									if (l == 1) codesection = 1; /* open section */
									else nlWrite();
									vNumWall++;
								}
								else 
								{
									l = foundSection(strData, "TEXTURE "); /* TEXTUREs have a section */
									if (l)
									{
										dataWrite(strData);
										if (l == 1) codesection = 1; /* open section */
										else nlWrite();
										vNumTex++;
									}
									else 
									{
										l = foundSection(strData, "THING "); /* THINGs have a section */
										if (!l)
											l = foundSection(strData, "ACTOR "); /* ACTORs have a section */
										if (l)
										{
											dataWrite(strData);
											if (l == 1) codesection = 1; /* open section */
											else nlWrite();
											vNumThing++;
										}
										else
										{
											l = foundSection(strData, "PALETTE "); /* PALETTEs have a section */
											if (l)
											{
												dataWrite(strData);
												if (l == 1) codesection = 1; /* open section */
												else nlWrite();
												vNumPalette++;
											}																					
											else if (str_stri(strData, "MODEL ")) /* MODEL always is a one liner */
											{
												dataWrite(strData);
												nlWrite();
												vNumModel++;
											}
											else if (str_stri(strData, "INCLUDE "))
											{
												l = str_stri(strData, "<");
												str_clip(strData, l);
												r = str_stri(strData, ">");
												str_trunc(strData, str_len(strData) - r + 1);
												//printf("include found: %s", strData->chars);
												extract_read(strPath, strData);
											}
											else
											{
												/* check for any irrelevant code section and ignore it */
												l = str_stri(strData, "{");
												r = str_stri(strData, "}");
												if (l && !r)
												{
													codesection = 2;
												}
											}
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

		file_close (vHandle);

	}
	else
	{
		#ifdef SYSMSG_ACTIVE
		str_printf(strError, "ERROR: could not parse %s", strFile->chars);
		SYSMSG_print(SYSMSG_ERROR, strError);
		#endif
		vFail = 1;
	}	
	ptr_remove(strData);
	ptr_remove(strPathFile);
	ptr_remove(strError);
	
	return vFail;
}

var foundSection(STRING* strData, STRING* strId)
{
	var l, r;
	var ret = 0;
	l = str_stri(strData, strId);
	r = str_stri(strData, "{");
	if (l == 1 && r > 0 && r > l)
	{
		if (str_stri(strData, "}") < r)
			ret = 1;
		else
			ret = 2;
	} else if (l == 1 && r == 0 && str_stri(strData, "}") == 0)
	{
		ret = 1;
	}
	
	return ret;	/* 0 no section - 1 open section - 2 closed section */
}

void strClean(STRING* strData)
{
	var l = 0;

	/* kill leading spaces */
	do
	{
		l = str_stri(strData, " ");
		if (l == 1)
			str_clip(strData, 1);
	}while (l == 1);

	/* kill tabs and multiple spaces */
	str_replaceall(strData, "	", " ");
}

void dataWrite(STRING* strData)
{
	
	/* make sure that between element and first bracket is a single space */
	str_replace(strData, " {", "{");
	str_replace(strData, "{", " {");
	/* kill unneeded spaces */
	str_replaceall(strData, ", ", ",");
	str_replaceall(strData, ",<", " <");
	str_replaceall(strData, "  ", " ");
	str_replaceall(strData, "; ", ";");
	str_replaceall(strData, "{ ", "{");
	str_replaceall(strData, " }", "}");
	str_replaceall(strData, "< ", "<");
	str_replaceall(strData, " >", ">");

	file_str_write(vWriteHandle, strData);
}

void nlWrite()
{
	file_str_write(vWriteHandle, "\r\n");
}