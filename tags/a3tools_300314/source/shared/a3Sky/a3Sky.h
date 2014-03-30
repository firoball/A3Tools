//-----------------------------------------------------------------------------
// A3-esque SKY RENDERING
// Copyright (c) 2011, Christian Behrenberg [1]
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
// CREDITS
// Lite-C code, shaders: Christian Behrenberg [1]
//
// REFRENCES
//
//  [1] http://www.christian-behrenberg.com
//-----------------------------------------------------------------------------

#ifndef a3Sky_h
#define a3Sky_h

	// Globals

		float a3_sky_res = 1280; // reference hor. resolution
		float a3_sky_tilt_speed = 4; // tilting speed
		float a3_sky_vert_scale = 1.5; // vertical scale of sky image
		float a3_sky_horizon_offset = 0.5; // offset from center (0.5: lower bounded to screen center)
		
	// Prototypes
	
		function a3Sky_ev ();
		void a3Sky_init (ENTITY* e, var skinid, MATERIAL* mat);
		void a3Sky_initEnt (ENTITY* e, var skinid);
		void a3Sky_initTex (MATERIAL* matTex, MATERIAL* matEnt);
		
	// Internals
	
		//char* a3_portalSolid_shader = "obj_a3_portalSolid.fx";
		char* a3_portalSolid_shader = "obj_a3_portalSolid.fxo";
	

	// include code, if header was included first
	#include "a3Sky.c"

#endif /* a3Sky_h */