////////////////////////////////////////////////////
// Tron-Virus  neu
////////////////////////////////////////////////////
//jc 16.10.	Virus sieht Player nicht, wenn viel hoeher
////////////////////////////////////////////////////

SOUND Tron_Virus,	<tron_vir.wav>;
SOUND Tron_Baller, <schuss1.wav>;
SOUND tron_aua, <tron_au.wav>;
SOUND tron_spot, <tr_tac.wav>;
//SOUND tron_2,  <texplo2.wav>;

////////////////////////////////////////////////////
BMAP	tron_0vh1,<v3_vhs.lbm>,20,12,92,84;
BMAP	tron_0vh2,<v3_vhs.lbm>,180,12,92,84;
BMAP	tron_0vh3,<v3_vhs.lbm>,340,12,92,84;
BMAP	tron_0vh4,<v3_vhs.lbm>,20,117,92,84;
BMAP	tron_0vh5,<v3_vhs.lbm>,180,117,92,84;
BMAP	tron_0vh6,<v3_vhs.lbm>,340,117,92,84;

BMAP	tron_0hre1,<v3_re_li.lbm>,20,12,92,84;
BMAP	tron_0hre2,<v3_re_li.lbm>,180,12,92,84;
BMAP	tron_0hre3,<v3_re_li.lbm>,340,12,92,84;
BMAP	tron_0hre4,<v3_re_li.lbm>,20,117,92,84;
BMAP	tron_0hre5,<v3_re_li.lbm>,180,117,92,84;
BMAP	tron_0hre6,<v3_re_li.lbm>,340,117,92,84;

BMAP	tron_0s1,<v3_vhs.lbm>,20,222,92,84;
BMAP	tron_0s2,<v3_vhs.lbm>,180,222,92,84;
BMAP	tron_0s3,<v3_vhs.lbm>,340,222,92,84;
BMAP	tron_0s4,<v3_vhs.lbm>,20,327,92,84;
BMAP	tron_0s5,<v3_vhs.lbm>,180,327,92,84;
BMAP	tron_0s6,<v3_vhs.lbm>,340,327,92,84;

BMAP	tron_0hli1,<v3_re_li.lbm>,20,222,92,84;
BMAP	tron_0hli2,<v3_re_li.lbm>,180,222,92,84;
BMAP	tron_0hli3,<v3_re_li.lbm>,340,222,92,84;
BMAP	tron_0hli4,<v3_re_li.lbm>,20,327,92,84;
BMAP	tron_0hli5,<v3_re_li.lbm>,180,327,92,84;
BMAP	tron_0hli6,<v3_re_li.lbm>,340,327,92,84;

BMAP	tron_sig,<v3_an.pcx>,20,12,92,84;
BMAP	tron_an2,<v3_an.pcx>,180,12,92,84;
BMAP	tron_an3,<v3_an.pcx>,340,12,92,84;
BMAP	tron_an4,<v3_an.pcx>,20,117,92,84;
BMAP	tron_an5,<v3_an.pcx>,180,117,92,84;
BMAP	tron_an6,<v3_an.pcx>,340,117,92,84;

BMAP    tron_ex0,<v3_ex01.lbm>,0,0,160,105;
BMAP    tron_ex1,<v3_ex01.lbm>,160,0,160,105;
BMAP    tron_ex2,<v3_ex01.lbm>,320,0,160,105;
BMAP    tron_ex3,<v3_ex01.lbm>,0,105,160,105;
BMAP    tron_ex4,<v3_ex01.lbm>,160,105,160,105;
BMAP    tron_ex5,<v3_ex01.lbm>,320,105,160,105;
BMAP    tron_ex6,<v3_ex01.lbm>,0,210,160,105;
BMAP    tron_ex7,<v3_ex01.lbm>,160,210,160,105;
BMAP    tron_ex8,<v3_ex01.lbm>,320,210,160,105;
BMAP    tron_ex9,<v3_ex01.lbm>,0,328,120,118;
BMAP    tron_ex10,<v3_ex01.lbm>,126,328,158,148;
BMAP    tron_ex11,<v3_ex01.lbm>,304,328,140,132;
#BMAP    tron_ex9,<v3_ex.lbm>,0,315,160,105;
#BMAP    tron_ex10,<v3_ex.lbm>,160,315,160,105;
#BMAP    tron_ex11,<v3_ex.lbm>,320,315,160,105;

