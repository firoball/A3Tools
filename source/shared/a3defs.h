/*
 *******************************************************************************
 * a3defs.h
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
 * A3 related definitions
 *
 * Comments
 * 
 * for short descriptions see comments in this file
 *
 *******************************************************************************
 */

#ifndef A3DEFS_H
#define A3DEFS_H

/*! \file 
 *  Include file for general A3 related defines.
 */

/* ----- DEFINITIONS ----- */


/*! \name Constant Data 
 *  These constants are used as parameters for certain functions.
 * \{ */
/* general flags */
#define A3_FLAG1 				0x00000001
#define A3_FLAG2 				0x00000002
#define A3_FLAG3 				0x00000004
#define A3_FLAG4 				0x00000008
#define A3_FLAG5 				0x00000010
#define A3_FLAG6 				0x00000020
#define A3_FLAG7 				0x00000040
#define A3_FLAG8 				0x00000080

/* texture flags */
#define A3_GHOST				0x00000100
#define A3_DIAPHANOUS		0x00000200
#define A3_BEHIND				0x00000400
#define A3_SHADOW				0x00000800
#define A3_LIGHTMAP			0x00001000
#define A3_SKY					0x00002000

/* wall flags */
#define A3_INVISIBLE			0x00010000
#define A3_PASSABLE			0x00020000
#define A3_IMMATERIAL		0x00040000
#define A3_IMPASSABLE		0x00080000
#define A3_TRANSPARENT		0x00100000
#define A3_CURTAIN			0x00200000
#define A3_PORTCULLIS		0x00400000
#define A3_FENCE				0x00800000

/* region flags */
#define A3_FLOOR_ASCEND		0x00000100
#define A3_CEIL_ASCEND		0x00000200
#define A3_FLOOR_DESCEND	0x00000400
#define A3_CEIL_DESCEND		0x00000800

/* thing flags */
//#define A3_INVISIBLE			0x00010000
//#define A3_PASSABLE			0x00020000
#define A3_FLAT				0x00040000
#define A3_ACTOR				0x00080000
#define A3_GROUND				0x00100000
#define A3_CANDELABER		0x00200000

/* custom flags */
#define A3_SCRIPTING			0x80000000

#define CEILING 1
#define FLOOR 0
#define SKIN 1
#define SPRITE 0

/* \} */

#endif