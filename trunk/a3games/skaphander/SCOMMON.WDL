///////////////////////////////////////////////////////
// Panels, Definitionen und Actions fuer skaphander
///////////////////////////////////////////////////////

#DEFINE SVGA;
#DEFINE DEBUG;
#DEFINE HARMLESS;	// monsters don't move
#DEFINE NO_PANEL;	// Start without panel for screenshots
DEFINE NO_BRIEFING;

DEFINE NO_RESOLUTION_SWITCH;
DEFINE UEBERSPRINGEN_LEVEL;

///////////////////////////////////////////////////////
SAVEDIR	"";	// save into current directory

DEFINE	STARTNAME,"SKSTA";
DEFINE	SAVENAME, "SKAPH";
DEFINE	SKILLNAME,"SKAGO";

IFDEF HIRES;
	VIDEO		S800x600;
   DEFINE DEF_SCREEN_WIDTH,     800;
	DEFINE DEF_SCREEN_HGT_PANEL, 502;
   DEFINE DEF_SCREEN_HGT_MAP,   490;
	DEFINE DEF_SCREEN_HGT      , 600;
IFELSE;
    IFDEF SVGA;
         VIDEO		S640x480;
        DEFINE DEF_SCREEN_WIDTH,     640;
         DEFINE DEF_SCREEN_HGT_PANEL, 402;
        DEFINE DEF_SCREEN_HGT_MAP,   392;
         DEFINE DEF_SCREEN_HGT      , 480;
    IFELSE;
         VIDEO		X320x400;
        DEFINE DEF_SCREEN_WIDTH,     320;
         DEFINE DEF_SCREEN_HGT_PANEL, 336;
         DEFINE DEF_SCREEN_HGT_MAP,   336;
         DEFINE DEF_SCREEN_HGT      , 400;
    ENDIF;
ENDIF;

////////////////////////////////////////////////
DEFINE OLD_VERS;	// alte/neue lift-version
IBANK		<op.ibk>;
DRUMBANK	<opdrum.ibk>;
MIDI_PITCH	2;

////////////////////////////////////////////////
#STRING pause_on,"Pause";
#STRING have_jet,"Jetbooster installed\nPress HOME/JOY4 for ignition";
#STRING full_ammo,"Full Data Refresh\nVery Happy Debugging";
#STRING god_off,"God Mode Off";
#STRING god_on,"God Mode On";
////////////////////////////////////////////////
DEFINE armor,SKILL1;
DEFINE counter,SKILL1;
DEFINE dead,FLAG7;
////////////////////////////////////////////////
SOUND zschbumm,	<skaplod5.wav>;
SOUND tschok,		<ttrff2.wav>;
SOUND booster, 	<jet.wav>;
SOUND energy_low,	<e_alarm.wav>;
////////////////////////////////////////////////

// LOCAL und Global Skill ausgelagert
// INCLUDE <LGSkills.wdl>  // moeglichts beim start des Hauptlevels

// Alle anderen Skills werden nur bei LOAD geladen
SKILL SOUND_VOL 	{ MIN 0; VAL 0.5; MAX 1; }
SKILL MUSIC_VOL 	{ MIN 0; VAL 0.5; MAX 1; }
SKILL AUDIO_VOL 	{ MIN 0; VAL 0.5; MAX 1; }
SKILL	screen_size	{ VAL 1; }
SKILL	last_player { VAL 1; }	// Monitore 1..4
#SKILL	max_level	{ VAL 0; }	// Maximal erreichter Level
#SKILL	via_nexlev	{ VAL 0; }	// Einsprung via next_level

SKILL points		{ VAL 0; 	MIN 0; }
SKILL health		{ VAL 300; MIN 0; MAX 400; }
SKILL energy		{ VAL 200; MIN 0; MAX 300; }
SKILL gun_type		{ VAL 0; }
SKILL gun1 			{ VAL 0; }	  // DEBUGGER
SKILL gun2 			{ VAL 0; }	  // DEBUGGER X 2
SKILL gun3 			{ VAL 0; }	  // INTERRUPTER
SKILL gun4 			{ VAL 0; }	  // ERASER
SKILL minen			{ VAL 0; }	  // MINEN
SKILL shield		{ MIN 0; VAL 0; }
SKILL old_shield	{ VAL 0; MIN 0; }
SKILL gun5 			{ VAL 0; }	// saege
SKILL gun_strength	{ VAL 0; }
SKILL gun_wait			{ MIN 0;	}
SKILL last_hitdist	{ VAL 0; MIN 2; }
SKILL last_hitmode	{ VAL 0; }
SKILL last_playerz	{ VAL 0; }
////////////////////////////////////////////////

SKILL PLAYER_LIGHT	{ VAL 0.5;	}
SKILL PLAYER_WIDTH	{ VAL 2.5;	}
SKILL PLAYER_CLIMB	{ VAL 1.6;	}

//jc 22.10.
//SKILL HIT_DIST			{ MIN	2;	}	// avoid div by zero
SKILL my_light			{ VAL 0.5; }
SKILL abschussquote	{ VAL 0; }
SKILL virenquote		{ VAL 0; }	// viren pro level
SKILL bugs_weg			{ VAL 0; }
SKILL bugquote			{ VAL 0; }	// bugs pro level
SKILL	praemie 			{}
SKILL save_no			{ VAL 0; }
SKILL slot_no			{ VAL 0; }
SKILL freeze			{ VAL 0; }	// move_mode 0;
#SKILL service_mode	{ VAL 0; }
SKILL pause				{ VAL 0; }
#SKILL old_maxlev		{ VAL 0; }
#SKILL old_points		{ VAL 0; 	MIN 0; }
SKILL old_health		{ VAL 300;	MIN 0; MAX 400; }
SKILL count_health	{ VAL 300; }
SKILL count_energy	{ VAL 200; }
SKILL count_points	{ VAL 0; }
#SKILL old_gun1 		{ VAL 0; }
#SKILL old_gun2 		{ VAL 0; }
#SKILL old_gun3 		{ VAL 0; }
#SKILL old_gun4 		{ VAL 0; }
#SKILL old_minen		{ VAL 0; }
SKILL my_distance		{ }
/////////////////////////////////////////////////////////
SKILL	message_delay	{ VAL 0; }		// delay in ticks
SKILL	fade 				{ VAL 0; }
// Parameters for LoadLevel
SKILL NextLevel { VAL -1; }
SKILL LocalLevelSwitchMode { VAL 0; }
/////////////////////////////////////////////////////////
SYNONYM fire			{ TYPE ACTION; DEFAULT tu_nix; }
SYNONYM set_gun		{ TYPE ACTION; DEFAULT set_gun0; }
SYNONYM set_gun1		{ TYPE ACTION; DEFAULT set_gun0; }
SYNONYM set_gun2		{ TYPE ACTION; DEFAULT set_gun0; }
SYNONYM set_gun3		{ TYPE ACTION; DEFAULT set_gun0; }
SYNONYM set_gun4		{ TYPE ACTION; DEFAULT set_gun0; }
SYNONYM set_gun5		{ TYPE ACTION; DEFAULT set_gun0; }
SYNONYM set_gun6		{ TYPE ACTION; DEFAULT set_gun0; }

//jc 16.09. Nur so funktioniert es auch mit synonym-Wechsel..
ACTION sset_gun1 { CALL set_gun1; }
ACTION sset_gun2 { CALL set_gun2; }
ACTION sset_gun3 { CALL set_gun3; }
ACTION sset_gun4 { CALL set_gun4; }
ACTION sset_gun5 { CALL set_gun5; }
ACTION sset_gun6 { CALL set_gun6; }

SYNONYM	letzt_pal  	{TYPE ACTION;}  /// zuletzt benutzte Palette

FONT		msg_font,	<font_amb.pcx>,8,16;
DEFINE FONT_SIZE_X, 8;
DEFINE FONT_SIZE_Y, 16;

#IFDEF DEBUG;
#	FONT	debug_font,<panfont.lbm>,8,10;
	FONT	debug_font,<skafo_02.pcx>,6,10;
#ENDIF;
////////////////////////////////////////////
//zufallstexte

TEXT  randtxt_matma_speicher{   //speichert nur die random strings
//ueber Index wird entsprechender string geholt
	POS_X 	0;
	POS_Y 	0;
	STRINGS 	10;
	FONT		msg_font;
	STRING 	matbad_1,matbad_2,matbad_3,matbad_4,matbad_5,
				matbad_6,matbad_7,matbad_8,matbad_9,matbad_0;
}

TEXT  randtxt_abkratz_speicher{   //speichert nur die random strings
//ueber Index wird entsprechender string geholt
	POS_X 	0;
	POS_Y 	0;
	STRINGS 	10;
	FONT		msg_font;
	STRING 	abkratz_1,abkratz_2,abkratz_3,abkratz_4,abkratz_5,
				abkratz_6,abkratz_7,abkratz_8,abkratz_9,abkratz_0;
}

SKILL zwerg_Skill{ MIN 1; MAX 10; VAL 5; } //skill fuer zwischenergebnis

////////////////////////////////////////////

/*
// Default-Werte fuer neue Agenten
ACTION 		set_defaults {
	SET		difficulty,2;
	SET		last_slot,2;
	BRANCH	set_def1;
}

ACTION set_def1 {
	SET max_level,0;
	SET	points,0;
	SET	health,300;
	SET	energy,200;
	SET	gun1,0;
	SET	gun2,0;
	SET	gun3,0;
	SET	gun4,0;
	SET	minen,0;
	SET	gun5,0;
	SET	shield,0;
}
*/
/////////////////////////////////////////////////////////
STRING	nullstring," ";
STRING	panstring,"           ";
STRING	erastring,"_";

TEXT screen_msg {
	POS_X 	12;
	POS_Y 	12;
	FONT		msg_font;
	STRING	nullstring;
}

TEXT panel_msg {
	POS_X 	130;
	POS_Y 	349;
	FONT		msg_font;
	STRING	nullstring;
}

TEXT touch_txt {
IFDEF	HIRES;
	POS_X 	390; // 390    //800x600
	POS_Y 	577; // 582;
	FONT	debug_font;
IFELSE;
IFDEF	SVGA;
	POS_X 	290;	 //SVGA 640x480
	POS_Y 	462;
	FONT	debug_font;
IFELSE;
	POS_X 	130;	//VGA  320x400
	POS_Y 	384;
	FONT	debug_font;
ENDIF;
ENDIF;
	STRING	panstring;
}

SKILL TOUCH_MODE { VAL 1; }
IFNDEF DEBUG;
  SKILL MOUSE_MODE { VAL 1; }
IFDEF	HIRES;
  SKILL MOUSE_X { VAL 400; }
  SKILL MOUSE_Y { VAL 270; }
IFELSE; IFDEF SVGA;
  SKILL MOUSE_X { VAL 320; }
  SKILL MOUSE_Y { VAL 210; }
IFELSE;
  SKILL MOUSE_X { VAL 160; }
  SKILL MOUSE_Y { VAL 176; }
ENDIF; ENDIF;
ENDIF;
/////////////////////////////////////////////////////////
//BMAP	brainout <raum3_d.lbm>;
//PALETTE picture_pal { PALFILE <raum3_d.lbm>; }

