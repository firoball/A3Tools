//////////////////////////////////////////////////////////////////////
// Acknex engine functions
// (c) Conitec / JCL 2004
//////////////////////////////////////////////////////////////////////
#ifndef afuncs_h
#define afuncs_h

// var = 22.10 fixed point 32-bit variable, used by C-Script.
// For other languages use the _VAR conversion function

// var math
EXT var F(ang)(var);
EXT var F(sign)(var);
EXT var F(fraction)(var);
EXT var F(integer)(var);
EXT var F(random)(var);
EXT var F(randomize)();
EXT var F(absv)(var);
EXT var F(sinv)(var);
EXT var F(cosv)(var);
EXT var F(tanv)(var);
EXT var F(asinv)(var);
EXT var F(acosv)(var);
EXT var F(atanv)(var);
EXT var F(expv)(var);
EXT var F(logv)(var);
EXT var F(log10v)(var);
EXT var F(sqrtv)(var);
EXT var F(powv)(var,var);
EXT var F(maxv)(var,var);
EXT var F(minv)(var,var);
EXT var F(fsin)(var,var);
EXT var F(fcos)(var,var);
EXT var F(ftan)(var,var);
EXT var F(fasin)(var,var);
EXT var F(facos)(var,var);
EXT var F(fatan)(var,var);
EXT var F(accelerate)(var*,var,var);
EXT var F(clamp)(var,var,var);
EXT var F(cycle)(var,var,var);

// var vector math
EXT ANGLE* F(ang_add)(ANGLE*,ANGLE*);
EXT ANGLE* F(ang_rotate)(ANGLE*,ANGLE*);
EXT var F(vec_length)(VECTOR*);
EXT var F(vec_dist)(VECTOR*,VECTOR*);
EXT var F(vec_dot)(VECTOR*,VECTOR*);
EXT VECTOR* F(vec_normalize)(VECTOR*,var);
EXT VECTOR* F(vec_accelerate)(VECTOR*,VECTOR*,VECTOR*,var);
EXT VECTOR* F(vec_add)(VECTOR*,VECTOR*);
EXT VECTOR* F(vec_diff)(VECTOR*,VECTOR*,VECTOR*);
EXT VECTOR* F(vec_inverse)(VECTOR*);
EXT VECTOR* F(vec_lerp)(VECTOR*,VECTOR*,VECTOR*,var);
EXT VECTOR* F(vec_rotate)(VECTOR*,ANGLE*);
EXT VECTOR* F(vec_scale)(VECTOR*,var);
EXT VECTOR* F(vec_set)(VECTOR*,VECTOR*);
EXT VECTOR* F(vec_sub)(VECTOR*,VECTOR*);
EXT VECTOR* F(vec_for_angle)(VECTOR*,ANGLE*);
EXT var F(vec_to_angle)(ANGLE*,VECTOR*);
EXT VECTOR* F(vec_for_bone)(VECTOR*,ENTITY*,char* bonename);
EXT ANGLE* F(ang_for_bone)(ANGLE*,ENTITY*,char* bonename);
EXT VECTOR* F(vec_for_normal)(VECTOR*,ENTITY*,var);
EXT VECTOR* F(vec_for_vertex)(VECTOR*,ENTITY*,var);
EXT VECTOR* F(vec_for_min)(VECTOR*,ENTITY*);
EXT VECTOR* F(vec_for_max)(VECTOR*,ENTITY*);
EXT VECTOR* F(vec_for_mesh)(VECTOR*,ENTITY*,var);
EXT VECTOR* F(vec_to_mesh)(VECTOR*,ENTITY*,var);
EXT VECTOR* F(vec_for_uv)(VECTOR*,ENTITY*,var);
EXT VECTOR* F(vec_to_uv)(VECTOR*,ENTITY*,var);
EXT VECTOR* F(vec_for_screen)(VECTOR*,VIEW*);
EXT VECTOR* F(vec_to_screen)(VECTOR*,VIEW*);
EXT VECTOR* F(rel_for_screen)(VECTOR*,VIEW*);
EXT VECTOR* F(rel_to_screen)(VECTOR*,VIEW*);
EXT VECTOR* F(vector)(var,var,var);

