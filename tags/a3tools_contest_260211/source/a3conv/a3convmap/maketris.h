/*
 *******************************************************************************
 * maketris.h
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
 * Definition script for triangulation DLL
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef MAKETRIS_H
#define MAKETRIS_H
/*! \file 
 *  Include file for triangulation DLL.
 */

/* ----- EXTERNAL FUNCTIONS ----- */


/* DLL */
var maketris_triangulate(var ncontours, var* cntr, var* vertices, int* triangles);
var maketris_getPointInPoly(var* vertex);

#endif