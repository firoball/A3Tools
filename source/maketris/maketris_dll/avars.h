//////////////////////////////////////////////////////////////////////
// Internal engine variables and pointers
// (c) Conitec / JCL 2004
//////////////////////////////////////////////////////////////////////

// engine & c_script
ENGINE_VAR version;
ENGINE_VAR edition;
ENGINE_VAR compatibility;
ENGINE_VAR logo;			// logo corner, 1..4
ENGINE_VAR nexus;			// current nexus consumed
ENGINE_VAR event_type;
ENGINE_VAR warn_level;
ENGINE_VAR max_loops;		// WDL only
ENGINE_VAR freeze_mode;
ENGINE_VAR debug_mode;
ENGINE_VAR debug_external;
ENGINE_VAR debug_result;	// not used
ENGINE_VAR last_error;
ENGINE_VAR proc_mode;
ENGINE_VAR run_mode;
ENGINE_VAR patch;
ENGINE_VAR result;
ENGINE_VAR max_nexus;		// -nx command line value
ENGINE_VAR diag_mode;
ENGINE_VAR reserved00[1];

// time & frame
ENGINE_VAR time_step;		// smoothed time of the last frame 
ENGINE_VAR time_factor;		// slow motion effect
ENGINE_VAR time_smooth;
ENGINE_VAR time_frame;		// real frametime without slow motion
ENGINE_VAR total_ticks;
ENGINE_VAR total_secs;
ENGINE_VAR total_frames;
ENGINE_VAR fps_max;			// limits fps
ENGINE_VAR fps_min;
ENGINE_VAR fps_lock;		// locks time to fps_max
ENGINE_VAR reserved01[3];

ENGINE_VAR time_actions;	// time in ms for entity actions
ENGINE_VAR time_render;
ENGINE_VAR time_level;
ENGINE_VAR time_entities;
ENGINE_VAR time_effects;
ENGINE_VAR time_pfuncs;
ENGINE_VAR time_portals;
ENGINE_VAR time_sky;
ENGINE_VAR time_client;
ENGINE_VAR time_server;
ENGINE_VAR time_panels;
ENGINE_VAR time_update;
ENGINE_VAR time_physics;
ENGINE_VAR time_total;
ENGINE_VAR time_idle;
ENGINE_VAR reserved02[2];

ENGINE_VAR sys_seconds;		// PC local time
ENGINE_VAR sys_minutes;
ENGINE_VAR sys_hours;
ENGINE_VAR sys_day;
ENGINE_VAR sys_month;
ENGINE_VAR sys_year;
ENGINE_VAR sys_dow;
ENGINE_VAR sys_doy;
ENGINE_VAR reserved03[6];

// input
ENGINE_VAR enable_joystick;
ENGINE_VAR num_joysticks;
ENGINE_VAR joy_sense;
ENGINE_VECTOR joy_force;
ENGINE_VECTOR joy_raw;
ENGINE_VECTOR joy_rot;
ENGINE_VAR joy_hat;
ENGINE_VECTOR joy2_raw;
ENGINE_VECTOR joy2_rot;
ENGINE_VAR joy2_hat;
ENGINE_VAR joy_buttons;
ENGINE_VAR joy2_buttons;
ENGINE_VAR reserved04[1];

ENGINE_VAR enable_mouse;
ENGINE_VAR mouse_mode;
ENGINE_VAR mouse_sense;
ENGINE_VECTOR mouse_force;
ENGINE_VECTOR mouse_pos;
ENGINE_VECTOR mouse_spot;
ENGINE_VAR mouse_pointer;
ENGINE_VAR mouse_range;
ENGINE_VAR mouse_time;
ENGINE_VAR mouse_moving;
ENGINE_VAR mouse_calm;
ENGINE_VAR mouse_sync;
ENGINE_VAR mouse_valid;
ENGINE_VAR touch_state;
ENGINE_VECTOR mickey;
ENGINE_VECTOR mouse_cursor;	// WDL: pointer
ENGINE_VECTOR mouse_pos3d;
ENGINE_VECTOR mouse_dir3d;
ENGINE_VAR reserved05[3];