// float 4x4 matrix math
EXT float* F(mat_identity)(float*);
EXT float* F(mat_inverse)(float*,float*);
EXT float* F(mat_multiply)(float*,float*);
EXT float* F(mat_scale)(float*,var,var,var);
EXT float* F(mat_set)(float*,float*);
EXT float* F(mat_transpose)(float*,float*);

// functions with char* arguments also accept a CScript STRING*.
// To distinguish, the char* must consist of at least 3 characters.
// Otherwise use the _str conversion function.
EXT STRING* F(str_create)(char *content);
EXT var F(str_remove)(STRING*);
EXT STRING* F(str_cpy)(STRING* to,char* from);
EXT STRING* F(str_for_asc)(STRING*,var);
EXT STRING* F(str_for_num)(STRING*,var);
EXT STRING* F(str_cat)(STRING* to,char* from);
EXT STRING* F(str_cat_num)(STRING *s1,char *s2,var num);
EXT STRING* F(str_clip)(STRING*,var);
EXT STRING* F(str_trunc)(STRING*,var);
EXT STRING* F(str_lwr)(STRING*);
EXT STRING* F(str_upr)(STRING*);
EXT var	F(str_cmp)(STRING*,char*);
EXT var	F(str_cmpi)(STRING*,char*);
EXT var	F(str_cmpni)(STRING*,char*);
EXT var	F(str_len)(char*);
EXT var	F(str_stri)(STRING*,char*);
EXT var	F(str_to_asc)(char*);
EXT var	F(str_to_num)(char*);
EXT var F(str_cursor)(STRING*);

// bitmap
EXT BMAP* F(bmap_create)(char* filename);
EXT BMAP* F(bmap_createblack)(var width,var height,var format);
EXT void F(bmap_remove)(BMAP* bmap);
EXT BMAP* F(bmap_for_entity)(ENTITY*,var frame);
EXT BMAP* F(bmap_for_screen)(BMAP*,var,var);
EXT BMAP* F(bmap_for_buffer)(var mode);
EXT void* F(bmap_preload)(BMAP*);
EXT void* F(bmap_purge)(BMAP*);
EXT BMAP* F(bmap_load)(BMAP*,char* filename,var flags);
EXT BMAP* F(bmap_save)(BMAP*,char *filename);
EXT BMAP* F(bmap_to_alpha)(BMAP*,var factor);
EXT BMAP* F(bmap_to_cubemap)(BMAP*);
EXT BMAP* F(bmap_to_mipmap)(BMAP*);
EXT BMAP* F(bmap_to_normals)(BMAP*,var);
EXT BMAP* F(bmap_to_uv)(BMAP*);
EXT BMAP* F(bmap_to_format)(BMAP*,var format);
EXT var	F(bmap_height)(BMAP*);
EXT var	F(bmap_width)(BMAP*);
EXT var	F(bmap_lock)(BMAP*,var);
EXT var	F(bmap_unlock)(BMAP*);
EXT var F(bmap_blit)(BMAP* bDest,BMAP* bSrc,var x,var y);
EXT var F(bmap_fill)(BMAP* bmap,COLOR* color,var alpha);
EXT long F(pixel_for_bmap)(BMAP*,var,var);
EXT long F(pixel_to_bmap)(BMAP*,var x,var y,long pixel);
EXT long F(pixel_for_vec)(COLOR*,var,var);
EXT long F(pixel_to_vec)(COLOR*,var*,var,var);

// multimedia & movies
EXT var F(cd_play)(var from,var to);
EXT var F(cd_pause)();
EXT var F(cd_start)();
EXT var F(cd_track)();
EXT var F(media_play)(char* filename,BMAP* target,var volume);
EXT var F(media_loop)(char* filename,BMAP* target,var volume);
EXT var F(media_pause)(var handle);
EXT var F(media_playing)(var handle);
EXT var F(media_start)(var handle);
EXT var F(media_stop)(var handle);
EXT var F(media_tune)(var handle,var volume,var pitch,var balance);

