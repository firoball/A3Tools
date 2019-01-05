//////////////////////////////////////////////////////////
// Example for a WDL menu
// to start new levels, save, load, etc.
//////////////////////////////////////////////////////////
#DEFINE	START_LEVEL;	// Only one level!

DEFINE menu_font,msg_font;
//SAVEDIR	"";	// save into current directory (not on CDROM!!)

//////////////////////// MENU - STRINGÔS///////////////
#STRING	scshot_str,"Screenshot VEX   .PCX";
SKILL 	used_time_menu {};  //zwischenspeicher der zeit
SKILL 	used_time_sec {};
SKILL 	used_time_min {};
SKILL 	used_time_stunden {};
SKILL	no_exit { VAL 0; }

SKILL   menu_with_panel { VAL 0; }

SYNONYM aft_hist_act { TYPE ACTION; DEFAULT tunix; }

SKILL   LevelWechelMitBlinken { VAL 0; }
SKILL ActiveVideoMode { VAL -1; }


//option menue

STRING Bar_pos_10,  "<=========[]>";
STRING Bar_pos_9,	"<========[]=>";
STRING Bar_pos_8,	"<=======[]==>";
STRING Bar_pos_7,	"<======[]===>";
STRING Bar_pos_6,	"<=====[]====>";
STRING Bar_pos_5,	"<====[]=====>";
STRING Bar_pos_4,	"<===[]======>";
STRING Bar_pos_3,	"<==[]=======>";
STRING Bar_pos_2,	"<=[]========>";
STRING Bar_pos_1,	"<[]=========>";

STRING Aufloes_lo_str,	"320x400";
STRING Aufloes_mid_str,	"640x480";
STRING Aufloes_hi_str,	"800x600";

TEXT All_Aufloes_txt {
	FONT	menu_font;
    STRINGS 3;
	STRING	Aufloes_lo_str, Aufloes_mid_str, Aufloes_hi_str;
}
//mr <<<<

STRING empty,    "                   ";
SKILL Newscore		{VAL 0;}

//////////////////////////////////////////////////////////

//SOUND	klick, <aufsetz.wav>;

IFDEF START_LEVEL;  // mr0810
DEFINE menu_xpos,48;
DEFINE menu_xpos_2,180;
DEFINE menu_ypos_l1,40;
DEFINE menu_ypos_l2,50;
DEFINE menu_ypos_l3,60;
DEFINE menu_ypos_l4,70;
DEFINE menu_ypos_l5,80;
DEFINE menu_ypos_l6,90;
DEFINE menu_ypos_l7,100;
DEFINE menu_ypos_l8,110;
DEFINE menu_ypos_l9,120;
IFELSE;  // START_LEVEL

IFDEF NEW_FONT;
// mr 24.09
IFDEF HIRES;
DEFINE menu_xpos,48;
DEFINE menu_xpos_2,180;
DEFINE menu_ypos_l1,64;
DEFINE menu_ypos_l2,84;
DEFINE menu_ypos_l3,104;
DEFINE menu_ypos_l4,124;
DEFINE menu_ypos_l5,144;
DEFINE menu_ypos_l6,164;
DEFINE menu_ypos_l7,184;
DEFINE menu_ypos_l8,204;
DEFINE menu_ypos_l9,224;
IFELSE;
IFDEF SVGA;
DEFINE menu_xpos,48;
DEFINE menu_xpos_2,180;
DEFINE menu_ypos_l1,64;
DEFINE menu_ypos_l2,84;
DEFINE menu_ypos_l3,104;
DEFINE menu_ypos_l4,124;
DEFINE menu_ypos_l5,144;
DEFINE menu_ypos_l6,164;
DEFINE menu_ypos_l7,184;
DEFINE menu_ypos_l8,204;
DEFINE menu_ypos_l9,224;
IFELSE;
DEFINE menu_xpos,48;
DEFINE menu_xpos_2,180;
DEFINE menu_ypos_l1,64;
DEFINE menu_ypos_l2,80;
DEFINE menu_ypos_l3,96;
DEFINE menu_ypos_l4,112;
DEFINE menu_ypos_l5,128;
DEFINE menu_ypos_l6,144;
DEFINE menu_ypos_l7,160;
DEFINE menu_ypos_l8,176;
DEFINE menu_ypos_l9,192;
ENDIF;
ENDIF;

IFELSE;
// mr 24.09
DEFINE menu_xpos,48;
DEFINE menu_xpos_2,180;
DEFINE menu_ypos_l1,64;
DEFINE menu_ypos_l2,80;
DEFINE menu_ypos_l3,96;
DEFINE menu_ypos_l4,112;
DEFINE menu_ypos_l5,128;
DEFINE menu_ypos_l6,144;
DEFINE menu_ypos_l7,160;
DEFINE menu_ypos_l8,176;
DEFINE menu_ypos_l9,192;
ENDIF;
ENDIF;  // START_LEVEL

//mr
TEXT EditPassword_txt {
	POS_X 	menu_xpos_2;
	POS_Y 	menu_ypos_l1;
	FONT	menu_font;
	STRING	LevPasswd;
}

TEXT menu1_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l1;
	FONT		menu_font;
	STRING	empty;
}

TEXT menu2_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l2;
	FONT		menu_font;
	STRING	empty;
}

TEXT menu3_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l3;
	FONT		menu_font;
	STRING	empty;
}

TEXT menu4_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l4;
	FONT		menu_font;
	STRING	empty;
}

TEXT menu5_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l5;
	FONT		menu_font;
	STRING	empty;
}

TEXT menu6_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l6;
	FONT		menu_font;
	STRING	empty;
}

TEXT menu7_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l7;
	FONT		menu_font;
	STRING	empty;
}

TEXT menu8_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l8;
	FONT		menu_font;
	STRING	empty;
}

TEXT menuexit_txt {
	POS_X 	menu_xpos;
	POS_Y 	menu_ypos_l9;
	FONT		menu_font;
	STRING	exit1_str;
}

IFDEF NO_RESOLUTION_SWITCH;
TEXT  bar_out_txt{
	POS_X 	menu_xpos_2;
	POS_Y 	menu_ypos_l1;
	STRINGS 	4;
	FONT		menu_font;
	STRING 	Bar_pos_1,Bar_pos_2,Bar_pos_3, Bar_pos_4;
}
IFELSE;
TEXT  bar_out_txt{
	POS_X 	menu_xpos_2;
	POS_Y 	menu_ypos_l1;
	STRINGS 	5;
	FONT		menu_font;
	STRING 	Bar_pos_1,Bar_pos_2,Bar_pos_3, Bar_pos_4, Bar_pos_5;
}
ENDIF;

// mr2409
MUSIC dummysong, <dummy.mid>;


//BMAP		level_map      <s_moda00.lbm>;
//BMAP		level_map_anim <PAL_0.pcx>;
//BMAP		level_map_anim_small <punkte.pcx>;

DEFINE END_MESSAGE_X, 60;
DEFINE END_MESSAGE_Y, 60;

SKILL absch_d { VAL 0; }
SKILL bug_d { VAL 0; }
SKILL score_d { VAL 0; }
SKILL score_count { VAL 0; }
SKILL abschussquote_1 { VAL 0; }
SKILL bugs_weg_1 { VAL 0; }
SKILL Newscore_1 { VAL 0; }

PANEL		panel_levelend_digits{
	FLAGS		REFRESH;
	POS_X		END_MESSAGE_X;
	POS_Y		END_MESSAGE_Y;
	DIGITS	128, 0,3,menu_font,1,abschussquote_1;
	DIGITS	 88,16,3,menu_font,1,bugs_weg_1;
	DIGITS	128,16,3,menu_font,1,bugquote;
	DIGITS	112,32,2,menu_font,1,used_time_stunden;
	DIGITS	136,32,2,menu_font,1,used_time_min;
//    DIGITS	160,32,2,menu_font,1,used_time_sec;
	DIGITS	 88,48,8,menu_font,1,Newscore_1;

IFDEF MOUSE_DEBUG_INFO;
	DIGITS	120,100,3,menu_font,1,MOUSE_X;
	DIGITS	180,100,6,menu_font,1,MOUSE_Y;
ENDIF;
}
/*
PANEL panel_level_leer {
	POS_X 0; POS_Y 0;
	PAN_MAP	level_map;
	FLAGS		REFRESH;
}
*/
/*
PANEL panel_level_anim {
	POS_X 0; POS_Y 0;
	PAN_MAP	level_map_anim;
	FLAGS		REFRESH;
}
*/

// PANEL panel_blink2 { POS_X 44; POS_Y 80; PAN_MAP this_map; FLAGS REFRESH; }
// PANEL panel_blink1 { POS_X 44; POS_Y 80; PAN_MAP next_map; FLAGS REFRESH; }
/*
PANEL panel_level_anim_small {
	POS_X 0; POS_Y 0;
	PAN_MAP	level_map_anim_small;
	FLAGS		REFRESH;
}
*/
TEXT	levelendWait_txt {
	POS_X 	END_MESSAGE_X;
	POS_Y 	END_MESSAGE_Y;
	FONT	menu_font;
    STRING  PleaseWait_txt;
}

TEXT	levelStartWait_txt {
	FONT	menu_font;
    STRING  wait_txt;
}

TEXT	levelend_txt{
	POS_X 	END_MESSAGE_X;
	POS_Y 	END_MESSAGE_Y;
	STRINGS	3; //pos 2 ist passwort
	FONT		menu_font;
    STRING	levelend_str1,LevPasswd,levelend_str2;
	 	//+Levelname des naechsten levels
}

IFDEF MOUSE_DEBUG_INFO;
IFNDEF DEBUG;
	INCLUDE	<mouse.wdl>;
ENDIF;
ENDIF;
//mr 20.09


////////////////////////////////////////////////////////////////////
//MAIN MENU
SKILL  menu_pos { VAL 0; MIN 0; MAX 7; }

