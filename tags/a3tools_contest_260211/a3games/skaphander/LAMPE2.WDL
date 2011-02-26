
BMAP lampe21,<lamp2.lbm>,7,5,65,159;
BMAP lampe22,<lamp2.lbm>,71,5,65,159;

TEXTURE lampe2_austex {
	SCALE_XY	34,32;
	BMAPS		lampe21;
	TOUCH		lamp2_touch;
	AMBIENT	0.1;
	FLAGS		CLIP;	//jc
}

TEXTURE lampe2_antex {
	SCALE_XY	34,32;
	BMAPS		lampe22;
	TOUCH		lamp2_touch;
	AMBIENT	0.9;
	FLAGS		CLIP;	//jc
}

TEXTURE lampe2_blinktex {
	SCALE_XY	34,32;
	CYCLES	5;
	BMAPS		lampe21,lampe21,lampe21,lampe21,lampe22;
	DELAY		16,16,16,16,16;
	TOUCH		lamp2_touch;
	AMBIENT	0.5;
	FLAGS		CLIP;	//jc
}

THING	lampe2 {
	TEXTURE	lampe2_antex;
#	HEIGHT   -0.1;
	SKILL1	1;		// An-Markierung
	FLAGS		SAVE;
	IF_HIT	lampe2_shit;
	IF_NEAR	lampe2_hit;
}

THING	lampe2_aus {
	TEXTURE	lampe2_austex;
#	HEIGHT   -0.1;
	SKILL1	0;		// Aus-Markierung
	FLAGS		SAVE;
	IF_HIT	lampe2_shit;
	IF_NEAR	lampe2_hit;
}

THING	lampe2_blink {
	TEXTURE	lampe2_blinktex;
#	HEIGHT   -0.1;
	SKILL1	2;		// Blink-Markierung
	FLAGS		SAVE;
	IF_HIT	lampe2_shit;
	IF_NEAR	lampe2_hit;
}

THING	lampe2_rblink {
	TEXTURE		lampe2_blinktex;
#	HEIGHT   	-0.1;
	SKILL7		8;	// *10 = blinkperiode
	EACH_TICK	blink_l2;
	SKILL1		3;		// Random-Blink-Markierung
	FLAGS		SAVE;
	IF_HIT	lampe2_shit;
	IF_NEAR	lampe2_hit;
}


ACTION blink_l2  {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,MY.SKILL7;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_austex;
	IF_ABOVE	RANDOM,0.1;
		END;
	SET		MY.TEXTURE,lampe2_antex;
}


ACTION lampe2_shit {
	IF_EQUAL	SHOOT_RANGE,14;
		END;
	DO			lampe2_hit;
}

ACTION lampe2_hit {
	SET		MY.TEXTURE,lampe2_antex;
	SET		MY.EACH_TICK,lampe2_hit1;
}
ACTION lampe2_hit1 {
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,lampe2_hit1a;
}
ACTION lampe2_hit1a {
	SET		MY.TEXTURE,lampe2_antex;
	SET		MY.EACH_TICK,lampe2_hit1b;
}
ACTION lampe2_hit1b {
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,lampe2_hit1c;
}
ACTION lampe2_hit1c {
	SET		MY.TEXTURE,lampe2_antex;
	SET		MY.EACH_TICK,lampe2_hit1d;
}
ACTION lampe2_hit1d {
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,lampe2_hit2;
}
ACTION lampe2_hit2 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,2;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_antex;
	SET		MY.EACH_TICK,lampe2_hit3;
}
ACTION lampe2_hit3 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,2;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,lampe2_hit4;
}
ACTION lampe2_hit4 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,3;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_antex;
	SET		MY.EACH_TICK,lampe2_hit5;
}
ACTION lampe2_hit5 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,3;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,lampe2_hit6;
}
ACTION lampe2_hit6 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,4;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_antex;
	SET		MY.EACH_TICK,lampe2_hit7;
}
ACTION lampe2_hit7 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,4;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,lampe2_hit8;
}
ACTION lampe2_hit8 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,5;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_antex;
	SET		MY.EACH_TICK,lampe2_hit9;
}
ACTION lampe2_hit9 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,5;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,lampe2_hit10;
}
ACTION lampe2_hit10 {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,5;
		END;
	SET		MY.SKILL8,0;
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,NULL;
	IF_EQUAL	MY.SKILL1,0;	// lampe aus
		END;
	SET		MY.TEXTURE,lampe2_antex;
	IF_EQUAL	MY.SKILL1,1;	// lampe an
		END;
	SET		MY.TEXTURE,lampe2_blinktex;
	IF_EQUAL	MY.SKILL1,2;
		END;
	SET		MY.TEXTURE,lampe2_austex;
	SET		MY.EACH_TICK,blink_l2;
	IF_EQUAL	MY.SKILL1,3;
		END;
}