// sound
EXT SOUND* F(snd_create)(char *filename);
EXT var F(snd_remove)(SOUND*);
EXT var F(snd_play)(SOUND*,var,var);
EXT var F(snd_loop)(SOUND*,var,var);
EXT var F(snd_playing)(var);
EXT var F(snd_pause)(var);
EXT var F(snd_start)(var);
EXT var F(snd_stop)(var);
EXT var F(snd_stopall)(var);
EXT var F(snd_tune)(var,var,var,var);
EXT var F(ent_playloop)(ENTITY*,SOUND*,var);
EXT var F(ent_playsound)(ENTITY*,SOUND*,var);

// collision detection
EXT var F(c_content)(VECTOR*,var mode);
EXT var F(c_scan)(VECTOR*,VECTOR*,VECTOR*,var mode);
EXT var F(c_trace)(VECTOR*,VECTOR*,var mode);
EXT var F(c_move)(ENTITY*,VECTOR*,VECTOR*,var mode);
EXT var F(c_rotate)(ENTITY*,VECTOR*,var mode);
EXT var F(c_setminmax)(ENTITY*);
EXT var F(c_updatehull)(ENTITY*,var);
EXT var F(content)(VECTOR*);
EXT var F(trace)(VECTOR*,VECTOR*);
EXT var F(ent_move)(VECTOR*,VECTOR*);

//physics
EXT var F(ph_selectgroup)(var);
EXT var F(ph_setgravity)(VECTOR*);
EXT var F(ph_setcorrections)(var,var);
EXT var F(ph_setcollisions)(var,var);
EXT var F(ph_setautodisable)(var,var,var,var);
EXT var F(phent_settype)(ENTITY*,var,var);
EXT var F(phent_addcentralforce)(ENTITY*,VECTOR* force);
EXT var F(phent_addforceglobal)(ENTITY*,VECTOR* force,VECTOR* position);
EXT var F(phent_addforcelocal)(ENTITY*,VECTOR* force,VECTOR* position);
EXT var F(phent_addvelcentral)(ENTITY*,VECTOR* speed);
EXT var F(phent_addvelglobal)(ENTITY*,VECTOR* speed,VECTOR* position);
EXT var F(phent_addvellocal)(ENTITY*,VECTOR* speed,VECTOR* position);
EXT var F(phent_addtorqueglobal)(ENTITY*,VECTOR*);
EXT var F(phent_addtorquelocal)(ENTITY*,VECTOR*);
EXT var F(phent_getangvelocity)(ENTITY*,VECTOR*);
EXT var F(phent_getvelocity)(ENTITY*,VECTOR*,VECTOR*);
EXT var F(phent_clearvelocity)(ENTITY*);
EXT var F(phent_setmass)(ENTITY*,var,var);
EXT var F(phent_setfriction)(ENTITY*,var);
EXT var F(phent_setmaxspeed)(ENTITY*,var,var);
EXT var F(phent_setdamping)(ENTITY*,var,var);
EXT var F(phent_enable)(ENTITY*,var);
EXT var F(phent_setgroup)(ENTITY*,var);
EXT var F(phent_setelasticity)(ENTITY*,var,var);
EXT var F(phent_getbounds)(ENTITY*,var,VECTOR*);
EXT var F(phent_makelocal)(ENTITY*,VECTOR*,VECTOR*);
EXT var F(phent_addobstruction)(ENTITY*,var,VECTOR*);
EXT var F(phcon_add)(var,ENTITY*,ENTITY*);
EXT var F(phcon_remove)(var);
EXT var F(phcon_setparams1)(var,VECTOR*,VECTOR*,VECTOR*);
EXT var F(phcon_setparams2)(var,VECTOR*,VECTOR*,VECTOR*);
EXT var F(phcon_setmotor)(var,VECTOR*,VECTOR*,VECTOR*); 
EXT var F(phcon_getposition)(var,VECTOR*);
EXT var F(ph_setcontacts)(VECTOR*, VECTOR*, VECTOR*, VECTOR*);

// effects, particles, materials
EXT MATERIAL* F(mtl_create)();
EXT var F(effect)(EVENT,var,VECTOR*,VECTOR*);
EXT var F(effect_local)(EVENT,var,VECTOR*,VECTOR*);
EXT var F(effect_cpy)(MATERIAL* to,MATERIAL* from);
EXT var F(effect_load)(MATERIAL* mtl,char *filename);
EXT var F(mat_effect)(float *matrix);

