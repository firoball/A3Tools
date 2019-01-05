/////////////////////////////////////////////////////////////
BIND <canon1_s.LBM>;	// SVGA
BIND <t_can1_s.LBM>;

/////////////////////////////////////////////////////////////
BMAP	debugger_obj, <can_obj.lbm>,0,0,153,24;
TEXTURE	debugger_tex { SCALE_XY 20,20; BMAPS debugger_obj; TOUCH debugger_touch;}

THING debugger {
	TEXTURE	debugger_tex;
	HEIGHT	1.5;
	IF_NEAR	take_debugger;
	IF_HIT	thing_hit;
}

ACTION take_debugger {
	ADD 		points,10;
	ADD 		energy,120;
	PLAY_SOUND	beamer,0.2;
	SET 		MY.INVISIBLE,1;
	IF_ABOVE	gun1,0;
		BRANCH	take_both;
	SET 		gun1,1;
	SET 		screen_msg.STRING,got_debugger;
	CALL		show_text;
	SET		set_gun1,set_debugger;
	BRANCH	set_gun1;
}

ACTION take_both {
	SET 		gun2,1;
	SET	 	screen_msg.STRING,another_debugger;
	CALL		show_text;
	SET		set_gun2,set_debugger2;
	BRANCH	set_gun2;
}

//////////////////////////////////////////////////////////////////
OVLY	grey_cross,<skafonts.lbm>,60,106,60,44;
/*
IFDEF HIRES;	///////////////////////////////////////////////////

OVLY	cannon1_0 <can1_hi.LBM>,0,14,153,88;	//1
OVLY	cannon1_1 <can1_hi.LBM>,182,7,153,88;	//2
OVLY	cannon1_2 <can1_hi.LBM>,350,9,153,88;	//4
OVLY	cannon1_3 <can1_hi.LBM>,16,106,153,88;	//5

OVLY	cannonr1_0 <t_ca1_hi.LBM>,647,14,153,88;
OVLY	cannonr1_1 <t_ca1_hi.LBM>,465,7,153,88;
OVLY	cannonr1_2 <t_ca1_hi.LBM>,297,9,153,88;
OVLY	cannonr1_3 <t_ca1_hi.LBM>,631,106,153,88;

OVERLAY	icrosshair { POS_X 361; POS_Y 235; FLAGS ABSPOS; OVLYS grey_cross; }

OVERLAY	cannon0 { POS_X 65; POS_Y 406; FLAGS ABSPOS; OVLYS cannon1_0; }
OVERLAY	cannon1 { POS_X 64; POS_Y 406; FLAGS ABSPOS; OVLYS cannon1_1; }
OVERLAY	cannon2 { POS_X 62; POS_Y 406; FLAGS ABSPOS; OVLYS cannon1_2; }
OVERLAY	cannon3 { POS_X 61; POS_Y 406; FLAGS ABSPOS; OVLYS cannon1_3; }

OVERLAY	cannonr0 { POS_X 580; POS_Y 406; FLAGS ABSPOS; OVLYS cannonr1_0; }
OVERLAY	cannonr1 { POS_X 581; POS_Y 406; FLAGS ABSPOS; OVLYS cannonr1_1; }
OVERLAY	cannonr2 { POS_X 582; POS_Y 406; FLAGS ABSPOS; OVLYS cannonr1_2; }
OVERLAY	cannonr3 { POS_X 584; POS_Y 406; FLAGS ABSPOS; OVLYS cannonr1_3; }


IFELSE;
*/
IFDEF SVGA;		////////////////////////////////////////////////////

OVLY	cannon1_0 <canon1_s.LBM>,0,11,124,72;	//1
OVLY	cannon1_1 <canon1_s.LBM>,145,5,124,72;	//2
OVLY	cannon1_2 <canon1_s.LBM>,279,7,124,72;	//4
OVLY	cannon1_3 <canon1_s.LBM>,11,84,124,72;	//5

OVLY	cannonr1_0 <t_can1_s.LBM>,0,11,124,72;
OVLY	cannonr1_1 <t_can1_s.LBM>,145,5,124,72;
OVLY	cannonr1_2 <t_can1_s.LBM>,272,5,124,72;
OVLY	cannonr1_3 <t_can1_s.LBM>,11,84,124,72;

