var drawscale = 1;
var offsetX = 0;
var offsetY = 0;

void make_drawShapes(var* vVertices, var* vVertexCnt, var vContours)
{
	var c, v, i;
	var offs = 0;
	for (c = 0; c < vContours; c++)
	{
		// set start point
		draw_line(vector((vVertices[offs]+offsetX)*drawscale,(vVertices[offs+1]+offsetY)*drawscale,0),NULL,100);
		draw_line(vector((vVertices[offs]+offsetX)*drawscale,(vVertices[offs+1]+offsetY)*drawscale,0),vector(0,0,255),100); //red please
		for (v = 1; v < vVertexCnt[c]; v++)
		{
			draw_line(vector((vVertices[offs+v*3]+offsetX)*drawscale,(vVertices[offs+v*3+1]+offsetY)*drawscale,0),vector(0,0,255),100);
		} 	
		// close shape
		draw_line(vector((vVertices[offs]+offsetX)*drawscale,(vVertices[offs+1]+offsetY)*drawscale,0),vector(0,0,255),100);

		// offset for next contour
		offs += vVertexCnt[c] * 3; 
	}
	draw_line(vector(screen_size.x/2,screen_size.y/2,0),vector(255,0,0),100); //blue please
}

#define VX(i) (vVertices[3*i])
#define VY(i) (vVertices[1 + 3*i])

void make_drawTris(var* vVertices, int* vTriangles, var n)
{
	var i;
	var vx, vy;
	for (i = 0; i < n; i++)
	{
		// set start point
		vx = (VX(vTriangles[i*3])+offsetX) * drawscale;
		vy = (VY(vTriangles[i*3])+offsetY) * drawscale;
		draw_line(vector(vx,vy,0),NULL,100);

		vx = (VX(vTriangles[i*3+1])+offsetX) * drawscale;
		vy = (VY(vTriangles[i*3+1])+offsetY) * drawscale;
		draw_line(vector(vx,vy,0),vector(0,255,255),100);

		vx = (VX(vTriangles[i*3+2])+offsetX) * drawscale;
		vy = (VY(vTriangles[i*3+2])+offsetY) * drawscale;
		draw_line(vector(vx,vy,0),vector(0,255,255),100);

		vx = (VX(vTriangles[i*3])+offsetX) * drawscale;
		vy = (VY(vTriangles[i*3])+offsetY) * drawscale;
		draw_line(vector(vx,vy,0),vector(0,255,255),100);
	}
}


void make_drawControl()
{
	if (key_cur)
		offsetX -= 3*time_step;
	if (key_cul)
		offsetX += 3*time_step;
	if (key_cud)
		offsetY -= 3*time_step;
	if (key_cuu)
		offsetY += 3*time_step;
	if (key_plus)
		drawscale += 0.1 * time_step;
	if (key_slash)
		drawscale -= 0.1 * time_step;
}