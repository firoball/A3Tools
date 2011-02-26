////////////////////////////////////////////////////
//======= XMAS-VIRUS 2. Version mit DB-GRAFIKEN=====
// init:			Nach Initialisierung: Ruhezustand bzw Patrouille; -> wake
// wake:			x erblickt Player, wird kurz hell,
//					alarmiert andere ixe -> atak, hit
//	attack:		Angriff mit Bewegung auf Player zu, kurzes abwarten
//					seitliche Ausweichbewegungen ->
//	attack2:		Angriff mit Bewegung auf Player zu,
// hurtme:		rammen und abhauen
// ausweich:	Ausweichen ohne Rammen links oder rechts
//					oder gerade auf Player zu  ->
// strafe:		Ausweichen mit strafecounter
// lurk:			Lauerzustand,  langsam verfolgen; -> atak, hit
// repel:		Rueckprall bei leichtem Treffer; -> strafe, hovo
// hovo:			Schwer angeschlagen - Flucht vor Player; -> atak
// explo: 		Erledigt; -> Explosion

////////////////////////////////////////////////////
SOUND xmas,<xmas_0.wav>;
SOUND xmas_Kill,<wei_kil2.wav>;
SOUND xkill_2,<newex8.wav>;
SOUND xkill_3,<newex9.wav>;

SOUND x_aua,<wei_au.wav>;
SOUND x_spot,<xmas_1.wav>;

////////////////////////////////////////////////////
BMAP	xmas_1,<v2_norm.lbm>,32,14,78,78;
BMAP	xmas_2,<v2_norm.lbm>,192,14,78,78;
BMAP	xmas_3,<v2_norm.lbm>,352,14,78,78;
BMAP	xmas_4,<v2_norm.lbm>,32,119,78,78;
BMAP	xmas_5,<v2_norm.lbm>,192,119,78,78;
BMAP	xmas_6,<v2_norm.lbm>,352,119,78,78;
BMAP	xmas_7,<v2_norm.lbm>,32,224,78,78;
BMAP	xmas_8,<v2_norm.lbm>,192,224,78,78;
BMAP	xmas_9,<v2_norm.lbm>,352,224,78,78;
BMAP	xmas_10,<v2_norm.lbm>,32,329,78,78;
BMAP	xmas_11,<v2_norm.lbm>,192,329,78,78;
BMAP	xmas_12,<v2_norm.lbm>,352,329,78,78;

BMAP	xmas_an1,<v2_an_ex.lbm>,25,8,92,87;
BMAP	xmas_an2,<v2_an_ex.lbm>,185,8,92,87;
BMAP	xmas_an3,<v2_an_ex.lbm>,345,8,92,87;
BMAP	xmas_an4,<v2_an_ex.lbm>,25,113,92,87;
BMAP	xmas_an5,<v2_an_ex.lbm>,185,113,92,87;
BMAP	xmas_an6,<v2_an_ex.lbm>,345,113,92,87;

BMAP    xmas_ex1,<v2_an_ex.lbm>,32,222,128,128;
BMAP    xmas_ex2,<v2_an_ex.lbm>,232,222,128,128;
BMAP    xmas_ex3,<v2_an_ex.lbm>,432,222,128,128;
BMAP    xmas_ex4,<v2_an_ex.lbm>,32,372,128,128;
BMAP    xmas_ex5,<v2_an_ex.lbm>,232,372,128,128;
BMAP    xmas_ex6,<v2_an_ex.lbm>,432,372,128,128;

BMAP	x_corpse,<knallig.lbm>,344,256,35,17;

TEXTURE	v_xmas_restex {
	SCALE_XY	12,12;
	BMAPS		x_corpse;
#	FLAGS		DIAPHANOUS;
	TOUCH		vir0_touch;
}

TEXTURE	v_xmas_tex {
	SCALE_XY	16,16;
	CYCLES	12;
	BMAPS		xmas_1,xmas_2,xmas_3,xmas_4,xmas_5,xmas_6,
				xmas_7,xmas_8,xmas_9,xmas_10,xmas_11,xmas_12;
	DELAY		1,1,1,1,1,1,1,1,1,1,1,1;
	AMBIENT	0.1;
	SOUND		xmas;
	SCYCLE	1;
	SVOL		0.25;
	SDIST		90;
	SVDIST	15;
	FLAGS		DIAPHANOUS;
	TOUCH		xmas_touch;
}

