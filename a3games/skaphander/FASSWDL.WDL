//////////////////////////////////////////////////////////////
SOUND fasstreff,<walbang1.wav>;
SOUND fassrums,<fbum.wav>;			#beim runterkommen
SOUND Wandbang, <w_bang2.wav>; 		#Aufprall
////////////////////////////////////////////////////////////
BMAP fass1,<tonne_2.lbm>,  0,0,82,164;
BMAP fass2,<tonne_2.lbm>, 88,0,82,164;
BMAP fass3,<tonne_2.lbm>,176,0,82,164;
BMAP fass4,<tonne_2.lbm>,264,0,82,164;
BMAP fass5,<tonne_2.lbm>,352,0,82,164;

TEXTURE fass {
	SCALE_XY	35,35;
	CYCLES	5;
	BMAPS		fass1,fass2,fass3,fass4,fass5;
	FLAGS		ONESHOT,CLIP;
	DELAY    3,3,3,3,3;
	FONT		msg_font;
	TOUCH		tonne2_touch;
}

THING	barrel {
	TEXTURE	fass;
	IF_NEAR	BarrelTouch_act;
	IF_HIT	Barrel_Hit;
	FLAGS		FRAGILE,SAVE;
	HEIGHT   0;
}


ACTION BarrelTouch_act {
	PLAY_SOUND	wandbang,0.2;
//	SET 	MY.EACH_TICK dotz;
}

SKILL hupf_random { VAL 0; }

ACTION	Barrel_Hit {
	IF_EQUAL	SHOOT_RANGE,14;
		BRANCH	BarrelTouch_act;
	IF_BELOW	MY.RESULT,0.1;
		END;
	PLAY_SOUND	fasstreff,0.2;
	RULE	MY.SKILL1 = 1+hupf_random;	// damit nicht alle Faesser gleich hupfen
	ADD	hupf_random,0.05;
	IF_ABOVE hupf_random,0.25;
		SET	hupf_random,-0.15;
	SET	MY.EACH_TICK,barrel_hupf;
}

ACTION barrel_hupf {
	SET	RENDER_MODE,1;
	ADD	MY.HEIGHT,MY.SKILL1;
	RULE	val1 = THERE.CEIL_HGT - THERE.FLOOR_HGT + MY.SIZE_Y;
	IF_ABOVE	MY.HEIGHT,val1;	// stoesst Fass an Decke?
		SET	MY.HEIGHT,val1;

	RULE	MY.SKILL1 = MY.SKILL1 - 0.15*TIME_CORR;
	IF_ABOVE	MY.HEIGHT,0;
		END;
	PLAY_SOUND	fassrums,0.3;
	SET	MY.EACH_TICK,NULL;
	SET	MY.HEIGHT,0;
	SET 	MY.PLAY,1;
}