ENGINE_VAR enable_key;
ENGINE_VAR key_sense;
ENGINE_VECTOR key_force;
ENGINE_VAR shift_sense;
ENGINE_VAR key_shift;
ENGINE_VAR key_any;
ENGINE_VAR key_lastpressed;
ENGINE_VAR inkey_active;
ENGINE_VAR reserved06[3];

// video
ENGINE_VAR video_mode;
ENGINE_VAR video_depth;
ENGINE_VAR video_screen;	// 1 = fullscreen, 2 = window
ENGINE_VECTOR screen_size;
ENGINE_COLOR screen_color;
ENGINE_VAR window_focus;
ENGINE_VAR video_gamma;
ENGINE_VECTOR window_pos;
ENGINE_VAR reserved07[3];

// renderer
ENGINE_VAR d3d_caps;
ENGINE_VAR d3d_optimize;
ENGINE_VAR d3d_mode;
ENGINE_VAR d3d_nobsp;
ENGINE_VAR d3d_noents;
ENGINE_VAR d3d_novis;
ENGINE_VAR d3d_notex;
ENGINE_VAR d3d_dither;
ENGINE_VAR d3d_lightres;
ENGINE_VAR d3d_monochrome;
ENGINE_VAR d3d_lines;
ENGINE_VAR d3d_anisotropy;
ENGINE_VAR d3d_vbuffersize;
ENGINE_VAR d3d_lockable;
ENGINE_VAR reserved10;
ENGINE_VAR d3d_autotransparency;
ENGINE_VAR d3d_automaterial;
ENGINE_VAR d3d_shaderversion;
ENGINE_VAR shadow_offset;
ENGINE_VAR shadow_threshold;
ENGINE_VAR shadow_range;
ENGINE_VAR shadow_stencil;
ENGINE_VAR d3d_shadowdepth;
ENGINE_VAR d3d_alphadepth;
ENGINE_VAR shadow_lod;
ENGINE_VAR d3d_texsmaps;
ENGINE_VAR d3d_texbmaps;
ENGINE_VAR d3d_texskins;
ENGINE_VAR d3d_texsurfs;
ENGINE_VAR d3d_textotal;
ENGINE_VAR d3d_texmemory;
ENGINE_VAR d3d_alpharef;
ENGINE_VAR d3d_texfree;
ENGINE_VAR d3d_texdepth;
ENGINE_VAR d3d_texmax;
ENGINE_VAR d3d_texlimit;
ENGINE_VAR d3d_entsort;
ENGINE_VAR d3d_near_sprites;
ENGINE_VAR d3d_mipmapping;
ENGINE_VAR d3d_near_models;
ENGINE_VAR d3d_triplebuffer;
ENGINE_VECTOR d3d_lodfactor;
ENGINE_VECTOR d3d_pointlightfalloff;
ENGINE_VECTOR d3d_spotlightfalloff;
ENGINE_VECTOR d3d_spotlightcone;
ENGINE_VAR tree_range;
ENGINE_VAR clip_factor;
ENGINE_VAR clip_particles;
ENGINE_VAR clip_size;
ENGINE_VAR floor_range;
ENGINE_VAR particle_mode;
ENGINE_VAR mip_shaded;
ENGINE_VAR mip_flat;
ENGINE_VAR mip_sprites;
ENGINE_VAR shadow_mode;
ENGINE_VAR trace_floor;

