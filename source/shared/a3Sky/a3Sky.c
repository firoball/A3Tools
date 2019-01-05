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

#ifndef a3Sky_c
#define a3Sky_c

	#include "a3Sky.h"
	
	// a3 sky event
	function a3Sky_ev ()
	{
		// synchronize offsets with camera angle
		mtl->skill3 = floatv(ang(camera->pan) / 90);
		mtl->skill4 = floatv(ang(camera->tilt) / 90);
	}
	
	// sky initialization
	void a3Sky_init (ENTITY* e, var skinid, MATERIAL* mat)
	{
		/* effect is on skin material */
		effect_load(mat, a3_portalSolid_shader);

		/* skills and events are on entity material */
		e->material->skin1 = ent_getskin(e, skinid+1);
		e->material->skill1 = floatv(bmap_width(e->material->skin1));
		e->material->skill2 = floatv(bmap_height(e->material->skin1));
		set(e->material, ENABLE_RENDER);
		e->material->event = a3Sky_ev;		
	}

	void a3Sky_initEnt (ENTITY* e, var skinid)
	{
		/* skills and events are on entity material */
		e->material->skin1 = ent_getskin(e, skinid+1);
		e->material->skill1 = floatv(bmap_width(e->material->skin1));
		e->material->skill2 = floatv(bmap_height(e->material->skin1));
	}

	void a3Sky_initTex (MATERIAL* matTex, MATERIAL* matEnt)
	{
		/* effect is on skin material */
		effect_load(matTex, a3_portalSolid_shader);

		/* skills and events are on entity material */
		set(matEnt, ENABLE_RENDER);
		matEnt->event = a3Sky_ev;		
	}

#endif /* a3Sky_c */