//mr 24.09
PALETTE PAL_ANIM
{
   CYCLE 1;
   PALFILE <PAL_1.pcx>;
}
PALETTE PAL_ANIM_2
{
   CYCLE 2;
   PALFILE <PAL_2.pcx>;
}
PALETTE PAL_ANIM_3
{
   CYCLE 3;
   PALFILE <PAL_3.pcx>;
}
PALETTE PAL_ANIM_4
{
   CYCLE 4;
   PALFILE <PAL_4.pcx>;
}
PALETTE PAL_ANIM_5
{
   CYCLE 5;
   PALFILE <PAL_5.pcx>;
}
PALETTE PAL_ANIM_6
{
   CYCLE 6;
   PALFILE <PAL_6.pcx>;
}
PALETTE PAL_ANIM_7
{
   CYCLE 7;
   PALFILE <PAL_7.pcx>;
}
PALETTE PAL_ANIM_8
{
   CYCLE 8;
   PALFILE <PAL_8.pcx>;
}
PALETTE PAL_ANIM_9
{
   CYCLE 9;
   PALFILE <PAL_9.pcx>;
}
PALETTE PAL_ANIM_10
{
   CYCLE 10;
   PALFILE <PAL_10.pcx>;
}

PALETTE green_pal { PALFILE <green.bbm>;
	RANGE 16,16;	RANGE 32,16;	RANGE 48,32;	RANGE 80,32;
	RANGE 112,16;	RANGE 128,16;	RANGE 144,32;
	RANGE 176,16;	RANGE 192,16;	RANGE 208,16;	RANGE 224,16;
}
PALETTE matmapal { PALFILE <matmapal.bbm>;
	RANGE 16,16;	RANGE 32,16;	RANGE 48,32;	RANGE 80,32;
	RANGE 112,16;	RANGE 128,16;	RANGE 144,32;
	RANGE 176,16;	RANGE 192,16;	RANGE 208,16;	RANGE 224,16;
}
PALETTE red_pal { PALFILE <red.bbm>; }

PALETTE black_2_pal { PALFILE <black_2.bbm>;
	RANGE 16,16;	RANGE 32,16;	RANGE 48,32;	RANGE 80,32;
	RANGE 112,16;	RANGE 128,16;	RANGE 144,32;
	RANGE 176,16;	RANGE 192,16;	RANGE 208,16;	RANGE 224,16;
}

PALETTE black_pal { PALFILE <black.bbm>;
	RANGE 16,16;	RANGE 32,16;	RANGE 48,32;	RANGE 80,32;
	RANGE 112,16;	RANGE 128,16;	RANGE 144,32;
	RANGE 176,16;	RANGE 192,16;	RANGE 208,16;	RANGE 224,16;
}

PALETTE pal1 { PALFILE <skafonts.lbm>;
	RANGE 16,16;	RANGE 32,16;	RANGE 48,32;	RANGE 80,32;
	RANGE 112,16;	RANGE 128,16;	RANGE 144,32;
	RANGE 176,16;	RANGE 192,16;	RANGE 208,16;	RANGE 224,16;
	FLAGS	BLUR;
}
PALETTE PAL_ANIM_LAST
{
    PALFILE <PAL_10.pcx>;
	RANGE 16,16;	RANGE 32,16;	RANGE 48,32;	RANGE 80,32;
	RANGE 112,16;	RANGE 128,16;	RANGE 144,32;
	RANGE 176,16;	RANGE 192,16;	RANGE 208,16;	RANGE 224,16;
	FLAGS	BLUR;
}
// letzte palette!!

//INCLUDE <level.wdl>;

//////////////////////////////////////
/// PALETTEN FADDING - ACTION
///////////
ACTION  l_fade_norm  {
	SET		letzt_pal,l_fade_norm;
	FADE_PAL	pal1,1;
}

ACTION	l_fade_matma {
	SET		letzt_pal,l_fade_matma;
	FADE_PAL	matmapal,1;
}

ACTION	l_fade_matma06 {
	SET		letzt_pal,l_fade_matma06;
	FADE_PAL	matmapal,0.6;
}

ACTION  l_fade_black2 {
	SET		letzt_pal,l_fade_black2;
	FADE_PAL	black_2_pal,1;
}

ACTION  l_fade_gruen {
	SET		letzt_pal,l_fade_gruen;
	FADE_PAL	green_pal,0.6;
}


/////////////////////////////////////////////////////////
///// NIX BITMAP aso nix sehen und nix spühren
/////////////////////////////////////////////////////////
BMAP	nix_map,<bugs.lbm>,0,80,64,64;	  //CG

TEXTURE nix_tex {
	SCALE_XY	10,10;
	BMAPS		nix_map;
}

WALL nix_wal {
	TEXTURE nix_tex;
	FLAGS	INVISIBLE,PASSABLE;
}
WALL nixp_wal {
	TEXTURE nix_tex;
	FLAGS	INVISIBLE,IMPASSABLE;
}


IFNDEF START_LEVEL; //mr 3009
///////////////////////////////////////////////////////
// Panels
/////////////////////////////////////////////////////////
SKILL counter		{ VAL 0; MIN 0; }
SKILL fwd_force	{ MIN 0; MAX 5; 	}
SKILL bkwd_force	{ MIN 0; MAX 5; 	}
SKILL show_speed	{}
SKILL blink_count	{ VAL 0;	}
SKILL e_count		{ VAL 0;	}

SKILL skatomic 	{ VAL 0; }
SKILL skajet		{ VAL 0; }
SKILL skanex		{ VAL 0; }
SKILL skaful		{ VAL 0; }

SKILL red_fade_counter 	{ VAL 0; }  // mr2409
SKILL red_fade 	{ MAX 0.8; }
// mr1010  SKILL old_fade 	{ MAX 0.8; }   // mr1010 wird nicht mehr gebraucht
SKILL diff_vz		{ VAL 0;	}
SKILL old_vz		{ VAL 0;	}
SKILL last_gndz	{ VAL 0;	}
SKILL vz_fac	 	{ 	}
SKILL fps			{}
SKILL svol 			{ VAL 0; MIN 0; MAX 0.3; }
SKILL gas			{ VAL 0.3; MIN 0;	}
SKILL gas1			{ VAL 0.3; MIN 0;	}
SKILL damage		{ VAL 0;		}

SKILL WAVE_PERIOD { VAL 5; }
SKILL PSOUND_TONE	{ VAL 1; MIN 0.5; MAX 1.3; }
SKILL PSOUND_VOL	{ VAL 1; MIN 0; MAX 0.8; }

// mr1010
SKILL skill_kein_rot_sehen { VAL 0; }

ACTION rot_sehen_an
{
    SET skill_kein_rot_sehen, 0;
    SET red_fade_counter, 0;
	SET	old_health,health;
}

ACTION rot_sehen_aus
{
    SET skill_kein_rot_sehen, 1;
    IF_ABOVE red_fade_counter, 0;
    	CALL    letzt_pal;
    SET red_fade_counter, 0;
}

ACTION skaph_panel	{
	RULE  fwd_force	= FORCE_AHEAD;
	RULE  bkwd_force	= -FORCE_AHEAD;
#	RULE  show_speed	= 0.5*show_speed + 0.5*REAL_SPEED;
	RULE  show_speed	= REAL_SPEED;
	RULE  fps			= 0.7*fps + 0.3*TIME_FAC;
	RULE  val1			= -0.02*fwd_force -0.02*bkwd_force -0.1*rocket_up;
	RULE  energy		= energy + val1*TIME_CORR;
	RULE  diff_vz		= (PLAYER_VZ - old_vz)*TIME_FAC;
	RULE  vz_fac		= diff_vz*diff_vz;
	RULE  old_vz		= PLAYER_VZ;
	RULE  svol			= rocket_up*0.3;
	RULE  gas1			= show_speed;
	RULE  gas			= -show_speed;
	RULE  gas			= gas + gas1;
	RULE  PSOUND_TONE	= 0.9 + gas*0.1;
	SET		PSOUND_VOL,0;
	IF_BELOW	gas,0.01;
		GOTO	pan_nosnd;
	IF_ABOVE	PLAYER_HGT,0.2;
		GOTO	pan_nosnd;	// Kein Fahrgeraeusch bei Spruengen
	RULE		PSOUND_VOL	= 0.04 + 0.06*gas + 0.09*fwd_force + 0.07*bkwd_force;
pan_nosnd:

	IF_ABOVE	rocket_up,0.1;
		PLAY_SOUND	booster,svol;

	IF_BELOW	energy,1;
		SET	FORCE_UP,0;

//jc 23.09. permanente map
	IF_EQUAL	MAP_MODE,0;
		GOTO	pan_nomap;
IFDEF DEBUG;
	SET		MAP_MODE,1;
ENDIF;
	IF_EQUAL	KEY_SZ,1;
		RULE	MAP_SCALE = MAP_SCALE*0.95;
	IF_EQUAL	KEY_MINUS,1;
		RULE	MAP_SCALE = MAP_SCALE*0.95;
	IF_EQUAL	KEY_APO,1;
		RULE	MAP_SCALE = MAP_SCALE*1.05;
	IF_EQUAL	KEY_PLUS,1;
		RULE	MAP_SCALE = MAP_SCALE*1.05;
pan_nomap:

	ADD		blink_count,TIME_CORR;
	IF_ABOVE	blink_count,24;
		SET	blink_count,0;

// Crash bei Aufschlag
	IF_BELOW	PLAYER_Z,HERE.FLOOR_HGT;
		GOTO	pan_crash;
	IF_BELOW	vz_fac,0.1;
		GOTO	pan_nocrash;
	PLAY_SOUND	rrumms,0.2;
	IF_BELOW	vz_fac,0.5;
		GOTO	pan_nocrash;
	PLAY_SOUND	rrumms,0.4;
pan_crash:
	RULE	health = health + -30*vz_fac;
	RULE    val1 = last_gndz - PLAYER_Z;	// Absturzhoehe

	IF_ABOVE	val1,65;   // mr1810
		SET	health,0;
pan_nocrash:
	IF_BELOW	PLAYER_VZ,-0.05;
		SKIP	2;
	IF_BELOW	PLAYER_HGT,0.2;
		SET	last_gndz,PLAYER_Z;	// letztes Z bei boden unter den Fuessen

	IF_EQUAL	underwater,0;
		GOTO	no_healthweg;
	IF_EQUAL	HERE.FLAG5,1;	// gruenes Matma?
		GOTO	no_healthweg;
	RULE		shield = shield-TIME_CORR;
	IF_ABOVE	shield,0;
		GOTO	no_healthweg;
	RULE		health = health-0.5*TIME_CORR;
no_healthweg:

	SET		damage,0;	// normal
	IF_NEQUAL	moving,4;	// rocket?
		GOTO	no_rocket;
	SET		damage,4;
	SET		shield,0;
	SET		old_shield,0;
no_rocket:

	IF_EQUAL	old_shield,0;
		GOTO	no_shield;
	SET		damage,1;	// shield
	IF_EQUAL	shield,0;	// shield verbraucht?
		CALL	shield_weg;
no_shield:
	SET		old_shield,shield;

	IF_ABOVE	health,75;
		GOTO	pan_nodam;
	SET		damage,3;	// konstant rot
	IF_ABOVE	health,50;
		GOTO	pan_nodam;
	IF_ABOVE	blink_count,16;
		GOTO	pan_nodam;
	SET		damage,9;	// schwarz/rot blinken
	IF_EQUAL blink_count,0;
		PLAY_SOUND	alarm,0.4;
pan_nodam:

    IF_EQUAL skill_kein_rot_sehen, 1;
    GOTO pan_nodam2;

//mr24.09 damit man das Rot auch richtig sieht !!!
    IF_EQUAL red_fade_counter, 0;
        GOTO pan_noredfade;

    ADD red_fade_counter, -1;
    IF_EQUAL red_fade_counter, 0;
    	CALL    letzt_pal;

pan_noredfade:
	RULE		red_fade=0.02*(old_health-health);
	SET		old_health,health;
	IF_EQUAL	red_fade, 0;   // mr1010 old_fade;
		GOTO	pan_nodam2;
// mr1010	SET		old_fade,red_fade;
	FADE_PAL	red_pal,red_fade;

    //mr23.09 damit man das Rot auch richtig sieht !!!
    SET    red_fade_counter, 2;   // mr1310
//mr23.09	CALL		letzt_pal;
pan_nodam2:

// Tickgeraeusche von den Anzeigen //////////////////////
	RULE		val1 = energy + 0.5;
	AND		val1,1023;
	RULE		val1=count_energy-val1;
	ABS		val1,val1;
	IF_BELOW	val1,1;		// Energy runtergezaehlt?
		GOTO	no_count_energy;
	RULE		count_energy = energy + 0.5;
	AND		count_energy,1023;
	PLAY_SOUND	count_snd,0.15,0.7;
no_count_energy:
	RULE		val1=count_health-health;
	ABS		val1,val1;
	IF_BELOW	val1,5;		// Health runtergezaehlt?
		GOTO	no_count_health;
	SET		count_health,health;
	PLAY_SOUND	count_snd,0.25,0.3;
no_count_health:
	RULE		val1=count_points-points;
	ABS		val1,val1;
	IF_BELOW	val1,5;		// points raufgezaehlt?
		GOTO	no_count_points;
	SET		count_points,points;
	PLAY_SOUND	count_snd,0.20,-0.7;
no_count_points:

	IF_EQUAL	god,0;
		GOTO	pan_nogod;
	SET		energy,energy.MAX;
	SET		health,health.MAX;
pan_nogod:

// Low energy //////////////////////////////////////////
	IF_ABOVE blink_count,0;
		GOTO	no_elow;
	IF_BELOW health,50;
		GOTO	no_elow;
	IF_BELOW	energy,50;
		PLAY_SOUND	energy_low,0.4;
no_elow:

	IF_BELOW health,1;
		BRANCH	skaph_die;
	IF_ABOVE energy,0.9;
		END;

	RULE		health = health + energy - 0.9;
	SET		energy,0.9;
	SET		PLAYER_VX,0;
	SET		PLAYER_VY,0;
	SET		ahead_speed,0;
}

