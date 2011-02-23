/*
 *******************************************************************************
 * makethi.h
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
 * Definition script for thing generator
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef MAKETHI_H
#define MAKETHI_H
/*! \file 
 *  Include file for thing generator.
 */

/* ----- EXTERNAL FUNCTIONS ----- */


void make_things(STRING* strTgtPath);
void make_cleanupThings();

#include "makethi.c"

#endif