BMAP	tron_corpse,<knallig.lbm>,437,256,47,21;

////////////////////////////////////////////////////////////
TEXTURE	v_tron_tex {
	SCALE_XY	14,14;
	SIDES		8;
	CYCLES	6;
	BMAPS		tron_0vh1,tron_0vh2,tron_0vh3,tron_0vh4,tron_0vh5,tron_0vh6,
				tron_0hre1,tron_0hre2,tron_0hre3,tron_0hre4,tron_0hre5,tron_0hre6,
				tron_0s1,tron_0s2,tron_0s3,tron_0s4,tron_0s5,tron_0s6,
				tron_0hre1,tron_0hre2,tron_0hre3,tron_0hre4,tron_0hre5,tron_0hre6,
				tron_0vh1,tron_0vh2,tron_0vh3,tron_0vh4,tron_0vh5,tron_0vh6,
				tron_0hli1,tron_0hli2,tron_0hli3,tron_0hli4,tron_0hli5,tron_0hli6,
				tron_0s1,tron_0s2,tron_0s3,tron_0s4,tron_0s5,tron_0s6,
				tron_0hli1,tron_0hli2,tron_0hli3,tron_0hli4,tron_0hli5,tron_0hli6;
	DELAY		3,3,2,2,3,3;
	MIRROR	0,0,0,1,1,1,1,0;
	AMBIENT	0.1;
	SOUND		Tron_Virus;
//	FLAGS		SVIS;	// nur Sound, wenn Tron visible
	SCYCLE	1;
	SVOL		0.4;
	SDIST		40;
	SVDIST	10;
	TOUCH		tron_touch;
}

TEXTURE	v_tron_hovotex {
	SCALE_XY	14,14;
	SIDES		8;
	CYCLES	6;
	BMAPS		tron_0vh1,tron_0vh2,tron_0vh3,tron_0vh4,tron_0vh5,tron_0vh6,
				tron_0hre1,tron_0hre2,tron_0hre3,tron_0hre4,tron_0hre5,tron_0hre6,
				tron_0s1,tron_0s2,tron_0s3,tron_0s4,tron_0s5,tron_0s6,
				tron_0hre1,tron_0hre2,tron_0hre3,tron_0hre4,tron_0hre5,tron_0hre6,
				tron_0vh1,tron_0vh2,tron_0vh3,tron_0vh4,tron_0vh5,tron_0vh6,
				tron_0hli1,tron_0hli2,tron_0hli3,tron_0hli4,tron_0hli5,tron_0hli6,
				tron_0s1,tron_0s2,tron_0s3,tron_0s4,tron_0s5,tron_0s6,
				tron_0hli1,tron_0hli2,tron_0hli3,tron_0hli4,tron_0hli5,tron_0hli6;
	DELAY		5,5,3,3,5,5;
	RANDOM	0.3;
	MIRROR	0,0,0,1,1,1,1,0;
	AMBIENT	-0.3;
	SOUND		Tron_Virus;
	SCYCLE	1;
	SVOL		0.4;
	SDIST		40;
	SVDIST	10;
	TOUCH		tron_touch;
}

TEXTURE	v_tron_hitex {
	SCALE_XY	14,14;
	CYCLES	6;
	BMAPS		tron_0vh1,tron_0vh2,tron_0vh3,tron_0vh4,tron_0vh5,tron_0vh6;
	DELAY		2,2,1,1,2,2;
	AMBIENT	1;
	SOUND		Tron_Virus;
	SCYCLE	1;
	SVOL		0.5;
	SDIST		200;
	SVDIST	30;
	TOUCH		tron_touch;
}

TEXTURE	v_tron_rottex {
	SCALE_XY	14,14;
	CYCLES	7;
	BMAPS		tron_0hre1,tron_0s2,tron_0hli2,tron_0vh3,tron_0hre3,
				tron_0s3,tron_0hli3;
	DELAY		1,1,1,1,1,1,1;
	AMBIENT	0.8;
	FLAGS		ONESHOT;
	SOUND		Tron_Virus;
	SCYCLE	1;
	SVOL		0.5;
	SDIST		200;
	SVDIST	20;
	TOUCH		tron_touch;
}