ACTION shield_weg {
	SET 	screen_msg.STRING,shield_wegtxt;
	SET 	EACH_TICK.14,show_message;
}

ACTION skaph_sec {
	ADD 		counter,1;
}

ACTION flash_off {
	WAIT		1;
//	FADE_PAL	red_pal,0;
    CALL       letzt_pal;  // mr1510

	SET		EACH_TICK.12,NULL;
}
///////////////////////////////////////////////
SKILL	SCREEN_X		{ VAL 0;	}
SKILL	SCREEN_Y		{ VAL 0;	}
SKILL	MAP_EDGE_X1 { VAL 0;  }
SKILL MAP_EDGE_Y1 { VAL 0;  }
SKILL	MAP_ROT 		{ VAL 1; }

// mr0910
SKILL SCREEN_WIDTH  { VAL DEF_SCREEN_WIDTH;	}
SKILL SCREEN_HGT	{ VAL DEF_SCREEN_HGT_PANEL;	}
SKILL MAP_EDGE_X2 	{ VAL DEF_SCREEN_WIDTH; }
SKILL MAP_EDGE_Y2   { VAL DEF_SCREEN_HGT_MAP; }

FONT	led,<zahlreih.bbm>,10,22;
FONT	skaph_font,<skaphs.bbm>,28,28;	 //jetzt GCPAN

BIND <PAN_SVGA.LBM>;

BMAP	compass,<skafonts.lbm>,0,83,160,22;

IFDEF HIRES;	///////////////////////////////////////////////
/*
BMAP	full_cockpit, <PAN_HI.LBM>;
OVLY	blit_cockpit, <PAN_HI.LBM>,0,0,800,43;
BMAP	pleer_bmp 	, <PAN_HI.LBM>,318,54,73,43; //es ist jetzt GCPAN

OVERLAY cockpit	{ POS_X 0; POS_Y 460; FLAGS ABSPOS; OVLYS blit_cockpit; }
PANEL	pleer_pan	{ POS_X 317; POS_Y 514; PAN_MAP pleer_bmp; }

PANEL panel_a {
	POS_X		0;
	POS_Y		502;
	PAN_MAP	full_cockpit;
	DIGITS	84,49,4,led,1,points;
	HBAR	206,39,50,compass,-19.1,PLAYER_ANGLE;
	DIGITS	437,12,1,skaph_font,1,damage;
	DIGITS	565,38,3,led,1,health;
	DIGITS	702,49,3,led,1,energy;
}
*/
IFELSE;
IFDEF SVGA;		///////////////////////////////////////////////

BMAP	full_cockpit, <PAN_SVGA.LBM>;
OVLY	blit_cockpit, <PAN_SVGA.LBM>,0,0,640,34;
BMAP	pleer_bmp 	, <PAN_SVGA.LBM>,254,43,58,34; //es ist jetzt GCPAN

OVERLAY cockpit	{ POS_X 0; POS_Y 368; FLAGS ABSPOS; OVLYS blit_cockpit; }
PANEL	pleer_pan	{ POS_X 254; POS_Y 411; PAN_MAP pleer_bmp; }

PANEL panel_a {
	POS_X		0;
	POS_Y		402;
	PAN_MAP	full_cockpit;
	DIGITS	67,39,4,led,1,points;
	HBAR		165,31,40,compass,-19.1,PLAYER_ANGLE;
	DIGITS	350,10,1,skaph_font,1,damage;
	DIGITS	452,31,3,led,1,health;
	DIGITS	562,39,3,led,1,energy;
}

IFELSE;  		/////////////////////////////////////////////////

BMAP	full_cockpit, <PAN_VGA.LBM>;
OVLY	blit_cockpit, <PAN_VGA.LBM>,0,0,320,29;
BMAP	pleer_bmp 	, <PAN_VGA.LBM>,127,36,29,28; //es ist jetzt GCPAN

OVERLAY cockpit	{ POS_X 0; POS_Y 307; FLAGS ABSPOS; OVLYS blit_cockpit; }
PANEL	pleer_pan	{ POS_X 127; POS_Y 342; PAN_MAP pleer_bmp; }

PANEL panel_a {
	POS_X		0;	POS_Y		306;
	PAN_MAP	full_cockpit;
#	DIGITS	16,59,4,led,40,show_speed;
	DIGITS	15,59,4,led,1,points;
	HBAR		73,52,40,compass,-19.1,PLAYER_ANGLE;
	DIGITS	169,35,1,skaph_font,1,damage;
	DIGITS	219,52,3,led,1,health;
	DIGITS	277,59,3,led,1,energy;
}

ENDIF; //kein SVGA
ENDIF; //kein HIRES

//////////////////////////////////////////////////////////////
// Virus-Routinen
SKILL	vhit_force 	{}	// Virus-Trefferwirkung
SKILL	hit_force 	{}	// Player-Trefferwirkung
SKILL	attacking	{ VAL 0; }
SKILL	vir_dist		{}
SKILL virus_dir	{ VAL 1; }	// letzte ausweich-richtung


ACTION unflash {
	WAIT		1;
//	FADE_PAL	red_pal,0;
    CALL       letzt_pal;  // mr1510
	ADD		PLAYER_LIGHT,my_light;
	SET		MY.EACH_TICK,NULL;
}

ACTION virus_init	{
//jc 03.11.
IFDEF HARMLESS;
	SET	MY.IF_NEAR,NULL;
	SET	MY.IF_HIT,NULL;
ENDIF;
	IF_BELOW	difficulty,1;		// noch nicht gewaehlt?
		END;
	SET		MY.INVISIBLE,1;
	IF_ABOVE	MY.SKILL5,difficulty;
		END;
	SET		MY.INVISIBLE,0;
	ADD		virenquote,1;
	SET		MY.EACH_TICK,NULL;
	SET		MY.EACH_CYCLE,NULL;
	IF_EQUAL	MY.FLAG5,0;			// Absolute Hoehe, wenn kein FLAG5 gesetzt
		SET	MY.GROUND,1;
	IF_NEQUAL MY.FLAG6,1;		// FLAG6: in BELOW-Region plazieren
		GOTO	no_below;
//jc 19.10.
	IF_EQUAL	THERE.BELOW,NULL;
		GOTO	no_below;
	SET		MY.REGION,THERE.BELOW;
	SET		MY.GROUND,0;
	SET		MY.HEIGHT,1.5;
	SET		MY.GROUND,1;
no_below:
	SET		MY.PASSABLE,0;		// wg. rebirth
	SET		MY.RESULT,0;
	SET		MY.FRAGILE,1;		// Reagiert auf EXPLODE
IFDEF HARMLESS;
	SET	MY.PASSABLE,1;
ENDIF;
}

ACTION virus_wait	{
	ADD		MY.DIST,2;	// Hysterese
	SET	 	MY.SPEED,0.3;
	SET		MY.TARGET,REPEL;
}

ACTION virus_run	{
	ADD		MY.DIST,-2;	// Hysterese
	SET		MY.SPEED,0.7;
	SET		MY.TARGET,FOLLOW;
}

ACTION rest_explode {
	ADD		points,MY.SKILL4;
	ADD		abschussquote,1;
	SET		MY.PLAY,1;
	SET		MY.dead,1;
	SET		MY.PASSABLE,1;
	SET		MY.TARGET,FOLLOW;
	SET		MY.SPEED,0.3;
	SET		MY.VSPEED,0.1;
	SET		MY.IF_NEAR,NULL;
	SET		MY.IF_FAR,NULL;
	SET		MY.IF_HIT,NULL;
	SET		MY.IF_ARRIVED,NULL;
	ADD		THERE.AMBIENT,0.3;	// Light up region
	WAITT		4;
	IF_ABOVE	MY.DISTANCE,15;
		GOTO	no_hurt;
	SET		HIT_DIST,MY.DISTANCE;
	RULE		health = health + MY.SKILL3*0.15*(20-HIT_DIST);
	SET		imp_fac,1.5;
	CALL		schubs;
	SET		HIT_DIST,0;
no_hurt:
	WAIT		1;
	ADD		THERE.AMBIENT,-0.1;
	WAIT		1;
	ADD		THERE.AMBIENT,-0.1;
	WAIT		1;
	ADD		THERE.AMBIENT,-0.1;
}

ACTION explo_light {	// light Region by explosion
	WAIT		1;
	ADD		THERE.AMBIENT,0.5;
	WAITT		3;
	ADD		THERE.AMBIENT,-0.1;
	WAIT		1;
	ADD		THERE.AMBIENT,-0.1;
	WAITT		2;
	ADD		THERE.AMBIENT,-0.1;
	WAITT		2;
	ADD		THERE.AMBIENT,-0.1;
	WAITT		2;
	ADD		THERE.AMBIENT,-0.1;
}

ACTION virus_die {
	IF_EQUAL	THERE.FLAG8,1;	//matma?
		SET	MY.INVISIBLE,1;
	SET		MY.GROUND,0;
	SET		MY.HEIGHT,0;
	SET		MY.SPEED,0;
	SET		MY.VSPEED,0;
	SET		MY.PASSABLE,1;
	SET		MY.TARGET,NULL;
	SET		MY.EACH_TICK,NULL;
	SET		MY.EACH_CYCLE,NULL;
	SET		MY.IF_NEAR,NULL;
	SET		MY.IF_FAR,NULL;
	SET		MY.IF_HIT,NULL;
	SET		MY.IF_ARRIVED,NULL;
}

ACTION set_vspeed {	// vertikale Viren-Bewegung auf Player zu
	SET		val1,MY.HEIGHT;
	IF_EQUAL	MY.GROUND,0;
		ADD	val1,THERE.FLOOR_HGT;
	SET		val2,MY.SIZE_Y;
	RULE		val1 = val1 + 0.5*val2 + -1*PLAYER_Z;	// Hoehendifferenz
	SET		MY.VSPEED,0;
	IF_ABOVE val1,1;
		SET	MY.VSPEED,-0.1;
 	IF_BELOW val1,-2;
		SET	MY.VSPEED,0.1;
}

