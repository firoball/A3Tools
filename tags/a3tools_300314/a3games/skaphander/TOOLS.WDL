//////////////////////////////////////////////////////////////
// Objekte ///////ACHTUNG ! alle Things mit "_unt" im Namen
////////	  	sind fuer Below-Regionen. Man kann sie
////////		unter Bruecken hinlegen. (Chees Gorski)
#DEFINE OLD_SCREW;

//////////////////////////////////////////////////////////////
BMAP	energy1,	<energy.lbm>,0,0,85,107;
BMAP	energy2,	<energy.lbm>,85,0,85,107;
BMAP	energy3,	<energy.lbm>,170,0,85,107;
BMAP	energy4,	<energy.lbm>,255,0,85,107;
BMAP	energy5,	<energy.lbm>,0,108,85,107;
BMAP	energy6,	<energy.lbm>,85,108,85,107;

BMAP	energy_n1,<energy.lbm>,171,108,97,117;
BMAP	energy_n2,<energy.lbm>,269,108,97,117;

TEXTURE	energy_n_tex {
	SCALE_XY	48,48;
	CYCLES	2;
	BMAPS		energy_n1,energy_n2;
	DELAY		4,6;
	FLAGS 	CLIP;
	TOUCH		energy_touch;
}

TEXTURE	energybig_tex {
	SCALE_XY	40,40;
	CYCLES	6;
	BMAPS		energy1,energy2,energy3,energy4,energy5,energy6;
	DELAY		1,1,1,1,1,1;
	FLAGS 	CLIP;
	TOUCH		energbig_touch;
}

THING	sixpack {
	HEIGHT		-0.01;
	TEXTURE		energybig_tex;
	IF_NEAR		akku_up1;
}

THING	sixpack_unt {
	TEXTURE		energybig_tex;
	FLAGS 		GROUND;
	IF_NEAR		akku_up1;
	EACH_TICK	thing_init;
}

THING	batterie1 {
	HEIGHT		-0.01;
	TEXTURE		energy_n_tex;
	IF_NEAR		battery_up1;
}
THING	batterie1_unt {
	TEXTURE		energy_n_tex;
	FLAGS 		GROUND;
	IF_NEAR		battery_up1;
	EACH_TICK	thing_init;
}

////////////////////////////////////////////////
//jc 10.08.
#IFDEF OLD_SCREW;

BMAP	screw_map, <objects.lbm>,272,2,44,82;

TEXTURE	screw_tex {
	SCALE_XY	32,32;
	BMAPS		screw_map;
	AMBIENT	0.2;
	FLAGS 	CLIP;
	TOUCH		refresher_touch;
}
/*IFELSE;
BMAP	screw1, 		<energy.lbm>,  0,226,54,89;
BMAP	screw2, 		<energy.lbm>, 54,226,54,89;
BMAP	screw3, 		<energy.lbm>,108,226,54,89;
BMAP	screw4, 		<energy.lbm>,162,226,54,89;
BMAP	screw5, 		<energy.lbm>,216,226,54,89;
BMAP	screw6, 		<energy.lbm>,270,226,54,89;

TEXTURE	screw_tex {
	SCALE_XY	40,45;
	CYCLES	6;
	BMAPS		screw1,screw2,screw3,screw4,screw5,screw6;
	DELAY 	1,1,1,1,1,1;
	AMBIENT	0.2;
	FLAGS 	CLIP;
	TOUCH		refresher_touch;
}
ENDIF;
*/
THING	screwdriver {
	TEXTURE		screw_tex;
	IF_NEAR		screw_up;
}

THING	screwdriver_unt {
	TEXTURE		screw_tex;
	FLAGS 		GROUND;
	IF_NEAR
	screw_up;
	EACH_TICK	thing_init;
}

/////Werkzeugkasten

BMAP werk_map, <objects.lbm>,242,89,96,74;

TEXTURE	werk_tex {
	SCALE_XY	36,32;
	BMAPS		werk_map;
	AMBIENT	0.2;
	FLAGS 	CLIP;
	TOUCH		box_touch;
}

THING	werk_kasten {
	TEXTURE		werk_tex;
	IF_NEAR		werk_up;
}

THING	werk_kasten_unt {
	TEXTURE		werk_tex;
	FLAGS 		GROUND;
	IF_NEAR		werk_up;
	EACH_TICK	thing_init;
}
////////////////////////////////////////////////////////////////////////////
ACTION	thing_init {
	SET 	MY.EACH_TICK,NULL;
	SET 	MY.HEIGHT,THERE.FLOOR_HGT;
	IF_EQUAL	THERE.FLAG8,0; //Untermatmaregion?
		END;
	SET		MY.HEIGHT,THERE.SKILL1;
}

ACTION thing_hit {
	IF_ABOVE	SHOOT_RANGE,14;
		END;
	BRANCH	MY.IF_NEAR;
}

ACTION  thing_skip {
	SET	MY.PASSABLE,1;
	SET	MY.DIST,4;

	WAITT	32;

	SET	MY.PASSABLE,0;
	SET	MY.DIST,0;
}

ACTION	screw_up {
	IF_ABOVE	health,380;
		BRANCH	thing_skip;
	SET		MY.invisible, 1 ;
	PLAY_SOUND	klonk,0.3;
	RULE		health = health + 25;
	SET 		screen_msg.STRING,got_spanner;
	BRANCH 	show_text;
}

ACTION	werk_up {
	IF_ABOVE	health,380;
		BRANCH	thing_skip;
	SET		MY.invisible, 1 ;
	PLAY_SOUND	klonk,0.3;
	RULE		health = health + 100;
	SET 		screen_msg.STRING,got_box;
	BRANCH 	show_text;
}


ACTION	battery_up1 {
	IF_ABOVE	energy,280;
		BRANCH	thing_skip;
	SET		MY.invisible, 1 ;
	RULE		energy = energy + 25;
	PLAY_SOUND	Beamer,0.2;
	SET 		screen_msg.STRING,got_battery;
	BRANCH 	show_text;
}
ACTION	akku_up1 {
	IF_ABOVE	energy,275;
		BRANCH	thing_skip;
	SET		MY.invisible, 1 ;
	RULE		energy = energy + 150;
	PLAY_SOUND	Beamer,0.4;
	SET 		screen_msg.STRING,got_6;
	BRANCH 	show_text;
}

