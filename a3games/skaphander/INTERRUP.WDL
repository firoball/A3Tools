//////////////////////////////////////////////////
// Kanone mit geschoss
//////////////////////////////////////////////////
BIND <canon2_s.LBM>;	//SVGA

//////////////////////////////////////////////////
BMAP  interruptor_obj,<can_obj.lbm>,0,24,153,43;

TEXTURE	interruptor_tex {
	SCALE_XY	16,16;
	BMAPS		interruptor_obj;
	TOUCH		interrup_touch;
}

THING interruptor {
	TEXTURE	interruptor_tex;
	IF_NEAR 	take_interruptor;
	IF_HIT	thing_hit;
	FLAGS		SAVE;
}

ACTION take_interruptor {
	PLAY_SOUND	beamer,0.2;
	SET 	MY.INVISIBLE,1;
	SET 	gun3,1;
	ADD 	points,15;
	ADD	energy,100;
	SET 	screen_msg.STRING,got_interruptor;
	CALL	show_message;
	SET 	set_gun3,set_interruptor;
	BRANCH 	set_gun3;
}

/*IFDEF HIRES;	///////////////////////////////////////////////////

OVLY	cannon2_0 <can2_hi.LBM>,37, 18 ,135,158;
OVLY	cannon2_1 <can2_hi.LBM>,37, 18 ,135,158;
OVLY	cannon2_3 <can2_hi.LBM>,214,18 ,135,158;
OVLY	cannon2_5 <can2_hi.LBM>,37, 179,135,158;
OVLY	cannon2_6 <can2_hi.LBM>,37, 179,135,158;

DEFINE zapgunPosX, 331;
DEFINE zapgunPosY, 327;

IFELSE; */
IFDEF SVGA;		//////////////////////////////////////////////////////

OVLY	cannon2_0 <canon2_s.LBM>,14, 9,112,127;
OVLY	cannon2_1 <canon2_s.LBM>,14, 9,112,127;
OVLY	cannon2_3 <canon2_s.LBM>,155,9,112,127;
OVLY	cannon2_5 <canon2_s.LBM>,14,138,112,127;
OVLY	cannon2_6 <canon2_s.LBM>,14,138,112,127;

DEFINE zapgunPosX, 265;
DEFINE zapgunPosY, 262;

IFELSE; 		/////////////////////////////////////////////////////////

OVLY	cannon2_0 <canon2.LBM>,0,0,72,135;
OVLY	cannon2_1 <canon2.LBM>,72,0,72,135;
#OVLY	cannon2_2 <canon2.LBM>,144,0,72,135;
OVLY	cannon2_3 <canon2.LBM>,216,0,72,135;
#OVLY	cannon2_4 <canon2.LBM>,0,135,72,135;
OVLY	cannon2_5 <canon2.LBM>,72,135,72,135;
OVLY	cannon2_6 <canon2.LBM>,144,135,72,135;

DEFINE zapgunPosX, 124;
DEFINE zapgunPosY, 196;

ENDIF;
//ENDIF;

OVERLAY	zapgun0 { POS_X zapgunPosX; POS_Y zapgunPosY; FLAGS ABSPOS; OVLYS cannon2_0; }
OVERLAY	zapgun1 { POS_X zapgunPosX; POS_Y zapgunPosY; FLAGS ABSPOS; OVLYS cannon2_1; }
OVERLAY	zapgun3 { POS_X zapgunPosX; POS_Y zapgunPosY; FLAGS ABSPOS; OVLYS cannon2_3; }
OVERLAY	zapgun5 { POS_X zapgunPosX; POS_Y zapgunPosY; FLAGS ABSPOS; OVLYS cannon2_5; }
OVERLAY	zapgun6 { POS_X zapgunPosX; POS_Y zapgunPosY; FLAGS ABSPOS; OVLYS cannon2_6; }
//<mr2610


BMAP 		flash_b0,<knallig.lbm>,350,2,18,18;
BMAP 		flash_b1,<knallig.lbm>,372,2,18,18;
BMAP 		flash_b2,<knallig.lbm>,396,2,18,18;
BMAP 		flash_b3,<knallig.lbm>,420,2,18,18;

TEXTURE	flashball_tex {
	SCALE_XY	16,16;
	CYCLES	4;
	BMAPS		flash_b0,flash_b1,flash_b2,flash_b3;
	DELAY		1,1,1,1;
	AMBIENT	1;
}

BMAP 		flash_ex0,<Explo_1.lbm >,0,0,180,180;
BMAP 		flash_ex1,<Explo_2.lbm >,0,0,180,180;
BMAP 		flash_ex2,<Explo_3.lbm >,0,0,180,180;
BMAP 		flash_ex3,<Explo_4.lbm >,0,0,180,180;
BMAP 		flash_ex4,<Explo_5.lbm >,0,0,180,180;
BMAP 		flash_ex5,<Explo_6.lbm >,0,0,180,180;
BMAP 		flash_ex6,<Explo_7.lbm >,0,0,180,180;
BMAP 		flash_ex7,<Explo_8.lbm >,0,0,180,180;

TEXTURE	flashball_extex {
	SCALE_XY	16,16;
	CYCLES	8;
	BMAPS		flash_ex0,flash_ex1,flash_ex2,flash_ex3,flash_ex4,flash_ex5,flash_ex6,flash_ex7;
	DELAY 	2,2,2,2,2,2,2,2;
	AMBIENT	1;
	FLAGS		ONESHOT,NO_CLIP;
#	SOUND		int_ex;
#	SVOL		0.6;
	SDIST		1000;
}