OVERLAY	icrosshair { POS_X 289; POS_Y 188; FLAGS ABSPOS; OVLYS grey_cross; }

OVERLAY	cannon0 { POS_X 52; POS_Y 325; FLAGS ABSPOS; OVLYS cannon1_0; }
OVERLAY	cannon1 { POS_X 51; POS_Y 325; FLAGS ABSPOS; OVLYS cannon1_1; }
OVERLAY	cannon2 { POS_X 50; POS_Y 325; FLAGS ABSPOS; OVLYS cannon1_2; }
OVERLAY	cannon3 { POS_X 49; POS_Y 325; FLAGS ABSPOS; OVLYS cannon1_3; }

OVERLAY	cannonr0 { POS_X 464; POS_Y 325; FLAGS ABSPOS; OVLYS cannonr1_0; }
OVERLAY	cannonr1 { POS_X 465; POS_Y 325; FLAGS ABSPOS; OVLYS cannonr1_1; }
OVERLAY	cannonr2 { POS_X 466; POS_Y 325; FLAGS ABSPOS; OVLYS cannonr1_2; }
OVERLAY	cannonr3 { POS_X 467; POS_Y 325; FLAGS ABSPOS; OVLYS cannonr1_3; }


IFELSE;		////////////////////////////////////////////////////////
OVLY	cannon1_0 <canon1.lbm>,0,0,68,82;	//1
OVLY	cannon1_1 <canon1.lbm>,68,0,68,80;	//2
OVLY	cannon1_3 <canon1.lbm>,204,0,68,80;	//4
OVLY	cannon1_4 <canon1.lbm>,0,82,68,81;	//5

OVLY	cannonr1_0 <t_canon1.LBM>,252,0,68,82;
OVLY	cannonr1_1 <t_canon1.LBM>,184,0,68,80;
OVLY	cannonr1_3 <t_canon1.LBM>,48,0,68,80;
OVLY	cannonr1_4 <t_canon1.LBM>,252,82,68,81;

OVERLAY	icrosshair { POS_X 130; POS_Y 154; FLAGS ABSPOS; OVLYS grey_cross; }

OVERLAY	cannon0 { POS_X 47; POS_Y 250; FLAGS ABSPOS; OVLYS cannon1_0; }
OVERLAY	cannon1 { POS_X 45; POS_Y 252; FLAGS ABSPOS; OVLYS cannon1_1; }
OVERLAY	cannon2 { POS_X 45; POS_Y 252; FLAGS ABSPOS; OVLYS cannon1_3; }
OVERLAY	cannon3 { POS_X 46; POS_Y 251; FLAGS ABSPOS; OVLYS cannon1_4; }

OVERLAY	cannonr0 { POS_X 208; POS_Y 250; FLAGS ABSPOS; OVLYS cannonr1_0; }
OVERLAY	cannonr1 { POS_X 210; POS_Y 252; FLAGS ABSPOS; OVLYS cannonr1_1; }
OVERLAY	cannonr2 { POS_X 210; POS_Y 252; FLAGS ABSPOS; OVLYS cannonr1_3; }
OVERLAY	cannonr3 { POS_X 209; POS_Y 251; FLAGS ABSPOS; OVLYS cannonr1_4; }

ENDIF;
//ENDIF;

BMAP	leermap,<knallig.lbm>,0,0,1,1;

BMAP	flash_1,<knallig.lbm>,0,0,16,16;
BMAP	flash_2,<knallig.lbm>,16,0,16,16;
BMAP	flash_3,<knallig.lbm>,32,0,16,16;
BMAP	flash_4,<knallig.lbm>,48,0,16,16;

BMAP	wolke_1,<knallig.lbm>,124,0,20,20;
BMAP	wolke_2,<knallig.lbm>,144,0,20,20;
BMAP	wolke_3,<knallig.lbm>,164,0,20,20;
BMAP	wolke_4,<knallig.lbm>,184,0,20,20;
BMAP	wolke_5,<knallig.lbm>,204,0,20,20;

BMAP	flblue_1,<knallig.lbm>,292,172,24,25;
BMAP	flblue_2,<knallig.lbm>,316,172,24,25;
BMAP	flblue_3,<knallig.lbm>,340,172,24,25;
BMAP	flblue_4,<knallig.lbm>,364,172,24,25;
BMAP	flblue_5,<knallig.lbm>,388,172,24,25;