// level parameters
ENGINE_VAR max_particles;
ENGINE_VAR max_entities;
ENGINE_VAR max_lights;
ENGINE_COLOR sky_color;
ENGINE_COLOR reserved20;
ENGINE_VAR sky_blend;
ENGINE_VAR reserved21[2];
ENGINE_VAR sky_scale;
ENGINE_VAR sky_curve;
ENGINE_VAR sky_clip;
ENGINE_VAR terrain_chunk;
ENGINE_VAR terrain_skirt;
ENGINE_VAR num_lights;
ENGINE_VAR num_sounds;
ENGINE_VAR sun_light;
ENGINE_COLOR sun_color;
ENGINE_ANGLE sun_angle;
ENGINE_VECTOR sun_pos;
ENGINE_VAR sun_field;
ENGINE_VAR fog_color;
ENGINE_COLOR d3d_fogcolor1;
ENGINE_COLOR d3d_fogcolor2;
ENGINE_COLOR d3d_fogcolor3;
ENGINE_COLOR d3d_fogcolor4;
ENGINE_VAR turb_speed;
ENGINE_VAR turb_range;
ENGINE_VAR tex_cycles;
ENGINE_VAR detail_size;
ENGINE_VAR pos_resolution;
ENGINE_VAR tex_share;
ENGINE_VAR map_subents;

// statistics
ENGINE_VAR num_particles;
ENGINE_VAR num_entities;
ENGINE_VAR num_visents;
ENGINE_VAR num_vismappolys;
ENGINE_VAR num_visentpolys;
ENGINE_VAR num_vistriangles;
ENGINE_VAR num_actions;

// multiplayer
ENGINE_VAR connection;
ENGINE_VAR dplay_maxclients;
ENGINE_VAR dplay_sync;
ENGINE_VAR dplay_unreliable;
ENGINE_VAR dplay_smooth;
ENGINE_VAR dplay_localfunction;
ENGINE_VAR dplay_clienttimeout;
ENGINE_VAR dplay_entupdate;
ENGINE_VAR dplay_pingrate;
ENGINE_VAR dplay_entrate;
ENGINE_VAR dplay_packetsize;
ENGINE_VAR reserved61;
ENGINE_VAR dplay_latency;
ENGINE_VAR dplay_bps;
ENGINE_VAR dplay_bpspeak;
ENGINE_VAR dplay_bpsreliable;
ENGINE_VAR dplay_bpsunreliable;
ENGINE_VAR dplay_dropped;
ENGINE_VAR recbuf_size;
ENGINE_VAR dplay_diag;
ENGINE_VAR reserved63[6];

// audio
ENGINE_VAR sound_vol;
ENGINE_VAR cdaudio_vol;
ENGINE_VAR midi_vol;
ENGINE_VAR media_handle;
ENGINE_VAR media_layer;
ENGINE_VAR num_mediastreams;
ENGINE_VAR doppler_factor;
ENGINE_VAR master_vol;
ENGINE_VAR reserved64[2];

// physics & collision
ENGINE_VECTOR hull_fatmin;
ENGINE_VECTOR hull_fatmax;
ENGINE_VECTOR hull_narrowmin;
ENGINE_VECTOR hull_narrowmax;

ENGINE_VAR max_ph_entities;
ENGINE_VAR enable_polycollision;
ENGINE_VAR trace_mode;
ENGINE_VAR move_mode;
ENGINE_VAR move_friction;
ENGINE_VAR input_dist;
ENGINE_VECTOR normal;
ENGINE_VECTOR bounce;
ENGINE_VECTOR target;
ENGINE_VECTOR vglide;
ENGINE_VAR on_passable;
ENGINE_VAR in_passable;
ENGINE_VAR in_solid;
ENGINE_VAR tex_light;
ENGINE_COLOR tex_color;
ENGINE_VAR tex_fog;
ENGINE_VAR tex_flag1;
ENGINE_VAR tex_flag2;
ENGINE_VAR tex_flag3;
ENGINE_VAR tex_flag4;
ENGINE_VAR tex_flag5;
ENGINE_VAR tex_flag6;
ENGINE_VAR tex_flag7;
ENGINE_VAR tex_flag8;
ENGINE_VAR hitvertex;
ENGINE_VAR terrain_cell_size;
ENGINE_VAR trace_hit;
ENGINE_VAR ph_num_bodies;
ENGINE_VAR ph_num_contacts;
ENGINE_VAR ph_iterations;
ENGINE_VAR ph_fps_max_lock;	// locks physics to fps_max
ENGINE_VAR move_min_z;
ENGINE_VAR disable_z_glide;
ENGINE_VAR reserved65;
ENGINE_VAR ph_check_distance; // min. body movement per fps_max frame before it's checked