TEXTURE	v_tron_antex {
	SCALE_XY	14,14;
	CYCLES	7;
	BMAPS		tron_0vh1,tron_an2,tron_an3,tron_an4,tron_an5,tron_an6,tron_an3;
	DELAY		1,1,1,1,1,1,1;
	AMBIENT	0.3;
	SOUND		Tron_baller;
	SCYCLE	4;
	SVOL		0.4;
	SDIST		200;
	SVDIST	20;
	TOUCH		tron_touch;
}

TEXTURE	v_tron_sigtex {
	SCALE_XY	14,14;
	CYCLES	2;
	BMAPS		tron_sig,tron_0vh1;
	DELAY		3,1;
	AMBIENT	1;
	SOUND		tron_spot;
	SCYCLE	1;
	SVOL		0.6;
	SDIST		200;
	SVDIST	20;
	FLAGS		ONESHOT;
	TOUCH		tron_touch;
}

TEXTURE	v_tron_repeltex {
	SCALE_XY	14,14;
	CYCLES	3;
	BMAPS		tron_an2,tron_an3,tron_an2;
	DELAY		1,1,1;
	AMBIENT	1;
	SOUND		Tron_Virus;
	SCYCLE	1;
	SVOL		0.4;
	SDIST		200;
	SVDIST	20;
	FLAGS		ONESHOT;
	TOUCH		tron_touch;
}

TEXTURE	v_tron_extex {
	SCALE_XY	12,12;
	CYCLES	12;
	BMAPS 	tron_ex0,tron_ex1,tron_ex2,tron_ex3,tron_ex4,
				tron_ex5,tron_ex6,tron_ex7,tron_ex8,
				tron_ex9,tron_ex10,tron_ex11;
   DELAY    1,1,1,2,2,3,2,2,2,2,2,3;
	AMBIENT	1;
	FLAGS		ONESHOT,NO_CLIP;
	SVOL		0.6;
	SDIST		300;
	SVDIST	40;
}

TEXTURE	v_tron_restex {
	SCALE_XY	14,14;
	BMAPS		tron_corpse;
	TOUCH		vir0_touch;
FLAGS		CLIP;
}
/////////////////////////////////////////////////////////////
ACTOR	v_tron {
	TEXTURE	v_tron_tex;
	HEIGHT	2;
	SPEED		0.5;
	DIST		60;			// Anfangs-Reaktionsradius
	EACH_TICK tron_init;
}

ACTOR	v_tron_1 {
	TEXTURE		v_tron_tex;
	HEIGHT		2;
	SPEED		0.5;
	DIST		60;			// Anfangs-Reaktionsradius
	SKILL5		1;				// Schwierigkeitslevel
	EACH_TICK 	tron_init;
}
ACTOR	v_tron_2 {
	TEXTURE		v_tron_tex;
	HEIGHT		2;
	SPEED			0.5;
	DIST			60;
	SKILL5		2;
	EACH_TICK 	tron_init;
}
ACTOR	v_tron_3 {
	TEXTURE		v_tron_tex;
	HEIGHT		2;
	SPEED			0.5;
	DIST			60;
	SKILL5		3;
	EACH_TICK 	tron_init;
}
ACTOR	v_tron_b1 {
	TEXTURE		v_tron_tex;
	HEIGHT		1.5;
	SPEED			0.5;
	DIST			60;
	SKILL5		1;
	FLAGS			FLAG6;
	EACH_TICK 	tron_init;
}
ACTOR	v_tron_b2 {
	TEXTURE		v_tron_tex;
	HEIGHT		1.5;
	SPEED			0.5;
	DIST			60;
	SKILL5		2;
	FLAGS			FLAG6;
	EACH_TICK 	tron_init;
}
ACTOR	v_tron_b3 {
	TEXTURE		v_tron_tex;
	HEIGHT		1.5;
	SPEED			0.5;
	DIST			60;
	SKILL5		3;
	FLAGS			FLAG6;
	EACH_TICK 	tron_init;
}
// If he has a WAY, he must not leave his region
// because CAREFULLY is not set!