TEXTURE	v_xmas_antex {
	SCALE_XY	16,16;
	CYCLES	10;
	BMAPS		xmas_an1,xmas_an2,xmas_an3,xmas_an4,xmas_an5,xmas_an6,
				xmas_an5,xmas_an4,xmas_an3,xmas_an2;
	DELAY		1,1,1,1,1,1,1,1,1,1;
	AMBIENT	0.3;
	SOUND		x_spot;
	SCYCLE	1;
	SVOL		0.3;
	SDIST		250;
	SVDIST	30;
	TOUCH		xmas_touch;
}

TEXTURE	v_xmas_hittex {
	SCALE_XY	16,16;
	CYCLES	10;
	BMAPS		xmas_an1,xmas_an2,xmas_an3,xmas_an4,xmas_an5,xmas_an6,
				xmas_an5,xmas_an4,xmas_an3,xmas_an2;
	DELAY		1,1,1,1,1,1,1,1,1,1;
	AMBIENT	0.9;
	FLAGS		ONESHOT;
	SOUND		x_aua;
	SCYCLE	1;
	SVOL		0.3;
	SDIST		100;
	SVDIST	30;
	TOUCH		xmas_touch;
}
TEXTURE	v_xmas_sigtex {
	SCALE_XY	16,16;
	CYCLES	10;
	BMAPS		xmas_an1,xmas_an2,xmas_an3,xmas_an4,xmas_an5,xmas_an6,
				xmas_an5,xmas_an4,xmas_an3,xmas_an2;
	DELAY		1,1,1,1,1,1,1,1,1,1;
	AMBIENT	1;
	FLAGS		ONESHOT;
	SOUND		x_spot;
	SCYCLE	1;
	SVOL		0.4;
	SDIST		100;
	SVDIST	20;
	TOUCH		xmas_touch;
}

TEXTURE	v_xmas_extex {
	SCALE_XY	12,12;
	CYCLES	6;
	BMAPS		xmas_ex1,xmas_ex2,xmas_ex3,xmas_ex4,xmas_ex5,xmas_ex6;
	DELAY		1,1,1,2,2,1;
	FLAGS		ONESHOT;
	AMBIENT	1;
	SDIST		1000;
#	SVDIST	40;
}


///////////////////////////////////////////////////////////////////
ACTOR	v_xmas {
	TEXTURE		v_xmas_tex;
	HEIGHT		2;
	SKILL7		0;
	EACH_TICK	xmas_init;
}
ACTOR	v_xmas_1 {
	TEXTURE		v_xmas_tex;
	HEIGHT		2;
	SKILL5      1;
	SKILL7		0;
	EACH_TICK	xmas_init;
}
ACTOR	v_xmas_2 {
	TEXTURE		v_xmas_tex;
	HEIGHT		2;
	SKILL5      2;
	SKILL7		0;
	EACH_TICK	xmas_init;
}
ACTOR	v_xmas_3 {
	TEXTURE		v_xmas_tex;
	HEIGHT		2;
	SKILL5      3;
	SKILL7		0;
	EACH_TICK	xmas_init;
}

//////////////////////////////////////////////////////////////
// Virus auf Standardwerte initialisieren
ACTION xmas_init {
	IF_EQUAL	MY.SKILL7,0;
	   SET      MY.armor,250;    // Panzerung
	IF_EQUAL	MY.SKILL7,1;
	   SET      MY.armor,300;
	IF_EQUAL	MY.SKILL7,2;
	   SET      MY.armor,500;
	IF_EQUAL	MY.SKILL7,3;
	   SET      MY.armor,750;
	IF_EQUAL	MY.SKILL7,0;
		SET		MY.SKILL3,-15;		// Treffer-Wirkung
	IF_EQUAL	MY.SKILL7,1;
		SET		MY.SKILL3,-15;
	IF_EQUAL	MY.SKILL7,2;
		SET		MY.SKILL3,-20;
	IF_EQUAL	MY.SKILL7,3;
		SET		MY.SKILL3,-30;

	SET		MY.SKILL4,5;		// Points pro Abschuss
	SET		MY.DIST,60;
	SET		MY.GROUND,1;
	SET 		MY.CAREFULLY,1;
	SET		MY.SENSITIVE,1;	// wake up if seen
	SET		MY.FRAGILE,1;
	SET		MY.IF_NEAR,x_wake;
	SET		MY.IF_HIT,x_wake;
	CALL		virus_init;
}