// recently added
ENGINE_VAR reserved8[19];

// button states
ENGINE_VAR key_bksp;
ENGINE_VAR key_enter;
ENGINE_VAR key_esc;
ENGINE_VAR key_alt;
ENGINE_VAR key_ctrl;
ENGINE_VAR key_shiftl;
ENGINE_VAR key_shiftr;
ENGINE_VAR key_space;
ENGINE_VAR key_tab;
ENGINE_VAR key_f1;
ENGINE_VAR key_f2;
ENGINE_VAR key_f3;
ENGINE_VAR key_f4;
ENGINE_VAR key_f5;
ENGINE_VAR key_f6;
ENGINE_VAR key_f7;
ENGINE_VAR key_f8;
ENGINE_VAR key_f9;
ENGINE_VAR key_f10;
ENGINE_VAR key_f11;
ENGINE_VAR key_f12;
ENGINE_VAR key_a;
ENGINE_VAR key_b;
ENGINE_VAR key_c;
ENGINE_VAR key_d;
ENGINE_VAR key_e;
ENGINE_VAR key_f;
ENGINE_VAR key_g;
ENGINE_VAR key_h;
ENGINE_VAR key_i;
ENGINE_VAR key_j;
ENGINE_VAR key_k;
ENGINE_VAR key_l;
ENGINE_VAR key_m;
ENGINE_VAR key_n;
ENGINE_VAR key_o;
ENGINE_VAR key_p;
ENGINE_VAR key_q;
ENGINE_VAR key_r;
ENGINE_VAR key_s;
ENGINE_VAR key_t;
ENGINE_VAR key_u;
ENGINE_VAR key_v;
ENGINE_VAR key_w;
ENGINE_VAR key_x;
ENGINE_VAR key_y;	// 'Z' on US keyboards
ENGINE_VAR key_z;	// 'Y' on US keyboards
ENGINE_VAR key_cuu;
ENGINE_VAR key_cud;
ENGINE_VAR key_cur;
ENGINE_VAR key_cul;
ENGINE_VAR key_pgup;
ENGINE_VAR key_pgdn;
ENGINE_VAR key_home;
ENGINE_VAR key_end;
ENGINE_VAR key_ins;
ENGINE_VAR key_del;
ENGINE_VAR key_car;
ENGINE_VAR key_cal;
ENGINE_VAR key_slash;
ENGINE_VAR key_equals;
ENGINE_VAR key_period;
ENGINE_VAR key_comma;
ENGINE_VAR key_brackl;
ENGINE_VAR key_brackr;
ENGINE_VAR key_semic;
ENGINE_VAR key_bksl;
ENGINE_VAR key_apos;
ENGINE_VAR key_minusc;
ENGINE_VAR key_grave;
ENGINE_VAR key_caps;
ENGINE_VAR key_scrlk;
ENGINE_VAR key_plus;
ENGINE_VAR key_sz;
ENGINE_VAR key_ae;
ENGINE_VAR key_ue;
ENGINE_VAR key_oe;
ENGINE_VAR key_1;
ENGINE_VAR key_2;
ENGINE_VAR key_3;
ENGINE_VAR key_4;
ENGINE_VAR key_5;
ENGINE_VAR key_6;
ENGINE_VAR key_7;
ENGINE_VAR key_8;
ENGINE_VAR key_9;
ENGINE_VAR key_0;
ENGINE_VAR key_pause;