//////////////////////////////////////////////////////////////
// Tron-Zustaende:
// init:		Nach Initialisierung: Ruhezustand bzw Patrouille; -> wake
// wake:		Tron erblickt Player, sendet blaues Signal,
//				alarmiert andere Trons -> atak, hit
//	atak:		Angriff mit Feuern, Bewegung auf Player zu,
//				seitliche Ausweichbewegungen -> lurk, fire, triple
// triple:	Stillstand, 3 Schuesse; -> strafe
//	fire:		Bewegung auf Player zu mit Dauerfeuer; -> strafe
//	retreat:	Zurueckweichen vor Player, wenn zu nahe; -> strafe
// strafe:	Ausweichen ohne Feuern links oder rechts
//				oder gerade auf Player zu ohne Feuern; -> fire/tripke
// lurk:		Lauerzustand nach Fehlschuss,
//				Player langsam verfolgen ohne Feuern; -> atak, hit
// repel:	Rueckprall bei leichtem Treffer; -> triple, strafe, hovo
// rotate:	Dreher bei schwarem Treffer; -> strafe, hovo
// hovo:		Schwer angeschlagen - Flucht vor Player; -> atak
// explo: 	Erledigt; -> Explosion

////////////////////////////////////////////////////
// Tron auf Standardwerte initialisieren
ACTION tron_init {
	SET		MY.TEXTURE,v_tron_tex;
	SET		MY.armor,1000;	// Panzerung
   SET      MY.SKILL2,130;    // Treffer-Reichweite
	SET		MY.SKILL3,-50;		// Treffer-Wirkung
	SET		MY.SKILL4,10;		// Points pro Abschuss
	SET		MY.SKILL8,0;		// Counter
#	SET		MY.CAREFULLY,1;	// set it later for speed-up
	SET		MY.FRAGILE,1;
	SET		MY.GROUND,1;
#	SET		MY.SKILL3,MY.HEIGHT;	// Abschuss-Hoehe
	SET		MY.IF_NEAR,tron_wake;
	SET		MY.IF_HIT,tron_wake;
	BRANCH	virus_init;
}

////////////////////////////////////////////////////
// Tron erblickt Player, wird sauer und alarmiert andere Trons
ACTION tron_wake {
	SET		MY.CAREFULLY,1;
// unter wasser keine wirkung
	IF_EQUAL	THERE.FLAG8,0;
		GOTO	no_uw;
	IF_EQUAL	MY.GROUND,0;
		GOTO	no_uw;
	IF_ABOVE	THERE.SKILL5,MY.HEIGHT;
		END;
no_uw:

#	IF_EQUAL HERE.FLAG5,1; // vor grÅnem Matma warten
#		GOTO warten;
#	IF_EQUAL underwater,1; // vor Wasser warten
#		GOTO warten;

#   SKIP 3;

#warten:   SET MY.SPEED,0;
#		    SET MY.VSPEED,0;
#		    SET MY.TARGET,NULL;

	SET		MY.IF_NEAR,NULL;
	SET		MY.IF_HIT,tron_hit;

	SET		MY.EACH_TICK,NULL;
	SET		MY.EACH_CYCLE,tron_wake;	// Periodisch nach Player ausschauen

#	SET		vhit_force,MY.RESULT;
	CALL		tron_look;
	IF_EQUAL	HIT_DIST,0;			// Player nicht sichtbar?
		GOTO	no_alarm;

	SET		MY.TEXTURE,v_tron_sigtex;	// Blau aufblinken
	SET		MY.PLAY,1;
	SET		SHOOT_FAC,0;
	SET		SHOOT_RANGE,WARN_DIST;
	EXPLODE	MY;								// Viren im Umkreis alarmieren
	SET		MY.EACH_CYCLE,tron_atak;	// Player angreifen
no_alarm:
        END;
}