ACTION x_wake {
	EXCLUSIVE;
	SET		MY.SENSITIVE,0;		// don't trigger IF_HIT in collisions
	SET		MY.IF_NEAR,xmas_attack;
	SET		MY.IF_HIT,xmas_hit;

look:
	CALL		x_look_for_player;
	IF_ABOVE	HIT_DIST,0;				// Player visible?
		GOTO	spot;
	WAITT		16;
	GOTO		look;

spot:
	SET		MY.TEXTURE,v_xmas_sigtex;	// aufblinken
	SET		MY.PLAY,1;
	WAITT		4;	// Verhindere sofortige EXPLODE-Reaktion auf IF_HIT
	SET		SHOOT_FAC,0;
	SET		SHOOT_RANGE,WARN_DIST;
	EXPLODE	MY;					// andere viren warnen
	WAITT		4;
	BRANCH	xmas_attack;		// Player attackieren
}

ACTION x_look_for_player {
	SET		HIT_DIST,MY.DISTANCE;
	IF_EQUAL	MY.VISIBLE,1;
		END;
	SET		HIT_DIST.MIN,0;
	SET		HIT_DIST,0;
	RULE		val1 = MY.HEIGHT + MY.Z - PLAYER_Z;
	IF_ABOVE	val1,10;
		END;	// nicht sehen, wenn 10 steps hoeher

	SET		SHOOT_Y,0;
	SET 		SHOOT_FAC,0;
	SET		SHOOT_RANGE,300;
	SHOOT		MY;
}

////////////////////////////////////////////////////
ACTION xmas_attack {
	EXCLUSIVE;
	IF_EQUAL	underwater,1;	// nicht treffen, wenn Player unter Matma
		BRANCH	x_lurk;		// Auf Auftauchen des Players lauern
// nicht angreifen, wenn ober- oder unterhalb Playerhoehe
	RULE		val1 = MY.HEIGHT - PLAYER_Z;
 	IF_ABOVE val1,3;
		BRANCH	x_lurk;
 	IF_BELOW val1,-4;
		BRANCH	x_lurk;

	SET		MY.TEXTURE,v_xmas_antex;	// aufblinken
	CALL		x_look_for_player;
	IF_EQUAL	HIT_DIST,0;		// Player nicht sichtbar?
		BRANCH	x_lurk;

  	SET		MY.SPEED,1.5;
	SET		MY.VSPEED,0.3;
	SET		MY.TARGET,FOLLOW;
	SET 		MY.DIST,15;				// x-spezifische Angriffsdistanz
   SET		MY.IF_NEAR,x_attack2;

	IF_BELOW MY.DISTANCE,15; 	// abtesten ob er nicht schon nah dran ist
		BRANCH x_attack2;

attack:
	WAITT		48;

	IF_BELOW	RANDOM,0.2;
		BRANCH	x_repel;
	IF_BELOW	RANDOM,0.6;
		BRANCH	x_strafe;
	GOTO			attack;
}

///schrecksekunde
ACTION x_attack2 {
	EXCLUSIVE;
	SET		MY.TEXTURE,v_xmas_antex;
	SET		MY.TARGET,NULL;
	SET		MY.SPEED,0;
	SET		MY.VSPEED,0;
	SET 		MY.DIST,0;
   SET		MY.IF_NEAR,xmas_hurtme;

	WAITT		8;

	SET		MY.TARGET,FOLLOW;
	SET		MY.VSPEED,0.5;
  	SET		MY.SPEED,2.5;

	WAITT		100;
	BRANCH	xmas_attack;
}

ACTION xmas_hurtme {
	IF_EQUAL	underwater,1;	// nicht treffen, wenn Player unter Matma
		BRANCH	x_lurk;		// Auf Auftauchen des Players lauern
// nicht angreifen, wenn ober- oder unterhalb Playerhoehe
	RULE		val1 = MY.HEIGHT - PLAYER_Z;
 	IF_ABOVE val1,2;
		BRANCH	x_lurk;
	IF_BELOW val1,-5;
		BRANCH	x_lurk;

	PLAY_SOUND	x_bang,0.3;
	ADD		health,MY.SKILL3;
	SET		HIT_DIST,15;
	SET		imp_fac,1;
	CALL		schubs;
	BRANCH 	x_repel;
}

//////////////////////////////////////////////////
ACTION x_lurk {
	SET		MY.TEXTURE,v_xmas_tex;
	SET		MY.DIST,60;
	SET		MY.IF_FAR,NULL;
	RULE		MY.SPEED = 0.2 + 0.01*MY.DISTANCE;
	IF_ABOVE	MY.SPEED,1.5;
		SET	MY.SPEED,1.5;
	SET		MY.VSPEED,0.3;
	SET		MY.TARGET,FOLLOW;
	BRANCH	x_wake;
}

