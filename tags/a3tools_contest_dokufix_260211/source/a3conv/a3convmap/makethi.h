/*
 *******************************************************************************
 * makethi.h
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