TEXTURE	leer_tex { BMAPS	leermap; }

TEXTURE	flash_tex {
	SCALE_XY	16,16;
	CYCLES	4;
	BMAPS		flash_1,flash_2,flash_3,flash_4;
	DELAY		1,1,1,1;
	FLAGS		ONESHOT,NO_CLIP;
	AMBIENT	1;
}

TEXTURE	flblue_tex {
	SCALE_XY	16,16;
	CYCLES	5;
	BMAPS		flblue_1,flblue_2,flblue_3,flblue_4,flblue_5;
	DELAY		1,1,1,1,1;
	FLAGS		ONESHOT,NO_CLIP;
	AMBIENT	1;
}

TEXTURE	wolke_tex {
	SCALE_XY	12,12;
	CYCLES	5;
	BMAPS		wolke_1,wolke_2,wolke_3,wolke_4,wolke_5;
	DELAY		2,2,2,2,2;
	FLAGS		ONESHOT,DIAPHANOUS,NO_CLIP;
	AMBIENT	0.5;
}

ACTOR	flash  { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }
ACTOR	flash2 { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }
ACTOR	flash3 { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }
ACTOR	flash4 { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }
ACTOR	flash5 { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }
ACTOR	flash6 { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }
ACTOR	flash7 { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }
ACTOR	flash8 { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }
ACTOR	flash9 { TEXTURE flash_tex; FLAGS GROUND,INVISIBLE,IMMATERIAL,PASSABLE,LIBER,SENSITIVE; }


/////////////////////////////////////////////////////////////

// mr0910 init OVERLAY's nach dem laden eines Levels mit anderer Aufloesung !!!!
ACTION init_debugger
{
/*
IFDEF HIRES;	///////////////////////////////////////////////////
    SET icrosshair.POS_X, 361;
    SET icrosshair.POS_Y, 235;
    SET cannon0.POS_X, 65;
    SET cannon0.POS_Y, 406;
    SET cannon1.POS_X, 64;
    SET cannon1.POS_Y, 406;
    SET cannon2.POS_X, 62;
    SET cannon2.POS_Y, 406;
    SET cannon3.POS_X, 61;
    SET cannon3.POS_Y, 406;
    SET cannonr0.POS_X, 580;
    SET cannonr0.POS_Y, 406;
    SET cannonr1.POS_X, 581;
    SET cannonr1.POS_Y, 406;
    SET cannonr2.POS_X, 582;
    SET cannonr2.POS_Y, 406;
    SET cannonr3.POS_X, 584;
    SET cannonr3.POS_Y, 406;
IFELSE;
*/
IFDEF SVGA;		////////////////////////////////////////////////////
    SET icrosshair.POS_X, 289;
    SET icrosshair.POS_Y, 188;
    SET cannon0.POS_X, 52;
    SET cannon0.POS_Y, 325;
    SET cannon1.POS_X, 51;
    SET cannon1.POS_Y, 325;
    SET cannon2.POS_X, 50;
    SET cannon2.POS_Y, 325;
    SET cannon3.POS_X, 49;
    SET cannon3.POS_Y, 325;
    SET cannonr0.POS_X, 464;
    SET cannonr0.POS_Y, 325;
    SET cannonr1.POS_X, 465;
    SET cannonr1.POS_Y, 325;
    SET cannonr2.POS_X, 466;
    SET cannonr2.POS_Y, 325;
    SET cannonr3.POS_X, 467;
    SET cannonr3.POS_Y, 325;
IFELSE;		////////////////////////////////////////////////////////
    SET icrosshair.POS_X, 130;
    SET icrosshair.POS_Y, 154;
    SET cannon0.POS_X, 47;
    SET cannon0.POS_Y, 250;
    SET cannon1.POS_X, 45;
    SET cannon1.POS_Y, 252;
    SET cannon2.POS_X, 45;
    SET cannon2.POS_Y, 252;
    SET cannon3.POS_X, 46;
    SET cannon3.POS_Y, 251;
    SET cannonr0.POS_X, 208;
    SET cannonr0.POS_Y, 250;
    SET cannonr1.POS_X, 210;
    SET cannonr1.POS_Y, 252;
    SET cannonr2.POS_X, 210;
    SET cannonr2.POS_Y, 252;
    SET cannonr3.POS_X, 209;
    SET cannonr3.POS_Y, 251;
ENDIF;
//ENDIF;
}

