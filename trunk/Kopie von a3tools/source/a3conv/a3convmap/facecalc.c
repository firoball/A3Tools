/*
 *******************************************************************************
 * facecalc.c
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
 * Script for mesh face based calculations
 *
 * Comments
 * 
 * for short descriptions see comments in facecalc.h
 *
 *******************************************************************************
 */

/*! \file 
 *  Script for mesh face based calculations.
 */

/* ----- INCLUDES ----- */


#include <acknex.h>


/* ----- FUNCTIONS ----- */


var face_checkDegenerated(var* vVertexBuf, int* iTriangleBuf, var vTriIdx, VECTOR* vecN)
{
	var vVert0;
	var vVert1;
	var vVert2;
	VECTOR vecV01;
	VECTOR vecV02;
	var vDegenerated;
#ifdef former_degeneration_check
	float fCosDot;
	float fLen1;
	float fLen2;
	float fDot;
#endif

	/* get vertex indices */
	vVert0 = iTriangleBuf[3*vTriIdx];
	vVert1 = iTriangleBuf[3*vTriIdx+1];
	vVert2 = iTriangleBuf[3*vTriIdx+2];

	/* vector from vertex 0 to vertex 1 */
	vecV01.x = vVertexBuf[vVert1*3] - vVertexBuf[vVert0*3];
	vecV01.y = vVertexBuf[vVert1*3+1] - vVertexBuf[vVert0*3+1];
	vecV01.z = vVertexBuf[vVert1*3+2] - vVertexBuf[vVert0*3+2];

	/* vector from vertex 0 to vertex 2 */
	vecV02.x = vVertexBuf[vVert2*3] - vVertexBuf[vVert0*3];
	vecV02.y = vVertexBuf[vVert2*3+1] - vVertexBuf[vVert0*3+1];
	vecV02.z = vVertexBuf[vVert2*3+2] - vVertexBuf[vVert0*3+2];

	vec_cross(vecN, &vecV01, &vecV02);
	vec_normalize(vecN, 1);
	if (vec_length(vecN) == 0)
	{
		vDegenerated = 1;
	}
	else
	{	
		vDegenerated = 0;
	}

	/* since it does not work proprely anyway, just check whethr normal = 0... */
#ifdef former_degeneration_check
	/* check if area of triangle is 0.
	 * The forumla actually does not deliver the real area, but since only
	 * an area of 0 or non 0 is of interest, it can be simplified
	 * Areal   = 0.5 * a * b * sin( acos( dot(CA, CB)/ (len(CA)*len(CB)) ) )
	 */
	fLen1 = vec_length(&vecV01);
	fLen2 = vec_length(&vecV02);

	/* any vector length is 0? */
	if (fLen1 == 0 || fLen2 == 0)
	{
		vDegenerated = 1;
	}
	else
	{
		fDot = vec_dot(&vecV01, &vecV02);
		fCosDot = acos(fDot / (fLen1 * fLen2));
		/* stupid var inaccuracy... 
		 * when removing degenerated fces this will cause holes in the mesh
		 * but since the mesh stays unmodified, thigns can be done this way
		 */
		//if ((fCosDot < 0.03) && (fLen1 == fLen2)) 
		//	fCosDot = 0;
		
		/* sin(0) = 0 */
		if (fCosDot == 0)
		{
			vDegenerated = 1;
		}
		else
		{
			vDegenerated = 0;
		}
	}	
	#endif
	return vDegenerated;
}

void face_calcNormal(var vVert0, var vVert1, var vVert2, var* vVertexBuf, VECTOR* vecN)
{
	VECTOR vecV01;
	VECTOR vecV02;

	/* vector from vertex 0 to vertex 1 */
	vecV01.x = vVertexBuf[vVert1*3] - vVertexBuf[vVert0*3];
	vecV01.y = vVertexBuf[vVert1*3+1] - vVertexBuf[vVert0*3+1];
	vecV01.z = vVertexBuf[vVert1*3+2] - vVertexBuf[vVert0*3+2];
	
	/* vector from vertex 0 to vertex 2 */
	vecV02.x = vVertexBuf[vVert2*3] - vVertexBuf[vVert0*3];
	vecV02.y = vVertexBuf[vVert2*3+1] - vVertexBuf[vVert0*3+1];
	vecV02.z = vVertexBuf[vVert2*3+2] - vVertexBuf[vVert0*3+2];

	/* get the normal */
	vec_cross(vecN, &vecV01, &vecV02);
	vec_normalize(vecN, 1);
}
