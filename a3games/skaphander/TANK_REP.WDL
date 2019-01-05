//////// REAPAIR - TANK - STATIONS ////////////////////////
/// Beide Stationen - Raumchoehe 20 St. und Breite 20 St.
///////////////

///////-------------- REPAIR

BMAP	damage_standby1,	<damage_g.lbm>,0,0,103,256;
BMAP	damage_standby2,	<damage_g.lbm>,256,0,103,256;
BMAP	damage_seule,		<damage_g.lbm>,102,0,51,256;
TEXTURE damage_standby_tex {
	SCALE_XY	12.8,12.8;
	CYCLES		2;
	BMAPS		damage_standby1,damage_standby2;
	DELAY		3,3;
	AMBIENT		0.4;
	TOUCH		repair_touch;
}
WALL dam_rep_side {
	TEXTURE		damage_standby_tex;
	FLAGS		PORTCULLIS;
	POSITION	0;
}
WALL damage_seiten {		 # standardwand!
	TEXTURE	damage_standby_tex;
	FLAGS		PORTCULLIS;
	POSITION	0;
}
TEXTURE damage_saeule_tex {
	SCALE_XY	12.8,6.4;	// doppelt hoch skaliert
	BMAPS		damage_seule;
	AMBIENT		0.3;
	TOUCH		repair_touch;
}
WALL dam_rep_saeule {
	TEXTURE		damage_saeule_tex;
	SKILL5		1000;	// Startfuellung
	FLAGS		SAVE,PORTCULLIS;
	POSITION	0;
	IF_NEAR		repair_station;
	DIST		15;
}
WALL damage_repair {		 #mittelstÅck!	individuelle wand!
	TEXTURE		damage_saeule_tex;
	SKILL5		1000;	// Startfuellung
	FLAGS		SAVE,PORTCULLIS;
	POSITION	0;
	IF_NEAR		repair_station;
	DIST		15;
}

ACTION repair_station {
	SET			MY.SKILL1,MY.X1;
	ADD			MY.SKILL1,MY.X2;
	SET			MY.SKILL2,MY.Y1;
	ADD			MY.SKILL2,MY.Y2;
	DO			health_refill;
}
//////-------------------- TANK

BMAP	tank_blau1a,<lasttank.lbm>, 27,0,202,256;
BMAP	tank_blau2a,<lasttank.lbm>,283,0,202,256;
BMAP	tank_blau1,<lasttang.lbm>,0,0,256,256;

TEXTURE tankvor_tex {
	SCALE_XY	12.8,12.8;
	CYCLES		2;
	BMAPS		tank_blau1a,tank_blau2a;
	DELAY		5,5;
	AMBIENT		0.2;
	TOUCH		tank_touch;
}
WALL tank_vor {
	TEXTURE		tankvor_tex;
	FLAGS		CURTAIN,PORTCULLIS;
	POSITION 	0;
	}

TEXTURE tank_blautex {
	SCALE_XY	12.8,6.4;
	BMAPS		tank_blau1;
	AMBIENT		0.5;
	TOUCH		tank_touch;
}

WALL tank_blau {
	TEXTURE		tank_blautex;
	DIST		15;
	SKILL5		1000;	// Startfuellung
	FLAGS		SAVE,PORTCULLIS;
	POSITION 	0;
	IF_NEAR		blau_refill;
}

ACTION blau_refill {
	SET			MY.SKILL1,MY.X1;
	ADD			MY.SKILL1,MY.X2;
	SET			MY.SKILL2,MY.Y1;
	ADD			MY.SKILL2,MY.Y2;
	DO			fuel_refill;
}