// entity
EXT ENTITY* F(ent_create)(char* filename,VECTOR* position,EVENT);
EXT ENTITY* F(ent_createlocal)(char* filename,VECTOR*,EVENT);
EXT ENTITY* F(ent_createlayer)(char* filename,var flags,var layer);
EXT ENTITY* F(ent_createterrain)(BMAP* bmap,VECTOR* pos,VECTOR* grid);
EXT ENTITY* F(ent_next)(ENTITY*);
EXT ENTITY* F(ent_for_name)(char* name);
EXT STRING* F(str_for_entname)(STRING*,ENTITY*);
EXT STRING* F(str_for_entfile)(STRING*,ENTITY*);
EXT void* F(ent_mesh)(ENTITY* ent,var num);
EXT var F(ent_morph)(ENTITY*,char *filename);
EXT var F(ent_morphskin)(ENTITY*,char *filename);
EXT MATERIAL* F(ent_mtlset)(ENTITY*,MATERIAL*,var skin);
EXT var F(ent_preload)(ENTITY*);
EXT var F(ent_purge)(ENTITY*);
EXT var F(ent_remove)(ENTITY*);
EXT var F(ent_animate)(ENTITY*,char *scenename,var,var);
EXT var F(ent_blend)(STRING*,var,var);
EXT var F(ent_blendpose)(ENTITY*,var,var,var);
EXT STRING* F(ent_bonename)(ENTITY*,STRING*,var);
EXT var F(ent_bonereset_all)(ENTITY*);
EXT var F(ent_bonereset)(ENTITY*,char *bonename);
EXT var F(ent_bonereset_branch)(ENTITY*,char *bonename);
EXT var F(ent_bonerotate)(ENTITY*,char *bonename,VECTOR*);
EXT var F(ent_bonerotate_parent)(ENTITY*,char *bonename,VECTOR*);
EXT var F(ent_bonemove)(ENTITY*,char *bonename,VECTOR*);
EXT var F(ent_bonescale)(ENTITY*,char *bonename,VECTOR*);
EXT var F(ent_fixnormals)(ENTITY*,var);
EXT var F(ent_frames)(ENTITY*);
EXT var F(ent_skins)(ENTITY*);
EXT var F(ent_bones)(ENTITY*);
EXT var F(ent_vertices)(ENTITY*);

// pathfinding
EXT var F(path_set)(ENTITY*,char *name);
EXT var F(path_next)(ENTITY*);
EXT var* F(path_getedge)(ENTITY*,var,var,var* skills);
EXT var* F(path_setedge)(ENTITY*,var,var,var* skills);
EXT var* F(path_getnode)(ENTITY*,var,VECTOR* position,var* skills);
EXT var* F(path_setnode)(ENTITY*,var,VECTOR* position,var* skills);
EXT var	F(path_nextnode)(ENTITY*,var,var);
EXT var F(path_scan)(ENTITY*,VECTOR* position,VECTOR* direction,ANGLE*);
EXT var F(path_scannode)(ENTITY*,var number);
EXT var F(path_length)(ENTITY*);
EXT var F(path_spline)(ENTITY*,VECTOR* position,var dist);

// file i/o
EXT char* F(file_cpy)(char *name_to,char *name_from);
EXT char* F(file_rename)(char *name_old,char *name_new);
EXT char* F(file_for_screen)(char *name,var number);
EXT char* F(file_delete)(char *name);
EXT void* F(file_load)(char *name,void* buffer,long* size);
EXT void* F(file_save)(char *name,void* buffer,long size);
EXT var F(file_open_append)(char *name);
EXT var F(file_open_game)(char *name);
EXT var F(file_open_read)(char *name);
EXT var F(file_open_write)(char *name);
EXT var F(file_close)(var handle);
EXT var F(file_length)(var handle);
EXT var F(file_find)(var handle,char *str);
EXT var F(file_seek)(var handle,var offset,var mode);
EXT var F(file_asc_read)(var handle);
EXT var F(file_asc_write)(var handle,var);
EXT var F(file_chr_read)(var handle,STRING*);
EXT var F(file_str_read)(var handle,STRING*);
EXT var F(file_str_readto)(var handle,STRING *s,char *delimit,var length);
EXT var F(file_str_write)(var handle,char*);
EXT var F(file_var_read)(var handle);
EXT var F(file_var_write)(var handle,var);

