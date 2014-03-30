// DUMP VERTEX DATA
var vh = file_open_write("dump\\data.txt");
if (vh)
{
	var ic, iv, o;
	file_var_write(vh, vCntRegionContours);
	file_str_write(vh, "\r\n");
	file_str_write(vh, "\r\n");
	
	o = 0;
	for(ic = 0; ic < vCntRegionContours; ic++)
	{
		file_var_write(vh, vContBuf[ic]);
		file_str_write(vh, "\r\n");
		for (iv = 0; iv < vContBuf[ic]; iv++)
		{
			file_var_write(vh, vVertBuf[o]);
			file_var_write(vh, vVertBuf[o+1]);
			file_str_write(vh, "\r\n");
			o+=3;		
		}
		file_str_write(vh, "\r\n");
	}
	file_close(vh);
}


// DUMP TRIANGLE DATA
vh = file_open_write("dump\\tris.txt");
if (vh)
{
	STRING* str = str_create("");
	var iv;
	for (iv = 0; iv < vCntTriangles; iv++)
	{
	   str_printf(str, "triangle #%d: %d %d %d\n", (int)iv, 
		   vTriFloorBuf[3*iv]+1, vTriFloorBuf[3*iv+1]+1, vTriFloorBuf[3*iv+2]+1);
		file_str_write(vh, str);
	}
	file_close(vh);
	ptr_remove(str);
}

//DRAW REGION
	while(1)
	{
		make_drawControl();
		make_drawTris(vVertBuf, vTriFloorBuf, vCntTriangles);
		make_drawShapes(vVertBuf, vContBuf, vCntRegionContours);
		wait(1);
	}