ACTION tunix { END; }

SKILL  menu_aktive { VAL 0; }


SYNONYM menu1_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu2_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu3_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu4_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu5_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu6_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu7_str { TYPE STRING; DEFAULT empty; }
SYNONYM menu8_str { TYPE STRING; DEFAULT empty; }
SYNONYM exit_str { TYPE STRING; DEFAULT empty; }

SYNONYM menu1_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu2_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu3_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu4_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu5_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu6_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu7_act { TYPE ACTION; DEFAULT tunix; }
SYNONYM menu8_act { TYPE ACTION; DEFAULT tunix; }

ACTION set_menu {
	SET	menu1_txt.STRING,menu1_str;
	SET	menu2_txt.STRING,menu2_str;
	SET	menu3_txt.STRING,menu3_str;
	SET	menu4_txt.STRING,menu4_str;
	SET	menu5_txt.STRING,menu5_str;
	SET	menu6_txt.STRING,menu6_str;
	SET	menu7_txt.STRING,menu7_str;
	SET	menu8_txt.STRING,menu8_str;
	SET	menuexit_txt.STRING,exit_str;

    IF_EQUAL no_exit, 1;
    	SET	menuexit_txt.STRING,empty;
}

//jc 15.08.
ACTION show_oneway_menu {
	SET		no_exit,1;
	BRANCH	show_anymenu;
}

ACTION show_menu {
	SET		no_exit,0;
	BRANCH	show_anymenu;
}

SKILL menu_loop_count { VAL 0; }

ACTION show_anymenu {
    WAIT 2;  // clear Screen !!!
    SET menu_aktive, 1;

//	FADE_PAL	black_2_pal,0.4;
	PLAY_SOUND	button,0.2;
	SET		IF_ENTER,menu_exec;
	SET		IF_CUU,menu_up;
	SET		IF_CUD,menu_down;
	SET		MOVE_MODE,0;
	SET		menu_pos.MIN,1;
	IF_EQUAL	menu_pos,0;
		SET	menu_pos,1;
	IF_EQUAL	no_exit,1;	// Menue ohne EXIT?
        GOTO    no_exit1;
	SET		IF_ESC,exit_menu;

    IFDEF START_LEVEL;  // mr0810
	RULE    menuexit_txt.POS_Y = menu1_txt.POS_Y+menu_pos.MAX*10-5;
    IFELSE;
    IFDEF NEW_FONT;
	RULE    menuexit_txt.POS_Y = menu1_txt.POS_Y+menu_pos.MAX*22-11;
    IFELSE;
	RULE    menuexit_txt.POS_Y = menu1_txt.POS_Y+menu_pos.MAX*16-8;
    ENDIF;
    ENDIF;
	SET		messages.9,menuexit_txt;
no_exit1:
	SET		messages.1,menu1_txt;  //mr
	SET		messages.2,menu2_txt;
	SET		messages.3,menu3_txt;
	SET		messages.4,menu4_txt;
	SET		messages.5,menu5_txt;
	SET		messages.6,menu6_txt;
	SET		messages.7,menu7_txt;
	SET		messages.8,menu8_txt;

blink:
    //mr2.10  terminate Menu if not active
    IF_EQUAL    menu_aktive, 0;
    END;

	CALL		set_menu;

    //mr0810
    RULE menu_loop_count = 6; // * TIME_CORR;
wait_loop1:
	WAIT   2;

    //mr2.10  terminate Menu if not active
    IF_EQUAL    menu_aktive, 0;
    END;

    ADDT menu_loop_count, -1;

    IF_ABOVE menu_loop_count, 0;
    GOTO wait_loop1;


	IF_EQUAL	no_exit,1;
		GOTO	no_exit2;
	IF_MAX	menu_pos;
		SET	menuexit_txt.STRING,empty;
no_exit2:
	IF_EQUAL	menu_pos,1;
		SET	menu1_txt.STRING,empty;
	IF_EQUAL	menu_pos,2;
		SET	menu2_txt.STRING,empty;
	IF_EQUAL	menu_pos,3;
		SET	menu3_txt.STRING,empty;
	IF_EQUAL	menu_pos,4;
		SET	menu4_txt.STRING,empty;
	IF_EQUAL	menu_pos,5;
		SET	menu5_txt.STRING,empty;
	IF_EQUAL	menu_pos,6;
		SET	menu6_txt.STRING,empty;
	IF_EQUAL	menu_pos,7;
		SET	menu7_txt.STRING,empty;
	IF_EQUAL	menu_pos,8;
		SET	menu8_txt.STRING,empty;
	IF_EQUAL	menu_pos,0;
        END;

    //mr0810
    SET menu_loop_count, 6;
wait_loop2:
	WAIT   2;

    //mr2.10  terminate Menu if not active
    IF_EQUAL    menu_aktive, 0;
    END;

    ADDT menu_loop_count, -1;

    IF_ABOVE menu_loop_count, 0;
    GOTO wait_loop2;

    GOTO		blink;
}

//MR (Hotkey'f fuer menu)
SKILL KeyDefAktive { VAL 0; }
SYNONYM KeyDefN { TYPE ACTION; DEFAULT NULL; }
SYNONYM KeyDefS { TYPE ACTION; DEFAULT NULL; }
SYNONYM KeyDefL { TYPE ACTION; DEFAULT NULL; }
SYNONYM KeyDefP { TYPE ACTION; DEFAULT NULL; }
SYNONYM KeyDefH { TYPE ACTION; DEFAULT NULL; }
SYNONYM KeyDefO { TYPE ACTION; DEFAULT NULL; }
SYNONYM KeyDefQ { TYPE ACTION; DEFAULT NULL; }

SKILL InMenu { VAL 0; }  // mr1510

ACTION clear_menu {
    SET     menu_aktive, 0;

    //MR (Hotkey'f fuer menu)
    IF_EQUAL KeyDefAktive,0;
    GOTO n_KeyDefAktive;
	SET		IF_N,KeyDefN;
	SET		IF_S,KeyDefS;
	SET		IF_L,KeyDefL;
	SET		IF_P,KeyDefP;
	SET		IF_H,KeyDefH;
	SET		IF_O,KeyDefO;
	SET		IF_Q,KeyDefQ;
    SET     KeyDefAktive, 0;
n_KeyDefAktive:

	SET		menu1_str,empty;
	SET		menu2_str,empty;
	SET		menu3_str,empty;
	SET		menu4_str,empty;
	SET		menu5_str,empty;
	SET		menu6_str,empty;
	SET		menu7_str,empty;
	SET		menu8_str,empty;
	SET		menu1_txt.STRING,empty;
	SET		menu2_txt.STRING,empty;
	SET		menu3_txt.STRING,empty;
	SET		menu4_txt.STRING,empty;
	SET		menu5_txt.STRING,empty;
	SET		menu6_txt.STRING,empty;
	SET		menu7_txt.STRING,empty;
	SET		menu8_txt.STRING,empty;
	IF_EQUAL messages.10,bar_out_txt;  //war hier option menue
		CALL	restore_ptr;             //dann loeschen

	SET		messages.1,NULL;
	SET		messages.2,NULL;
	SET		messages.3,NULL;
	SET		messages.4,NULL;
	SET		messages.5,NULL;
	SET		messages.6,NULL;
	SET		messages.7,NULL;
	SET		messages.8,NULL;
	SET		messages.9,NULL;
	SET		menu_pos.MIN,0;
	SET		menu_pos,0;	// signal to end the show_menu action

	SET		IF_ESC,main_menu;
	SET		IF_CUU,NULL;
	SET		IF_CUD,NULL;
	SET		IF_ENTER,NULL;

	SET		PANELS.10,NULL;		// Level switch digits  mr0310b

    IF_EQUAL menu_with_panel, 0;
    END;

    SET     RENDER_MODE, 0;
    SET     frame_color, 1;
//    CALL    ClearScreen;
    WAIT    2;

//	FADE_PAL	black_2_pal,0;
//	SET		MOVE_MODE,1;
}

ACTION menu_up {
	PLAY_SOUND	klick,0.5;
	CALL		set_menu;
	ADD		menu_pos,-1;

    IF_EQUAL menu_pos, 2;
        GOTO p2;
    END;

p2:
    IF_EQUAL menu2_act, tunix;
    	ADD		menu_pos,-1;
}

ACTION menu_down {
	PLAY_SOUND	klick,0.5;
	CALL		set_menu;
	ADD		menu_pos,1;

    IF_EQUAL menu_pos, 2;
        GOTO p2;
    END;

p2:
    IF_EQUAL menu2_act, tunix;
    	ADD		menu_pos,1;
}

ACTION menu_exec {
#	BEEP;
	PLAY_SOUND	klick,0.5;
	IF_EQUAL	no_exit,1;
		GOTO	no_exit3;
	IF_MAX	menu_pos;
		BRANCH	exit_menu;
no_exit3:
	IF_EQUAL	menu_pos,1;
		BRANCH	menu1_act;
	IF_EQUAL	menu_pos,2;
		BRANCH	menu2_act;
	IF_EQUAL	menu_pos,3;
		BRANCH	menu3_act;
	IF_EQUAL	menu_pos,4;
		BRANCH	menu4_act;
	IF_EQUAL	menu_pos,5;
		BRANCH	menu5_act;
	IF_EQUAL	menu_pos,6;
		BRANCH	menu6_act;
	IF_EQUAL	menu_pos,7;
		BRANCH	menu7_act;
	IF_EQUAL	menu_pos,8;    // mr2010
		BRANCH	menu8_act;
}