ACTION tron_look {
	SET		HIT_DIST,MY.DISTANCE;
	IF_EQUAL	MY.VISIBLE,1;
		END;
//jc 16.10.
	SET		HIT_DIST,0;
	RULE		val1 = MY.HEIGHT + MY.Z - PLAYER_Z;
	IF_ABOVE	val1,10;
		END;	// nicht sehen, wenn 10 steps hoeher

	SET		SHOOT_Y,0.4;		// Tron-Augen sind oben
	SET 		SHOOT_FAC,0;
	SET		SHOOT_RANGE,300;
	SHOOT		MY;
	SET		SHOOT_Y,0;
}
////////////////////////////////////////////////
// Tron ist getroffen
ACTION tron_hit {
	EXCLUSIVE;
	SET		MY.EACH_TICK,NULL;
	SET		MY.EACH_CYCLE,NULL;
	CALL		virus_hit;
// Jetzt Trefferstaerke testen und reagieren
	IF_BELOW vhit_force,-15;
		PLAY_SOUND	tron_aua,0.4;
	IF_BELOW	MY.armor,1;			// Volltreffer
		BRANCH	tron_explode;
	IF_BELOW vhit_force,-75;		// schwerer Treffer: rotieren
		BRANCH 	tron_rotate;
	IF_BELOW vhit_force,-40;
		BRANCH	tron_repel;
	IF_BELOW	MY.armor,300;			// Schwer angeschlagen?
		BRANCH	tron_hosenvoll;	// direkter Uebergang wg. alarm

	IF_BELOW RANDOM,0.5;
		BRANCH	tron_strafe;
	BRANCH	tron_atak;
}

ACTION tron_rotate {
	SET		MY.TEXTURE,v_tron_rottex;
	SET		MY.PLAY,1;

	SET		MY.SPEED,0;
	SET		MY.TARGET,NULL;

	SET		MY.EACH_TICK,NULL;			// Counter abbrechen
	SET		MY.EACH_CYCLE,tron_strafe;
	IF_BELOW	MY.armor,300;					// Schwer angeschlagen?
		SET	MY.EACH_CYCLE,tron_hosenvoll;
}

ACTION tron_repel {
	SET		MY.TEXTURE,v_tron_repeltex;
	SET		MY.PLAY,1;

	SET		MY.SPEED,1;
	SET		MY.TARGET,REPEL;

	SET		MY.EACH_TICK,NULL;
	SET		MY.EACH_CYCLE,tron_strafe;
	IF_BELOW	RANDOM,0.5;
		SET	MY.EACH_CYCLE,tron_triple;
	IF_BELOW	RANDOM,0.2;
		SET	MY.EACH_CYCLE,tron_fire;
	IF_BELOW	MY.armor,300;
		SET	MY.EACH_CYCLE,tron_hosenvoll;
}

ACTION tron_explode {
	EXCLUSIVE;
#	SET		MY.SKILL3,MY.HEIGHT;
	SET		MY.TEXTURE,v_tron_extex;
	SET		MY.EACH_TICK,NULL;
	SET      MY.EACH_CYCLE,tron_rest;
	PLAY_SOUND	tron_bang,0.7,MY;
	BRANCH 	rest_explode;
}

//jc 18.09.
ACTION tron_rest {
	EXCLUSIVE;
	SET		MY.TEXTURE,v_tron_restex;
	BRANCH	virus_die;
}

////////////////////////////////////////////////////
// Angriffs-Aktionen
ACTION tron_atak {
// Zuerst nach Player Ausschau halten
	IF_EQUAL	underwater,1;		// nicht treffen, wenn Player unter Matma
		BRANCH	tron_lurk;		// auf Auftauchen des Players lauern

// nicht treffen, wenn bei GROUND ober- oder unterhalb Playerhoehe
	RULE		val1 = MY.HEIGHT - PLAYER_Z;
 	IF_ABOVE val1,2;
		BRANCH	tron_lurk;
 	IF_BELOW val1,-10;
		BRANCH	tron_lurk;

	CALL		tron_look;
	IF_EQUAL	HIT_DIST,0;			// Player nicht sichtbar?
		BRANCH	tron_lurk;
	IF_ABOVE	RANDOM,0.5;
		BRANCH	tron_triple;
	BRANCH	tron_fire;
}