// keys
EXT var F(key_for_str)(char*);
EXT STRING* F(str_for_key)(STRING*,var);
EXT var F(key_pressed)(var);
EXT var F(key_set)(var,var);

// game & video
EXT var F(level_load)(char *filename);
EXT void F(level_mark)();
EXT void F(level_free)();
EXT var F(update)(char *filename,var);
EXT var F(game_save)(char *filename,var,var);
EXT var F(game_load)(char *filename,var);
EXT var F(sys_record)(char *filename,var mode);
EXT var F(sys_replay)(char *filename);
EXT var F(sys_exit)(char *message);
EXT var F(sys_metrics)(var);
EXT var F(sys_trial)(char* section,char *name,var days); 
EXT var F(video_set)(var,var,var,var);
EXT var F(video_switch)(var,var,var);
EXT var F(video_window)(VECTOR*,VECTOR*,var,char *title);

// panels, views, text
EXT VIEW* F(view_create)(var layer);
EXT PANEL* F(pan_create)(char* content,var layer);
EXT var F(pan_remove)(PANEL*);
EXT var F(pan_setbmap)(PANEL*,var type,var number,BMAP* bmap);
EXT var F(pan_setpos)(PANEL*,var type,var number,VECTOR* xy);
EXT var F(digits_set)(PANEL*,var number,var* digit);
EXT var F(button_state)(PANEL*,var number,var state);
EXT var F(layer_sort)(void *element,var layer);

EXT TEXT* F(txt_create)(var strings,var layer);
EXT void F(txt_remove)(TEXT*);
EXT var F(txt_for_dir)(TEXT*,char *s);
EXT var F(txt_sort)(TEXT*);
EXT var F(txt_load)(TEXT*,char *filename);
EXT var F(txt_setinvisible)(TEXT*,var);
EXT var F(txt_setvisible)(TEXT*,var);
EXT STRING* F(txt_str)(TEXT*,int n);

EXT FONT* F(font_create)(char* content);
EXT FONT* F(font_remove)(FONT*);

// draw
EXT void* F(draw_begin)();
EXT var F(draw_line)(VECTOR* xy,COLOR*,var alpha);
EXT var F(draw_line3d)(VECTOR* xyz,COLOR*,var alpha);
EXT var F(draw_box3d)(VECTOR* vMin,VECTOR* vMax,COLOR *c,var alpha);
EXT var F(draw_point3d)(VECTOR* xyz,COLOR*,var alpha,var size);
EXT var F(draw_text)(char* text,var,var,VECTOR* xy);
EXT var F(draw_textmode)(char* fontname,var,var,var);

// multiplayer
EXT var F(proc_client)(var,var);
EXT var F(proc_local)(var,var);
EXT var F(send_skill)(var*,var);
EXT var F(send_string)(STRING*);
EXT var F(send_string_to)(ENTITY*,STRING*);
EXT var F(send_var)(var*);
EXT var F(send_var_to)(ENTITY*,var*);
EXT var F(session_connect)(char* sessionname,char *hostname);
EXT var F(client_drop)(char* name);
EXT var F(ent_sendnow)(ENTITY*);

// diagnostics
EXT var F(beep)();
EXT var F(diag)(char *text);
EXT var F(diag_var)(char *format,var);
EXT var F(diag_frame)(var *v);	// log this var every frame
EXT var F(error)(char *text);
EXT var F(timer)();				// high precision timer
EXT var F(breaks)();		// for internal tests

// input/output
EXT var F(port_in)(var port);
EXT var F(port_out)(var port,var data);

// misc
EXT var F(dll_open)(char *dllname);
EXT var F(exec)(char* program,char *cmdline);
EXT var F(proc_kill)(var);
EXT var F(proc_status)(EVENT code);	// 1 = function running, 0 = not running
EXT var F(execute)(char *command);
EXT void* F(var_for_name)(char* name);
EXT void* F(ptr_first)(void* p);
EXT void* F(ptr_for_handle)(var handle);
EXT var F(handle)(void* ptr);