ACTION exit_menu
{
    IF_EQUAL InMenu, 0; // mr2410
    END;

    // exit Menu
    CALL clear_menu;

    IF_EQUAL level_no, 0;
        BRANCH main_menu;

//mr3009
    SET		IF_CTRL,	fire_start;
IFNDEF DEBUG;
	SET		IF_LEFT,	fire_start;
ENDIF;

    CALL RestoreLevelSetting;

    SET InMenu, 0; // mr1510

    CALL set_gun;  // mr0310

   	SET	IF_F1,help_skaph;  // mr1310

	SET  MOVE_MODE,1;

IFNDEF START_LEVEL;
    //mr2610
    SET		EACH_TICK.15,skaph_panel;
ENDIF;

    IF_EQUAL menu_with_panel, 0;
    GOTO without_menupanel2;
        SET		PANELS.9,NULL;
    	SET		PANELS.10,NULL;

        SET screen_msg.POS_Y, 12;
        SET screen_msg.POS_X, 12;

IFNDEF START_LEVEL;
        //mr2509
	    SET		PANELS.1,panel_a;
	    SET		LAYERS.16,cockpit;
ENDIF;

        SET RENDER_MODE, 2;
without_menupanel2:
    IF_EQUAL menu_with_panel, 0;
	    CALL    letzt_pal;

}

//jc 30.09.
ACTION notavail_menu {
	CALL		exit_menu;
	SET 		screen_msg.STRING,notavail_str;
	CALL		show_message;
}

SKILL menu_ohne_save { VAL 0; }

ACTION main_menu_ohne_Save
{
    SET menu_ohne_save, 1;
}

ACTION main_menu_mit_Save
{
    SET menu_ohne_save, 0;
}

ACTION main_menu {

    SET IF_ANYKEY, NULL;

    SET menu_with_panel, 0;
    IF_ABOVE level_no, 0;
    GOTO weiter;
        SET menu_with_panel, 1;
        SET menu_ohne_save, 1;
    weiter:

    // begin Menu
    CALL EnterMenu;

    IF_EQUAL menu_with_panel, 0;
    GOTO without_menupanel1;
        SET     RENDER_MODE, 0;
        SET     frame_color, 1;
//        CALL    ClearScreen;
        WAIT    2;

/*
        SET		PANELS.1,NULL;
	    SET		LAYERS.16,NULL;
        SET     PANELS.9,panel_level_leer; //mr digits loeschen
        SET     screen_msg.POS_Y, 40;  //mr 24.09
        SET     screen_msg.POS_X, 40;  //mr 24.09
*/
without_menupanel1:
    IF_EQUAL menu_with_panel, 0;
	    FADE_PAL	black_2_pal,0.4;

    CALL    clear_menu;
	SET		menu1_str,new_game_str;

    IF_EQUAL menu_ohne_save, 0;
    	SET		menu2_str,save_game_str;
	SET		menu3_str,load_game_str;
/*
	SET		menu4_str,Npasswd_str;
	SET		menu5_str,hiscor_str;
	SET		menu6_str,game_option_str;
	SET		menu7_str,quit_game_str;
*/
	SET		menu4_str,game_option_str;
	SET		menu5_str,quit_game_str;
    SET     exit_str, exit1_str;

    //MR (Hotkey'f fuer menu)
    IF_EQUAL KeyDefAktive,1;
    GOTO n_KeyDefAktive;
	    SET		KeyDefN,IF_N;
	    SET		KeyDefS,IF_S;
	    SET		KeyDefL,IF_L;
//	    SET		KeyDefP,IF_P;
//	    SET		KeyDefH,IF_H;
	    SET		KeyDefO,IF_O;
	    SET		KeyDefQ,IF_Q;
        SET     KeyDefAktive, 1;
    n_KeyDefAktive:

	SET		IF_N,new_game_menu;
    IF_EQUAL menu_ohne_save, 0;
    	SET		IF_S,save_menu;
	SET		IF_L,load_menu;
	//SET		IF_P,passwd_menu;
//	SET		IF_H,hiscor_menu;
	SET		IF_O,vol_blur_menu;
	SET		IF_Q,exit_yesno;

	SET		menu1_act,new_game_menu;
    SET     menu2_act,tunix;
    IF_EQUAL menu_ohne_save, 0;
    	SET		menu2_act,save_menu;
	SET		menu3_act,load_menu;
/*
	SET		menu4_act,passwd_menu;
	SET		menu5_act,hiscor_menu;
	SET		menu6_act,vol_blur_menu;
	SET		menu7_act,exit_yesno;
*/
	SET		menu4_act,vol_blur_menu;
	SET		menu5_act,exit_yesno;
	SET		menu_pos.MAX,6;	//8;
    SET     no_exit, 0;

    IF_ABOVE level_no, 0;
    GOTO no_exit_label;
        SET no_exit, 1;
    	SET	menu_pos.MAX,7;
no_exit_label:
	BRANCH	show_anymenu;
}


////////////////////////////////////////////////////////////////////
//MAP-SCALE

ACTION toggle_map {
	SET		MAP_ROT,1;
	ADD		MAP_MODE,0.5;
	IF_ABOVE	MAP_MODE,0.5;
		SET	MAP_MODE,0;
}

ACTION mscale_plus {
	IF_EQUAL	MAP_MODE,0;
		END;
	RULE		MAP_SCALE = MAP_SCALE * 1.1;
}

ACTION mscale_minus {
	IF_EQUAL	MAP_MODE,0;
		END;
	RULE		MAP_SCALE = MAP_SCALE * 0.9;
}
////////////////////////////////////////////////////
//HISCORE
/*
ACTION hiscor_menu
{
    CALL    clear_menu;
    WAIT    2;
    CALL    ShowHiscore;

    WAIT 16;

    CALL HS_AnyKey;

    SET IF_ANYKEY exit_hiscor_menu;
//	SET		menu1_str,hiscor_str;
//	SET		menu1_act,exit_yesno;
//	SET		menu_pos.MAX,1;
//	BRANCH	show_menu;
}

ACTION exit_hiscor_menu
{
   	SET		IF_ANYKEY,NULL;
	SET		PANELS.10,NULL;
    BRANCH  main_menu;
}
*/
//////////////////////////////////////////////////
//DIFFICULTY
SYNONYM aft_diff_act { TYPE ACTION; DEFAULT tunix; }
//aktion die difficulty-menue nach menue-ende ausfuehrt
SKILL new_difficulty {MIN 1; MAX 3;} //skill fuer neue difficulty

ACTION new_game_menu{
/*
	SET		aft_diff_act,set_diff_menue; //mit level muenue weiter
	IF_EQUAL difficulty,-1;   //nur default
		SET		difficulty,1; //dann beginnt level aber immer mit 1 wg. virus_init!
	SET	    	no_exit,0;
	CALL		diff_menu;
*/
	LOAD    STARTNAME,0;		// Level-Start wieder laden
    WAIT    4;
    BRANCH	skaph_start;
}

ACTION Check_difficulty
{
	SET		used_time_menu,TICKS;
	//time kann hier zugeordnet werden da Check_... bei start aufgerufen
	IF_ABOVE	difficulty,-1;
		END;  //difficulty schon veraendert

//    SET     difficulty, 2;  // default wert mr2609

    //mr1710
    CALL EnterMenu;

    SET     aft_diff_act,set_diff_only; //ohne level muenue weiter
	SET	   	no_exit,1;
	BRANCH  diff_menu;  // mr1710

    IF_ABOVE level_no, 0;
        END;

//	SET		aft_diff_act,set_diff_only; //ohne level muenue weiter
//jc 15.08.
	BRANCH	main_menu;
}

//aktionen nach diff menu
ACTION set_diff_menue { //level menue folgt
	IF_BELOW	menu_pos,1;
		SET   menu_pos,1;
	SET		new_difficulty,menu_pos;//menu_pos von 1..3
//jc 15.08.
	CALL	clear_menu;

//IFNDEF START_LEVEL; //mr1810
//    IF_EQUAL difficulty,new_difficulty;
//        BRANCH skaph_reload;
//ENDIF; // START_LEVEL; //mr 3009

	SET		difficulty,new_difficulty;

    CALL    ResetPlayer;

/*
// nur bei neuem level auch	difficulty veraendern
// provisorisch!!
IFDEF START_LEVEL;  // mr2210
#    SET     RENDER_MODE, 0;
#    SET     frame_color, 1;
#    WAIT 2;
#	CALL    ShowIntroText;
#	WAIT	2;
IFELSE;
	SET		screen_msg.STRING,wait_txt;
	SET		MESSAGES.16,screen_msg;
	WAIT	2;
ENDIF;

    SET    NextLevel, 1;

    // mr0210
    IF_EQUAL EinzelLevelMode, 1;
        SET    NextLevel, level_no;

    SET LevelWechelMitBlinken, 0;
    BRANCH SwitchToLevel;
*/
}

ACTION set_diff_only { //nur difficulty menue
	IF_BELOW	menu_pos,1;
		SET   menu_pos,1;
	SET		difficulty,menu_pos;//menu_pos von 1..3
	SET		new_difficulty,menu_pos;
	CALL		clear_menu;
	CALL		skaph_gsave; //alle aenderungen sichern

    BRANCH  exit_menu;
}

ACTION diff_menu {
	CALL		clear_menu;
    WAIT 1;

	SET		menu_pos.MAX,4;
//jc 15.08.
	SET      new_difficulty,difficulty; // AUF 1..3 Einschraenken
	IF_BELOW	difficulty,0;
		SET   new_difficulty,2;
	SET   	menu_pos,new_difficulty; //startposition

	SET		menu1_str,difficult1_str;
	SET		menu2_str,difficult2_str;
	SET		menu3_str,difficult3_str;
	SET		menu1_act,aft_diff_act;
	SET		menu2_act,aft_diff_act;
	SET		menu3_act,aft_diff_act;

    SET     exit_str, exit2_str;

	BRANCH	show_anymenu;
}