/////////////////////////////////////////////////////////////////
// mr0910 init OVERLAY's nach dem laden eines Levels mit anderer Aufloesung !!!!
ACTION init_interrupt
{
    //mr2610
    SET zapgun0.POS_X, zapgunPosX;
    SET zapgun0.POS_Y, zapgunPosY;
    SET zapgun1.POS_X, zapgunPosX;
    SET zapgun1.POS_Y, zapgunPosY;
    SET zapgun3.POS_X, zapgunPosX;
    SET zapgun3.POS_Y, zapgunPosY;
    SET zapgun5.POS_X, zapgunPosX;
    SET zapgun5.POS_Y, zapgunPosY;
    SET zapgun6.POS_X, zapgunPosX;
    SET zapgun6.POS_Y, zapgunPosY;
}

ACTION set_interruptor {
	SET		EACH_TICK.13,NULL;
	IF_EQUAL	gun3,0;
		END;
	SET		LAYERS.1,zapgun0;
	SET		LAYERS.2,NULL;
	SET		LAYERS.3,NULL;
	SET		LAYERS.4,NULL;
	SET		LAYERS.5,NULL;
	SET		LAYERS.6,icrosshair;
	SET		gun_type,3;
	SET		fire,fire3;
	SET		set_gun,set_interruptor;

}

ACTION init_flashball {
	SET		MY.INVISIBLE,0;
	SET		MY.TEXTURE,leer_tex;
 	SET		MY.PASSABLE,0;
	SET		MY.ANGLE,PLAYER_ANGLE;
	RULE	val1 = -0.83*PLAYER_TILT;
	SET		MY.VSPEED,val1;
	RULE	val1 = PLAYER_Z + -1.3;
	SET		MY.HEIGHT,val1;
	SET		MY.DIST,0;	//jc
	DROP   	MY;
	SET      MY.PASSABLE,1;	    // sonst bleibt Ball h„ngen
	SET		MY.SPEED,2;
	SET		MY.CAREFULLY,1;	 //jc
	SET		MY.TARGET,BULLET;
	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,flashball_count;
	SET		MY.IF_NEAR,NULL;
	SET		MY.IF_HIT,flashball_hit;
	SET		MY.EACH_CYCLE,NULL;
}

ACTION flashball_count {
	IF_BELOW	MY.SPEED,4;
		ADD	MY.SPEED,1;

  	IF_BELOW	MY.DISTANCE,4;		// jetzt sichtbar,CAREFULLY ,MASSIV
		 GOTO	invisible;
  	SET      MY.PASSABLE,0;
	SET    	MY.TEXTURE,flashball_tex;
invisible:
	IF_ABOVE	MY.DISTANCE,500;
		BRANCH	flashball_explo;
}

ACTION flashball_hit {
	SET		MY.SPEED,0.5;
	RULE 		my_distance = (PLAYER_X-MY.X)*(PLAYER_X-MY.X)
   				+(PLAYER_Y-MY.Y)*(PLAYER_Y-MY.Y);
	SQRT		my_distance,my_distance;
   RULE   	MY.VSPEED = (PLAYER_Z-2)-(MY.HEIGHT+MY.SIZE_Y*0.5);
   RULE		MY.VSPEED = MY.SPEED*MY.VSPEED/my_distance;         // Feuerball zielt auf PLAYER-HÖhe
	SET		MY.TARGET,FOLLOW;	// Rueckprall
	CALL		explo_light;
	BRANCH	flashball_explo;
}

ACTION flashball_explo {
	SET		MY.IF_HIT,NULL;
	SET		MY.EACH_TICK,flashball_x3;
	SET		MY.PASSABLE,1;
	SET		MY.CAREFULLY,0;
	SET		SHOOT_FAC,1;
	SET		SHOOT_RANGE,12;		//jc 28.10.
	SET		gun_strength,-1000;
	EXPLODE	MY;
	IF_BELOW	RESULT,0.2;	// Player selbst getroffen?
		END;
	RULE		health = health + -40*RESULT;
	RULE		imp_fac = 3*RESULT;
}

ACTION flashball_x3 {
	SET	MY.TEXTURE,flashball_extex;
	SET	MY.PLAY,1;
	PLAY_SOUND	int_ex,0.6,MY;
	SET	MY.EACH_CYCLE,flashball_weg;
	RULE	MY.HEIGHT = MY.HEIGHT - MY.SIZE_Y*0.5;
	SET	MY.EACH_TICK,NULL;
}

ACTION flashball_weg {
	SET	MY.EACH_CYCLE,NULL;
	SET	MY.SPEED,0;
	SET   MY.TEXTURE,leer_tex;  // sonst blinkt letze flash_extex-Phase
	SET   MY.PASSABLE,1;
	SET	MY.INVISIBLE,1;
}


ACTION fire3 {
	PLAY_SOUND	int_schuss,0.6;
	SET		LAYERS.1,zapgun1;
	ADD		PLAYER_LIGHT,0.8;
#	WAIT		1;
#	SET		LAYERS.1,zapgun2;

	CALL		select_myflash;
	CALL		init_flashball;

	WAIT		1;
	SET		LAYERS.1,zapgun3;
#	WAIT		1;
#	SET		LAYERS.1,zapgun4;
	WAIT		1;
	SET		LAYERS.1,zapgun5;
	WAIT		1;
	SET		PLAYER_LIGHT,my_light;
	SET		LAYERS.1,zapgun6;
	WAIT		1;
	SET		LAYERS.1,zapgun0;
	WAIT		9;
	RULE		energy = energy - 32;
	IF_BELOW	energy,1;
		DO		fire_stop;
	IF_EQUAL	KEY_CTRL,1;
		END;
	IF_EQUAL	MOUSE_LEFT,1;
		END;
	DO			fire_stop;
}