////////////////////////////////////////////////////////////////////////////
// conversion and utility functions for the DLL interface

EXT STRING*	F(_str)(char*);	
// char* -> temporary STRING*, for passing char[] constants to functions only 

EXT VECTOR*	F(_vec)(float x,float y,float z); 
// float,float,float -> temporary VECTOR*, for passing vector constants to functions only 

EXT var F(add_buffer)(char* name,void* buffer,long size);	
// add a named buffer for game files

EXT var F(add_folder)(char* pathname);		
// add a path for game files

EXT var F(add_resource)(char* filename);	
// add a WRS resource

EXT var F(add_struct)(void* data,long size);	
// add a memory area to be saved

EXT long F(engine_getobj)(char *name);
// returns the address of any script object with the given name
// if the object was a pointer, ev->isPointer is set

EXT void* F(engine_getvar)(char *name,long* type);
// returns the address of any lite-C object with the given name
// type is set to the type of the variable:
#define VAR_STRUCT	0
#define VAR_CHAR	1
#define VAR_SHORT	2
#define VAR_FIXED	3
#define VAR_LONG	4
#define VAR_FLOAT	5
#define VAR_DOUBLE	7
#define VAR_POINTER	16	// added if it's a pointer	

EXT long F(engine_getfunc)(char *name);
// returns the address of an engine function that is not yet listed in afuncs.h

EXT long F(engine_getscript)(char *name);
// returns the address of a user defined script function or action
// it can not be called directly, but requires engine_callname()

EXT var F(engine_callscript4)(long address,long p1,long p2,long p3,long p4);
// calls a user-defined script function with given address and 4 parameters
// parameters can be a var, an array, or a pointer to a WDL object

EXT var F(engine_callname4)(char *name,long p1,long p2,long p3,long p4);
// calls a user-defined script function with given name and 4 parameters
// parameters can be a var, an array, or a pointer to a WDL object

EXT var F(engine_debugposition)(char **scriptname,long *offset,long *line);
// gives the last position of the source debugger
// scriptname - set to the name of the current script file,
//              or NULL if no debugging is in process
// offset - set to the offset within the file, in bytes
// line - set to the line number within the file
// returns - the result of the last instruction

EXT var F(engine_debugbreakpoint)(char *scriptname,long line, long on);
// sets or resets a breakpoint
// scriptname - name of the script file.
// line - line number of the breakpoint. 
// on - 0 to reset, 1 to set the breakpoint
// returns - 0 if the line does not contain a valid instruction,
// 1 for pure mode and 2 for window mode
// remarks - line must contain a valid C-Script instruction. Instructions like while() 
// or if() don't accept breakpoints - if 0 is returned, increase the line number and retry.

EXT long F(engine_debugstep)(long mode);
// For controlling the source debugger in window mode.
// mode = 2 -> Step over
// mode = 1 -> Step into
// mode = 0 -> Cancel debugging, run until next breakpoint is hit 
// mode = -1 -> Cancel debugging and ignore all further breakpoints.


#endif

// only available for plugin DLLs ///////////////////////////////////////////
#ifndef afuncs_dll_h
#define afuncs_dll_h

EXT long engine_bind(void);	
// to be called in DllMain 

EXT var engine_callname(char *name,long p1=0,long p2=0,long p3=0,long p4=0);
// calls a user-defined script function with given name
// parameters can be a var, an array, or a pointer to a WDL object

EXT var engine_callscript(long address,long p1=0,long p2=0,long p3=0,long p4=0);
// calls a user-defined script function with given address
// parameters can be a var, an array, or a pointer to a WDL object


// not available for plugin DLLs ////////////////////////////////////////////

EXT ENGINE_VARS* engine_open(char* commandline,DWORD callback = 0);	
// open the engine, pass a command line with a model, level, or script
// passing a callback function activates lite-C debug mode

EXT long engine_frame(void);	
// render a frame

EXT void engine_close(void);	
// close the engine, release all resources

#endif