// Mit Dauerfeuer auf Player zu
ACTION tron_fire {
	EXCLUSIVE;
	SET		MY.TEXTURE,v_tron_antex;
	SET		MY.EACH_CYCLE,tron_shoot;
	SET		MY.SKILL8,0;			// Counter fuer strafe etc.
	SET		MY.EACH_TICK,tron_firecount;

	SET		val1,MY.DISTANCE;		// Bewegung um so schneller,
	RULE		val1 = 0.5 + 0.01*val1;
	IF_ABOVE	val1,1.5;				// je weiter tron entfernt
		SET	val1,1.5;
	SET		MY.SPEED,val1;
	SET		MY.VSPEED,0.5;
	SET		MY.TARGET,FOLLOW;

	SET		MY.DIST,10;
	SET		MY.IF_NEAR,tron_retreat;
	SET		MY.IF_FAR,NULL;
	IF_BELOW	MY.DISTANCE,12;		// Wenn bereits sehr nahe..
		BRANCH	tron_retreat;
}

ACTION tron_firecount {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,32;			// 2 Sekunden warten..
		END;
	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,NULL;
	BRANCH	tron_strafe;
}

// Von Player weg mit Dauerfeuer
ACTION tron_retreat	{
	SET		MY.TEXTURE,v_tron_antex;
	SET		MY.EACH_CYCLE,tron_shoot;
	SET		MY.DIST,14;				// Hysterese
	SET	 	MY.SPEED,0.5;
	SET		MY.TARGET,REPEL;
	SET		MY.IF_NEAR,NULL;
	SET		MY.IF_FAR,tron_strafe;
}

// Stehenbleiben, Einzelschuesse abgeben
ACTION tron_triple	{
	EXCLUSIVE;
	SET		MY.TEXTURE,v_tron_antex;
	SET		MY.EACH_CYCLE,tron_shoot;
	SET		MY.SKILL8,0;			// Counter fuer strafe
	SET		MY.EACH_TICK,tron_triplecount;
	SET	 	MY.SPEED,0.2;
	SET		MY.VSPEED,0.5;
	SET		MY.TARGET,FOLLOW;
	SET		MY.DIST,12;
	SET		MY.IF_NEAR,tron_retreat;
}

ACTION tron_triplecount {
	ADD		MY.SKILL8,timefac_1;
	IF_BELOW	MY.SKILL8,48;			// 3/2 Sekunden warten..
		END;
	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,NULL;

	IF_BELOW	MY.DISTANCE,8;
		BRANCH	tron_retreat;
	BRANCH	tron_strafe;
}


ACTION tron_strafe {
	SET		MY.TEXTURE,v_tron_tex;
	SET		MY.EACH_CYCLE,NULL;	// nicht mehr feuern

	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,tron_strafecount;

	RULE		MY.SPEED = 0.5 + 0.01*MY.DISTANCE;
	IF_ABOVE	MY.SPEED,1.5;
		SET	MY.SPEED,1.5;
    CALL            set_vspeed ;
	SET		MY.ANGLE,PLAYER_ANGLE;
	SET		MY.VSPEED,0;
	SET		MY.TARGET,MOVE;		// geradlinige Bewegung
	# SET      MY.PASSABLE,0;
	ADD		virus_dir,1;
	IF_BELOW	virus_dir,3;
		GOTO	strf_rechts;
	SET		virus_dir,0;
	ADD		MY.ANGLE,2.75;			// schraeg links ausweichen
	IF_BELOW	MY.DISTANCE,14;		// Wenn zu nahe,
		ADD	MY.ANGLE,-1.5;			// nach hinten ausweichen
	END;
strf_rechts:
	IF_BELOW	virus_dir,2;
		GOTO	strf_gerade;
	ADD		MY.ANGLE,-2.75;		// schraeg rechts ausweichen
	IF_BELOW	MY.DISTANCE,14;
		ADD	MY.ANGLE,1.5;
	END;
strf_gerade:
	IF_BELOW	MY.DISTANCE,14;
		BRANCH	tron_retreat;
	SET		MY.VSPEED,0.5;
	SET		MY.TARGET,FOLLOW;
}

