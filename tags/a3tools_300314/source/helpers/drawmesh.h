#ifndef DRAWMESH_H
#define DRAWMESH_H

void make_drawShapes(var* vVertices, var* vVertexCnt, var vContours);
void make_drawTris(var* vVertices, int* vTriangles, var n);
void make_drawControl();

#include "drawmesh.c"

#endif