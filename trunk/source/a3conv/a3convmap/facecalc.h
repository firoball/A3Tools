/*
 *******************************************************************************
 * facecalc.h
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
 * Definition script for mesh face based calculations
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef FACECALC_H
#define FACECALC_H
/*! \file 
 *  Include file for mesh face based calculations.
 */


/* ----- EXTERNAL FUNCTIONS ----- */


var face_checkDegenerated(var* vVertexBuf, int* iTriangleBuf, var vTriIdx, VECTOR* vecN);
void face_calcNormal(var vVert0, var vVert1, var vVert2, var* vVertexBuf, VECTOR* vecN);

#include "facecalc.c"

#endif