ACTION tron_strafecount {
	ADD		MY.SKILL8,TIME_CORR;
	RULE		val1=40*RANDOM + 16;	// Zufallszeit abwarten..
	IF_BELOW	MY.SKILL8,val1;
		END;
	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,NULL;

	IF_BELOW	random_1,0.3;
		BRANCH	tron_fire;
	IF_BELOW	random_1,0.6;
		BRANCH	tron_triple;
	IF_BELOW	MY.DISTANCE,8;
		BRANCH	tron_retreat;
	BRANCH	tron_strafe;
}

// Schuss abgeben
ACTION tron_shoot {
	IF_BELOW	MOVE_MODE,1;
		END;
	IF_EQUAL	underwater,1;			// nicht treffen, wenn Player unter Matma
		BRANCH	tron_lurk;	// Auf Auftauchen des Players lauern

// nicht treffen, wenn bei GROUND ober- oder unterhalb Playerhoehe
	IF_EQUAL	MY.GROUND,0;
		GOTO	ts_noground;
	RULE		val1 = MY.HEIGHT - PLAYER_Z;
 	IF_ABOVE val1,2;
		BRANCH	tron_lurk;
 	IF_BELOW val1,-10;
		BRANCH	tron_lurk;
ts_noground:

   SET      MY.IF_HIT, tron_hit;
#   SET      SHOOT_SECTOR,0.1;       //   winkelfenster
   SET		SHOOT_Y,-0.5;		// Tron schiesst mit den Beinen
	SET		SHOOT_RANGE,MY.SKILL2;
   SET      SHOOT_FAC,0.9;
	SHOOT		MY;
	SET		SHOOT_Y,0;
	IF_EQUAL	HIT_DIST,0;			// Kein Treffer?
		BRANCH	tron_lurk;		// Tron gefrustet
   RULE     imp_fac = RESULT;
	CALL		schubs;			// Player anstossen
	SET		hit_force,MY.SKILL3;	// Tron-Trefferwirkung
   BRANCH	player_hit;			// Rest in skaphndr.wdl
}

////////////////////////////////////////////////////
// Langsam verfolgen, auf Player lauern
ACTION tron_lurk {
	SET		MY.EACH_TICK,NULL;
	SET		MY.TEXTURE,v_tron_tex;
// Jede Sekunde nach Player ausschauen
	SET		MY.EACH_CYCLE,tron_atak;

	SET		MY.DIST,30;
	SET		MY.IF_NEAR,tron_wake;
	SET		MY.IF_FAR,NULL;
	SET		MY.IF_HIT,tron_wake;

	RULE		MY.SPEED = 0.5 + 0.01*MY.DISTANCE;
	IF_ABOVE	MY.SPEED,1.5;
		SET	MY.SPEED,1.5;
	SET		MY.VSPEED,0.5;
	SET		MY.TARGET,FOLLOW;
	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,tron_lurkcount;
}

ACTION tron_lurkcount {
	ADD		MY.SKILL8,TIME_CORR;
	IF_BELOW	MY.SKILL8,1000;			// Nach einer Minute stillegen
		END;
	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,NULL;
	SET		MY.SPEED,0;
	SET		MY.TARGET,NULL;			// Tron stillegen
}

////////////////////////////////////////////////////
// Flucht vor Player
ACTION tron_hosenvoll {
	SET		MY.TEXTURE,v_tron_hovotex;
	SET		MY.SPEED,1;
	SET		MY.TARGET,REPEL;
	SET		MY.IF_NEAR,tron_wake;
	SET		MY.IF_HIT,tron_hit;
	SET		MY.DIST,0;
	SET		MY.IF_FAR,NULL;

	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,tron_hovocount;
	SET		MY.EACH_CYCLE,NULL;
}

ACTION tron_hovocount {
	ADD		MY.SKILL8,TIME_CORR;
	RULE		val1=200*RANDOM + 200;	// Zufallszeit abwarten..
	IF_BELOW	MY.SKILL8,val1;
		END;
	SET		MY.SKILL8,0;
	SET		MY.EACH_TICK,NULL;

	IF_ABOVE	random_1,0.5;
		BRANCH	tron_lurk;				// Manchmal wieder aufwachen...

	SET		MY.SPEED,0;
	SET		MY.TARGET,NULL;			// Tron stillegen
}
////////////////////////////////////////////////////
