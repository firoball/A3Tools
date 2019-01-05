#ifndef __interface_h
#define __interface_h

#define TRUE 1
#define FALSE 0

int triangulate_polygon(int ncontours, int* cntr, double* vertices, int* triangles);
extern int is_point_inside_polygon(double*);

#endif /* __interface_h */