ACTION virus_hit {
	IF_EQUAL	SHOOT_RANGE,14;	// manipulation?
		SET	RESULT,0;
	SET		vhit_force,0;
	IF_ABOVE	RESULT,0;	// Treffer von Player oder Mine?
		RULE	vhit_force = (RESULT+0.3)*gun_strength;
	ADD		MY.armor,vhit_force;
}

ACTION player_hit {	// erwartet RESULT + hit_force!
	RULE		RESULT = 0.9*RESULT + 0.1;
	IF_MIN	shield;
		GOTO	no_shield;
	RULE		shield = shield + RESULT*hit_force;
	RULE		RESULT = 0.5*RESULT;
no_shield:
	RULE		health = health + RESULT*hit_force;
	RULE		RESULT = 0.3*RESULT + 0.1;
	PLAY_SOUND	tschok,RESULT;
	SET		RESULT,0;
}

ACTION show_panel {
	SET		MESSAGES.15,panel_msg;
	IF_EQUAL	message_delay,0;	// keine message unterwegs?
		SET	message_delay,3;	//
	SET		EACH_TICK.14,count_message;
}

ACTION clear_panel {
    SET		PANELS.14,pleer_pan;
    SET		message_delay,2;
	SET		EACH_TICK.14,count_message;
}

ENDIF; // START_LEVEL; //mr 3009

////////////////////////////////////////////////
// Message-Aktionen:
// STRING my_string,"Dies ist ein Teststring!";
// SET 	screen_msg.STRING,my_string;
// CALL 	show_message;

ACTION show_text {
#	SET		LAYERS.16,NULL;
	BRANCH			show_message;
}

//mr
ACTION show_normal_message
{
    SET	        message_delay, 160;
	CALL        show_message;
}

ACTION show_message {
	SET		MESSAGES.16,screen_msg;
	IF_EQUAL	message_delay,0;
		SET	message_delay,80;	// 5-Sekunden-Message
	SET		EACH_TICK.14,count_message;
}

ACTION count_message {
	ADD		message_delay,time_dec;
	IF_ABOVE	message_delay,0;
		END;
	BRANCH	clear_message;
}

ACTION clear_message {
#	SET		LAYERS.16,NULL;
	SET		MESSAGES.15,NULL;
	SET		MESSAGES.16,NULL;
	SET		PANELS.14,NULL;
	SET		EACH_TICK.14,NULL;
	SET 		screen_msg.STRING,nullstring;
	SET		message_delay,0;
	IF_EQUAL	freeze,0;
		SET  	MOVE_MODE,1;			// Abbrechen
	SET		IF_Y,NULL;
	SET		IF_Z,NULL;
	SET		IF_N,cheat_n;
	SET		IF_J,cheat_j;         // mr1810
	SET		IF_ESC,main_menu;  // mr1810

	SET		IF_CTRL,	fire_start;
IFNDEF DEBUG;
	SET		IF_LEFT,	fire_start;
ENDIF;
}

ACTION wait_yesno {
	SET		MESSAGES.16,screen_msg;
	SET		MOVE_MODE,0;			// Einfrieren
	SET		EACH_TICK.14,NULL;
	SET		IF_N,back_to_game;  //mr 2309
	SET		IF_ESC,back_to_game;
	SET		IF_CTRL,NULL;
IFNDEF DEBUG;
	SET		IF_LEFT,NULL;
ENDIF;
}

ACTION back_to_game {
//vk sonst wird main_menu; nicht mehr ausgefuehrt
	SET		IF_J, NULL;			// Tasten ent-belegen
	SET		IF_Y, NULL;
	SET		IF_Z, NULL;
	SET		IF_N, cheat_n;		//cheat_n wieder setzen
	SET		IF_ESC,main_menu;
	SET		IF_CTRL,	fire_start;
IFNDEF DEBUG;
	SET		IF_LEFT,	fire_start;
ENDIF;

    CALL    letzt_pal;

    //mr2409 Level 0 besteht nur aus dem Menu !
    IF_EQUAL level_no, 0;
        CALL main_menu;

    BRANCH	clear_message;
}

///////////////////////////////////////////////////////
/*
TEXT screen_txt {					// TEXT to display a message
	POS_X 	32;
	POS_Y 	32;
	FONT		menu_font;			// s.o.
	STRING	empty;
}*/

ACTION show_message2 {				// Meldung anzeigen
	SET		MESSAGES.14,screen_msg;
	WAITT		48;							// 3 Sekunden warten
	SET		MESSAGES.14,NULL;
}

ACTION wait_yesno2 {			// Auf J/N-Tastenbetaetigung warten
	PLAY_SOUND	button,0.2;
	FADE_PAL	black_2_pal,0.4;
	SET		MESSAGES.14,screen_msg;	// Frage anzeigen
	SET		MOVE_MODE,0;				// Player einfrieren
	SET		IF_N, clear_yesno;		// Tasten belegen
	SET		IF_ESC, clear_yesno;
	SET		IF_CTRL,NULL;
IFNDEF DEBUG;
	SET		IF_LEFT,NULL;
ENDIF;
}

ACTION clear_yesno {			// J/N-Abfrage beenden
	SET		MESSAGES.14,NULL;	// Text weg
    CALL       letzt_pal;  // mr1510
//	FADE_PAL	black_2_pal,0;
	SET		MOVE_MODE,1;		// Player wieder auftauen
	SET		IF_J, NULL;			// Tasten ent-belegen
	SET		IF_Y, NULL;
	SET		IF_Z, NULL;
	SET		IF_N, cheat_n;		//cheat_n wieder setzen
	SET		IF_ESC,main_menu;
	SET		IF_CTRL,	fire_start;
IFNDEF DEBUG;
	SET		IF_LEFT,	fire_start;
ENDIF;
}


IFNDEF START_LEVEL; //mr 3009

//jc 16.09.
INCLUDE <tools.wdl>;
////////////////////////////////////////////////////////
// Tank/Repair-Aktionen
// Achtung!! Jede Tank/Repair-Wand braucht individuellen Namen!!
SKILL	fuel 			{}
SKILL	repair		{ VAL 0; }
SKILL old_dist		{}
SKILL	drown_count	{ VAL 0; }

ACTION fuel_refill {
	IF_BELOW	MY.SKILL5,0;	// leergesaugt?
		END;
	IF_ABOVE	energy,290;
		END;
	SET		MY.EACH_TICK,suck_fuel;
	BRANCH	start_refill;
}

ACTION health_refill {
	IF_BELOW	MY.SKILL5,0;	// leergesaugt?
		END;
	IF_ABOVE	drown_count,0;	// haengt whopper dran?
		SKIP	2;
	IF_ABOVE	health,390;
		END;
	SET		repair,1;		// Fuer whopper
	SET		MY.EACH_TICK,suck_health;
	BRANCH	start_refill;
}

ACTION start_refill {
	SET		fuel,5;			// Wait-counter
	ADD		MY.DIST,10;		// Hysterese
	SET		i_fric,1;
	SET		xy_fric,1;
	SET		a_fric,0.6;
}

ACTION catch_drift {
	RULE 		drift_x	= 0.1*drift_x + -0.2*PLAYER_X;
	RULE 		drift_y	= 0.1*drift_y + -0.2*PLAYER_Y;
	RULE 		fuel		= fuel + time_dec;
}

ACTION suck_fuel {
	SET		drift_x,MY.SKILL1;
	SET		drift_y,MY.SKILL2;
	CALL 		catch_drift;
	IF_ABOVE	fuel,0;	// noch warten?
		END;

	PLAY_SOUND klonk,0.2;
	ADD		MY.SKILL5,time_dec;
	RULE		val1 = TIME_CORR * 0.128;
	ADD		MY.OFFSET_Y,val1;
	IF_BELOW	MY.SKILL5,0;	// leergesaugt?
		BRANCH	stop_refill;
	RULE		energy = energy + TIME_CORR;
	IF_MAX	energy;
		BRANCH	stop_refill;
}

ACTION stop_refill {
	SET		repair,0;		// Fuer whopper
	PLAY_SOUND alarm, 0.4;
	IF_ABOVE	drift_x,0;
		ADD	PLAYER_VX,-1;
	IF_BELOW	drift_x,0;
		ADD	PLAYER_VX,1;
	IF_ABOVE	drift_y,0;
		ADD	PLAYER_VY,-1;
	IF_BELOW	drift_y,0;
		ADD	PLAYER_VY,1;
	SET		drift_x,0;
	SET		drift_y,0;
	ADD		MY.DIST,-10;
	SET		MY.EACH_TICK,NULL;
	BRANCH	set_drive;
}

ACTION suck_health {
	SET		drift_x,MY.SKILL1;
	SET		drift_y,MY.SKILL2;
	CALL 		catch_drift;
	IF_ABOVE	fuel,0;	// noch warten?
		END;

	PLAY_SOUND klonk,0.2;
	ADD		MY.SKILL5,time_dec;
	RULE		val1 = TIME_CORR * 0.128;
	ADD		MY.OFFSET_Y,val1;
	IF_ABOVE	drown_count,0;	// haengt whopper dran?
		END;
	IF_BELOW	MY.SKILL5,0;	// leergesaugt?
		BRANCH	stop_refill;
	RULE		health = health + TIME_CORR;
	IF_MAX	health;
		BRANCH	stop_refill;
}


////////////////////////////////////////////////////////
// Door actions (texture animation)
////////////////////////////////////////////////////////

ACTION texdoor_open {
	SET		MY.TRANSPARENT,1;
	ADD		MY.DIST,2;	// Hysterese
	SET		MY.EACH_CYCLE,texdoor_checkopen;
	SET		MY.PLAY,1;
}

ACTION texdoor_checkopen {
	SET 		MY.PASSABLE,1;
	SET		MY.IMMATERIAL,1;
	SET		MY.EACH_CYCLE,NULL;
}

ACTION texdoor_close {
	SET 		MY.PASSABLE,0;
	SET		MY.IMMATERIAL,0;
	SET		MY.PLAY,1;
	SET		MY.EACH_CYCLE,texdoor_checkclose;
}

ACTION texdoor_checkclose {
	SET		MY.EACH_CYCLE,NULL;
	SET		MY.TRANSPARENT,0;
	ADD		MY.DIST,-2;
}

////////////////////////////////////////////////
SYNONYM ifnear_old { TYPE ACTION; DEFAULT NULL; }

// 1 Sec. Pause, nachdem IF_NEAR ausgeloest wurde
ACTION dotz {
	IF_ABOVE	IMPACT_VX,0;
		SET	IMPACT_VX,2;
	IF_BELOW	IMPACT_VX,0;
		SET	IMPACT_VX,-2;
	IF_ABOVE	IMPACT_VY,0;
		SET	IMPACT_VY,2;
	IF_BELOW	IMPACT_VY,0;
		SET	IMPACT_VY,-2;
	BRANCH	pause_ifnear;
}

// 1 Sec. Pause, nachdem IF_NEAR ausgeloest wurde
ACTION pause_ifnear {
//	SET			MY.DIST,0.1;	// IF_NEAR verhindern
	IF_NEQUAL	ifnear_old,NULL;	// already used?
		END;
	SET		ifnear_old,MY.IF_NEAR;
	SET		MY.IF_NEAR,NULL;

	WAITT		16;

//	SET		MY.DIST,0;		// IF_NEAR wieder aktivieren
	SET		MY.IF_NEAR,ifnear_old;
	SET		ifnear_old,NULL;
	SET		MY.EACH_TICK,NULL;
}
////////////////////////////////////////////////
ACTION light_up {
	ADD			PLAYER_LIGHT,0.1;
	IF_ABOVE	PLAYER_LIGHT,3;
	SET			PLAYER_LIGHT,3;
}