ACTION EnterMenu
{
    CALL    clear_message;
    SET     IF_F1,NULL;  // mr1310

	SET	    MOVE_MODE,0;

    SET		IF_CTRL,	NULL;
IFNDEF DEBUG;
	SET		IF_LEFT,	NULL;
ENDIF;

    //mr2610
	SET		EACH_TICK.15,NULL;

    IF_EQUAL InMenu, 0;    // mr1510
        CALL    SaveLevelSetting;
    SET InMenu, 1;

    IF_EQUAL menu_with_panel, 0;
	    FADE_PAL	black_2_pal,0.4;
}

//////////////////////////////////////////////////
// SAVE/LOAD
//////////////////////////////////////////////////

TEXT SaveNames_txt
{
	POS_X		menu_xpos;
	POS_Y		menu_ypos_l1;
	FONT	menu_font;
    STRINGS 8;
	STRING	name1_str, name2_str, name3_str, name4_str,
            name5_str, name6_str, name7_str, name8_str;
}

ACTION save_menu {
    CALL EnterMenu;

    CALL		clear_menu;
    WAIT 2;

	SET	menu1_str,name1_str;
	SET	menu2_str,name2_str;
	SET	menu3_str,name3_str;
	SET	menu4_str,name4_str;
	SET	menu5_str,name5_str;
	SET	menu6_str,name6_str;
	SET	menu7_str,name7_str;
	SET	menu8_str,name8_str;
	SET	menu1_act,save_name1;
	SET	menu2_act,save_name2;
	SET	menu3_act,save_name3;
	SET	menu4_act,save_name4;
	SET	menu5_act,save_name5;
	SET	menu6_act,save_name6;
	SET	menu7_act,save_name7;
	SET	menu8_act,save_name8;
	SET	menu_pos.MAX,9;

    SET     exit_str, exit2_str;

    BRANCH	show_menu;

//jc 14.08. provisorisch!!
//	CALL	skaph_qsave;

//    BRANCH		exit_menu;
}

ACTION load_menu {
    CALL EnterMenu;

    CALL clear_menu;
    WAIT 2;

	SET	menu1_str,name1_str;
	SET	menu2_str,name2_str;
	SET	menu3_str,name3_str;
	SET	menu4_str,name4_str;
	SET	menu5_str,name5_str;
	SET	menu6_str,name6_str;
	SET	menu7_str,name7_str;
	SET	menu8_str,name8_str;
	SET	menu1_act,load_name1;
	SET	menu2_act,load_name2;
	SET	menu3_act,load_name3;
	SET	menu4_act,load_name4;
	SET	menu5_act,load_name5;
	SET	menu6_act,load_name6;
	SET	menu7_act,load_name7;
	SET	menu8_act,load_name8;
	SET	menu_pos.MAX,9;

    SET     exit_str, exit2_str;

	BRANCH	show_menu;

//	CALL    skaph_qload;

//    IF_EQUAL level_no, 0;
//        END;

//    BRANCH  exit_menu;
}

ACTION save_allg {
	SET		menu_pos.MIN,0;
	SET		menu_pos,0;	//stop blinking
    SET     SaveNames_txt.INDEX, slot;

    INKEY	SaveNames_txt.STRING;
    IF_EQUAL RESULT, -1;
        GOTO abbruch;

    IF_NEQUAL level_no, 0;
        CALL exit_menu;

    IF_EQUAL level_no, 0;
        CALL clear_menu;

	SET		screen_msg.STRING,wait_txt;
	SET		MESSAGES.16,screen_msg;
    WAIT    2;

    CALL    skaph_gsave;   //mr2610
	BRANCH  skaph_save;

abbruch:
    IF_NEQUAL level_no, 0;
        BRANCH exit_menu;

    IF_EQUAL level_no, 0;
        BRANCH main_menu;
}

ACTION load_allg {
    IF_NEQUAL level_no, 0;
        CALL    exit_menu;

    IF_EQUAL level_no, 0;
        CALL clear_menu;

	SET		screen_msg.STRING,wait_txt;
	SET		MESSAGES.16,screen_msg;
    WAIT    2;

IFNDEF START_LEVEL; //mr2710
	BRANCH skaph_load;
IFELSE;
//    SET LevelSwitchMode, 3;

    CALL    skaph_gsave;
    WAIT    2;
    CALL    SetVideoMode;

    BRANCH  skaph_load;  //mr0411

//    RULE    LevelLoadSlot = slot + 100*last_player;
//    LEVEL   "hichcok.wdl", "hichcok.wrs";

//    LEVEL   "start2.wdl", "start2.wrs";
//    CALL LevelNotFoundMessage;
ENDIF;
}

ACTION save_name1 {	SET	slot,1; BRANCH  save_allg; }
ACTION save_name2 {	SET	slot,2; BRANCH  save_allg; }
ACTION save_name3 {	SET	slot,3; BRANCH  save_allg; }
ACTION save_name4 {	SET	slot,4; BRANCH  save_allg; }
ACTION save_name5 {	SET	slot,5; BRANCH  save_allg; }
ACTION save_name6 {	SET	slot,6; BRANCH  save_allg; }
ACTION save_name7 {	SET	slot,7; BRANCH  save_allg; }
ACTION save_name8 {	SET	slot,8; BRANCH  save_allg; }

ACTION load_name1 {	SET	slot,1; BRANCH  load_allg; }
ACTION load_name2 {	SET	slot,2; BRANCH  load_allg; }
ACTION load_name3 {	SET	slot,3; BRANCH  load_allg; }
ACTION load_name4 {	SET	slot,4; BRANCH  load_allg; }
ACTION load_name5 {	SET	slot,5; BRANCH  load_allg; }
ACTION load_name6 {	SET	slot,6; BRANCH  load_allg; }
ACTION load_name7 {	SET	slot,7; BRANCH  load_allg; }
ACTION load_name8 {	SET	slot,8; BRANCH  load_allg; }


//////////////////////////////////////////////////
// LEVEL
//////////////////////////////////////////////////

//////////////////////////////////////////////////////////////
//SCREENSHOT
SKILL 	screenshotnum {VAL 0;} //zaehler fuer screenshot

PANEL		Scshotskill{
	FLAGS		REFRESH;
	POS_X		0;
	POS_Y		0;
	DIGITS	144,32,3,menu_font,1,screenshotnum;
}

ACTION screen_shot {
	SET		screen_msg.STRING,scshot_str;
	CALL		show_message2;

	SCREENSHOT "VEX",screenshotnum;
	ADD		screenshotnum,1;
	IF_BELOW	RESULT,0;		// Fehler beim Speichern?
		SET	screen_msg.STRING,save_nix;	// schiefgegangen!
	CALL		show_message2;
	SET		PANELS.10,Scshotskill;
	WAITT		48;
	SET		PANELS.10,NULL;
}
/////////////////////////////////////////////////////////

// OPTIONS VOL MUSIC, SOUND und MBLUR

SKILL  vol_use_bar{MIN 1; VAL 1; MAX 10;}  //welche bar -Pos
SKILL  mus_use_bar{MIN 1; VAL 1; MAX 10;}
//SKILL  mblur_use_bar{MIN 1; VAL 1; MAX 10;}

//zwischenspeicher der aktionen
SYNONYM ptrleft_act 	{ TYPE ACTION; DEFAULT tunix; }
SYNONYM ptrright_act { TYPE ACTION; DEFAULT tunix; }

//jc 30.09. ohne MOTION_BLUR
ACTION check_more{
	PLAY_SOUND	klick,0.5;
//	IF_EQUAL menu_pos,1;
//		ADD 	MOTION_BLUR,1;
	IF_EQUAL menu_pos,1;
		ADD 	old_sound,0.1;   //mr 0910
	IF_EQUAL menu_pos,2;
		ADD 	old_music,0.1;   //mr 0910
	IF_EQUAL menu_pos,3;
		ADD 	old_mouse_sense,0.1;   //mr 1110
	IF_EQUAL menu_pos,4;
		ADD 	old_joy_sense,0.1;   //mr 1110
	IF_EQUAL menu_pos,5;
        ADD     NextVideoMode,1;       //mr
	SET		smus,0;	// alles an //jc 19.09
	CALL		set_smus;
    CALL        set_sense;
	CALL 		drawptrs;
}

//jc 30.09. ohne MOTION_BLUR
ACTION check_less{
	PLAY_SOUND	klick,0.5;
//	IF_EQUAL menu_pos,1;
//		ADD 	MOTION_BLUR,-1;
	IF_EQUAL menu_pos,1;
		ADD 	old_sound,-0.1;  //mr 0910
	IF_EQUAL menu_pos,2;
		ADD 	old_music,-0.1;  //mr 0910
	IF_EQUAL menu_pos,3;
		ADD 	old_mouse_sense,-0.1;   //mr 1110
	IF_EQUAL menu_pos,4;
		ADD 	old_joy_sense,-0.1;   //mr 1110
	IF_EQUAL menu_pos,5;
        ADD     NextVideoMode,-1;       //mr
	SET		smus,0;	// alles an  //jc 19.09
	CALL		set_smus;
    CALL        set_sense;
	CALL 		drawptrs;
}

SYNONYM 		newpos_str { TYPE STRING; DEFAULT empty; }
SKILL 		posnow{ MIN 1; VAL 1; MAX 10;}

TEXT  bar_out_txt_speicher{   //speichert nur die barpos
//uber Index wird entsprechender string geholt
	POS_X 	0;
	POS_Y 	0;
	STRINGS 	10;
	FONT		menu_font;
	STRING 	Bar_pos_1,Bar_pos_2,Bar_pos_3,
				Bar_pos_4,Bar_pos_5,Bar_pos_6,
				Bar_pos_7,Bar_pos_8,Bar_pos_9,Bar_pos_10;
}