ACTION tu_nix {	SET	EACH_TICK.13,NULL;}

ACTION set_gun0 {
	SET		EACH_TICK.13,NULL;
	SET		LAYERS.1,NULL;
	SET		LAYERS.2,NULL;
	SET		LAYERS.3,NULL;
	SET		LAYERS.4,NULL;
	SET		LAYERS.5,NULL;
	SET		LAYERS.6,NULL;
	SET		gun_type,0;
	SET		fire,tu_nix;
	SET		set_gun,tu_nix;
}
ACTION set_debugger {
	IF_EQUAL	gun1,0;
		BRANCH	set_gun0;
	SET		EACH_TICK.13,NULL;
	SET		LAYERS.1,cannon0;
	SET		LAYERS.2,NULL;
	SET		LAYERS.3,NULL;
	SET		LAYERS.4,NULL;
	SET		LAYERS.5,NULL;
	SET		LAYERS.6,icrosshair;
	SET		gun_type,1;
	SET		fire,fire1;
	SET		set_gun,set_debugger;
}
ACTION set_debugger2 {
	IF_EQUAL	gun2,0;
		BRANCH	set_debugger;
	SET		EACH_TICK.13,NULL;
	SET		LAYERS.1,cannon0;
	SET		LAYERS.2,cannonr0;
	SET		LAYERS.3,NULL;
	SET		LAYERS.4,NULL;
	SET		LAYERS.5,NULL;
	SET		LAYERS.6,icrosshair;
	SET		gun_type,2;
	SET		fire,fire2;
	SET		set_gun,set_debugger2;
}

ACTION fire_start {
	IF_BELOW	energy,1;
		END;
	IF_BELOW	gun_type,1;
		END;
	IF_ABOVE	underwater,0;	// unter Wasser nicht feuern
		END;
	IF_BELOW	gun_type,5;
		SET	LAYERS.6,icrosshair;
	SET		EACH_TICK.13,fire;
}


ACTION fire_stop { SET EACH_TICK.13,NULL;}

ACTION init_flash {
	SET		MY.INVISIBLE,0;
	SET		MY.TEXTURE,flash_tex;
	IF_EQUAL	HIT.FRAGILE,1;		// Virus getroffen?
		SET	MY.TEXTURE,flblue_tex;
	SET		MY.PLAY,1;
	RULE 		MY.DIST = last_hitdist-0.5;
	RULE		MY.HEIGHT = PLAYER_Z -0.83*last_hitdist*PLAYER_TILT + RANDOM - 1;
	DROP		MY;
	SET		MY.SPEED,0.3;
	SET		MY.TARGET,FOLLOW;
	SET		MY.PASSABLE,1;
	SET		MY.CAREFULLY,0;
	SET		MY.EACH_TICK,NULL;
	SET		MY.EACH_CYCLE,init_wolke;
}

ACTION init_wolke {
	SET		SHOOT_FAC,0;
	SET		SHOOT_RANGE,30;
	EXPLODE	MY;				// Viren im Umkreis alarmieren
	SET		MY.SPEED,0.3;
	RULE		val1 = 0.3*TIME_CORR;
	SET		MY.SKILL8,val1;
	ADD		MY.HEIGHT,0.3;
	SET		MY.TEXTURE,wolke_tex;
	SET		MY.PLAY,1;
	SET		MY.EACH_TICK,flash_auf;
	SET		MY.EACH_CYCLE,flash_weg;
}

ACTION flash_auf {
	ADD	MY.HEIGHT,MY.SKILL8;
}

ACTION flash_weg {
	SET   MY.TEXTURE,leer_tex;  // sonst blinkt letze flash_extex-Phase
	SET	MY.INVISIBLE,1;
}

ACTION select_myflash {
	SET		MY,flash;
	IF_EQUAL MY.INVISIBLE,1;	// flash 1 frei?
		END;
	SET		MY,flash2;
	IF_EQUAL MY.INVISIBLE,1;
		END;
	SET		MY,flash3;
	IF_EQUAL MY.INVISIBLE,1;
		END;
	SET		MY,flash4;
	IF_EQUAL MY.INVISIBLE,1;
		END;
	SET		MY,flash5;
	IF_EQUAL MY.INVISIBLE,1;
		END;
	SET		MY,flash6;
	IF_EQUAL MY.INVISIBLE,1;
		END;
	SET		MY,flash7;
	IF_EQUAL MY.INVISIBLE,1;
		END;
	SET		MY,flash8;
	IF_EQUAL MY.INVISIBLE,1;
		END;
	SET		MY,flash9;
}


