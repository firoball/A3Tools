//////////////////////Bug WDL///////////////////////////
///////////////////////////////////////////////////////
//jc
SOUND got_it, <spot1.wav>;
BMAP s_bug, <bugs.lbm>,8,8,128,64;
BMAP g_bug, <bugs.lbm>,144,8,128,64;

TEXTURE silver_bug_tex {
	SCALE_XY 35,35;
	BMAPS		s_bug;
	AMBIENT 	0.7;
	TOUCH		s_bug_touch;
}

TEXTURE gold_bug_tex {
	SCALE_XY 28,30;
	BMAPS		g_bug;
	AMBIENT 	1;
	TOUCH		g_bug_touch;
	FLAGS		CLIP;
}

THING silver_bug {
	TEXTURE	silver_bug_tex;
	HEIGHT	-0.1;
	IF_NEAR 	take_sbug;
#	IF_HIT	hit_sbug;
	EACH_TICK	bug_init;
	FLAGS		SAVE;
}

ACTION hit_sbug {
#	IF_EQUAL	SHOOT_RANGE,14;
		DO		take_sbug;
}

ACTION take_sbug {
	ADD	bugs_weg,1;
	PLAY_SOUND got_it, 0.3; SET MY.INVISIBLE, 1; ADD points, 50;
	SET	screen_msg.STRING,sbuggie; DO show_text;
}

THING gold_bug {
	TEXTURE	gold_bug_tex;
	HEIGHT	-0.2;
	IF_NEAR 	take_gbug;
	IF_HIT		take_gbug;
	EACH_TICK	bug_init;
	FLAGS		SAVE;
}

ACTION hit_gbug {
//	IF_EQUAL	SHOOT_RANGE,14;
//		DO		take_gbug;
	BRANCH	MY.IF_NEAR;
}

ACTION take_gbug {
	ADD	bugs_weg,1;
	PLAY_SOUND got_it, 0.5;
	SET MY.INVISIBLE, 1;
	ADD points, 100;
	SET	screen_msg.STRING,gbuggie;
//jc	Das gehoert nicht hierher!!
//	SET	nach_Bug.EACH_TICK,lift_start;
	 DO show_text;
}

ACTION bug_init {
	SET	MY.EACH_TICK,NULL;
	ADD	bugquote,1;
}
/////////////////Ende der Bug Wdl////////////////////////////////////////