//jc 30.09. ohne MOTION_BLUR
ACTION drawptrs{
//	IF_EQUAL menu_pos,1;
//		RULE  posnow=MOTION_BLUR*10;
	IF_EQUAL menu_pos,1;
		RULE posnow = (SOUND_VOL*10+0.5) + 1;  //mr 0910
	IF_EQUAL menu_pos,2;
		RULE posnow = (AUDIO_VOL*10+0.5) + 1;  //mr 0910
	IF_EQUAL menu_pos,3;
		RULE posnow = ((MOUSE_SENSE-0.5)*10+0.5) + 1;  //mr 0910
	IF_EQUAL menu_pos,4;
		RULE posnow = ((JOY_SENSE-0.5)*10+0.5) + 1;  //mr 0910
IFNDEF NO_RESOLUTION_SWITCH;
    IF_EQUAL menu_pos,5;   //mr
        GOTO mp5;
ENDIF;
	IF_ABOVE menu_pos,5;
      END; //mr0810

	SET		bar_out_txt_speicher.INDEX,posnow;	//woher
	SET		bar_out_txt.INDEX,menu_pos; //wohin
	SET   	bar_out_txt.STRING,bar_out_txt_speicher.STRING;     //welcher string
    END;

//mr
mp5:
    IF_BELOW NextVideoMode, 1;
        SET NextVideoMode, 1;
//jc 29.09.
IFNDEF DEMO_MENU;
    IF_ABOVE NextVideoMode, 3;
        SET NextVideoMode, 3;
IFELSE;
    IF_ABOVE NextVideoMode, 2;
        SET NextVideoMode, 2;
ENDIF;

    SET     All_Aufloes_txt.INDEX, NextVideoMode;
	SET		bar_out_txt.INDEX,menu_pos; //wohin
	SET   	bar_out_txt.STRING,All_Aufloes_txt.STRING;     //welcher string
}

ACTION restore_ptr{ //actionen pfeiltasten links rechts zurueck
	SET		messages.10,NULL;
	SET   	IF_CUL,ptrleft_act;
	SET   	IF_CUR,ptrright_act;
}

IFNDEF NO_RESOLUTION_SWITCH;
ACTION changeVideoMode
{
	CALL	clear_menu;
    WAIT 2;

    SET		screen_msg.STRING,wait_txt;
	SET		MESSAGES.16,screen_msg;
	WAITT	2;

    CALL    LevelChangeVideoMode;

	SET		screen_msg.STRING, error_change_gr_str;
	CALL	show_message2;

	WAITT		48;							// 3 Sekunden warten

    BRANCH main_menu;
}
ENDIF;

ACTION exit_options_menu
{
    CALL skaph_gsave;

	SET  menu_pos, menu_pos.MAX;
	CALL menu_exec;
}

ACTION vol_blur_menu {
	CALL	clear_menu;
    WAIT    2;
//jc 30.09.
	SET   	ptrleft_act,IF_CUL;  //pfeiltasten links rechts sichern und neu def
	SET   	ptrright_act,IF_CUR;
	SET   	IF_CUR,check_more;
	SET   	IF_CUL,check_less;

    //mr 16.9
IFNDEF START_LEVEL; //mr0410
    CALL    InitActiveFlags;
    SET     NextVideoMode, ActiveVideoMode;
ENDIF;

	SET 		menu_pos,1;				//alle bars ausgeben
	CALL 		drawptrs;
	SET 		menu_pos,2;
	CALL 		drawptrs;
	SET 		menu_pos,3;
	CALL 		drawptrs;
	SET 		menu_pos,4;
    CALL 		drawptrs;
IFNDEF NO_RESOLUTION_SWITCH;
	SET 		menu_pos,5;
    CALL 		drawptrs;
    SET     menu5_str,Aufloes_set_str;
IFDEF START_LEVEL; //mr0410
	SET		menu5_act,exit_options_menu;
IFELSE;
	SET		menu5_act,changeVideoMode;  //mr
ENDIF;
ENDIF;
	SET 		menu_pos,1;

	SET		messages.10,bar_out_txt;

//jc 30.09.
//	SET		menu1_str,mblur_set_str;
	SET		menu1_str,sndvol_set_str;
	SET		menu2_str,musvol_set_str;
    SET     menu3_str,mouse_set_str;
    SET     menu4_str,joy_set_str;

	SET		menu1_act,exit_options_menu;
	SET		menu2_act,exit_options_menu;
	SET		menu3_act,exit_options_menu;
	SET		menu4_act,exit_options_menu;

    SET     exit_str, exit2_str;

IFDEF NO_RESOLUTION_SWITCH;
	SET		menu_pos.MAX,5;
IFELSE;
	SET		menu_pos.MAX,6;
ENDIF;
	BRANCH	show_menu;
}
/////////////////////////////////////////////////////

/*
ACTION passwd_menu{
	CALL	clear_menu;
    WAIT    2;

    SET_STRING LevPasswd, empty;
	SET	menu1_str,enter_passwd_str;
	SET	menu1_txt.STRING,enter_passwd_str;
	SET	messages.1,menu1_txt;
	SET	messages.2,EditPassword_txt;

	INKEY   LevPasswd;

	SET	    messages.2,NULL;
	SET		screen_msg.STRING,wait_txt;
	SET		messages.16,screen_msg;
	WAIT	2;

    CALL PasswordCheck;

    SET LevelWechelMitBlinken, 0;

    IF_EQUAL RESULT, 0;
        BRANCH SwitchToLevel;

	SET messages.16, NULL;

    SET_STRING MessageString, wrong_pw_str;
    ADD_STRING MessageString, LevPasswd;

	SET		screen_msg.STRING,MessageString;
	CALL	show_message2;
ende:
	SET	messages.1,NULL;
	SET	messages.2,NULL;

	WAITT		48;							// 3 Sekunden warten

    BRANCH main_menu;
}
*/
////////////////////////////////////////////////////
//EXIT_screen

TEXT  random_txt_speicher{   //speichert nur die random strings
//uber Index wird entsprechender string geholt
	POS_X 	0;
	POS_Y 	0;
	STRINGS 	10;
	FONT		menu_font;
	STRING 	exit_1,exit_2,exit_3,exit_4,exit_5,
				exit_6,exit_7,exit_8,exit_9,exit_0;
}

SKILL zwerg_menue{MIN 1; MAX 10; VAL 5;}

ACTION exit_yesno {
	CALL	clear_menu;
	SET		screen_msg.STRING,exit_1;
	IF_ABOVE	RANDOM,0.5;
		GOTO 	norandsel;
	RULE		zwerg_menue=RANDOM*20+1;//werte 1..10 erzeugen
	SET   	random_txt_speicher.index,zwerg_menue;
	//nur mit set wird string sofort ermittelt //keine rule
	SET		screen_msg.STRING,random_txt_speicher.STRING;
norandsel:
	SET		IF_J, exit_game; //skaph_exit;
	SET		IF_Y, exit_game;
	SET		IF_Z, exit_game;

    IF_ABOVE level_no, 0;
	    BRANCH	wait_yesno2;   //	BRANCH	wait_yesno;

	SET		MESSAGES.14,screen_msg;	// Frage anzeigen
	SET		IF_N, main_menu;		// Tasten belegen
	SET		IF_ESC, main_menu;
}

/*
ACTION skaph_exit {
#	CALL		skaph_gsave;			// letzten Skill-Stand sichern
	SET		EACH_TICK.12,NULL;
	SET		EACH_TICK.13,NULL;
	SET		EACH_TICK.14,NULL;
	SET		EACH_TICK.15,NULL;
	SET		EACH_TICK.16,skaph_fadeout;
}
*/

ACTION exit_game {
	BRANCH	skaph_fadeout;
}
//////////////////////////////////////////////////////
//menue zu levelende

// SKILL LoopCount { VAL 0; }

/*
ACTION SwitchToLevel
{
	SET IF_ANYKEY,NULL;
	SET	MESSAGES.1,	NULL;

IFDEF MOUSE_DEBUG_INFO;
    IF_EQUAL KEY_M, 1;
    END;
    SET IF_M, cheat_m;
ENDIF;

IFNDEF START_LEVEL; //mr 0910
    CALL	clear_menu;

	SET		LAYERS.16,NULL;

    SET     RENDER_MODE, 0;
    SET     frame_color, 1;
//    CALL    ClearScreen;
    WAIT 2;


	RULE	panel_level_leer.POS_X = (SCREEN_WIDTH-320)*0.5;
	RULE	panel_level_leer.POS_Y = (DEF_SCREEN_HGT-400)*0.5;

	RULE	panel_blink1.POS_X = panel_level_leer.POS_X + 44;
	RULE	panel_blink1.POS_Y = panel_level_leer.POS_Y + 80;

	SET 	panel_blink2.POS_X, panel_blink1.POS_X;
	SET 	panel_blink2.POS_Y, panel_blink1.POS_Y;

    RULE    screen_msg.POS_Y = panel_level_leer.POS_Y + 40;
    RULE    screen_msg.POS_X = panel_level_leer.POS_X + 40;

    RULE    levelendWait_txt.POS_Y = panel_level_leer.POS_Y + END_MESSAGE_X;
    RULE    levelendWait_txt.POS_X = panel_level_leer.POS_X + END_MESSAGE_Y;

    SET		PANELS.1,panel_level_leer;
    CALL    start_ekg;

    IF_EQUAL LevelWechelMitBlinken, 0;
    GOTO nicht_blink1;

// mr2010
    SET		PANELS.2,panel_blink1;
    WAITT   10;
    SET		PANELS.2,panel_blink2;
    WAITT   10;
    SET		PANELS.2,panel_blink1;
    WAITT   10;
    SET		PANELS.2,panel_blink2;
    WAITT   10;
    SET		PANELS.2,panel_blink1;
    WAITT   10;
    SET		PANELS.2,panel_blink2;

nicht_blink1:
	SET		MESSAGES.9,levelendWait_txt;

    CALL    PleaseWaitAnim;

ENDIF;

	SET		IF_ANYKEY,NULL;
//	FADE_PAL	black_2_pal,0;
	SET		MOVE_MODE,0;				// Player noch nicht freigeben

    STOP_SOUND;
    PLAY_SONG dummysong, 0;

    WAIT 2; //mr2409 Bildaufbau beim Startlevel richtig ?!

    //mr  - fuer tests, da noch nicht alle Levels da sind !
IFDEF START_LEVEL; //mr 3009
DEFINE exit_last_level, exit_game;
//IFNDEF UEBERSPRINGEN_LEVEL;
//DEFINE UEBERSPRINGEN_LEVEL; // mr0310b
//ENDIF;
ENDIF;

IFDEF UEBERSPRINGEN_LEVEL; // mr0310b

    ADD NextLevel, -1;
//    SET LoopCount, 0;

loop:
    ADD NextLevel,1;

    IF_ABOVE NextLevel, 14;
    	BRANCH exit_last_level;

//    IF_BELOW LoopCount, 15;
//    GOTO not_exit;

//    IF_EQUAL NextLevel, level_no;
//    	BRANCH exit_last_level;

//not_exit:
//    ADD LoopCount, 1;

IFNDEF START_LEVEL; //mr 0910
    CALL LoadingLevelMessage;
    WAIT 2;
ENDIF;

    SET     ActiveLevel, NextLevel;

	CALL    skaph_gsave; //globasl sichern

    WAIT 2;  //mr0411

    CALL    ChangeLevel;

    WAIT 2;

    GOTO loop;

IFELSE;  // UEBERSPRINGEN_LEVEL;  mr0310b
    IF_ABOVE NextLevel, 14;
      	BRANCH exit_last_level;

IFNDEF START_LEVEL; //mr 0910
    CALL LoadingLevelMessage;
    WAIT 2;
ENDIF;

    SET     ActiveLevel, NextLevel;

	CALL    skaph_gsave; //globasl sichern

    WAIT 2;  //mr0411

    CALL    ChangeLevel;

    WAIT    16;

    SET     ActiveLevel, level_no;
    SET     NextLevel,   level_no;
	CALL    skaph_gsave; //globasl sichern

  	BRANCH exit_last_level;
ENDIF;
}
*/