ENGINE_VAR mouse_left;
ENGINE_VAR mouse_right;
ENGINE_VAR mouse_middle;

ENGINE_VAR joy_1;
ENGINE_VAR joy_2;
ENGINE_VAR joy_3;
ENGINE_VAR joy_4;
ENGINE_VAR joy_5;
ENGINE_VAR joy_6;
ENGINE_VAR joy_7;
ENGINE_VAR joy_8;
ENGINE_VAR joy_9;
ENGINE_VAR joy_10;
ENGINE_VAR joy_11;
ENGINE_VAR joy_12;

ENGINE_VAR joy2_1;
ENGINE_VAR joy2_2;
ENGINE_VAR joy2_3;
ENGINE_VAR joy2_4;
ENGINE_VAR joy2_5;
ENGINE_VAR joy2_6;
ENGINE_VAR joy2_7;
ENGINE_VAR joy2_8;
ENGINE_VAR joy2_9;
ENGINE_VAR joy2_10;
ENGINE_VAR joy2_11;
ENGINE_VAR joy2_12;

ENGINE_VAR reserved9[10];

// engine event functions
ENGINE_EVENT on_bksp;
ENGINE_EVENT on_enter;
ENGINE_EVENT on_esc;
ENGINE_EVENT on_alt;
ENGINE_EVENT on_ctrl;
ENGINE_EVENT on_shiftl;
ENGINE_EVENT on_shiftr;
ENGINE_EVENT on_space;
ENGINE_EVENT on_tab;
ENGINE_EVENT on_f1;
ENGINE_EVENT on_f2;
ENGINE_EVENT on_f3;
ENGINE_EVENT on_f4;
ENGINE_EVENT on_f5;
ENGINE_EVENT on_f6;
ENGINE_EVENT on_f7;
ENGINE_EVENT on_f8;
ENGINE_EVENT on_f9;
ENGINE_EVENT on_f10;
ENGINE_EVENT on_f11;
ENGINE_EVENT on_f12;
ENGINE_EVENT on_a;
ENGINE_EVENT on_b;
ENGINE_EVENT on_c;
ENGINE_EVENT on_d;
ENGINE_EVENT on_e;
ENGINE_EVENT on_f;
ENGINE_EVENT on_g;
ENGINE_EVENT on_h;
ENGINE_EVENT on_i;
ENGINE_EVENT on_j;
ENGINE_EVENT on_k;
ENGINE_EVENT on_l;
ENGINE_EVENT on_m;
ENGINE_EVENT on_n;
ENGINE_EVENT on_o;
ENGINE_EVENT on_p;
ENGINE_EVENT on_q;
ENGINE_EVENT on_r;
ENGINE_EVENT on_s;
ENGINE_EVENT on_t;
ENGINE_EVENT on_u;
ENGINE_EVENT on_v;
ENGINE_EVENT on_w;
ENGINE_EVENT on_x;
ENGINE_EVENT on_y;		// 'Z' on US keyboards
ENGINE_EVENT on_z;		// 'Y' on US keyboards
ENGINE_EVENT on_cuu;
ENGINE_EVENT on_cud;
ENGINE_EVENT on_cur;
ENGINE_EVENT on_cul;
ENGINE_EVENT on_pgup;
ENGINE_EVENT on_pgdn;
ENGINE_EVENT on_home;
ENGINE_EVENT on_end;
ENGINE_EVENT on_ins;
ENGINE_EVENT on_del;
ENGINE_EVENT on_car;
ENGINE_EVENT on_cal;
ENGINE_EVENT on_slash;
ENGINE_EVENT on_equals;
ENGINE_EVENT on_period;
ENGINE_EVENT on_comma;
ENGINE_EVENT on_brackl;
ENGINE_EVENT on_brackr;
ENGINE_EVENT on_semic;
ENGINE_EVENT on_bksl;
ENGINE_EVENT on_apos;
ENGINE_EVENT on_minusc;
ENGINE_EVENT on_grave;
ENGINE_EVENT on_caps;
ENGINE_EVENT on_scrlk;
ENGINE_EVENT on_plus;
ENGINE_EVENT on_sz;
ENGINE_EVENT on_ae;
ENGINE_EVENT on_ue;
ENGINE_EVENT on_oe;
ENGINE_EVENT on_1;
ENGINE_EVENT on_2;
ENGINE_EVENT on_3;
ENGINE_EVENT on_4;
ENGINE_EVENT on_5;
ENGINE_EVENT on_6;
ENGINE_EVENT on_7;
ENGINE_EVENT on_8;
ENGINE_EVENT on_9;
ENGINE_EVENT on_0;
ENGINE_EVENT on_pause;