ACTION light_dn {
	ADD			PLAYER_LIGHT,-0.1;
	IF_BELOW	PLAYER_LIGHT,0;
	SET			PLAYER_LIGHT,0;
}
////////////////////////////////////////////////

////////////////////////////////////////////////

/*
ACTION skaph_fadein {
SET		fade,0;
fadein_1:
	RULE		fade = fade + 0.1;
	FADE_PAL	pal1,fade;
	WAIT		1;
	IF_BELOW	fade,1;
	SKIP		-4;
	SET		EACH_TICK.16,NULL;
	BRANCH			set_drive;
}
*/

ENDIF; // START_LEVEL

ACTION skaph_fadeout {
	CALL		skaph_gsave;
	SET		fade,0;
loop:
	RULE		fade = fade + 0.1;
	FADE_PAL	black_pal,fade;
	WAIT		1;
	IF_BELOW	fade,1;
		GOTO	loop;
	EXIT		exit_laber;
}

IFNDEF START_LEVEL;

ACTION if_tast_init_menu{  //menue_tasten definieren
	SET		IF_ESC,	main_menu;

	SET		IF_F1,	help_skaph;
//jc 14.08.
	SET		IF_F2,	skaph_qsave;
	SET		IF_F3,	skaph_qload;

//jc 29.09.
	SET		IF_F5,	NULL;	//switch_mblur;
	SET		IF_F6, 	screen_shot;  //screenshot
	SET		IF_F10,	exit_yesno;
//	SET		IF_F10,	skaph_qexit;
	SET		IF_F12,	switch_music;
	SET		IF_SZ,	shrink;
	SET		IF_MINUS,shrink;
	SET		IF_APO,	 inflate;
	SET		IF_PLUS, inflate;
}

/////////////////////////////////////////////////////////////////
INCLUDE <menu.wdl>;	// hier noetig wg. panels

IFNDEF NO_BRIEFING;
/*
PANEL picpanel_1 { PAN_MAP PICSHOT1; FLAGS REFRESH; }
PANEL picpanel_2 { PAN_MAP PICSHOT2; FLAGS REFRESH; }
PANEL picpanel_3 { PAN_MAP PICSHOT3; FLAGS REFRESH; }

TEXT pictext { FONT debug_font; STRING pictitle1; FLAGS CENTER; }
//jc 29.09.
STRING abstand_str,"\n\n\n\n\n\n\n\n";
TEXT scrolltext {
	FONT menu_font;
	STRINGS	2;
	STRING 	abstand_str,briefing;
}
TEXT scroll_bkgd {
	FONT menu_font;
	STRING "___________________________
___________________________
___________________________
___________________________
";
}

SKILL	labercount {}

ACTION scroll_text {
loop:
	ADD		scrolltext.OFFSET_Y,1;
	WAITT		2;
	IF_EQUAL	scrolltext.VISIBLE,1;
		GOTO	loop;
}
*/
ENDIF;

SKILL level_start_save { VAL 0; }
SKILL level_start_fuss { VAL 0; }
SKILL Game_Started { VAL 0; }

SYNONYM Game_Start { TYPE ACTION; DEFAULT tu_nix; }

ACTION fuss_start
{
    SET level_start_fuss, 1;
    BRANCH skaph_start;
}

ACTION fuss_init
{
IFDEF	HIRES;
	SET		SCREEN_HGT,600;
IFELSE;
IFDEF	SVGA;
	SET		SCREEN_HGT,480;
IFELSE;
	SET		SCREEN_HGT,400;
ENDIF;
ENDIF;

    SET     RENDER_MODE, 0;
    SET     FRAME_COLOR, 1;

    RULE levelStartWait_txt.POS_X =  (SCREEN_WIDTH -
        (12 * FONT_SIZE_X + 108)) * 0.5;
    RULE levelStartWait_txt.POS_Y = (SCREEN_HGT * 0.3);

	SET	MESSAGES.9,levelStartWait_txt;

    WAIT    2;

//akt    SET	    RENDER_MODE,1;

	SET		MAP_LAYER,15;
	SET		last_gndz,PLAYER_Z;	// letztes Z bei boden unter den Fuessen

    //mr0210
//	SET	RENDER_MODE,1;
//  WAIT    2;
    SET	    MOVE_MODE,0; // mr3009 Player anhalten !?

	SET		my_size,4;
	SET		PLAYER_SIZE,my_size;
	SET		PLAYER_SIZE.MAX,my_size;
    // mr1810 warte 4 ticks, damit engine in stabilem zustand
    // bevor save ( sonst PLAYER_HGT nach laden falsch !!!)
    WAIT 4;

// Anfangs-Initialisierung
	SET		MOTION_BLUR,0;

IFNDEF NO_BRIEFING;
	IF_ABOVE	level_track,0;
		CALL	play_cdtrack;
ENDIF;
    CALL    Check_difficulty;  //mr 24.09
loop:                          // mr1810
    IF_BELOW difficulty,1;
        WAIT 2;
    IF_BELOW difficulty,1;
    GOTO loop;

	SET	MESSAGES.9,levelStartWait_txt;

    CALL    if_tast_init_menu;
	CALL    main_menu_mit_Save;
//mr2610 CALL  main_menu_ohne_Save;
//mr2610 SET   IF_F2, NULL;  // mr 0910 kein quecksave am anfang !!!

	SET		IF_SPACE,   manipulate;
	SET		IF_BKSP,	manipulate;
	SET		IF_P,		switch_pause;

//mr2610	SET	    RENDER_MODE,1;  // akt
    SET	    MOVE_MODE,1; // mr3009 Player anhalten !?
/*
	IF_EQUAL	difficulty,1;
		SET	screen_msg.STRING,difficult1_str;
	IF_EQUAL	difficulty,2;
		SET	screen_msg.STRING,difficult2_str;
	IF_EQUAL	difficulty,3;
		SET	screen_msg.STRING,difficult3_str;
*/
    SET	    MOVE_MODE,1;
    SET     Game_Started, 1;
    SET level_start_save, 1;
    WAIT    2;

    SET     smus,0;	// alles an  //jc 19.09
	CALL    set_smus;

    //mr0411
    SET slot, -1;

    SAVE    STARTNAME, 0;		// Level-Start fuer Ruecksprung speichern
//    WAITT   32;
	CALL		show_message;

    SET	    MESSAGES.9, NULL;
    SET	    PANELS.4, NULL;
    WAIT    2;
    CALL    l_fade_norm;  //mr2509

    SET     PANELS.1, NULL;

//    SET	    MOVE_MODE,1;
    SET     Game_Started, 1;

//mr2610
	SET	    FRAME_COLOR,0;
    SET	    RENDER_MODE,1;

    BRANCH  Game_Start;
}

ACTION InitActiveFlags
{
//    IF_EQUAL ActiveLevel, -1;
        SET ActiveLevel, level_no;

//    IF_EQUAL ActiveVideoMode, -1;
IFDEF HIRES;
        SET ActiveVideoMode, 3;
IFELSE;
IFDEF SVGA;
        SET ActiveVideoMode, 2;
IFELSE;
        SET ActiveVideoMode, 1;
ENDIF;
ENDIF;

    IF_EQUAL NextLevel, -1;
        SET NextLevel,     ActiveLevel;

    IF_EQUAL NextVideoMode, -1;
        SET NextVideoMode, ActiveVideoMode;
}

ACTION EinzelLevelModeEin
{
	CALL   skaph_gload;
    SET    EinzelLevelMode, 1;
    SET    old_gun_type, 0;
    SET    old_gun1    , 0;
    SET    old_gun2    , 0;
    SET    old_gun3    , 0;
    SET    old_gun4    , 0;
    SET    old_minen   , 0;
    SET    old_shield1 , 0;
    SET    old_gun5    , 0;
	CALL   skaph_gsave;
}

ACTION AfterLoadLevel
{
    SET LOAD_MODE, 1;

    CALL InitActiveFlags;

    SET LocalLevelSwitchMode, LevelSwitchMode;
    SET LevelSwitchMode, 0;

    IF_EQUAL LocalLevelSwitchMode, 0;
        BRANCH EinzelLevelModeEin;

    IF_EQUAL LocalLevelSwitchMode, 1;  //mr levelwechsel
        BRANCH RestoreLevelSetting;

    IF_EQUAL LocalLevelSwitchMode, 2;
        GOTO videoswitch;

	LOAD	SAVENAME, LevelLoadSlot;
//  SET     screen_msg.STRING,load_nix;
//  CALL    show_message;
//  BRANCH  main_menu;

videoswitch:
    SET LOAD_MODE, 1;
    LOAD "TMPVID", 0;
}


ACTION skaph_start {
    IF_EQUAL level_start_save, 1;
    BRANCH skaph_init;

    //mr 17.09  LoadLevel fortsetzung
    CALL    AfterLoadLevel;

#	SET_ALL	nix_wal.INVISIBLE,1;	//$$$ Patch!!

	CALL		load_global;			// Letztes Ende-Info wieder laden

    SET Game_Started, 0;

    SET		letzt_pal,l_fade_norm;

IFNDEF NO_BRIEFING;
/*
	SET	RENDER_MODE,0;
	SET	MOVE_MODE,0;

    // mr0910
    SET     FRAME_COLOR, 1;
    WAIT 2;

#	PLAY_SOUNDFILE	<taipan1.wav>,0.9,-0.3;
	PLAY_SOUND	laber,0.8,-0.4;
	RULE	panel_level_leer.POS_X = (SCREEN_WIDTH-320)*0.9;
	RULE	panel_level_leer.POS_Y = (SCREEN_HGT-336)*0.5;
	RULE	pictext.POS_X = panel_level_leer.POS_X + 160;
	RULE	pictext.POS_Y = panel_level_leer.POS_Y + 312;
	RULE	scrolltext.POS_X = 32;
	RULE	scrolltext.POS_Y = panel_level_leer.POS_Y + 40;
	RULE	scrolltext.SIZE_Y = 256;
	SET	scrolltext.VISIBLE,1;
	SET	scroll_bkgd.POS_X,scrolltext.POS_X;
	SET	scroll_bkgd.POS_Y,scrolltext.POS_Y;
	SET	FRAME_COLOR,1;		// Hintergrund schwarz
	IF_ABOVE	panel_level_leer.POS_X,0;	// Hires?
		SET	scroll_bkgd.VISIBLE,1;

	CALL	scroll_text;

	RULE	picpanel_1.POS_X = panel_level_leer.POS_X + 30;
	RULE	picpanel_1.POS_Y = panel_level_leer.POS_Y + 40;
	SET	pictext.VISIBLE,1;
	SET	pictext.STRING,pictitle1;
	SET	PANELS.1,panel_level_leer;
	SET	PANELS.2,picpanel_1;

    CALL    start_ekg;

    WAIT    4; //mr3009
    CALL    l_fade_norm;  //mr2509

    SET	labercount,0;
	WAIT	4;		// Keys abfangen
//    SET KEY_ANY, 0; //mr2910
loop1:
	WAIT	1;
#	IF_EQUAL	KEY_ANY,1;
#		GOTO	raus;
	IF_EQUAL	KEY_ESC,1;
		GOTO	raus;
	IF_EQUAL	KEY_SPACE,1;
		GOTO	raus;
	ADDT		labercount,0.063;	// 1/16
	IF_BELOW	labercount,LABER_DELAY1;
		GOTO	loop1;

	RULE	picpanel_2.POS_X = panel_level_leer.POS_X + 30;
	RULE	picpanel_2.POS_Y = panel_level_leer.POS_Y + 40;
	SET	pictext.STRING,pictitle2;
	SET	PANELS.2,picpanel_2;
	SET	labercount,0;
loop2:
	WAIT	1;
	IF_EQUAL	KEY_ESC,1;
		GOTO	raus;
	IF_EQUAL	KEY_SPACE,1;
		GOTO	raus;
#	IF_EQUAL	KEY_ANY,1;
#		GOTO	raus;
	ADDT		labercount,0.063;	// 1/16
	IF_BELOW	labercount,LABER_DELAY2;
		GOTO	loop2;

	RULE	picpanel_3.POS_X = panel_level_leer.POS_X + 30;
	RULE	picpanel_3.POS_Y = panel_level_leer.POS_Y + 40;
	SET	pictext.STRING,pictitle3;
	SET	PANELS.2,picpanel_3;
	SET	labercount,0;
loop3:
	WAIT	1;
	IF_EQUAL	KEY_ESC,1;
		GOTO	raus;
	IF_EQUAL	KEY_SPACE,1;
		GOTO	raus;
#	IF_EQUAL	KEY_ANY,1;
#		GOTO	raus;
	ADDT		labercount,0.063;	// 1/16
	IF_BELOW	labercount,LABER_DELAY3;
		GOTO	loop3;

raus:
	RULE	panel_level_leer.POS_X = 0;
	RULE	panel_level_leer.POS_Y = 0;

    CALL    stop_ekg;

	SET	pictext.VISIBLE,0;
	SET	scrolltext.VISIBLE,0;
	SET	scroll_bkgd.VISIBLE,0;
	SET	FRAME_COLOR,0;
	SET	PANELS.1,NULL;
	SET	PANELS.2,NULL;
	SET	MOVE_MODE,1;

    STOP_SOUND;  //mr2910

    SET     smus,2;	// alles aus  //jc 19.09
	CALL    set_smus;

    WAIT 1; // mr2909 clear Key
*/
IFELSE;
    //	FADE_PAL	pal1,2;  //mr2909
    CALL    l_fade_norm;  //mr2509
ENDIF;

    IF_EQUAL level_start_fuss, 0;
        BRANCH skaph_init;

    BRANCH fuss_init;
}

