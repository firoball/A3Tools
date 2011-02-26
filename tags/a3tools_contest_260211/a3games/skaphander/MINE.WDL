///////////////////////////////////////////////////////////////////////
///////////-MINEN ZUM ABLEGEN UND ABHAUEN-
////////// F.O. Juli `95
///////////////////////////////////////////////////////////////////////
//SOUND	klick,<ausklink.wav>;
///SOUND	klonk,<aufsetz.wav>;
SOUND	tic_tac,<tic.wav>;

///////////////////////////////////////////////////////////////////////
BMAP min_ob,<mine2.lbm>,0,0,78,80;

/*IFDEF HIRES;	///////////////////////////////////////////////////

OVLY min_ovl,<mine_hi2.pcx>,11,5,99, 80;
OVERLAY mine1_ovr { POS_X 353; POS_Y 405; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine2_ovr { POS_X 463; POS_Y 406; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine3_ovr { POS_X 243; POS_Y 406; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine4_ovr { POS_X 133; POS_Y 408; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine5_ovr { POS_X 573; POS_Y 408; FLAGS ABSPOS; OVLYS min_ovl; }

IFELSE;*/
IFDEF SVGA;

OVLY min_ovl,<mine_s2.pcx>,9,9,76,63;
OVERLAY mine1_ovr { POS_X 273; POS_Y 325; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine2_ovr { POS_X 193; POS_Y 326; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine3_ovr { POS_X 353; POS_Y 326; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine4_ovr { POS_X 113; POS_Y 328; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine5_ovr { POS_X 433; POS_Y 328; FLAGS ABSPOS; OVLYS min_ovl; }

IFELSE;

OVLY min_ovl,<mine2.lbm>,119,0,40,31;
OVERLAY mine1_ovr { POS_X 138; POS_Y 293; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine2_ovr { POS_X  94; POS_Y 295; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine3_ovr { POS_X 182; POS_Y 295; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine4_ovr { POS_X  50; POS_Y 297; FLAGS ABSPOS; OVLYS min_ovl; }
OVERLAY mine5_ovr { POS_X 226; POS_Y 297; FLAGS ABSPOS; OVLYS min_ovl; }

ENDIF;
//ENDIF;

BMAP min_ex1,<knallig.lbm>,0,42,128,128;
BMAP min_ex2,<knallig.lbm>,128,42,128,128;
BMAP min_ex3,<knallig.lbm>,256,42,128,128;
BMAP min_ex4,<knallig.lbm>,384,42,128,128;
BMAP min_ex5,<knallig.lbm>,0,170,128,128;
BMAP min_ex6,<knallig.lbm>,128,170,128,128;

TEXTURE	min_obj_tex {
	SCALE_XY		50,50;
	BMAPS			min_ob;
	TOUCH			mine_touch;
}

TEXTURE	min_tick_tex {
	SCALE_XY		50,50;
	CYCLES		2;
	BMAPS			min_ob,min_ob;
	TOUCH			mine_1_touch;
	DELAY			4,4;
	SOUND			tic_tac;
	SVOL			0.4;
	SDIST			60;
}

TEXTURE	min_bums_tex {
	SCALE_XY		10,10;
	CYCLES		6;
	BMAPS			min_ex1,min_ex2,min_ex3,min_ex4,min_ex5,min_ex6;
	DELAY			2,2,2,2,3,2;
	AMBIENT		1;
	FLAGS			ONESHOT,NO_CLIP;
	SOUND			tron_bang;
	SVOL			0.5;
	SDIST			300;
}

/////////////////////////////////////////////////////////////////////////
ACTOR mine	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine1	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine2	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine3	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine4	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine5	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine6	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine7	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine8	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
ACTOR mine9	{ TEXTURE min_obj_tex; FLAGS SAVE,LIBER; EACH_TICK mine_init; }

ACTOR mine_box	{ TEXTURE min_obj_tex; HEIGHT	-4; FLAGS SAVE,LIBER; EACH_TICK mine_init; }
/////////////////////////////////////////////////////////////////////////

// mr0910 init OVERLAY's nach dem laden eines Levels mit anderer Aufloesung !!!!
ACTION init_mine
{
/*IFDEF HIRES;	///////////////////////////////////////////////////
    SET mine1_ovr.POS_X, 353;
    SET mine1_ovr.POS_Y, 405;
    SET mine2_ovr.POS_X, 463;
    SET mine2_ovr.POS_Y, 406;
    SET mine3_ovr.POS_X, 243;
    SET mine3_ovr.POS_Y, 406;
    SET mine4_ovr.POS_X, 133;
    SET mine4_ovr.POS_Y, 408;
    SET mine5_ovr.POS_X, 573;
    SET mine5_ovr.POS_Y, 408;
IFELSE;*/
IFDEF SVGA;
    SET mine1_ovr.POS_X, 273;
    SET mine1_ovr.POS_Y, 325;
    SET mine2_ovr.POS_X, 193;
    SET mine2_ovr.POS_Y, 326;
    SET mine3_ovr.POS_X, 353;
    SET mine3_ovr.POS_Y, 326;
    SET mine4_ovr.POS_X, 113;
    SET mine4_ovr.POS_Y, 328;
    SET mine5_ovr.POS_X, 433;
    SET mine5_ovr.POS_Y, 328;
IFELSE;
    SET mine1_ovr.POS_X, 138;
    SET mine1_ovr.POS_Y, 293;
    SET mine2_ovr.POS_X , 94;
    SET mine2_ovr.POS_Y, 295;
    SET mine3_ovr.POS_X, 182;
    SET mine3_ovr.POS_Y, 295;
    SET mine4_ovr.POS_X , 50;
    SET mine4_ovr.POS_Y, 297;
    SET mine5_ovr.POS_X, 226;
    SET mine5_ovr.POS_Y, 297;
ENDIF;
//ENDIF;
}

ACTION mine_init {
	SET	MY.GROUND,1;
	SET	MY.FRAGILE,1;
	SET	MY.IF_NEAR,add_mine;
	SET	MY.IF_HIT,hit_mine;
	SET	MY.EACH_TICK,NULL;
}

ACTION hit_mine {
	IF_EQUAL	SHOOT_RANGE,14;	// Space-Taste
		BRANCH	add_mine;
	IF_ABOVE	RESULT,0;			// nur Testschuss?
		BRANCH	mine_explode;
}

ACTION add_mine {
	SET 		screen_msg.STRING,no_mine;
	SET		message_delay,80;	// 5-Sekunden-Message
	SET 		EACH_TICK.14,show_message;
	IF_ABOVE	minen,4;
		END;		// max. 5 minen erlaubt
	PLAY_SOUND	beamer,0.3;
	SET		MY.TEXTURE,min_obj_tex;
	SET 		MY.INVISIBLE,1;
	ADD 		minen,1;
	SET 		screen_msg.STRING,got_mine;
	BRANCH	set_mine;
}

//jc 18.09.
ACTION set_mine {
	SET			LAYERS.1,NULL;
	IF_EQUAL	minen,0;
		END;
	SET			EACH_TICK.13,NULL;
	SET			LAYERS.1,mine1_ovr;
	SET			LAYERS.2,NULL;
	SET			LAYERS.3,NULL;
	SET			LAYERS.4,NULL;
	SET			LAYERS.5,NULL;
	SET			LAYERS.6,NULL;
	IF_ABOVE	minen,1;
		SET		LAYERS.2,mine2_ovr;
	IF_ABOVE	minen,2;
		SET		LAYERS.3,mine3_ovr;
	IF_ABOVE	minen,3;
		SET		LAYERS.4,mine4_ovr;
	IF_ABOVE	minen,4;
		SET		LAYERS.5,mine5_ovr;
	SET			gun_type,5;
	SET			fire,mine_werf;
	SET			set_gun5,set_mine;
	SET			set_gun,set_mine;
}


ACTION mine_werf {
	IF_EQUAL	minen,0;
		END;
// only throw invisible mines
	SET	MY,mine;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine1;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine2;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine3;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine4;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine5;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine6;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine7;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine8;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	SET	MY,mine9;
	IF_EQUAL	MY.INVISIBLE,1;
		GOTO	mwerf1;
	END;

mwerf1:
	SET 		screen_msg.STRING,hot_mine;
	CALL 		show_message;
	SET		EACH_TICK.13,NULL;
	ADD		minen,-1;
	PLAY_SOUND	klick,0.5;
	CALL		set_mine;	// show mine count
	BRANCH	mine_throw;
}

ACTION mine_throw {
	CALL	mine_init;				// if the mine wasnt initialized yet
	SET	MY.INVISIBLE,0;
	SET	MY.TEXTURE,min_obj_tex;
	RULE	MY.HEIGHT = PLAYER_Z-1.5;	// mine with flag GROUND!
	SET 	MY.DIST,0;
  	DROP	MY;
	SET 	MY.DIST,10;		// wg. LIBER
	SET	MY.SPEED,2;
	SET	MY.PASSABLE,1;
	SET 	MY.CAREFULLY,1;
	SET	MY.ANGLE,PLAYER_ANGLE;
	SET	MY.TARGET,BULLET;
	SET	MY.VSPEED,0.3;
	SET	MY.EACH_TICK,mine_fly;
	SET	MY.EACH_CYCLE,NULL;
	SET	MY.IF_NEAR,NULL;
	SET	MY.IF_HIT,hit_mine;
}


ACTION mine_fly {
	IF_EQUAL	MY.MOVED,0;		// object moved?
		END;
	SET		MY.MOVED,0;
	ADDT		MY.VSPEED,-0.15;	// Gravity
	IF_ABOVE	MY.HEIGHT,ACTOR_FLOOR_HGT;	// works only within EACH_TICK!
		END;
	SET	MY.VSPEED,0;
	SET	MY.HEIGHT,ACTOR_FLOOR_HGT;
	PLAY_SOUND	klonk,0.5;
	SET	MY.EACH_TICK,mine_slide;
}

ACTION mine_slide {
	SET	MY.HEIGHT,ACTOR_FLOOR_HGT;		// still adapt to steps
	ADD	MY.SPEED,-0.3;		// Friction
	IF_EQUAL	THERE.FLAG8,1;	// under water?
		SET	MY.HEIGHT,THERE.SKILL1;
	IF_ABOVE	MY.SPEED,0;
		END;

	SET	MY.TEXTURE,min_tick_tex;
	SET	MY.EACH_TICK,NULL;
	SET	MY.EACH_CYCLE,mine_sensor;
	SET	MY.SPEED,0;
	SET	MY.SKILL8,0;
	SET	MY.TARGET,NULL;
	SET	MY.DIST,4;
	SET	MY.IF_NEAR,add_mine;	// to take it again
}

ACTION mine_sensor {			// look for victims...
	SET		SHOOT_FAC,0;
	SET		SHOOT_RANGE,10;
	EXPLODE	MY;				// test explosion
	IF_ABOVE	HIT_MINDIST,0;		// hit something?
		BRANCH	mine_explode;	// then hurt it really
}

ACTION mine_explode {
	EXCLUSIVE;
	CALL		explo_light;
	SET		MY.PASSABLE,0; 	// sonst nix IF_HIT bei Gegner
	SET		MY.CAREFULLY,0;	// THERE nicht mehr aendern
	SET		MY.SPEED,0.5;
	SET		MY.TARGET,FOLLOW;
	SET		gun_strength,-1600;
	SET		SHOOT_RANGE,30;
	SET		SHOOT_FAC,1;
 	EXPLODE	MY;				// jetzt 'echte' Explosion
   SET		MY.TEXTURE,min_bums_tex;
  	SET      MY.PLAY,1;
	ADD		MY.HEIGHT,-4;
	SET		MY.EACH_CYCLE,mine_weg;
	SET		MY.IF_HIT,NULL;
	SET		MY.IF_NEAR,NULL;
	SET		MY.EACH_TICK,NULL;
	IF_EQUAL	RESULT,0;		// Player selbst getroffen?
		END;
	RULE		health = health + -200*RESULT + -15;
   SET      MY.PASSABLE,1;  // jetzt PASSABLE !!!
}

ACTION mine_weg {
	SET		MY.INVISIBLE,1;
	SET		MY.EACH_CYCLE,NULL;
}
