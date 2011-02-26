/////////////////////////////////////////////////////////
BIND <canon3_s.LBM>; //SVGA

BMAP	eraser_obj,<can_obj.lbm>,0,140,141,75;

TEXTURE	eraser_tex {
	SCALE_XY	20,20;
	BMAPS		eraser_obj;
	TOUCH		eraser_touch;
}

THING eraser {
	TEXTURE	eraser_tex;
	HEIGHT	1;
	IF_NEAR	take_eraser;
	IF_HIT	thing_hit;
}
/////////////////////////////////////////////////////////

/*IFDEF HIRES;	///////////////////////////////////////////////////

OVLY	cannon3_0 <can3_hi.LBM>,18,6,199,102;
OVLY	cannon3_2 <can3_hi.LBM>,237,7,199,102;	//-3
OVLY	cannon3_3 <can3_hi.LBM>,18,151,199,102;	//-4

DEFINE twingunPosX, 297;
DEFINE twingunPosY, 382;

IFELSE;*/
IFDEF SVGA; // SVGA Overlays

OVLY	cannon3_0 <canon3_s.LBM>,0,41,161,84;
OVLY	cannon3_2 <canon3_s.LBM>,175,41,161,84;	//-3
OVLY	cannon3_3 <canon3_s.LBM>,0,156,161,84;	//-4

DEFINE twingunPosX, 238;
DEFINE twingunPosY, 306;

IFELSE;	  //  VGA  Overlays

OVLY	cannon3_0 <canon3.LBM>,1,1,110,84;
OVLY	cannon3_2 <canon3.LBM>,113,1,110,84; 	//-3
OVLY	cannon3_3 <canon3.LBM>,225,1,110,84;	//-4

DEFINE twingunPosX, 104;
DEFINE twingunPosY, 250;

ENDIF;
//ENDIF;

OVERLAY	twingun0 { POS_X twingunPosX; POS_Y twingunPosY; FLAGS ABSPOS; OVLYS cannon3_0; }
OVERLAY	twingun1 { POS_X twingunPosX; POS_Y twingunPosY; FLAGS ABSPOS; OVLYS cannon3_2; }
OVERLAY	twingun2 { POS_X twingunPosX; POS_Y twingunPosY; FLAGS ABSPOS; OVLYS cannon3_3; }
// < mr2610

// mr0910 init OVERLAY's nach dem laden eines Levels mit anderer Aufloesung !!!!
ACTION init_eraser
{
    SET twingun0.POS_X, twingunPosX;
    SET twingun0.POS_Y, twingunPosY;
    SET twingun1.POS_X, twingunPosX;
    SET twingun1.POS_Y, twingunPosY;
    SET twingun2.POS_X, twingunPosX;
    SET twingun2.POS_Y, twingunPosY;
}

ACTION take_eraser {
	ADD 		points,30;
	RULE		energy = energy+200;
	PLAY_SOUND	beamer,0.2;
	SET 		MY.INVISIBLE,1;
	SET 		gun4,1;
	SET 		screen_msg.STRING,got_eraser;
	SET 		EACH_TICK.14,show_text;
	SET		set_gun4,set_eraser;
	BRANCH	set_gun4;
}

ACTION set_eraser {
	SET		EACH_TICK.13,NULL;
	IF_EQUAL	gun4,0;
		END;
	SET		LAYERS.1,twingun0;
	SET		LAYERS.2,NULL;
	SET		LAYERS.3,NULL;
	SET		LAYERS.4,NULL;
	SET		LAYERS.5,NULL;
	SET		LAYERS.6,icrosshair;
	SET		gun_type,4;
	SET		fire,fire4;
	SET		set_gun,set_eraser;
}

ACTION fire4 {
	IF_BELOW	energy,1,fire4_end;
	RULE		energy = energy + -6;
	PLAY_SOUND	bang,0.7;
	SET		LAYERS.1,twingun1;
	ADD		PLAYER_LIGHT,0.7;
	ADD		ahead_speed,-0.1;	// Rueckstoss
	ADD		tilt_speed,-0.05;
	SET		gun_strength,-300;
	SET 		SHOOT_RANGE,400;
	SET		SHOOT_FAC,1;
   SHOOT;

   IF_EQUAL	HIT_DIST,0;
   	GOTO	fire4_daneben1;
  	SET		last_hitdist,HIT_DIST;

	CALL		select_myflash;
	CALL		init_flash;
	CALL		make_hole;

fire4_daneben1:
	WAIT		1;
	SET		LAYERS.1,twingun2;
	SET		PLAYER_LIGHT,my_light;
	WAIT		1;
	SET		LAYERS.1,twingun0;
	WAIT		3;

	IF_EQUAL	KEY_CTRL,1;
		END;
	IF_EQUAL	MOUSE_LEFT,1;
		END;
fire4_end:
	SET		LAYERS.1,twingun0;
	BRANCH	fire_stop;
}