ACTION showLevelEnd
{
    CALL    clear_message;
    SET	    IF_F1,NULL;  // mr1310
    SET     IF_ESC, NULL;

    CALL    SaveLevelSetting;
    CALL    clear_layers;

    SET     RENDER_MODE, 0;
    SET     frame_color, 1;
//    CALL    ClearScreen;
    WAIT 2;
	EXIT	hurra_txt;
}
/*
	RULE	panel_level_leer.POS_X = (SCREEN_WIDTH-320)*0.5;
	RULE	panel_level_leer.POS_Y = (DEF_SCREEN_HGT-400)*0.5;

    RULE    screen_msg.POS_Y = panel_level_leer.POS_Y + 40;
    RULE    screen_msg.POS_X = panel_level_leer.POS_X + 40;
    SET		PANELS.1,panel_level_leer; //mr digits loeschen

    CALL    start_ekg;

IFDEF MOUSE_DEBUG_INFO;
    SET IF_M, mouse_toggle;  // cheat_m
    SET IF_ESC, exit_game;
ENDIF;

    SET     abschussquote_1, 0;
    SET     bugs_weg_1, 0;
    SET     Newscore_1, 0;

    RULE    panel_levelend_digits.POS_Y = panel_level_leer.POS_Y + END_MESSAGE_X;
    RULE    panel_levelend_digits.POS_X = panel_level_leer.POS_X + END_MESSAGE_Y;

	SET		PANELS.10,panel_levelend_digits;
//    FADE_PAL	black_2_pal,0.6;

	SET		MOVE_MODE, 0;				// Player einfrieren
//mr	passwort fuer naechsten level holen
    CALL GetNextLevPassword;

    SET_STRING MessageString, Passwort_txt;
    ADD_STRING MessageString, LevPasswd;

	SET		levelend_txt.INDEX,2;	//passwort an 2. string
    SET		levelend_txt.STRING,MessageString; //passwort holen

    CALL    CalculatePoints;

    SET abschussquote_1, 0;
    SET bugs_weg_1, 0;
    SET Newscore_1, 0;

    RULE    levelend_txt.POS_Y = panel_level_leer.POS_Y + END_MESSAGE_X;
    RULE    levelend_txt.POS_X = panel_level_leer.POS_X + END_MESSAGE_Y;

    SET	MESSAGES.9,levelend_txt;

    IF_EQUAL Newscore, 0;
    GOTO no_score;

    RULE score_count = Newscore / 10;   // noch festzulegende hausnummer !!!
    RULE absch_d = abschussquote / score_count;
    RULE bug_d   = bugs_weg / score_count;
    RULE score_d = Newscore / score_count;

    // mr0910  clear key
    WAIT 2;
    SET KEY_ANY, 0;

CountLoop:
    IF_EQUAL KEY_ANY, 0;
        WAITT  4;

    PLAY_SOUND	klick,0.5;

    ADD abschussquote_1, absch_d;
    ADD bugs_weg_1, bug_d;
    ADD Newscore_1, score_d;
    ADD score_count, -1;
    IF_ABOVE score_count, 0;
        GOTO CountLoop;

no_score:
    SET abschussquote_1, abschussquote;
    SET bugs_weg_1, bugs_weg;
    SET Newscore_1, Newscore;

    SET KEY_ANY, 0;

    SET	IF_ANYKEY,WaitEndText;
}
*/

/*
ACTION WaitEndText
{
    SET	 IF_ANYKEY,NULL;

	SET		MESSAGES.9,NULL;
	SET		PANELS.10,NULL;
    SET		PANELS.1,NULL;
    CALL    stop_ekg;

    RULE NextLevel = level_no + 1;

    SET LevelWechelMitBlinken, 1;

    SET aft_hist_act, NULL;	//SwitchToLevel;

	CALL	clear_layers;

    SET     RENDER_MODE, 0;
    SET     frame_color, 1;
//    CALL    ClearScreen;
    WAIT    2;

    BRANCH CheckHiscore;
}
*/
ACTION CalculatePoints
{
	RULE    used_time_sec=(TICKS-used_time_menu)/16;
    AND     used_time_sec, 65535;

    RULE    used_time_min     = used_time_sec / 60;
    RULE    used_time_stunden = used_time_min / 60;
    AND     used_time_stunden, 65535;

    AND     used_time_min, 65535;
    RULE    used_time_sec = used_time_sec - used_time_min * 60;

    RULE    used_time_min = used_time_min - used_time_stunden * 60;

	SET val1, 1;
	IF_EQUAL difficulty,2;
		SET val1, 1.5;
	IF_EQUAL difficulty,3;
		SET val1, 2;

    RULE Newscore = points * val1 * level_mintime /
                            (level_mintime + used_time_menu);
}


//
//  HiScore    Newscore
//
IFDEF START_LEVEL;  // mr0810

PANEL   panel_HiScore_digits
{
	FLAGS		REFRESH;
	DIGITS	    0, 0,8,menu_font,1,HiscoreVal1;
	DIGITS	    0, 10,8,menu_font,1,HiscoreVal2;
	DIGITS	    0, 20,8,menu_font,1,HiscoreVal3;
	DIGITS	    0, 30,8,menu_font,1,HiscoreVal4;
	DIGITS	    0, 40,8,menu_font,1,HiscoreVal5;
	DIGITS	    0, 50,8,menu_font,1,HiscoreVal6;
	DIGITS	    0, 60,8,menu_font,1,HiscoreVal7;
	DIGITS	    0, 70,8,menu_font,1,HiscoreVal8;
	DIGITS	    0, 80,8,menu_font,1,HiscoreVal9;
	DIGITS	    0, 90,8,menu_font,1,HiscoreVal10;

IFDEF MOUSE_DEBUG_INFO;
	DIGITS	120,100,3,menu_font,1,MOUSE_X;
	DIGITS	180,100,6,menu_font,1,MOUSE_Y;
ENDIF;
}

IFELSE; // START_LEVEL;  // mr0810

IFDEF NEW_FONT;

IFDEF HIRES;

PANEL   panel_HiScore_digits
{
	FLAGS		REFRESH;
	DIGITS	    0, 0,8,menu_font,1,HiscoreVal1;
	DIGITS	    0, 22,8,menu_font,1,HiscoreVal2;
	DIGITS	    0, 44,8,menu_font,1,HiscoreVal3;
	DIGITS	    0, 66,8,menu_font,1,HiscoreVal4;
	DIGITS	    0, 88,8,menu_font,1,HiscoreVal5;
	DIGITS	    0, 110,8,menu_font,1,HiscoreVal6;
	DIGITS	    0, 132,8,menu_font,1,HiscoreVal7;
	DIGITS	    0, 154,8,menu_font,1,HiscoreVal8;
	DIGITS	    0, 176,8,menu_font,1,HiscoreVal9;
	DIGITS	    0, 198,8,menu_font,1,HiscoreVal10;

IFDEF MOUSE_DEBUG_INFO;
	DIGITS	120,100,3,menu_font,1,MOUSE_X;
	DIGITS	180,100,6,menu_font,1,MOUSE_Y;
ENDIF;
}

IFELSE; // HIRES; NEW_FONT
IFDEF SVGA;

PANEL   panel_HiScore_digits
{
	FLAGS		REFRESH;
	DIGITS	    0, 0,8,menu_font,1,HiscoreVal1;
	DIGITS	    0, 22,8,menu_font,1,HiscoreVal2;
	DIGITS	    0, 44,8,menu_font,1,HiscoreVal3;
	DIGITS	    0, 66,8,menu_font,1,HiscoreVal4;
	DIGITS	    0, 88,8,menu_font,1,HiscoreVal5;
	DIGITS	    0, 110,8,menu_font,1,HiscoreVal6;
	DIGITS	    0, 132,8,menu_font,1,HiscoreVal7;
	DIGITS	    0, 154,8,menu_font,1,HiscoreVal8;
	DIGITS	    0, 176,8,menu_font,1,HiscoreVal9;
	DIGITS	    0, 198,8,menu_font,1,HiscoreVal10;

IFDEF MOUSE_DEBUG_INFO;
	DIGITS	120,100,3,menu_font,1,MOUSE_X;
	DIGITS	180,100,6,menu_font,1,MOUSE_Y;
ENDIF;
}