ACTION skaph_init
{
    IF_NEQUAL level_start_save, 0;  //mr3009
    GOTO weiter;

//mr2010
    SET     RENDER_MODE, 0;
    SET     FRAME_COLOR, 1;

    RULE levelStartWait_txt.POS_X =  (SCREEN_WIDTH -
        (12 * FONT_SIZE_X + 108)) * 0.5;
    RULE levelStartWait_txt.POS_Y = (SCREEN_HGT * 0.3);

	SET	MESSAGES.9,levelStartWait_txt;

    WAIT    2;

	SET		MOVE_MODE,1;
//mr2710	SET		RENDER_MODE,1;

weiter:
	SET		MAP_LAYER,15;
	SET		last_gndz,PLAYER_Z;	// letztes Z bei boden unter den Fuessen

//mr2010
IFNDEF NO_PANEL;
//	SET		PANELS.1,panel_a;
//#	SET		PANELS.2,debug_panel;
//	SET		LAYERS.16,cockpit;
	SET		TOUCH_TEXT,touch_txt;
	SET		TOUCH_TEXT.VISIBLE,1;
IFELSE;
IFDEF	HIRES;
	SET		SCREEN_HGT,600;
IFELSE;
IFDEF	SVGA;
	SET		SCREEN_HGT,480;
IFELSE;
	SET		SCREEN_HGT,400;
ENDIF;
ENDIF;
ENDIF;

	CALL		set_drive;

	SET		EACH_TICK.12,NULL;
	SET		EACH_TICK.15,skaph_panel;
	SET		EACH_SEC.16,skaph_sec;

	SET		my_size,4;
	SET		PLAYER_SIZE,my_size;
	SET		PLAYER_SIZE.MAX,my_size;

    IF_NEQUAL level_start_save, 0;  //mr2210
    GOTO weiter2;

    // mr1810 warte 4 ?? ticks, damit engine in stabilem zustand
    // bevor save ( sonst PLAYER_HGT nach laden falsch !!!)
    WAIT 4;

// Anfangs-Initialisierung
	SET		MOTION_BLUR,0;

IFNDEF NO_BRIEFING;
	IF_ABOVE	level_track,0;
		CALL	play_cdtrack;
ENDIF;

    CALL    Check_difficulty;  //mr 24.09
loop:                          // mr1810
    IF_BELOW difficulty,1;
        WAIT 2;
    IF_BELOW difficulty,1;
    GOTO loop;

  	SET 	MESSAGES.9,levelStartWait_txt;
    WAIT    2;
weiter2:

	CALL if_tast_init_menu; //IF_F... tasten setzen
	CALL main_menu_mit_Save;

IFNDEF DEBUG;	//jc
	SET		IF_LEFT,	fire_start;
	SET		IF_RIGHT,manipulate;
	SET		IF_0,set_gun0;
ENDIF;
	SET		IF_1,sset_gun1;
	SET		IF_2,sset_gun2;
	SET 	IF_3,sset_gun3;
	SET 	IF_4,sset_gun4;
	SET 	IF_5,sset_gun5;
	SET 	IF_6,sset_gun6;

	SET		IF_CTRL,	fire_start;
	SET		IF_SPACE,   manipulate;
	SET		IF_BKSP,	manipulate;
	SET		IF_P,		switch_pause;

    IF_NEQUAL level_start_save, 0;  //mr2210
    GOTO weiter3;
/*
	IF_EQUAL	difficulty,1;
		SET	screen_msg.STRING,difficult1_str;
	IF_EQUAL	difficulty,2;
		SET	screen_msg.STRING,difficult2_str;
	IF_EQUAL	difficulty,3;
		SET	screen_msg.STRING,difficult3_str;
*/
    SET Game_Started, 1;

weiter3:
    SET	MESSAGES.9, NULL;

IFNDEF NO_PANEL;
	SET		PANELS.1,panel_a;
#	SET		PANELS.2,debug_panel;
	SET		LAYERS.16,cockpit;
ENDIF;

	SET	    FRAME_COLOR,0;
    SET		RENDER_MODE,1;

    IF_NEQUAL level_start_save, 0;
        BRANCH   set_gun;

    SET     smus,0;	// alles an  //jc 19.09
	CALL    set_smus;

    SET slot, -1;

    // Level-Start fuer Ruecksprung speichern
    SAVE    STARTNAME,0;

    CALL set_gun;  // mr2909

	SET   screen_msg.STRING, briefing;
	SET	message_delay,160;	// 10-Sekunden-Message
	CALL	show_message;
}

// Alles setzen nach laden neuer global-skills
ACTION load_global {
	CALL		skaph_gload;
/*
	IF_EQUAL	gun_type,0;		// Bei Levelstart letzte Kanone setzen
		CALL	set_gun0;
	IF_EQUAL	gun_type,1;
		CALL	set_gun1;
	IF_EQUAL	gun_type,2;
		CALL	set_gun2;
	IF_EQUAL	gun_type,3;
		CALL	set_gun3;
	IF_EQUAL	gun_type,4;
		CALL	set_gun4;
	IF_EQUAL	gun_type,5;
		CALL	set_gun5;
	IF_EQUAL	gun_type,6;
		CALL	set_gun6;
*/
	CALL		set_smus;

    CALL		set_sense;
}

// mr2409 sichern und wieder aktivieren der bei Levelwechel
// zu uebernemenden daten
ACTION SaveLevelSetting
{
//    IF_EQUAL old_gun_type, 0;
    SET old_gun_type, gun_type;
    SET old_gun1    , gun1;
    SET old_gun2    , gun2;
    SET old_gun3    , gun3;
    SET old_gun4    , gun4;
    SET old_minen   , minen;
    SET old_shield1 , shield;  //mr2909
    SET old_gun5    , gun5;

    SET glo_health  , health; //mr0411
    SET glo_energy  , energy;

    BRANCH set_gun0;
}

ACTION RestoreLevelSetting
{
    SET gun_type, old_gun_type;
    SET gun1    , old_gun1;
    SET gun2    , old_gun2;
    SET gun3    , old_gun3;
    SET gun4    , old_gun4;
    SET minen   , old_minen;
    SET shield  , old_shield1;  //mr2909
    SET old_shield  , shield;
    SET gun5    , old_gun5;

    SET health  , glo_health;  //mr0411
    SET energy  , glo_energy;

    IF_EQUAL gun1,1;
    	SET	set_gun1,set_debugger;

    IF_EQUAL gun2,1;
    	SET	set_gun2,set_debugger2;

    IF_EQUAL gun3,1;
    	SET	set_gun3,set_interruptor;

    IF_EQUAL gun4,1;
	    SET	set_gun4,set_eraser;

//    IF_EQUAL gun5,1;
//    	SET	set_gun6,set_saw;  // ?????

    IF_ABOVE minen,0;
        SET	set_gun5,set_mine;

	IF_EQUAL	gun_type,0;		// Bei Levelstart letzte Kanone setzen
		SET set_gun, set_gun0;
	IF_EQUAL	gun_type,1;
		SET set_gun, set_gun1;
	IF_EQUAL	gun_type,2;
		SET set_gun, set_gun2;
	IF_EQUAL	gun_type,3;
		SET set_gun, set_gun3;
	IF_EQUAL	gun_type,4;
		SET set_gun, set_gun4;
	IF_EQUAL	gun_type,5;
		SET set_gun, set_gun5;
	IF_EQUAL	gun_type,6;
		SET set_gun, set_gun6;
}

/////////////////////////////////////////////////////////
ACTION clear_keys {	// Loesche alle Keys ausser F3 und F10
	SET	IF_F1,	NULL;
	SET	IF_F2,	NULL;
	SET	IF_F3,	NULL;
	SET	IF_F5,	NULL;
	SET	IF_F11,	NULL;
	SET	IF_F12,	NULL;

IFNDEF DEBUG;	//jc
	SET	IF_0,	NULL;
ENDIF;
	SET	IF_1,	NULL;
	SET	IF_2,	NULL;
	SET	IF_3,	NULL;
	SET	IF_4,	NULL;
	SET	IF_5,	NULL;
	SET	IF_6,	NULL;
	SET	IF_7,	NULL;

	SET	IF_CTRL, NULL;
	SET	IF_SPACE,NULL;
	SET	IF_BKSP, NULL;
IFNDEF DEBUG;	//jc
	SET	IF_LEFT, NULL;
	SET	IF_RIGHT,NULL;
ENDIF;
	SET	IF_JOY4, NULL;

	SET	IF_SZ,	NULL;
	SET	IF_MINUS,NULL;
	SET	IF_APO,	NULL;
	SET	IF_PLUS, NULL;

	SET	IF_ESC,	NULL;
	SET	IF_P,	 	NULL;
	SET	IF_TAB,  NULL;
	SET	IF_ENTER,NULL;

	SET	fire,tu_nix;
}

