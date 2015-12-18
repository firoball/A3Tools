/*
 *******************************************************************************
 * unpack.h
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
 * definition script for WRS unpacker
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef UNPACK_H
#define UNPACK_H
/*! \file 
 *  Include file for WRS unpacker.
 */


/* ----- EXTERNAL FUNCTIONS ----- */


void unpack_resource(STRING* strPath, STRING* strWrsFile, LIST* pFileList);

#include "unpack.c"

#endif