ENGINE_EVENT on_mouse_left;
ENGINE_EVENT on_mouse_right;
ENGINE_EVENT on_mouse_middle;

ENGINE_EVENT on_joy1;
ENGINE_EVENT on_joy2;
ENGINE_EVENT on_joy3;
ENGINE_EVENT on_joy4;
ENGINE_EVENT on_joy5;
ENGINE_EVENT on_joy6;
ENGINE_EVENT on_joy7;
ENGINE_EVENT on_joy8;
ENGINE_EVENT on_joy9;
ENGINE_EVENT on_joy10;
ENGINE_EVENT on_joy11;
ENGINE_EVENT on_joy12;

ENGINE_EVENT on_joy2_1;
ENGINE_EVENT on_joy2_2;
ENGINE_EVENT on_joy2_3;
ENGINE_EVENT on_joy2_4;
ENGINE_EVENT on_joy2_5;
ENGINE_EVENT on_joy2_6;
ENGINE_EVENT on_joy2_7;
ENGINE_EVENT on_joy2_8;
ENGINE_EVENT on_joy2_9;
ENGINE_EVENT on_joy2_10;
ENGINE_EVENT on_joy2_11;
ENGINE_EVENT on_joy2_12;

ENGINE_EVENT on_anykey;
ENGINE_EVENT on_click;
ENGINE_EVENT on_mouse_stop;

ENGINE_EVENT on_close;
ENGINE_EVENT on_load;
ENGINE_EVENT on_level;

ENGINE_EVENT on_server;
ENGINE_EVENT on_client;

ENGINE_EVENT on_d3d_lost;
ENGINE_EVENT on_d3d_reset;

ENGINE_EVENT render_sky;
ENGINE_EVENT render_world;
ENGINE_EVENT render_entities;
ENGINE_EVENT render_solid;

ENGINE_EVENT on_exit;
ENGINE_EVENT on_reserved[18];

// engine pointers ///////////////////////////////////////////////////
ENGINE_VIEW		camera;			// predefined view
ENGINE_VIEW		map_view;		// not used
ENGINE_VIEW		render_view;	// currently rendering view

ENGINE_ENTITY	watched;
ENGINE_ENTITY	me;
ENGINE_ENTITY	you;
ENGINE_ENTITY	sky_cube_level;
ENGINE_ENTITY	sky_dome_level;
ENGINE_ENTITY	mouse_ent;

ENGINE_BMAP		mouse_map;
ENGINE_BMAP		render_map[4];	// current entity textures
void*			render_mesh;	// current entity LPD3DXMESH

ENGINE_MATERIAL	mtl;			// current material
ENGINE_MATERIAL mat_flat;
ENGINE_MATERIAL mat_shaded;
ENGINE_MATERIAL mat_model;
ENGINE_MATERIAL mat_terrain;
ENGINE_MATERIAL mat_sprite;
ENGINE_MATERIAL mat_particle;
ENGINE_MATERIAL mat_metal;
ENGINE_MATERIAL mat_sky;
ENGINE_MATERIAL mat_shadow;
ENGINE_MATERIAL mat_unlit;