IFELSE; // SVGA; NEW_FONT

PANEL   panel_HiScore_digits
{
	FLAGS		REFRESH;
	DIGITS	    0, 0,8,menu_font,1,HiscoreVal1;
	DIGITS	    0, 18,8,menu_font,1,HiscoreVal2;
	DIGITS	    0, 36,8,menu_font,1,HiscoreVal3;
	DIGITS	    0, 54,8,menu_font,1,HiscoreVal4;
	DIGITS	    0, 72,8,menu_font,1,HiscoreVal5;
	DIGITS	    0, 90,8,menu_font,1,HiscoreVal6;
	DIGITS	    0, 108,8,menu_font,1,HiscoreVal7;
	DIGITS	    0, 126,8,menu_font,1,HiscoreVal8;
	DIGITS	    0, 144,8,menu_font,1,HiscoreVal9;
	DIGITS	    0, 162,8,menu_font,1,HiscoreVal10;

IFDEF MOUSE_DEBUG_INFO;
	DIGITS	120,100,3,menu_font,1,MOUSE_X;
	DIGITS	180,100,6,menu_font,1,MOUSE_Y;
ENDIF;
}

ENDIF; // 320x400; NEW_FONT
ENDIF; // HIRES; NEW_FONT

IFELSE;

PANEL   panel_HiScore_digits
{
	FLAGS		REFRESH;
	DIGITS	    0, 0,8,menu_font,1,HiscoreVal1;
	DIGITS	    0, 16,8,menu_font,1,HiscoreVal2;
	DIGITS	    0, 32,8,menu_font,1,HiscoreVal3;
	DIGITS	    0, 48,8,menu_font,1,HiscoreVal4;
	DIGITS	    0, 64,8,menu_font,1,HiscoreVal5;
	DIGITS	    0, 80,8,menu_font,1,HiscoreVal6;
	DIGITS	    0, 96,8,menu_font,1,HiscoreVal7;
	DIGITS	    0, 112,8,menu_font,1,HiscoreVal8;
	DIGITS	    0, 128,8,menu_font,1,HiscoreVal9;
	DIGITS	    0, 144,8,menu_font,1,HiscoreVal10;

IFDEF MOUSE_DEBUG_INFO;
	DIGITS	120,100,3,menu_font,1,MOUSE_X;
	DIGITS	180,100,6,menu_font,1,MOUSE_Y;
ENDIF;
}

ENDIF;
ENDIF;

/*STRING Hiscore_Title1 "Hiscore";
STRING Hiscore_Title2 "Pos       Name         Score   Level";*/
//                     123 1234567890123456 12345678 12345678

DEFINE HS_Pos_XSize,   4;
DEFINE HS_Name_XSize,  17;
DEFINE HS_Val_XSize,   9;
DEFINE HS_Level_XSize, 9;
DEFINE HS_Gesamt_XSize, 39;


STRING HSLevel1_txt,  "12345678";
STRING HSLevel2_txt,  "12345678";
STRING HSLevel3_txt,  "12345678";
STRING HSLevel4_txt,  "12345678";
STRING HSLevel5_txt,  "12345678";
STRING HSLevel6_txt,  "12345678";
STRING HSLevel7_txt,  "12345678";
STRING HSLevel8_txt,  "12345678";
STRING HSLevel9_txt,  "12345678";
STRING HSLevel10_txt, "12345678";

#STRING any_key_str, "Any Key...";

TEXT	HS_AnyKey_txt
{
	FONT	menu_font;
    STRING any_key_str;
}

TEXT HiscoreTitle1_txt
{
	FONT	menu_font;
    STRING Hiscore_Title1;
}

TEXT HiscoreTitle2_txt
{
	FONT	menu_font;
    STRING Hiscore_Title2;
}

TEXT HiscorePos_txt
{
	FONT	menu_font;
    STRING " 1\n 2\n 3\n 4\n 5\n 6\n 7\n 8\n 9\n10";
}

TEXT HiscoreLevs_txt
{
	FONT	menu_font;
    STRINGS 10;
	STRING	HSLevel1_txt, HSLevel2_txt, HSLevel3_txt, HSLevel4_txt, HSLevel5_txt,
            HSLevel6_txt, HSLevel7_txt, HSLevel8_txt, HSLevel9_txt, HSLevel10_txt;
}

TEXT HiscoreNames_txt
{
	FONT	menu_font;
    STRINGS 10;
	STRING	HiscorePos1, HiscorePos2, HiscorePos3, HiscorePos4, HiscorePos5,
            HiscorePos6, HiscorePos7, HiscorePos8, HiscorePos9, HiscorePos10;
}

SKILL HIIndex { VAL 0; }
SKILL HIIndexSave { VAL 0; }
/*
ACTION CheckHiscore
{
    CALL    InitHiscoreStrings;

    IF_BELOW Newscore, HiscoreVal10;
    BRANCH aft_hist_act;
    IF_EQUAL Newscore, HiscoreVal10;
    BRANCH aft_hist_act;

    SET HIIndex, 10;

    IF_ABOVE Newscore, HiscoreVal9;
    SET HIIndex, 9;
    IF_ABOVE Newscore, HiscoreVal8;
    SET HIIndex, 8;
    IF_ABOVE Newscore, HiscoreVal7;
    SET HIIndex, 7;
    IF_ABOVE Newscore, HiscoreVal6;
    SET HIIndex, 6;
    IF_ABOVE Newscore, HiscoreVal5;
    SET HIIndex, 5;
    IF_ABOVE Newscore, HiscoreVal4;
    SET HIIndex, 4;
    IF_ABOVE Newscore, HiscoreVal3;
    SET HIIndex, 3;
    IF_ABOVE Newscore, HiscoreVal2;
    SET HIIndex, 2;
    IF_ABOVE Newscore, HiscoreVal1;
    SET HIIndex, 1;

    CALL VerschiebeHiscore;
    CALL SetHiscore;
    CALL SetHiscoreLevel;

    CALL ShowHiscore;

    SET HiscoreNames_txt.INDEX, HIIndex;
    SET_STRING HiscoreNames_txt.STRING,empty;

//    SET     RENDER_MODE, 1;  // test
    INKEY HiscoreNames_txt.STRING;

    CALL skaph_gsave; //globasl sichern

    CALL ShowHiscore;

//    CALL   HS_AnyKey;

    WAITT 16;

//    SET IF_ANYKEY, aft_hist_act;
    BRANCH   aft_hist_act;
}
*/
ACTION HS_AnyKey
{
    SET MESSAGES.6,HS_AnyKey_txt;
}
/*
ACTION ShowHiscore
{
    CALL    InitHiscoreStrings;

    CALL    clear_message;

//    CALL	clear_menu;
//    WAIT    2;

	SET		MOVE_MODE, 0;				// Player einfrieren

IFDEF MOUSE_DEBUG_INFO;
    SET IF_M, mouse_toggle;  // cheat_m
    SET IF_ESC, exit_game;
ENDIF;

    SET HiscoreLevs_txt.INDEX, 1;
    SET All_Levels_txt.INDEX, HiscoreLev1;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 2;
    SET All_Levels_txt.INDEX, HiscoreLev2;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 3;
    SET All_Levels_txt.INDEX, HiscoreLev3;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 4;
    SET All_Levels_txt.INDEX, HiscoreLev4;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 5;
    SET All_Levels_txt.INDEX, HiscoreLev5;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 6;
    SET All_Levels_txt.INDEX, HiscoreLev6;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 7;
    SET All_Levels_txt.INDEX, HiscoreLev7;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 8;
    SET All_Levels_txt.INDEX, HiscoreLev8;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 9;
    SET All_Levels_txt.INDEX, HiscoreLev9;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;

    SET HiscoreLevs_txt.INDEX, 10;
    SET All_Levels_txt.INDEX, HiscoreLev10;
    SET HiscoreLevs_txt.STRING, All_Levels_txt.STRING;


//	SET		levelend_txt.INDEX,2;	//passwort an 2. string
//    SET		levelend_txt.STRING,MessageString; //passwort holen

    RULE HiscoreTitle1_txt.POS_X =  (SCREEN_WIDTH -
        (7 * FONT_SIZE_X)) * 0.5;
    RULE HiscoreTitle1_txt.POS_Y = (DEF_SCREEN_HGT -
        (16 * FONT_SIZE_Y)) * 0.3;
    RULE HiscoreTitle2_txt.POS_X = (SCREEN_WIDTH -
        (HS_Gesamt_XSize * FONT_SIZE_X)) * 0.5;
    RULE HiscoreTitle2_txt.POS_Y = HiscoreTitle1_txt.POS_Y +
        2 * FONT_SIZE_Y;

    RULE HiscorePos_txt.POS_Y = HiscoreTitle2_txt.POS_Y +
        2 * FONT_SIZE_Y;

    SET HiscorePos_txt.POS_X, HiscoreTitle2_txt.POS_X;

    SET panel_HiScore_digits.POS_Y, HiscorePos_txt.POS_Y;
    SET HiscoreLevs_txt.POS_Y, HiscorePos_txt.POS_Y;
    SET HiscoreNames_txt.POS_Y, HiscorePos_txt.POS_Y;

    RULE HiscoreNames_txt.POS_X = HiscorePos_txt.POS_X +
        HS_Pos_XSize * FONT_SIZE_X;
    RULE panel_HiScore_digits.POS_X = HiscoreNames_txt.POS_X +
        HS_Name_XSize * FONT_SIZE_X;
    RULE HiscoreLevs_txt.POS_X = panel_HiScore_digits.POS_X +
        HS_Val_XSize * FONT_SIZE_X;

    RULE HS_AnyKey_txt.POS_X =  (SCREEN_WIDTH -
        (10 * FONT_SIZE_X)) * 0.5;
    RULE HS_AnyKey_txt.POS_Y = HiscorePos_txt.POS_Y +
        11 * FONT_SIZE_Y;

	SET		PANELS.10,panel_HiScore_digits;
	SET		MESSAGES.1,HiscorePos_txt;
	SET		MESSAGES.2,HiscoreLevs_txt;
	SET		MESSAGES.3,HiscoreNames_txt;
    SET		MESSAGES.4,HiscoreTitle1_txt;
    SET		MESSAGES.5,HiscoreTitle2_txt;
}
*/
SKILL FreeHiscorePos { VAL 0; }