ACTION clear_layers {
	SET		PANELS.1,NULL;			// cockpit
	SET		PANELS.2,NULL;			// debug
	SET		PANELS.3,NULL;			// EKG
	SET		PANELS.4,NULL;
	SET		PANELS.5,NULL;
	SET		PANELS.6,NULL;
	SET		PANELS.7,NULL;
	SET		PANELS.8,NULL;
	SET		PANELS.9,NULL;		// Level switch         mr0310b
	SET		PANELS.10,NULL;		// Level switch digits  mr0310b
	SET		PANELS.11,NULL;
	SET		PANELS.12,NULL;
	SET		PANELS.13,NULL;
	SET		PANELS.14,NULL;		// display
	SET		PANELS.15,NULL;		// mine
	SET		PANELS.16,NULL;

	SET		LAYERS.1,NULL;
	SET		LAYERS.2,NULL;
	SET		LAYERS.3,NULL;
	SET		LAYERS.4,NULL;
	SET		LAYERS.5,NULL;
	SET		LAYERS.6,NULL;
	SET		LAYERS.7,NULL;
	SET		LAYERS.8,NULL;
	SET		LAYERS.9,NULL;
	SET		LAYERS.10,NULL;
	SET		LAYERS.11,NULL;
	SET		LAYERS.12,NULL;
	SET		LAYERS.13,NULL;
	SET		LAYERS.14,NULL;		// cockpit alt
	SET		LAYERS.15,NULL;		// whopper
	SET		LAYERS.16,NULL;		// cockpit

	SET		MESSAGES.1,NULL;
	SET		MESSAGES.2,NULL;
	SET		MESSAGES.3,NULL;
	SET		MESSAGES.4,NULL;
	SET		MESSAGES.5,NULL;
	SET		MESSAGES.6,NULL;
	SET		MESSAGES.7,NULL;
	SET		MESSAGES.8,NULL;
	SET		MESSAGES.9,NULL;
	SET		MESSAGES.10,NULL;
	SET		MESSAGES.11,NULL;
	SET		MESSAGES.12,NULL;
	SET		MESSAGES.13,NULL;
	SET		MESSAGES.14,NULL;
	SET		MESSAGES.15,NULL;
	SET		MESSAGES.16,NULL;

	SET		EACH_TICK.1,NULL;
	SET		EACH_TICK.2,NULL;
	SET		EACH_TICK.3,NULL;
	SET		EACH_TICK.4,NULL;
	SET		EACH_TICK.5,NULL;
	SET		EACH_TICK.6,NULL;
	SET		EACH_TICK.7,NULL;
	SET		EACH_TICK.8,NULL;
	SET		EACH_TICK.9,NULL;
	SET		EACH_TICK.10,NULL;	// load_levelstart
	SET		EACH_TICK.11,NULL;	// whopper
	SET		EACH_TICK.12,NULL;
	SET		EACH_TICK.13,NULL;	// gun
	SET		EACH_TICK.14,NULL;	// message
	SET		EACH_TICK.15,NULL;
	SET		EACH_TICK.16,NULL;
//jc 28.09.

	SET		RENDER_MODE,0;
	SET		MOVE_MODE,0;			// Keine Animation mehr
	SET		MAP_MODE,0;
	SET		SOUND_VOL,0;
	SET		fire,tu_nix;
}

ACTION skaph_reload {
	SET		EACH_TICK.15,NULL;
	SET		EACH_TICK.16,NULL;
    SET     LOAD_MODE, 1;
	LOAD	STARTNAME,0;		// Level-Start wieder laden
	WAIT	4;
	BRANCH	skaph_start;
}

/////////////////////////////////////////////
// Tastenbelegung
ACTION manipulate {
	SET		gun_strength,0;
	PUSH		14;
}

ACTION switch_pause {
	PLAY_SOUND	button,0.2;
	ADD		pause,1;
	IF_ABOVE	pause,1;
	SET		pause,0;
	IF_EQUAL	pause,1;
	GOTO		set_pause;
	SET		MESSAGES.16,NULL;
	SET		MOVE_MODE,1;
//	IF_EQUAL	service_mode,1;
//		SET	MOVE_MODE,0.5;
	BRANCH	set_smus;

set_pause:
	SET		screen_msg.STRING,pause_on;
	SET		MESSAGES.16,screen_msg;
	SET		MOVE_MODE,-1;	// Auch each_ticks stoppen
	SET		MUSIC_VOL,0;
	SET		AUDIO_VOL,0;
	SET		SOUND_VOL,0;
}

ENDIF; // START_LEVEL; //mr 3009

//////////////////////////////////////////
ACTION set_smus {
	SET		MUSIC_VOL,old_music;
	SET		AUDIO_VOL,old_music;
	SET		SOUND_VOL,old_sound;
	IF_ABOVE	smus,0;
		SET	MUSIC_VOL,0;
	IF_ABOVE	smus,0;
		SET	AUDIO_VOL,0;
	IF_ABOVE	smus,1;
		SET	SOUND_VOL,0;
}

ACTION set_sense
{
    SET MOUSE_SENSE, old_mouse_sense;
    SET JOY_SENSE,   old_joy_sense;
//    SET KEY_SENSE,   old_key_sense;
}

IFNDEF START_LEVEL; //mr 3009

ACTION shrink {
	IF_EQUAL	MAP_MODE,0;
		BRANCH	shrink_screen;
}

ACTION inflate {
	IF_EQUAL	MAP_MODE,0;
		BRANCH	inflate_screen;
}

ACTION set_scrsize {
	END;	// jc 15.08.

	IF_BELOW	screen_size,1;
		GOTO	sscr_1;
	SET		screen_size,1;
	SET		SCREEN_X,0;	// default values
	SET		SCREEN_Y,0;
	SET		SCREEN_WIDTH,320;
	SET		SCREEN_HGT,336;
	END;
sscr_1:
	IF_BELOW	screen_size,0.5;
		SET	screen_size,0.5;
	IF_ABOVE	screen_size,0.49;
		SET	SCREEN_WIDTH,144;
	IF_ABOVE	screen_size,0.56;
		SET	SCREEN_WIDTH,160;
	IF_ABOVE	screen_size,0.62;
		SET	SCREEN_WIDTH,176;
	IF_ABOVE	screen_size,0.68;
		SET	SCREEN_WIDTH,192;
	IF_ABOVE	screen_size,0.74;
		SET	SCREEN_WIDTH,208;
	IF_ABOVE	screen_size,0.81;
		SET	SCREEN_WIDTH,224;
	IF_ABOVE	screen_size,0.87;
		SET	SCREEN_WIDTH,240;
	IF_ABOVE	screen_size,0.93;
		SET	SCREEN_WIDTH,256;
	RULE		SCREEN_HGT	= 1.162*SCREEN_WIDTH;
	RULE		SCREEN_X 	= -0.5*SCREEN_WIDTH + 160;
	RULE		SCREEN_Y 	= -0.5*SCREEN_HGT + 172;
}

ACTION shrink_screen {
	PLAY_SOUND	button,0.2;
	ADD 		screen_size,-0.063;	//=272/16
	BRANCH	set_scrsize;
}

ACTION inflate_screen {
	PLAY_SOUND	button,0.2;
	ADD 		screen_size,0.063;
	BRANCH	set_scrsize;
}
//////////////////////////////////////////////////

//jc 29.09.
/*
ACTION switch_mblur {
	ADD		MOTION_BLUR,0.5;
	IF_ABOVE	MOTION_BLUR,0.5;
		SET	MOTION_BLUR,0;

	SET		screen_msg.STRING,mblur_on;
	IF_EQUAL	MOTION_BLUR,0;
		SET	screen_msg.STRING,mblur_off;
	BRANCH	show_message;
}*/

ACTION switch_music {
	PLAY_SOUND	button,0.2;
	ADD		smus,1;
	IF_ABOVE	smus,2;
		SET	smus,0;
	IF_EQUAL	smus,0;
		SET	screen_msg.STRING,music_2;
	IF_EQUAL	smus,1;
		SET	screen_msg.STRING,music_1;
	IF_EQUAL	smus,2;
		SET	screen_msg.STRING,music_0;
	CALL		set_smus;
	CALL		show_message;
}
/////////////////////////////////////////////////
ACTION help_skaph {
	PLAY_SOUND	button,0.2;
	SET		screen_msg.STRING,briefing;
	SET		IF_F1,help_skaph2;
	BRANCH	show_help;
}

ACTION help_skaph2 {
	PLAY_SOUND	button,0.2;
	SET		screen_msg.STRING,motion_s;
	SET		IF_F1,help_skaph3;
	BRANCH	show_help;
}

ACTION help_skaph3 {
	PLAY_SOUND	button,0.2;
	SET		screen_msg.STRING,tasten_s;
	SET		IF_F1,help_skaph4;
	BRANCH	show_help;
}

ACTION help_skaph4 {
	PLAY_SOUND	button,0.2;
	SET		screen_msg.STRING,function_s;
	SET		IF_F1,help_weg;
	BRANCH	show_help;
}

ACTION help_weg {
	PLAY_SOUND	button,0.2;
	SET		IF_F1,help_skaph;
	BRANCH	clear_message;
}

ACTION show_help {
	SET		message_delay,200;
	BRANCH	show_message;
}
/////////////////////////////////////////////
ACTION switch_floor {
	ADD		FLOOR_MODE,1;
	IF_ABOVE	FLOOR_MODE,1;
		SET	FLOOR_MODE,0;
}

//////////////////////////////////////////////
//////////////////////////////////////////////
// Cheats:
// VEXFUL (AMMO + alles full),
//	VEXJET (= rocket),
//	VEXATOMIC (= toetet alle viren),
//	VEXNEX (= Levelausgang),

ACTION cheat {
	SET		health,health.MAX;
	SET	    old_health,health;  //mr1010
	SET		energy,energy.MAX;
	SET		gun1,1;
	SET		gun2,1;
	SET		gun3,1;
	SET		gun4,1;
	SET      gun5,1;
	SET		set_gun1,set_debugger;
	SET		set_gun2,set_debugger2;
	SET		set_gun3,set_interruptor;
	SET		set_gun4,set_eraser;
	SET		set_gun5,set_mine;
//	SET		set_gun6,set_saw;
//jc 16.09.
	IF_BELOW	shield,1000;
		SET   shield,1000;
	IF_BELOW	minen,3;
		SET	minen,5;
}

IF_V	cheat_v;
IF_N	cheat_n;
IF_E	cheat_e;
IF_X	cheat_x;

IF_F	cheat_f;
IF_U	cheat_u;
IF_L	cheat_l;

IF_J	cheat_j;
IF_E	cheat_e;
IF_T	cheat_t;

IF_A	cheat_a;
IF_O	cheat_o;
IF_M	cheat_m;
IF_I	cheat_i;
IF_C	cheat_c;

ACTION cheat_v {
	SET		skatomic,1;
	SET		skajet,1;
	SET		skanex,1;
	SET		skaful,1;
}

ACTION cheat_e {
	ADD		skatomic,1;
	IF_NEQUAL	skatomic,2;
		SET	skatomic,0;

	ADD		skaful,1;
	IF_NEQUAL	skaful,2;
		SET	skaful,0;

	ADD		skajet,1;
	IF_EQUAL	skajet,2;  //2. und 5. opos e dann ok
		GOTO 	skajetok;
	IF_EQUAL	skajet,5;
		 GOTO skajetok;
	SET		skajet,0;      //nicht ok
skajetok:

	ADD		skanex,1;
	IF_EQUAL	skanex,2;  //2. und 5. opos x dann ok
      END;
	IF_EQUAL	skanex,5;
		END;
	SET		skanex,0;
}

ACTION cheat_x {
	ADD		skatomic,1;
	IF_NEQUAL	skatomic,3;
		SET	skatomic,0;

	ADD		skaful,1;
	IF_NEQUAL	skaful,3;
		SET	skaful,0;

	ADD		skajet,1;
	IF_NEQUAL	skajet,3;
		SET	skajet,0;

	ADD		skanex,1;
	IF_EQUAL	skanex,3;  //3. und 6. opos x dann ok
      END;
	IF_EQUAL	skanex,6;
        BRANCH schluss_aus; //mr0310 ShowLevelEnd; //mr
      END;
	SET		skanex,0;
}

ACTION cheat_f {
	SET		skanex,0;
	SET		skatomic,0;
	SET		skajet,0;
	ADD		skaful,1;
	IF_NEQUAL	skaful,4;
		SET	skaful,0;
}

ACTION cheat_a {
	SET		skanex,0;
	SET		skajet,0;
   SET		skaful,0;
	ADD		skatomic,1;
	IF_NEQUAL	skatomic,4;
		SET	skatomic,0;
}

ACTION cheat_u {
	SET		skanex,0;
	SET		skatomic,0;
	SET		skajet,0;
	ADD		skaful,1;
	IF_NEQUAL	skaful,5;
		SET	skaful,0;
}