ENGINE_STRING	debug_str;
ENGINE_STRING	watch_str;
ENGINE_STRING	delimit_str;
ENGINE_STRING	tex_name;
ENGINE_STRING	app_name;		// name of the main script without extension
ENGINE_STRING	level_name;
ENGINE_STRING	player_name;
ENGINE_STRING	session_name;
ENGINE_STRING	server_name;
ENGINE_STRING	server_ip;
ENGINE_STRING	work_dir;
ENGINE_STRING	save_dir;
ENGINE_STRING	exe_dir;

ENGINE_ENTITY	player;
ENGINE_STRING	user_name;		// registered user name, 19 chars
ENGINE_ENTITY	passable_ent;
ENGINE_STRING	path_name;		// path name of the last opened object file
ENGINE_STRING	command_str;	// command line

ENGINE_ long	epunused1[3];

ENGINE_ void*	render_d3dmaterial;		// current LPD3DMATERIAL9
ENGINE_ void*	render_d3dxeffect;		// current LPD3DXEFFECT
ENGINE_MATERIAL	render_material;		// current material containing effect handles
ENGINE_ long	epunused2[8];

// engine matrices
ENGINE_ float*	matEffect;
ENGINE_ float*	matView;
ENGINE_ float*	matViewInv;
ENGINE_ float*	matProj;
ENGINE_ float*	matWorld;

// engine functions //////////////////////////////////////////////////
ENGINE_ long  eunused1[2];
		long  (*DLLExec)(long n,long p1,long p2,long p3);	// DLLLIB internal use only
		void  (*SendPacket)(long to,void *data,long size,long flags);		// the send function of the engine
		void  (*ReceivePacket)(long from,void *data,long size);				// user provided receive function
		long  (*ScanMessage)(UINT message, WPARAM w_param, LPARAM l_param);	// user provided message handler
		long  (*GetObj)(char *name);	// DLLLIB internal use only
		long  (*GetFunc)(char *name);	// DLLLIB internal use only
ENGINE_ long  eunused2[2];
		long  (*CallFunc)(long,long,long,long,long);	// Call a user defined WDL action
ENGINE_ BOOL  isPointer;		// TRUE if engine_getvar returned a pointer rather than the object
ENGINE_ void  *EngineFunctions;	// Null-terminated ENGINE_FUNCTION list 
ENGINE_ long  eunused3[10];

// DirectX interfaces ////////////////////////////////////////////////
ENGINE_ void* pdi;			// pointer to the DirectInput object 
ENGINE_ void* pdimouse;		// pointer to the DirectInput mouse device
ENGINE_ void* pdikbd;		// not used - keyboard doesn't use DirectInput
ENGINE_ void* pdijoy;		// not used  -joystick doesn't use DirectInput

ENGINE_ void* pdplayclient; // pointer to the DirectPlayClient interface 
ENGINE_ void* pdplayserver; // pointer to the DirectPlayServer interface 
ENGINE_ void* dunused1[2];	// not used 

ENGINE_ void* pds;			// pointer to the IDirectSound interface
ENGINE_ void* pdsb;			// pointer to the primary IDirectSoundBuffer

ENGINE_ void* pd3d;			// pointer to the Direct3D interface 
ENGINE_ void* pd3ddev;		// pointer to the IDirect3DDevice
ENGINE_ HWND  hWnd;			// main app window
ENGINE_ void* pd3dcaps;		// pointer to the current D3DCAPS9

ENGINE_ long  hInstance;	// app hinstance
ENGINE_ HWND  hWndTarget;	// target window
ENGINE_ RECT* pRectTarget;	// target rectangle
ENGINE_ void* dunused2[6];	// not used

ENGINE_ void* pdsbs;		// pointer to the recently created secondary IDirectSoundBuffer
