/*
 *******************************************************************************
 * makeent.h
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
 * Definition script for entity creation
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef MAKEENT_H
#define MAKEENT_H
/*! \file 
 *  Include file for entity creation.
 */

/* ----- INCLUDES ----- */


#include "regbuf.h"
#include "parser.h"


/* ----- EXTERNAL FUNCTIONS ----- */


void make_regionEnt(REGIONMESH* psData, REGIONDATA* psRegion);
void make_wallEnt(REGIONMESH* psData, WALLDATA* psWall, REGIONDATA* psRegion);
void make_cleanupRegions();

#include "makeent.c"

#endif