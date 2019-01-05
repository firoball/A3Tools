////////////////////////////////////////////////////////////////////////////
//SAVEDIR	"C:\\OPGAMES";

//SKILL THING_WIDTH { VAL 0.7; }
SKILL ACTOR_WIDTH { VAL 0.7; }

DEFINE WARN_DIST,20;
/////////////////////////////////////////////////////

ACTION schluss_aus {
	SET		LAYERS.15,NULL;		// whopper
	SET		drown_count,0;
loop:
	WAIT		1;
	IF_ABOVE	PLAYER_HGT,50;
		goto	loop;

    BRANCH      showLevelEnd;
}

/*
ACTION exit_last_level
{
	CALL	clear_layers;

    SET     RENDER_MODE, 0;
    SET     FRAME_COLOR, 1;
    CALL    ClearScreen;
    WAIT 2;

    SET KEY_ANY, 0; // mr0910
    WAIT 2;
    SET KEY_ANY, 0; // mr2010

    SET screen_msg.POS_Y, 12; // mr0910
    SET screen_msg.POS_X, 12; // mr0910

	SET		FRAME_COLOR,1;
	SET		screen_msg.STRING,hurra_str;
	SET		screen_msg.VISIBLE,1;
#	SET		screen_msg.CENTER,1;

    WAIT 2;
    SET KEY_ANY, 0; // mr2010

	SET		fade,0;
loop:
	RULE		fade=fade+TIME_CORR;
	WAIT		1;
	IF_EQUAL	KEY_ANY,1;
		GOTO	weiter;
	IF_BELOW	fade,200;
		GOTO	loop;
weiter:

	BRANCH	skaph_fadeout;
//	EXIT		hurra_str;
}
*/

///////////////////////////////////////////////////
SKILL COLOR_BORDER	{ VAL 114; }
SKILL COLOR_WALLS		{ VAL 130; }

IF_TAB	toggle_map;

///////////////////////////////////////////////////
IFDEF DEBUG;
ACTION test {
	BEEP;
	SET_ALL	nix_wal.INVISIBLE,1;
}
IF_T	schluss_aus;
#IF_T changelevel;
ENDIF;

SYNONYM dy { TYPE ACTOR; }
SYNONYM dyreg { TYPE REGION; }

ACTION inv_virus_init {
	SET	dy.INVISIBLE,0;
}

ACTION unt_virus_init {
	SET	dyreg,dy.REGION;
	SET	dy.Z,dyreg.FLOOR_HGT;
	SET	dy.INVISIBLE,0;
}

///////////////////////////////////////////////////
ACTION skaph_die {
	EXCLUSIVE;

    SET IF_F2, NULL;  // nicht Quicksave !!!!

	SET		energy,0;
	SET		MESSAGES.16,NULL;
	SET		EACH_TICK.10,NULL;	// load_levelstart
	SET		EACH_TICK.11,NULL;	// whopper
	SET		EACH_TICK.12,NULL;
	SET		EACH_TICK.13,NULL;	// gun
	SET		EACH_TICK.14,NULL;	// message
	SET		EACH_TICK.15,skaph_die;
	SET		EACH_TICK.16,NULL;
	CALL		clear_keys;
	PLAY_SOUND	zschbumm,0.4;

	SET		fade,0;

skdie_11:
	IF_BELOW	PLAYER_VZ,0.3;
		RULE	PLAYER_VZ = PLAYER_VZ + 0.003;
	RULE		PLAYER_VROT = PLAYER_VROT + 0.005;
	RULE		fade = fade + 0.02*TIME_CORR;
	FADE_PAL	red_pal,fade;
	WAIT		1;
	IF_BELOW	fade,0.6;
		GOTO	skdie_11;

	RULE		MUSIC_VOL = 0.5*MUSIC_VOL;
	RULE		AUDIO_VOL = 0.5*AUDIO_VOL;

//	CALL		clear_layers;
	SET   	randtxt_abkratz_speicher.index,1;
	IF_ABOVE	RANDOM,0.5;
		GOTO 	NoAbsel;
	RULE		zwerg_Skill=RANDOM*20+1; //1..10 erzeugen
	SET   	randtxt_abkratz_speicher.index,zwerg_Skill;
	//nur mit set wird string sofort ermittelt //keine RULE verwenden
NoAbsel:
	SET		screen_msg.STRING,randtxt_abkratz_speicher.STRING;
	SET		MESSAGES.16,screen_msg;
sdie_nomsg:

	SET		fade,0;
skdie_2:
	RULE		fade=fade+TIME_CORR;
	WAIT		1;
	IF_EQUAL	KEY_ANY,1;
		GOTO	skdie_3;
	IF_BELOW	fade,40;
		GOTO	skdie_2;

skdie_3:

	LOAD    STARTNAME,0;		// Level-Start wieder laden
    WAIT    4;
    BRANCH	skaph_start;
}