ACTION VerschiebeHiscore
{
    IF_ABOVE HIIndex, 9;
    END;
    //save Pos10
    SET FreeHiscorePos, HiscoreStringPos10;

    SET HiscoreVal10, HiscoreVal9;
    SET HiscoreLev10, HiscoreLev9;
    SET HiscoreStringPos10, HiscoreStringPos9;

    IF_ABOVE HIIndex, 8;
    GOTO weiter;
    SET HiscoreVal9, HiscoreVal8;
    SET HiscoreLev9, HiscoreLev8;
    SET HiscoreStringPos9, HiscoreStringPos8;

    IF_ABOVE HIIndex, 7;
    GOTO weiter;
    SET HiscoreVal8, HiscoreVal7;
    SET HiscoreLev8, HiscoreLev7;
    SET HiscoreStringPos8, HiscoreStringPos7;

    IF_ABOVE HIIndex, 6;
    GOTO weiter;
    SET HiscoreVal7, HiscoreVal6;
    SET HiscoreLev7, HiscoreLev6;
    SET HiscoreStringPos7, HiscoreStringPos6;

    IF_ABOVE HIIndex, 5;
    GOTO weiter;
    SET HiscoreVal6, HiscoreVal5;
    SET HiscoreLev6, HiscoreLev5;
    SET HiscoreStringPos6, HiscoreStringPos5;

    IF_ABOVE HIIndex, 4;
    GOTO weiter;
    SET HiscoreVal5, HiscoreVal4;
    SET HiscoreLev5, HiscoreLev4;
    SET HiscoreStringPos5, HiscoreStringPos4;

    IF_ABOVE HIIndex, 3;
    GOTO weiter;
    SET HiscoreVal4, HiscoreVal3;
    SET HiscoreLev4, HiscoreLev3;
    SET HiscoreStringPos4, HiscoreStringPos3;

    IF_ABOVE HIIndex, 2;
    GOTO weiter;
    SET HiscoreVal3, HiscoreVal2;
    SET HiscoreLev3, HiscoreLev2;
    SET HiscoreStringPos3, HiscoreStringPos2;

    IF_ABOVE HIIndex, 1;
    GOTO weiter;
    SET HiscoreVal2, HiscoreVal1;
    SET HiscoreLev2, HiscoreLev1;
    SET HiscoreStringPos2, HiscoreStringPos1;

weiter:
    IF_EQUAL HIIndex, 1;
        SET HiscoreStringPos1, FreeHiscorePos;
    IF_EQUAL HIIndex, 2;
        SET HiscoreStringPos2, FreeHiscorePos;
    IF_EQUAL HIIndex, 3;
        SET HiscoreStringPos3, FreeHiscorePos;
    IF_EQUAL HIIndex, 4;
        SET HiscoreStringPos4, FreeHiscorePos;
    IF_EQUAL HIIndex, 5;
        SET HiscoreStringPos5, FreeHiscorePos;
    IF_EQUAL HIIndex, 6;
        SET HiscoreStringPos6, FreeHiscorePos;
    IF_EQUAL HIIndex, 7;
        SET HiscoreStringPos7, FreeHiscorePos;
    IF_EQUAL HIIndex, 8;
        SET HiscoreStringPos8, FreeHiscorePos;
    IF_EQUAL HIIndex, 9;
        SET HiscoreStringPos9, FreeHiscorePos;
    IF_EQUAL HIIndex, 10;
        SET HiscoreStringPos10, FreeHiscorePos;

    CALL    InitHiscoreStrings;
}

ACTION SetHiscore
{
    IF_EQUAL HIIndex, 1;
        SET HiscoreVal1, Newscore;
    IF_EQUAL HIIndex, 2;
        SET HiscoreVal2, Newscore;
    IF_EQUAL HIIndex, 3;
        SET HiscoreVal3, Newscore;
    IF_EQUAL HIIndex, 4;
        SET HiscoreVal4, Newscore;
    IF_EQUAL HIIndex, 5;
        SET HiscoreVal5, Newscore;
    IF_EQUAL HIIndex, 6;
        SET HiscoreVal6, Newscore;
    IF_EQUAL HIIndex, 7;
        SET HiscoreVal7, Newscore;
    IF_EQUAL HIIndex, 8;
        SET HiscoreVal8, Newscore;
    IF_EQUAL HIIndex, 9;
        SET HiscoreVal9, Newscore;
    IF_EQUAL HIIndex, 10;
        SET HiscoreVal10, Newscore;
}

ACTION SetHiscoreLevel
{
    IF_EQUAL HIIndex, 1;
        SET HiscoreLev1, level_no;
    IF_EQUAL HIIndex, 2;
        SET HiscoreLev2, level_no;
    IF_EQUAL HIIndex, 3;
        SET HiscoreLev3, level_no;
    IF_EQUAL HIIndex, 4;
        SET HiscoreLev4, level_no;
    IF_EQUAL HIIndex, 5;
        SET HiscoreLev5, level_no;
    IF_EQUAL HIIndex, 6;
        SET HiscoreLev6, level_no;
    IF_EQUAL HIIndex, 7;
        SET HiscoreLev7, level_no;
    IF_EQUAL HIIndex, 8;
        SET HiscoreLev8, level_no;
    IF_EQUAL HIIndex, 9;
        SET HiscoreLev9, level_no;
    IF_EQUAL HIIndex, 10;
        SET HiscoreLev10, level_no;
}

ACTION SetHiscoreString
{
    IF_EQUAL HIIndex, 1;
        SET HiscoreNames_txt.STRING, HiscorePos1;
    IF_EQUAL HIIndex, 2;
        SET HiscoreNames_txt.STRING, HiscorePos2;
    IF_EQUAL HIIndex, 3;
        SET HiscoreNames_txt.STRING, HiscorePos3;
    IF_EQUAL HIIndex, 4;
        SET HiscoreNames_txt.STRING, HiscorePos4;
    IF_EQUAL HIIndex, 5;
        SET HiscoreNames_txt.STRING, HiscorePos5;
    IF_EQUAL HIIndex, 6;
        SET HiscoreNames_txt.STRING, HiscorePos6;
    IF_EQUAL HIIndex, 7;
        SET HiscoreNames_txt.STRING, HiscorePos7;
    IF_EQUAL HIIndex, 8;
        SET HiscoreNames_txt.STRING, HiscorePos8;
    IF_EQUAL HIIndex, 9;
        SET HiscoreNames_txt.STRING, HiscorePos9;
    IF_EQUAL HIIndex, 10;
        SET HiscoreNames_txt.STRING, HiscorePos10;
}

ACTION InitHiscoreStrings
{
    SET HIIndexSave, HIIndex;

    SET HiscoreNames_txt.INDEX, 1;
    SET HIIndex, HiscoreStringPos1;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 2;
    SET HIIndex, HiscoreStringPos2;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 3;
    SET HIIndex, HiscoreStringPos3;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 4;
    SET HIIndex, HiscoreStringPos4;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 5;
    SET HIIndex, HiscoreStringPos5;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 6;
    SET HIIndex, HiscoreStringPos6;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 7;
    SET HIIndex, HiscoreStringPos7;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 8;
    SET HIIndex, HiscoreStringPos8;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 9;
    SET HIIndex, HiscoreStringPos9;
    CALL SetHiscoreString;

    SET HiscoreNames_txt.INDEX, 10;
    SET HIIndex, HiscoreStringPos10;
    CALL SetHiscoreString;

    SET HIIndex, HIIndexSave;
}
/*
ACTION PleaseWaitAnim
{
	SET	MESSAGES.9,levelendWait_txt;

    RULE panel_level_anim_small.POS_X = levelendWait_txt.POS_X +
                                        (12 * FONT_SIZE_X);
    SET panel_level_anim_small.POS_Y, levelendWait_txt.POS_Y;

    SET	PANELS.4,panel_level_anim_small;
    SET PALANIM_DELAY, 16;
    FADE_PAL, PAL_ANIM,1;
}
*/
//BMAP   leer_map <leer.pcx>;
//PANEL  panel_leer { POS_X 0; POS_Y 0; PAN_MAP leer_map; FLAGS REFRESH; }

ACTION ClearScreen
{
//    SET SCREEN_WIDTH, 100;
//    SET SCREEN_HGT,   100;
//    SET frame_color, 1;
//    SET RENDER_MODE, 2;

//    SET PANELS.1, panel_leer;
    WAIT 2;

//    SET RENDER_MODE, 0;
//    SET FRAME_COLOR, 0;
}

ACTION ResetPlayer
{
    SET    slot, -1;
    SET    old_gun_type, 0;
    SET    old_gun1    , 0;
    SET    old_gun2    , 0;
    SET    old_gun3    , 0;
    SET    old_gun4    , 0;
    SET    old_minen   , 0;
    SET    old_shield1 , 0;
    SET    old_gun5    , 0;
    SET    glo_health  , 300;  //mr0411
    SET    glo_energy  , 200;

	CALL   skaph_gsave;
}


//INCLUDE <ekg.wdl>;