//////////repel-act
ACTION x_repel {						// retreat nach angriff
	EXCLUSIVE;
	SET		MY.IF_NEAR,NULL;		// sonst dauernd Verletzung
	SET		MY.TEXTURE,v_xmas_tex;
	SET		MY.SPEED,1.7;
	SET		MY.VSPEED,0;
	SET		MY.TARGET,REPEL;

	WAITT		20;

	IF_BELOW	RANDOM,0.6;
		BRANCH	x_strafe;
	BRANCH	xmas_attack;
}

////////////////strafe-act
ACTION x_strafe {
	EXCLUSIVE;
	SET		MY.IF_NEAR,xmas_attack;
	SET		MY.TEXTURE,v_xmas_tex;
	SET		MY.ANGLE,PLAYER_ANGLE;
	SET		MY.SPEED,1.5;
	RULE		MY.VSPEED = -0.04 + 0.1 * RANDOM;
	SET		MY.TARGET,MOVE;		// geradlinige Bewegung

	ADD		virus_dir,1;
	IF_BELOW	virus_dir,2;
		GOTO	strf_rechts;
	SET		virus_dir,0;
	ADD		MY.ANGLE,2;			// schraeg links ausweichen
	IF_BELOW	MY.DISTANCE,14;		// Wenn zu nahe,
		ADD	MY.ANGLE,-0.25;		// nach hinten ausweichen
	GOTO		go_on;
strf_rechts:
	ADD		MY.ANGLE,-2;			// schraeg rechts ausweichen
	IF_BELOW	MY.DISTANCE,14;
		ADD	MY.ANGLE,0.25;
go_on:
	WAITT		24;

	IF_BELOW	RANDOM,0.5;
		BRANCH	xmas_attack;
	BRANCH	x_strafe;
}

////////hit-act x ist getroffen
ACTION xmas_hit {
	EXCLUSIVE;
	CALL		virus_hit;

	IF_BELOW	MY.armor,1;			// Volltreffer
		BRANCH	xmas_explode;

	IF_BELOW vhit_force,-15;
		PLAY_SOUND x_aua, 0.3;

	IF_BELOW vhit_force,-75;		// schwerer Treffer: abhauen
		BRANCH	x_rueckprall;

	IF_BELOW	MY.armor,100;			// Schwer angeschlagen?
		BRANCH	x_hosenvoll;		// direkter Uebergang wg. alarm

	IF_BELOW	RANDOM,0.3;
		BRANCH	xmas_attack;
	BRANCH	x_strafe;
}


ACTION x_rueckprall {
	EXCLUSIVE;
	SET		MY.TEXTURE,v_xmas_hittex;
	SET		MY.PLAY,1;
	SET		MY.SPEED,1.7;
	SET		MY.VSPEED,0;
	SET		MY.TARGET,REPEL;

	IF_BELOW	MY.armor,100;			// Schwer angeschlagen?
		BRANCH	x_hosenvoll;

	WAITT		16;
	BRANCH	x_strafe;
}

////////// Flucht vor Player (hovo-act)
ACTION x_hosenvoll {
	EXCLUSIVE;
		SET	MY.TEXTURE,v_xmas_hittex;
	SET		MY.PLAY,1;
	SET		MY.SPEED,1.8;
	SET		MY.VSPEED,0;
	SET		MY.TARGET,REPEL;
	SET		MY.DIST,60;
	SET		MY.IF_NEAR,x_wake;
	SET		MY.IF_HIT,xmas_hit;

	WAITT		160;

	IF_ABOVE	RANDOM,0.7;
		BRANCH	xmas_attack;				// Manchmal wieder aufwachen...
#	IF_ABOVE	RANDOM,0.3;
	BRANCH	x_strafe;

#	SET		MY.SPEED,0;
#	SET		MY.VSPEED,0;
#	SET		MY.TARGET,NULL;			// virus stillegen
}

///////////explode & disappear-act
ACTION xmas_explode {
	EXCLUSIVE;
	SET		MY.TEXTURE,v_xmas_extex;
	PLAY_SOUND xmas_kill,0.7,MY;
	SET		MY.EACH_CYCLE,x_rest;
	SET		MY.IF_ARRIVED,NULL;
	BRANCH	rest_explode;
}

ACTION x_rest {
	EXCLUSIVE;
	SET		MY.TEXTURE,v_xmas_restex;
	BRANCH	virus_die;
}