ACTION cheat_l {
	SET		skanex,0;
	SET		skatomic,0;
	SET		skajet,0;
	ADD		skaful,1;
	IF_NEQUAL	skaful,6;
		SET	skaful,0;
	IF_EQUAL	skaful,0;
		END;
	SET		skaful,0;
	PLAY_SOUND	button,0.2;
	SET		screen_msg.STRING,full_ammo;
	SET		EACH_TICK.14,show_message;
	BRANCH	cheat;
}

ACTION cheat_n {
	SET		skaful,0;
	SET		skatomic,0;
	SET		skajet,0;
	ADD		skanex,1;
	IF_NEQUAL	skanex,4;
		SET	skanex,0;
}

ACTION cheat_j {
	SET		skaful,0;
	SET		skatomic,0;
	SET		skanex,0;
	ADD		skajet,1;
	IF_NEQUAL	skajet,4;
		SET	skajet,0;
}

ACTION cheat_t {
	SET		skaful,0;
	SET		skanex,0;
	ADD		skatomic,1;
	IF_NEQUAL	skatomic,5;
		SET	skatomic,0;

	ADD		skajet,1;
	IF_NEQUAL	skajet,6;
		SET	skajet,0;
	IF_EQUAL	skajet,0;
		END;
	SET		skajet,0;
	BRANCH	do_skajet;
}

ACTION cheat_o {
	SET		skaful,0;
	SET		skanex,0;
	SET		skajet,0;
	ADD		skatomic,1;
	IF_NEQUAL	skatomic,6;
		SET	skatomic,0;
}

ACTION cheat_m {
	SET		skaful,0;
	SET		skanex,0;
	SET		skajet,0;
	ADD		skatomic,1;
	IF_NEQUAL	skatomic,7;
		SET	skatomic,0;
}

ACTION cheat_i {
	SET		skaful,0;
	SET		skanex,0;
	SET		skajet,0;
	ADD		skatomic,1;
	IF_NEQUAL	skatomic,8;
		SET	skatomic,0;
}

ACTION cheat_c {
	SET		skaful,0;
	SET		skanex,0;
	SET		skajet,0;
	IF_NEQUAL	skatomic,8;
		SET	skatomic,0;
	IF_EQUAL	skatomic,0;
		END;
	SET		skatomic,0;
	BRANCH	do_skatomic;
}

ACTION do_skatomic {
	SET		MY,screwdriver;
	SET		MY.HEIGHT,PLAYER_Z;
	SET		MY.DIST,0;
	SET		MY.INVISIBLE,0;
	DROP		MY;
	SET		gun_strength,-4000;
	SET		SHOOT_FAC,1;
	SET		SHOOT_RANGE,2000;
	EXPLODE	MY;
	SET		MY.INVISIBLE,1;
}

ACTION do_skajet {
	PLAY_SOUND	button,0.2;
	SET		screen_msg.STRING,have_jet;
	CALL		show_message;
	BRANCH	set_rocket;
}

IF_LOAD	if_load_global;

ACTION if_load_global
{
    CALL load_global;

	SET	TOUCH_TEXT,touch_txt;

// init OVERLAY's nach dem laden eines Levels mit anderer Aufloesung !!!!
IFDEF	HIRES;
	SET	TOUCH_TEXT.POS_X, 	390;     //800x600
	SET	TOUCH_TEXT.POS_Y, 	577;
	SET	MOUSE_X,400;
	SET	MOUSE_Y,270;
    SET panel_a.POS_Y,	502;
    SET cockpit.POS_Y, 460;
    SET pleer_pan.POS_X, 317;
    SET pleer_pan.POS_Y, 514;
IFELSE;
IFDEF	SVGA;
	SET	TOUCH_TEXT.POS_X, 	290;	 //SVGA 640x480
	SET	TOUCH_TEXT.POS_Y, 	462;
	SET	MOUSE_X,320;
	SET	MOUSE_Y,210;
    SET panel_a.POS_Y,	402;
    SET cockpit.POS_Y, 368;
    SET pleer_pan.POS_X, 254;
    SET pleer_pan.POS_Y, 411;
IFELSE;
	SET	TOUCH_TEXT.POS_X, 	130;	//VGA  320x400
	SET	TOUCH_TEXT.POS_Y, 	384;
	SET	MOUSE_X,160;
	SET	MOUSE_Y,176;
    SET panel_a.POS_Y,	306;
    SET cockpit.POS_Y, 307;
    SET pleer_pan.POS_X, 127;
    SET pleer_pan.POS_Y, 342;
ENDIF;
ENDIF;

    CALL init_debugger;
    CALL init_eraser;
    CALL init_interrupt;
    CALL init_mine;
//    CALL init_saw;
IFDEF WHOPPER_USED;
    CALL init_whopper;
ENDIF;

IFDEF CALL_LEVEL_INIT;
    CALL load_init;
ENDIF;

    IF_NEQUAL PANELS.1, panel_a;
    GOTO ohne_panel;
   	SET	TOUCH_TEXT.VISIBLE,1;

	SET	SCREEN_WIDTH, DEF_SCREEN_WIDTH;
	SET SCREEN_HGT,   DEF_SCREEN_HGT_PANEL;
	SET MAP_EDGE_X2,  DEF_SCREEN_WIDTH;
	SET MAP_EDGE_Y2,  DEF_SCREEN_HGT_MAP;
    SET Game_Started, 1;
    END;

ohne_panel:
   	SET	TOUCH_TEXT.VISIBLE,0;

	SET	SCREEN_WIDTH, DEF_SCREEN_WIDTH;
	SET SCREEN_HGT,   DEF_SCREEN_HGT;
	SET MAP_EDGE_X2,  DEF_SCREEN_WIDTH;
	SET MAP_EDGE_Y2,  DEF_SCREEN_HGT_MAP;

    SET	MESSAGES.9, NULL;
    SET	PANELS.4, NULL;
    SET PANELS.1, NULL;

    SET     Game_Started, 1;
    SET	    MOVE_MODE,1;
}


ENDIF; // START_LEVEL; //mr 3009

/////////////////////////////////////////////
ACTION skaph_gload {				// alle globals laden
	LOAD_INFO	SKILLNAME,LGVersion; //mr2909
}

ACTION skaph_gsave {				// save local skills
	SAVE_INFO	SKILLNAME,LGVersion; //mr2909
}

ACTION skaph_qsave {
    IF_EQUAL slot, -1;  // don't quickload !! mr1010
        BRANCH save_menu;

    CALL exit_menu;  // mr2410 fals in menu raus...

    FADE_PAL	black_2_pal,0.4;

	SET		screen_msg.STRING,save_yesno;
	SET		IF_Y,skaph_save;
	SET		IF_Z,skaph_save;
	SET		IF_J,skaph_save;
	BRANCH	wait_yesno;
}

ACTION skaph_save
{
	CALL    clear_message;	//jc 18.09.
	SET		screen_msg.STRING,ok;
	SET		EACH_TICK.14,show_message;
	SET		MOVE_MODE,1;
	SET		RESULT,0;

	CALL		skaph_gsave;		// slot saven, z.B. fuer levelstart
	RULE		slot_no = slot + 100*last_player;	// + 5*level_no;

    CALL       letzt_pal;

    SAVE		SAVENAME,slot_no;

	IF_BELOW	RESULT,0;	// Fehler?
		SET	screen_msg.STRING,save_nix;
	CALL	show_message;

    //mr2409 Level 0 besteht nur aus dem Menu !
    IF_EQUAL level_no, 0;
        CALL main_menu;
}

ACTION skaph_qload {
    IF_EQUAL slot, -1;  // don't quickload !! mr0910
        GOTO kein_save;

    CALL exit_menu;  // mr2410 fals in menu raus...

    FADE_PAL	black_2_pal,0.4;

	SET		screen_msg.STRING,load_yesno1;
//	SET		slot_no,slot;
//	IF_BELOW	slot_no,1;
//		ADD	slot_no,3;
	SET		IF_Y,skaph_load;
	SET		IF_Z,skaph_load;
	SET		IF_J,skaph_load;
//	SET		IF_F3,skaph_qload2;
	BRANCH	wait_yesno;

kein_save:
	SET	screen_msg.STRING,load_nix;
	BRANCH show_message;
}

/*
ACTION skaph_qload2 {
	SET		screen_msg.STRING,load_yesno2;
	SET		slot_no,slot;
	ADD		slot_no,-1;
	IF_BELOW	slot_no,1;
		ADD	slot_no,3;
	SET		IF_Y,skaph_load;
	SET		IF_Z,skaph_load;
	SET		IF_J,skaph_load;
	SET		IF_F3,skaph_qload3;
	BRANCH	wait_yesno;
}

ACTION skaph_qload3 {
	SET		screen_msg.STRING,load_yesno3;
	SET		slot_no,slot;
	ADD		slot_no,-2;
	IF_BELOW	slot_no,1;
		ADD	slot_no,3;
	SET		IF_Y,skaph_load;
	SET		IF_Z,skaph_load;
	SET		IF_J,skaph_load;
	SET		IF_F3,skaph_qload;
	BRANCH	wait_yesno;
}
*/

ACTION skaph_load
{
	CALL    clear_message;	// mr1810

	SET		screen_msg.STRING,wait_txt;
	SET		MESSAGES.16,screen_msg;

IFNDEF START_LEVEL;  // mr3009
	IF_EQUAL PANELS.1,  panel_a;    // mr0910  wenn im Game, dann
		SET	PANELS.14,pleer_pan;	// panel vorher loeschen
ENDIF;
	WAIT		2;					// damit message sichtbar und panel geloescht wird

	CALL		skaph_gsave;		// Globals - slot, max_player - vorher sichern
	RULE		slot_no = slot + 100*last_player;

IFNDEF START_LEVEL;  // mr2210
    SET LOAD_MODE, 1;
IFELSE;
    SET LOAD_MODE, 0;
ENDIF;
    LOAD	SAVENAME,slot_no;
	SET		screen_msg.STRING,load_nix;
	SET		MOVE_MODE,1;
	BRANCH	show_message;
}

IFNDEF START_LEVEL; //mr 3009

////////////////////////////////////////////////////////////////////////////
SKILL	old_audio { VAL 0.5; }
ACTION	play_cdtrack {
IFNDEF NO_BRIEFING;
again:
	PLAY_CD	level_track,level_track;
	WAITT		80;
	PLAY_CD	0,0;				// CD abfragen
	IF_EQUAL	CD_TRACK,0;
		END;
loop:
	WAITT		16;
	IF_ABOVE	AUDIO_VOL,0.1;
		GOTO	play;
stby:
	IF_ABOVE	old_audio,0.1;
		PLAY_CD	0,1;			// CD stoppen
	SET		old_audio,AUDIO_VOL;
	GOTO		loop;
play:
	IF_BELOW	old_audio,0.1;
		PLAY_CD	1,0;			// CD weiter
	SET		old_audio,AUDIO_VOL;
	PLAY_CD	0,0;				// CD abfragen
	IF_EQUAL	CD_TRACK,0;
		GOTO	again;			// Track zuende: nochmal versuchen
	GOTO		loop;
ENDIF;
	END;
}
////////////////////////////////////////////////////////////////////////////
ENDIF; // START_LEVEL;

INCLUDE	<skaphjc.wdl>;
INCLUDE	<skaphgor.wdl>;
INCLUDE	<hole.wdl>;
INCLUDE	<debugger.wdl>;
INCLUDE	<slift.wdl>;

IFDEF DEBUG;
	INCLUDE	<debug.wdl>;
	INCLUDE	<mouse.wdl>;
	INCLUDE	<info.wdl>;

#	IF_8	well_done;
#	IF_9	skaph_die;
ENDIF;
////////////////////////////////////////////////////////////////////////////