ACTION fire1 {
	SET		gun_wait,TICKS;
	PLAY_SOUND	twaeng,0.6,-0.7;
	SET		LAYERS.1,cannon1;
	ADD		PLAYER_LIGHT,0.6;
	ADD		ahead_speed,-0.1;	// Rueckstoss
	ADD		tilt_speed,-0.03;
	ADD		PLAYER_VROT,0.05;	// Drall
	SET		gun_strength,-100;
	SET 		SHOOT_RANGE,100;
	SET		SHOOT_FAC,1;
	SHOOT;

	IF_EQUAL	HIT_DIST,0;
		GOTO	fire1_daneben;
	SET		last_hitdist,HIT_DIST;
	CALL		select_myflash;
	CALL		init_flash;
	CALL 		make_hole;

fire1_daneben:
	WAITT		1;// mr1510 (2)
	SET		LAYERS.1,cannon2;
	SET		PLAYER_LIGHT,my_light;
	RULE		energy = energy + -1;
	IF_BELOW	energy,1;
	GOTO		fire1_end;
	WAITT		2;
	SET		LAYERS.1,cannon3;
	WAITT		1;
	SET		LAYERS.1,cannon0;
	WAITT		2;   // mr1510 (3)
	IF_EQUAL	KEY_CTRL,1;
	END;
	IF_EQUAL	MOUSE_LEFT,1;
	END;
fire1_end:
	SET		LAYERS.1,cannon0;
	BRANCH	fire_stop;
}

ACTION fire2 {
	SET		gun_wait,TICKS;
	PLAY_SOUND	twaeng,0.6,0.7;
	SET		LAYERS.2,cannonr1;
	ADD		PLAYER_LIGHT,0.6;
	ADD		ahead_speed,-0.1;	// Rueckstoss
	ADD		tilt_speed,-0.03;
	ADD		PLAYER_VROT,0.03;	// Drall
	SET		gun_strength,-120;
	SET	 	SHOOT_RANGE,100;
	SET		SHOOT_FAC,1;
	SHOOT;

	IF_EQUAL	HIT_DIST,0;
		GOTO	not_hit1;
	SET		last_hitdist,HIT_DIST;
	CALL		select_myflash;
	CALL		init_flash;
	CALL 		make_hole;

not_hit1:
	WAITT		1;
	SET		LAYERS.2,cannonr2;
	SET		PLAYER_LIGHT,my_light;
	RULE		energy = energy + -1;
	IF_BELOW	energy,1;
		GOTO	fire2_end;
	WAITT		2;
	SET		LAYERS.2,cannonr3;
	WAIT		1;
	PLAY_SOUND	twaeng,0.6,-0.7;
	SET		LAYERS.1,cannon1;
	SET		LAYERS.2,cannonr0;
	ADD		PLAYER_LIGHT,0.6;
	ADD		ahead_speed,-0.1;	// Rueckstoss
	ADD		tilt_speed,-0.03;
	ADD		PLAYER_VROT,-0.03;	// Drall
	SET		gun_strength,-120;
	SET 		SHOOT_RANGE,100;
	SHOOT;

	IF_EQUAL	HIT_DIST,0;
		GOTO	not_hit2;
	SET		last_hitdist,HIT_DIST;
	CALL		select_myflash;
	CALL		init_flash;
	CALL 		make_hole;

not_hit2:
	WAITT		1;
	SET		LAYERS.1,cannon2;
	SET		PLAYER_LIGHT,my_light;
	RULE		energy = energy + -1;
	IF_BELOW	energy,1;
		GOTO	fire2_end;
	WAITT		2;
	SET		LAYERS.1,cannon3;
	WAITT		1;
	SET		LAYERS.1,cannon0;
	IF_EQUAL	KEY_CTRL,1;
		END;
	IF_EQUAL	MOUSE_LEFT,1;
		END;
fire2_end:
	SET		LAYERS.1,cannon0;
	SET		LAYERS.2,cannonr0;
	BRANCH	fire_stop;
}

